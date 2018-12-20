package graduation.util;

import graduation.entity.UserEntity;
import graduation.helper.GmailSender;

public class MailUtil {
    public static void sendMailCheckout(UserEntity userEntity, String discountCode) {
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

    public static void sendMailReFeedback(String email, String message){
        String subject = "Reply from Fashe to your message";
        String body = "<h1> Dear " +email + ",<h1>"
                + "<h2>"+ message+"</h2>";
        try {
            GmailSender.send(email, subject, body, true);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void sendMailRegister(UserEntity userEntity, String discountCode) {
        String subject = "Registration successfully";
        String body = "<h1> Dear " + userEntity.getFullName() + ",<h1>"
                + "<h2>You've registered successfully to our website. </h2>"
                + "<h2>And to wellcome you to our system, here is a small gift for our new customer. " +
                "Use this code to get 20% discount on your fisrt order. Your code: </h2>" +discountCode
                + "<h2>Enjoy your time with us</h2>";
        try {
            GmailSender.send(userEntity.getEmail(), subject, body, true);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void sendMailResetPassword(UserEntity userEntity,String password){
        String subject = "Recover Your Password";
        String body = "<h1> Dear " + userEntity.getFullName() + ",<h1>"
                +"<h2>We recently have received your request</h2>"
                + "<h2>You can use this code to login your account: " + password +"</h2>";

        try {
            GmailSender.send(userEntity.getEmail(), subject, body, true);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
