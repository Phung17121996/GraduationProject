package graduation.controller;

import graduation.entity.*;
import graduation.helper.GenCaptchaUtil;
import graduation.helper.GmailSender;
import graduation.helper.Pbkdf2Encryptor;
import graduation.repository.*;
import graduation.util.MailUtil;
import graduation.util.RegexUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

@Controller
public class UserController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    OrdersRepository ordersRepository;
    @Autowired
    OrderDetailRepository orderDetailRepository;
    @Autowired
    FavouriteRepository favouriteRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    StateRepository stateRepository;
    @Autowired
    ProductQuantityRepository productQuantityRepository;
    @Autowired
    RecentlyReponsitory recentlyReponsitory;

    @RequestMapping(value="userInfo")
    public String userPage(Model model,
                           @RequestParam(name="userId") int userId){
        UserEntity user = userRepository.findOne(userId);
        model.addAttribute("user",user);
        return "user";
    }

    @RequestMapping(value="edit", method = RequestMethod.POST)
    public String doEdit(Model model, UserEntity user,
                         @RequestParam(name="userId") int userId,
                         @RequestParam(name="roleId") int roleId,
                         HttpServletRequest request){
        HttpSession session = request.getSession();
        RoleEntity role = roleRepository.findOne(roleId);
        user.setRoleEntity(role);
        user.setId(userId);
        user.setIsDel("true");
        userRepository.save(user);
        String message = "Your information has been changed successfully";
        session.setAttribute("user",user);
        model.addAttribute("message",message);
        model.addAttribute("user",user);
        return "user";
    }

    @RequestMapping(value="password")
    public String passwordPage(Model model,
                               HttpServletRequest request,
                               @RequestParam(name="userId") int userId){
        UserEntity user = userRepository.findOne(userId);
        model.addAttribute("email",user.getEmail());
        String capt =  GenCaptchaUtil.getCaptcha();
        model.addAttribute("captcha", capt);
        request.getSession().setAttribute("captcha", capt);
        return "password";
    }

    @RequestMapping(value="password", method = RequestMethod.POST)
    public String doPassword(Model model,
                             HttpServletRequest request,
                             @RequestParam(name="email") String email,
                             @RequestParam(name="currentPassword") String currentPassword,
                             @RequestParam(name="newPassword") String newPassword,
                             @RequestParam(name="confirmPassword") String confirmPassword,
                             @RequestParam(name = "captcha") String captcha){

        //check format pass
//        if (!RegexUtil.validatePassword(newPassword)) {
//            String errorMessage = "Your format password is incorrect";
//            model.addAttribute("errorMessage",errorMessage);
//            model.addAttribute("email",email);
//            String capt =  GenCaptchaUtil.getCaptcha();
//            model.addAttribute("captcha", capt);
//            request.getSession().setAttribute("captcha", capt);
//            return"password";
//        }

        UserEntity user = userRepository.findByEmail(email);
        String keyhash = user.getKeyHash();
        String hashedPassword = Pbkdf2Encryptor.createHash(currentPassword,keyhash,1000);
        HttpSession session = request.getSession();
        String keyCapt = (String) session.getAttribute("captcha");

        if (!confirmPassword.equals(newPassword)) {
            String errorMessage = "Your confirm password is incorrect";
            model.addAttribute("errorMessage",errorMessage);
            model.addAttribute("email",email);
            String capt =  GenCaptchaUtil.getCaptcha();
            model.addAttribute("captcha", capt);
            request.getSession().setAttribute("captcha", capt);
            return"password";
        }
        if (newPassword.equals(currentPassword)) {
            String errorMessage = "Your password already exist";
            model.addAttribute("errorMessage",errorMessage);
            model.addAttribute("email",email);
            String capt =  GenCaptchaUtil.getCaptcha();
            model.addAttribute("captcha", capt);
            request.getSession().setAttribute("captcha", capt);
            return"password";
        }
        if (!captcha.equals(keyCapt)) {
            String errorMessage = "Your Input Captcha is incorrect";
            model.addAttribute("errorMessage",errorMessage);
            model.addAttribute("email",email);
            String capt =  GenCaptchaUtil.getCaptcha();
            model.addAttribute("captcha", capt);
            request.getSession().setAttribute("captcha", capt);
            return"password";
        }
        if( user.getHashedPass().equals(hashedPassword) ){
            String newHashedPassword = Pbkdf2Encryptor.createHash(newPassword,keyhash,1000);
            user.setHashedPass(newHashedPassword);
            user.setKeyHash(keyhash);
            user.setId(user.getId());
            String message = "Your password has been changed successfully";
            model.addAttribute("email",user.getEmail());
            model.addAttribute("message",message);
            String capt =  GenCaptchaUtil.getCaptcha();
            model.addAttribute("captcha", capt);
            request.getSession().setAttribute("captcha", capt);
            return "password";
        }
        else{
            String errorMessage = "Your current password is incorrect";
            model.addAttribute("errorMessage",errorMessage);
            model.addAttribute("email",email);
            String capt =  GenCaptchaUtil.getCaptcha();
            model.addAttribute("captcha", capt);
            request.getSession().setAttribute("captcha", capt);
            return"password";
        }
    }

    @RequestMapping(value="orderHistory")
    public String orderHistory(Model model,
                               @RequestParam("userId") int userId){
        List<OrdersEntity> orders = ordersRepository.getOrderByUserId(userId);
        model.addAttribute("orders", orders);
        return "order";
    }

    @RequestMapping(value="cancelOrder")
    public String cancelOrder(Model model, HttpServletRequest request,
                              @RequestParam("orderId") int orderId){
        HttpSession session = request.getSession();
        UserEntity user = (UserEntity)session.getAttribute("user");
        if (user == null) {
            return "404";
        }

        OrdersEntity ordersEntity = ordersRepository.findOne(orderId);
        StateEntity stateEntity = stateRepository.findOne(4);
        ordersEntity.setStateEntity(stateEntity);
        ordersRepository.save(ordersEntity);

        List<OrderDetailEntity> orderDetails =
                orderDetailRepository.getOrderDetailByOrdersId(orderId);
        for(OrderDetailEntity orderDetail : orderDetails){
            int productId = orderDetail.getProductEntity().getId();
            int quantity = orderDetail.getQuantity();
            ProductEntity productEntity = productRepository.findOne(productId);

            ProductQuantityEntity productQuantity = productEntity.getProductQuantityEntity();
            productQuantity.setQuantity( productQuantity.getQuantity()+ quantity);
            productQuantityRepository.save(productQuantity);
        }

        List<OrdersEntity> orders = ordersRepository.getOrderByUserId(user.getId());
        model.addAttribute("orders", orders);
        return "order" ;
    }

    @RequestMapping(value="detail")
    public String orderDetail(Model model,
                              @RequestParam("orderId") int orderId){
        List<OrderDetailEntity> orderDetails = orderDetailRepository.getOrderDetailByOrdersId(orderId);
        OrdersEntity order = ordersRepository.findOne(orderId);// in ra total
        model.addAttribute("orderDetails", orderDetails);
        model.addAttribute("order",order);
        return "orders_detail";
    }

    @RequestMapping(value="favouriteList")
    public String favouriteList(Model model,
                                @RequestParam(name="userId") int userId){
        List<FavouriteEntity> favouriteList = favouriteRepository.getFavouriteListByUserId(userId);
        model.addAttribute("favouriteList",favouriteList);
        return"favourite";
    }

    @RequestMapping(value = "recentlyList")
    public String recentlyList(Model model,
                               @RequestParam(name = "userId") int userId) {
        List<RecentlyEntity> recentlyEntityList = recentlyReponsitory.getRecentlyListByUserId(userId);
        model.addAttribute("recentlyList", recentlyEntityList);
        return "recently";
    }

    @RequestMapping(value="logOut")
    public String logout(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        session.removeAttribute("carts");
        session.removeAttribute("orderSubtotal");
        session.removeAttribute("cartQuantity");
        List<ProductEntity> products = (List<ProductEntity>)productRepository.getHotProduct();
        model.addAttribute("products",products);
        return "redirect:index";
    }

    @RequestMapping(value="reset_password")
    public String resetPassword(Model model){
        return "reset_password";
    }

    @RequestMapping(value="reset_password",method = RequestMethod.POST)
    public String doResetPassword(Model model,@RequestParam(name="email") String email){
        UserEntity user = userRepository.findByEmail(email);
        if(user != null){
            Random rd = new Random();
            int rand = rd.nextInt(1000000) + 10000000;
            String password = String.valueOf(rand);
            String keyHash = user.getKeyHash();
            String hashedPass = Pbkdf2Encryptor.createHash(password,keyHash,1000);

            user.setKeyHash(keyHash);
            user.setHashedPass(hashedPass);
            user.setId(user.getId());

            MailUtil.sendMailResetPassword(user,password);
            String message ="Please check your mail and follow our instruction.";
            model.addAttribute("message",message);
            return "reset_password";
        }else{
            String errorMessage ="There is no result matches your email. Please try again.";
            model.addAttribute("errorMessage",errorMessage);
            return "reset_password";
        }
    }
}
