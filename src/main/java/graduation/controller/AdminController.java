package graduation.controller;

import graduation.entity.MessageEntity;
import graduation.entity.OrdersEntity;
import graduation.entity.UserEntity;
import graduation.helper.GmailSender;
import graduation.repository.MessageRepository;
import graduation.repository.OrdersRepository;
import graduation.util.AdminUtil;
import graduation.util.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class AdminController {
    @Autowired
    OrdersRepository ordersRepository;
    @Autowired
    MessageRepository messageRepository;

    @RequestMapping("admin")
    public String showAdmin(Model model, HttpServletRequest request){
        if (!AdminUtil.checkRoleAdmin(request)) {
            return "404";
        }
        //Chart
        String shirt = "3302.0, 1234.9, 2456, 11233.5, 5343.2, 12234.5, 5322.2, 76456.5, 23424.3, 23442.3, 23434.9, 75645.6";
        String jean = "2342.1, 78654.8, 23424, 35345, 231.3, 34242.2, 12331.2, 6342.2, 1234.2, 12352.2, 11231, 1123.5";
        String jacket = "1231.1, 12373.6, 7456.5, 2342.4, 8756.5, 4663.0, 18756.6, 2345.9, 45647.3, 4566.0, 4342.9, 4234.0";
        String hoodie = "23463.9, 2344.2, 2363.7, 23423, 2346.9, 2342.2, 13453.0, 23446.6, 35234.2, 78645.3, 3452.6, 45345.8";
        model.addAttribute("shirt", shirt);
        model.addAttribute("jean", jean);
        model.addAttribute("jacket", jacket);
        model.addAttribute("hoodie", hoodie);


        //Daily Status
        List<OrdersEntity> ordersPrepare= ordersRepository.getOrdersByState(1);
        List<OrdersEntity> ordersOnHold= ordersRepository.getOrdersByState(2);
        List<OrdersEntity> ordersDelivering= ordersRepository.getOrdersByState(3);
        List<OrdersEntity> ordersCancel= ordersRepository.getOrdersByState(4);

        DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH : mm : ss");

        Date today = Calendar.getInstance().getTime();
        String reportDate = df.format(today);

        List<Integer> ordersSize= new ArrayList<>();
        ordersSize.add(ordersPrepare.size());
        ordersSize.add(ordersOnHold.size());
        ordersSize.add(ordersDelivering.size());
        ordersSize.add(ordersCancel.size());

        model.addAttribute("date", reportDate);
        model.addAttribute("ordersSize", ordersSize);

        //Message of Customer
        List<MessageEntity> messageEntities= (List<MessageEntity>) messageRepository.getMessageDESC();
        model.addAttribute("messages", messageEntities);

        return "admin";
    }

    @RequestMapping(value = "sendMessage", method = POST)
    public String sendMessage(@RequestParam(name = "mess") String message,
                              @RequestParam(name = "email") String email,
                              @RequestParam(name = "content") String content,
                              HttpServletRequest request){
        if (!AdminUtil.checkRoleAdmin(request)) {
            return "404";
        }
        MailUtil.sendMailReFeedback(email, message);
        List<MessageEntity> messageEntities= (List<MessageEntity>) messageRepository.getMessageDESC();
        for(MessageEntity mess: messageEntities){
            if(mess.getEmail().equalsIgnoreCase(email) && mess.getContent().equalsIgnoreCase(content)){
                mess.setIsRep("false");
                messageRepository.save(mess);
                break;
            }
        }
        return "redirect:admin";
    }
}
