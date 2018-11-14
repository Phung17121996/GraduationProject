package graduation.controller;

import graduation.entity.BannerEntity;
import graduation.entity.ProductEntity;
import graduation.repository.BannerRepository;
import graduation.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    BannerRepository bannerRepository;

    @RequestMapping
    public String showHome(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<ProductEntity> products = (List<ProductEntity>)productRepository.getHotProduct();
        List<BannerEntity> banners= bannerRepository.getBanners();

        session.setAttribute("banners", banners);
        model.addAttribute("products",products);
        return "index";
    }

    @RequestMapping("index")
    public String showIndex(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();

        List<ProductEntity> products = (List<ProductEntity>)productRepository.getHotProduct();
        List<BannerEntity> banners= bannerRepository.getBanners();

        model.addAttribute("products",products);
        session.setAttribute("banners",banners);
        return "index";
    }
}
