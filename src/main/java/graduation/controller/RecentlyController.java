package graduation.controller;

import graduation.entity.ProductEntity;
import graduation.entity.RecentlyEntity;
import graduation.entity.UserEntity;
import graduation.repository.ProductRepository;
import graduation.repository.RecentlyReponsitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RecentlyController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    RecentlyReponsitory recentlyReponsitory;

    @RequestMapping(value = "deleteRecently")
    public String deleteRecently(Model model,
                                  @RequestParam(name="recentlyId") int recentlyId,
                                  @RequestParam(name="userId") int userId){
        RecentlyEntity recentlyEntity = recentlyReponsitory.findOne(recentlyId);
        recentlyReponsitory.delete(recentlyEntity);
        // load again
        List<RecentlyEntity> recentlyEntityList =
                recentlyReponsitory.getRecentlyListByUserId(userId);
        model.addAttribute("recentlyList",recentlyEntityList);
        return "recently";
    }
}
