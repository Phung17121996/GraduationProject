package graduation.controller;

import graduation.entity.MessageEntity;
import graduation.entity.UserEntity;
import graduation.repository.MessageRepository;
import graduation.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;

@Controller
public class ContactController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    MessageRepository messageRepository;

    @RequestMapping(value="contact")
    public String contactPage(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        UserEntity user = (UserEntity)session.getAttribute("user");
        if(user != null){
            model.addAttribute("user",user);
        }else{
            model.addAttribute("user",new UserEntity());
            return "contact";
        }
        return "contact";
    }

    @RequestMapping(value="message")
    public String doContact(Model model,
                            @RequestParam(name="email") String email,
                            @RequestParam(name="content") String content){
        UserEntity user = userRepository.findByEmail(email);
        MessageEntity message = new MessageEntity();
        message.setContent(content);
        if(user != null){
            message.setUserEntity(user);
            message.setEmail(user.getEmail());
            message.setIsRep("true");
            message.setTimestamp(new Timestamp(System.currentTimeMillis()));
            messageRepository.save(message);
        }else{
            message.setEmail(email);
            message.setIsRep("true");
            message.setTimestamp(new Timestamp(System.currentTimeMillis()));
            messageRepository.save(message);
        }
        String notify = "Your message has been sent successfully";
        model.addAttribute("notify",notify);
        return"contact";
    }
}
