package graduation.controller;

import graduation.entity.*;
import graduation.helper.GmailSender;
import graduation.helper.Pbkdf2Encryptor;
import graduation.repository.*;
import graduation.util.MailUtil;
import graduation.util.RegexUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class RegisterController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    DiscountCodeRepository discountCodeRepository;
    @Autowired
    CheckLoginRepository checkLoginRepository;

    @RequestMapping(value = "register", method = GET)
    public String showSignUpPage(Model model) {
        model.addAttribute("userEntity", new UserEntity());
        return "register";
    }

    @RequestMapping(value="register", method = POST)
    public String doRegister(UserEntity userEntity, Model model,
                             @RequestParam(name="pass") String password,
                             HttpServletRequest request){
        HttpSession session= request.getSession();
        UserEntity userCheckEmail = userRepository.findByEmail(userEntity.getEmail());
        if(userCheckEmail == null) {
            String keyHash = Pbkdf2Encryptor.getSaltString();
            String hashedPass = Pbkdf2Encryptor.createHash(password, keyHash, 1000);
            //password
            userEntity.setKeyHash(keyHash);
            userEntity.setHashedPass(hashedPass);
            //set role
            RoleEntity role = roleRepository.findOne(1);
            userEntity.setRoleEntity(role);
            userEntity.setIsDel("true");
            userRepository.save(userEntity);

            //discount code
            Random rd = new Random();
            int rand = rd.nextInt(1000) + 10000;
            String discountCode = String.valueOf(rand);

            DiscountCodeEntity discountCodeEntity = new DiscountCodeEntity();
            discountCodeEntity.setCode(discountCode);
            discountCodeEntity.setIsUsed("False");
            discountCodeRepository.save(discountCodeEntity);

            //save check login
            CheckLoginEntity checkLoginEntity = checkLoginRepository.findById(userEntity.getId());
            if (checkLoginEntity == null) {
                checkLoginEntity = new CheckLoginEntity();
                checkLoginEntity.setId(userEntity.getId());
                checkLoginEntity.setNumberLoginFail(0);
                checkLoginEntity.setLastLogin((System.currentTimeMillis()));
                checkLoginRepository.save(checkLoginEntity);
            }

            session.setAttribute("user", userEntity);
            MailUtil.sendMailRegister(userEntity,discountCode);
            List<ProductEntity> products = (List<ProductEntity>)productRepository.getHotProduct();
            model.addAttribute("products",products);
        }else{
            String message = "Your email is already taken. Try again!";
            model.addAttribute("message",message);
            return "register";
        }
        return "redirect:index";
    }
}
