package graduation.controller;
import graduation.LoginConst;
import graduation.entity.CheckLoginEntity;
import graduation.entity.UserEntity;
import graduation.helper.Pbkdf2Encryptor;
import graduation.repository.CheckLoginRepository;
import graduation.repository.RoleRepository;
import graduation.repository.UserRepository;
import graduation.util.RegexUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    CheckLoginRepository checkLoginRepository;

    @RequestMapping(value = "login",method = RequestMethod.POST)
    @ResponseBody
    public String doLogin(Model model,
                          @RequestParam(value = "email") String email,
                          @RequestParam(value = "password") String password,
                          HttpServletRequest request){
        //check format email
//        System.out.println("Login>>>>>>>>>>>>> " + email + "---" + password);
        if (!RegexUtil.validateEmail(email)) {
            return String.valueOf(LoginConst.EMAIL_ERROR);
        }

        HttpSession session = request.getSession();
        UserEntity user = userRepository.findByEmail(email);
        if (user == null) {
            return String.valueOf(LoginConst.EMAIL_ERROR);
        }

        //check can login
        CheckLoginEntity checkLoginEntity = checkLoginRepository.findById(user.getId());
        if (checkLoginEntity != null) {
            long timeNow = System.currentTimeMillis();
            //check lock in 1 day
            if (timeNow - checkLoginEntity.getLastLogin() >= LoginConst.TIME_LOCK_USER) {
                checkLoginEntity.setLastLogin(timeNow);
                checkLoginEntity.setNumberLoginFail(0);
                checkLoginRepository.save(checkLoginEntity);
            }
            else if (checkLoginEntity.getNumberLoginFail() >= LoginConst.NUMER_MAX_LOGIN_FAIL) {
                return String.valueOf(LoginConst.LOCKED_USER);
            }
        }
        else {
            checkLoginEntity = new CheckLoginEntity();
            checkLoginEntity.setId(user.getId());
            checkLoginEntity.setNumberLoginFail(0);
            checkLoginEntity.setLastLogin(System.currentTimeMillis());
            checkLoginRepository.save(checkLoginEntity);
        }

        String keyHash = user.getKeyHash();
        String hashedPass = Pbkdf2Encryptor.createHash(password, keyHash, 1000);
        if (!user.getHashedPass().equals(hashedPass)) {
            checkLoginEntity.setNumberLoginFail(checkLoginEntity.getNumberLoginFail() + 1);
            checkLoginEntity.setLastLogin(System.currentTimeMillis());
            checkLoginRepository.save(checkLoginEntity);
            return String.valueOf(LoginConst.PASSWORD_ERROR);
        }
        else if(user.getIsDel().equalsIgnoreCase("false")){
            return String.valueOf(LoginConst.BANNED_USER);
        }
        else {
            checkLoginEntity.setNumberLoginFail(0);
            checkLoginEntity.setLastLogin(System.currentTimeMillis());
            checkLoginRepository.save(checkLoginEntity);
            if(user.getRoleEntity().getId() == roleRepository.findOne(2).getId()){
                session.setAttribute("user", user);
                String data= "<div class=\"topbar-child2\">\n" +
                        "\t<div class=\"dropdown\" >\n" +
                        "\t\t<button class=\"btn btn-link dropdown-toggle\" id=\"button_user\"\n" +
                        "\t\t\t\ttype=\"button\" data-toggle=\"dropdown\">Hello, " + user.getFullName() +"\n"+
                        "\t\t\t<span class=\"caret\"></span></button>\n" +
                        "\t\t<ul class=\"dropdown-menu dropdown-menu-right\" id=\"login_user\">\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\" \n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='admin'\">Admin Page</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\" \n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='logOut'\">Log out</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t</ul>\n" +
                        "\t</div>\n" +
                        "</div>" ;
                return data;
            }
            else{
                session.setAttribute("user", user);
                String data= "<div class=\"topbar-child2\">\n" +
                        "\t<div class=\"dropdown\" >\n" +
                        "\t\t<button class=\"btn btn-link dropdown-toggle\" id=\"button_user\"\n" +
                        "\t\t\t\ttype=\"button\" data-toggle=\"dropdown\">Hello, " + user.getFullName() +"\n"+
                        "\t\t\t<span class=\"caret\"></span></button>\n" +
                        "\t\t<ul class=\"dropdown-menu dropdown-menu-right\" id=\"login_user\">\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\"\n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='userInfo?userId="+ user.getId() +"'\">Manage Account</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\" \n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='password?userId="+user.getId()+"'\">Change Password</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\"\n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='orderHistory?userId="+ user.getId()+"'\">My Order</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\"\n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='favouriteList?userId="+ user.getId()+"'\">My Favourite List</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\"\n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='recentlyList?userId="+ user.getId()+"'\">My Recently List</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\" \n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='logOut'\">Log out</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t</ul>\n" +
                        "\t</div>\n" +
                        "</div>";
                return data;
            }

        }

    }

    @RequestMapping(value = "/login1",method = RequestMethod.POST)
    @ResponseBody
    public String doLogin1(HttpServletRequest request, Model model){
        HttpSession session= request.getSession();
        UserEntity user= (UserEntity) session.getAttribute("user");
        if(user != null){
            if(user.getRoleEntity().getId() == roleRepository.findOne(2).getId()){
                session.setAttribute("user", user);
                String data= "<div class=\"topbar-child2\">\n" +
                        "\t<div class=\"dropdown\" >\n" +
                        "\t\t<button class=\"btn btn-link dropdown-toggle\" id=\"button_user\"\n" +
                        "\t\t\t\ttype=\"button\" data-toggle=\"dropdown\">Hello, " + user.getFullName() +"\n"+
                        "\t\t\t<span class=\"caret\"></span></button>\n" +
                        "\t\t<ul class=\"dropdown-menu dropdown-menu-right\" id=\"login_user\">\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\" \n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='admin'\">Admin Page</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\" \n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='logOut'\">Log out</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t</ul>\n" +
                        "\t</div>\n" +
                        "</div>" ;
                return data;
            }
            else{
                session.setAttribute("user", user);
                String data= "<div class=\"topbar-child2\">\n" +
                        "\t<div class=\"dropdown\" >\n" +
                        "\t\t<button class=\"btn btn-link dropdown-toggle\" id=\"button_user\"\n" +
                        "\t\t\t\ttype=\"button\" data-toggle=\"dropdown\">Hello, " + user.getFullName() +"\n"+
                        "\t\t\t<span class=\"caret\"></span></button>\n" +
                        "\t\t<ul class=\"dropdown-menu dropdown-menu-right\" id=\"login_user\">\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\"\n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='userInfo?userId="+ user.getId() +"'\">Manage Account</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\" \n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='password?userId="+user.getId()+"'\">Change Password</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\"\n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='orderHistory?userId="+ user.getId()+"'\">My Order</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\"\n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='favouriteList?userId="+ user.getId()+"'\">My Favourite List</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\"\n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='recentlyList?userId="+ user.getId()+"'\">My Recently List</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t\t<li>\n" +
                        "\t\t\t\t<button type=\"button\" class=\"btn btn-link\" \n" +
                        "\t\t\t\t\t\tonclick=\"window.location.href='logOut'\">Log out</button>\n" +
                        "\t\t\t</li>\n" +
                        "\t\t</ul>\n" +
                        "\t</div>\n" +
                        "</div>";
                return data;
            }
        }
        else return String.valueOf(LoginConst.USER_NULL);
    }
}
