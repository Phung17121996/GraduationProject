package graduation.controller;

import graduation.entity.*;
import graduation.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductDetailController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    ViewRepository viewRepository;
    @Autowired
    SizeRepository sizeRepository;
    @Autowired
    RecentlyReponsitory recentlyReponsitory;
    @Autowired
    UserRepository userRepository;

    @RequestMapping(value="product-detail",  method = RequestMethod.GET)
    public String showProductDetailPage(Model model,
                                        HttpServletRequest request,
                                        @RequestParam(name="productId") int productId){
        HttpSession session = request.getSession();
        UserEntity user = (UserEntity)session.getAttribute("user");
        ViewEntity viewEntity = viewRepository.getViewByProductId(productId);
        viewEntity.setCount(viewEntity.getCount() + 1);
        viewRepository.save(viewEntity);
        //selected product
        ProductEntity product = productRepository.findOne(productId);

        double price = product.getPrice();
        int categoryId = product.getCategoryEntity().getId();

        //recommend product
        List<ProductEntity> recommendProducts =
                productRepository.getProductbyPriceAndCategoryId(price,categoryId, productId);

        //related hot product
        List<ProductEntity> hotProducts = productRepository.getHotProductByCategoryID(categoryId);

        //size
        if(categoryId == 2 ){
            List<SizeEntity> sizeEntities = (List<SizeEntity>)sizeRepository.getSizeJeans();
            model.addAttribute("sizeEntities",sizeEntities);
        }else{
            List<SizeEntity> sizeEntities = (List<SizeEntity>)sizeRepository.getSize();
            model.addAttribute("sizeEntities",sizeEntities);
        }

        model.addAttribute("product",product);
        model.addAttribute("recommendProducts",recommendProducts);
        model.addAttribute("hotProducts",hotProducts);

        //add recently
        if(user != null) {
            List<RecentlyEntity> recentlyEntityList = recentlyReponsitory.getRecentlyListByUserId(user.getId());
            if (recentlyEntityList != null) {
                boolean isExistingId = false;
                for (RecentlyEntity recentlyEntity : recentlyEntityList) {
                    if (recentlyEntity.getProductEntity().getId() == productId) {
                        isExistingId = true;
                        break;
                    }
                }
                if (!isExistingId) {
                    RecentlyEntity recentlyEntity = new RecentlyEntity();
                    recentlyEntity.setProductEntity(product);
                    recentlyEntity.setUserEntity(user);
                    recentlyReponsitory.save(recentlyEntity);
                }
            }
            else {
                recentlyEntityList = new ArrayList<>();
                RecentlyEntity recentlyEntity = new RecentlyEntity();
                recentlyEntity.setProductEntity(product);
                recentlyEntity.setUserEntity(user);
                recentlyReponsitory.save(recentlyEntity);
            }
        }

        return "product-detail";
    }
}
