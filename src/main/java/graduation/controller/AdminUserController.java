package graduation.controller;

import graduation.entity.FavouriteEntity;
import graduation.entity.OrdersEntity;
import graduation.entity.UserEntity;
import graduation.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminUserController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    UserPageRepository userPageRepository;
    @Autowired
    FavouriteRepository favouriteRepository;
    @Autowired
    OrdersRepository ordersRepository;
    @Autowired
    OrderPageRepository orderPageRepository;

    @RequestMapping("admin_user")
    public String showUser(Model model){
        List<UserEntity> users= userRepository.getUsersDESC();
        List<UserEntity> userDisable= userRepository.getUsersDisable();

        model.addAttribute("users", users);
        model.addAttribute("userDisable", userDisable);

        return "admin_user";
    }

    @RequestMapping(value = "deleteUser", method = RequestMethod.POST)
    @ResponseBody
    public String deleteUser(@RequestParam(name = "id") int id,
                              HttpServletRequest request){
        UserEntity userEntity= userRepository.findOne(id);
        userEntity.setIsDel("false");
        userRepository.save(userEntity);

        List<UserEntity> data =
                userPageRepository.getUsers(1, (List<UserEntity>) userRepository.getUsersDESC());
        String result = "";
        for (UserEntity user : data) {
            result += "<tr>\n" +
                    "<td>" + user.getId() + "</td>\n" +
                    "<td>" + user.getFullName() + "</td>\n" +
                    "<td>" + user.getEmail() + "</td>\n" +
                    "<td>" + user.getAddress() + "</td>\n" +
                    "<td>" + user.getPhone() + "</td>\n" +
                    "<td><button class=\"btn btn-primary\"\n" +
                    "                                onclick=\"window.location.href='detailUser?userId="+user.getId()+"'\"><strong>Details</strong></button></td>\n"+
                    "<td><button class=\"confirm btn btn-danger\" onclick=\"deleteUser(" + user.getId() + ")\">\n" +
                    "<strong>Delete</strong>\n" +
                    "</button></td>\n" +
                    "</tr>";
        }

        List<UserEntity> data1 =
                userPageRepository.getUsers(1, (List<UserEntity>) userRepository.getUsersDisable());
        String result1 = "";
        for (UserEntity user : data1) {
            result1 += "<tr>\n" +
                    "<td>" + user.getId() + "</td>\n" +
                    "<td>" + user.getFullName() + "</td>\n" +
                    "<td>" + user.getEmail() + "</td>\n" +
                    "<td>" + user.getAddress() + "</td>\n" +
                    "<td>" + user.getPhone() + "</td>\n" +
                    "<td><button class=\"btn btn-primary\"\n" +
                    "                                onclick=\"window.location.href='detailUser?userId="+user.getId()+"'\"><strong>Details</strong></button></td>"+
                    "<td><button class=\"confirm btn btn-default\" onclick=\"enableUser("+user.getId()+")\">\n" +
                    "                        <strong>Enable</strong>\n" +
                    "                    </button></td>\n" +
                    "</tr>";
        }
        return result +"||" + result1;
    }

    @RequestMapping(value = "enableUser", method = RequestMethod.POST)
    @ResponseBody
    public String enableUser(@RequestParam(name = "id") int id,
                             HttpServletRequest request){
        UserEntity userEntity= userRepository.findOne(id);
        userEntity.setIsDel("true");
        userRepository.save(userEntity);

        List<UserEntity> data =
                userPageRepository.getUsers(1, (List<UserEntity>) userRepository.getUsersDESC());
        String result = "";
        for (UserEntity user : data) {
            result += "<tr>\n" +
                    "<td>" + user.getId() + "</td>\n" +
                    "<td>" + user.getFullName() + "</td>\n" +
                    "<td>" + user.getEmail() + "</td>\n" +
                    "<td>" + user.getAddress() + "</td>\n" +
                    "<td>" + user.getPhone() + "</td>\n" +
                    "<td><button class=\"btn btn-primary\"\n" +
                    "                                onclick=\"window.location.href='detailUser?userId="+user.getId()+"'\"><strong>Details</strong></button></td>"+
                    "<td><button class=\"confirm btn btn-danger\" onclick=\"deleteUser(" + user.getId() + ")\">\n" +
                    "<strong>Delete</strong>\n" +
                    "</button></td>\n" +
                    "</tr>";
        }

        List<UserEntity> data1 =
                userPageRepository.getUsers(1, (List<UserEntity>) userRepository.getUsersDisable());
        String result1 = "";
        for (UserEntity user : data1) {
            result1 += "<tr>\n" +
                    "<td>" + user.getId() + "</td>\n" +
                    "<td>" + user.getFullName() + "</td>\n" +
                    "<td>" + user.getEmail() + "</td>\n" +
                    "<td>" + user.getAddress() + "</td>\n" +
                    "<td>" + user.getPhone() + "</td>\n" +
                    " <td><button class=\"btn btn-primary\"\n" +
                    "                                onclick=\"window.location.href='detailUser?userId="+user.getId()+"'\"><strong>Details</strong></button></td>"+
                    "<td><button class=\"confirm btn btn-default\" onclick=\"enableUser("+user.getId()+")\">\n" +
                    "                        <strong>Enable</strong>\n" +
                    "                    </button></td>\n" +
                    "</tr>";
        }
        return result +"||" + result1;
    }

    @RequestMapping("detailUser")
    public String showDetailUser(@RequestParam(name = "userId") int id,
                                 Model model,
                                 HttpServletRequest request){
        HttpSession session= request.getSession();
        UserEntity user= userRepository.findOne(id);

        List<OrdersEntity> orders= ordersRepository.getOrderByUserId(id);
        List<FavouriteEntity> favouriteList= favouriteRepository.getFavouriteListByUserId(id);
        model.addAttribute("user", user);
        model.addAttribute("orders", orders );
        model.addAttribute("favouriteList", favouriteList);
        return "admin_userdetail";
    }
}
