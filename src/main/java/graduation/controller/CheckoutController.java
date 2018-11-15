package graduation.controller;

import graduation.entity.*;
import graduation.helper.GmailSender;
import graduation.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;

@Controller
public class CheckoutController {
    @Autowired
    OrdersRepository ordersRepository;
    @Autowired
    OrderDetailRepository orderDetailRepository;
    @Autowired
    ProductQuantityRepository productQuantityRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    StateRepository stateRepository;
    @Autowired
    DiscountCodeRepository discountCodeRepository;

    @RequestMapping(value = "checkout")
    public String checkOutPage(Model model,
                               HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("carts");
        if (cartItems == null || cartItems.size() == 0) {
            return "empty_cart";
        } else {
            UserEntity userEntity = (UserEntity) session.getAttribute("user");
            if (userEntity == null) {
                model.addAttribute("user", new UserEntity());
            } else {
                model.addAttribute("user", userEntity);
            }
            return "checkout";
        }
    }

    @RequestMapping(value = "checkout", method = RequestMethod.POST)
    public String checkOut(Model model, UserEntity user, HttpServletRequest request,
                           @RequestParam(name = "note") String note,
                           @RequestParam(name = "discountCode") String discountCode) {
        HttpSession session = request.getSession();
        List<CartItem> carts = (List<CartItem>) session.getAttribute("carts");

        OrdersEntity order = new OrdersEntity();
        Date today = new Date(System.currentTimeMillis());
        SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String currentDateTime = timeFormat.format(today.getTime());
        order.setCreatedDate(currentDateTime);

        order.setEmail(user.getEmail());
        order.setFullName(user.getFullName());
        order.setAddress(user.getAddress());
        order.setPhone(user.getPhone());
        order.setNote(note);
        StateEntity state = stateRepository.findOne(1);
        order.setStateEntity(state);

        UserEntity userCheckmail = userRepository.findByEmail(user.getEmail());
        if (userCheckmail != null) {
            order.setUserEntity(userCheckmail);
        }

        //handle total + discount + shipping fee
        double orderSubtotal = 0;
        double shippingFee = 0;
        for (CartItem cartItem : carts) {
            orderSubtotal += cartItem.getSubTotal();
        }

        if (discountCode.isEmpty()) {
            if (orderSubtotal < 500) {
                shippingFee = 50;
            }
            order.setDiscount(0);
            order.setShippingFee(shippingFee);
            order.setOrderSubtotal(orderSubtotal);
            double orderTotal = shippingFee + orderSubtotal;
            order.setOrderTotal(orderTotal);
        } else {
            DiscountCodeEntity discountCodeEntity = discountCodeRepository.findByCode(discountCode);
            if (discountCodeEntity != null && discountCodeEntity.getIsUsed().equals("False")) {
                double orderTotal = orderSubtotal - (orderSubtotal * 0.2);
                if (orderTotal < 500) {
                    shippingFee = 50;
                }
                order.setDiscount(20);
                order.setShippingFee(shippingFee);
                order.setOrderSubtotal(orderSubtotal);
                orderTotal = orderTotal + shippingFee;
                order.setOrderTotal(orderTotal);
                discountCodeEntity.setIsUsed("True");
                discountCodeRepository.save(discountCodeEntity);
            } else {
                UserEntity userEntity = (UserEntity) session.getAttribute("user");
                if (userEntity == null) {
                    model.addAttribute("user", new UserEntity());
                } else {
                    model.addAttribute("user", userEntity);
                }
                String message = "This code is incorrect";
                model.addAttribute("message", message);
                return "checkout";
            }
        }
        OrdersEntity ordersEntity = ordersRepository.save(order);
        //handle order details
        int quantityDB = 0;
        for (CartItem cartItem : carts) {
            OrderDetailEntity orderDetailEntity = new OrderDetailEntity();
            //set order detail
            orderDetailEntity.setProductEntity(cartItem.getProduct());
            orderDetailEntity.setQuantity(cartItem.getQuantityProductCart());
            orderDetailEntity.setSubTotal(cartItem.getSubTotal());
            orderDetailEntity.setOrdersEntity(ordersEntity);
            orderDetailEntity.setSize(cartItem.getSize());
            orderDetailRepository.save(orderDetailEntity);
            // handle quantity
            ProductQuantityEntity productQuantity = cartItem.getProduct().getProductQuantityEntity();
            quantityDB = productQuantity.getQuantity() - cartItem.getQuantityProductCart();
            productQuantity.setQuantity(quantityDB);
            productQuantityRepository.save(productQuantity);
        }

        UserEntity userEntity = userRepository.findByEmail(user.getEmail());
        List<OrdersEntity> ordersEntityList = ordersRepository.getsuccessfullOrderByUserId(userEntity.getId());
        int count = 0;
        for (OrdersEntity orders : ordersEntityList) {
            count += 1;
        }
        if (count % 5 == 0) {
            Random rd = new Random();
            int rand = rd.nextInt(1000) + 10000;
            String discountCodde = String.valueOf(rand);

            DiscountCodeEntity discountCodeEntity = new DiscountCodeEntity();
            discountCodeEntity.setCode(discountCodde);
            discountCodeEntity.setIsUsed("False");
            discountCodeRepository.save(discountCodeEntity);
            sendMail(userEntity, discountCodde);
        }
        session.removeAttribute("carts");
        session.removeAttribute("orderSubtotal");
        session.removeAttribute("cartQuantity");
        model.addAttribute("carts", carts);
        model.addAttribute("order", order);
        return "thank_you";
    }

    public void sendMail(UserEntity userEntity, String discountCode) {
        String subject = "Thank you for your support";
        String body = "<h1> Dear " + userEntity.getFullName() + ",<h1>"
                + "<h4>I want you to know how much we enjoy serving your clothing needs and consider you a special customer. " +
                "Of course we appreciate your orders, but we also appreciate the positive lift we get from your visits. " +
                "As a token of our appreciation, I am enclosing a discount code worth 20% off your next purchase. Here is your discount code: " +
                " <h3>" + discountCode + ". <h3>" +
                "Come visit us soon. </h4>";
        try {
            GmailSender.send(userEntity.getEmail(), subject, body, true);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
