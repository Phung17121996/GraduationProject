package graduation.controller;

import graduation.entity.ProductEntity;
import graduation.repository.ProductPageRepository;
import graduation.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class ProductController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    ProductPageRepository productPageRepository;

    @RequestMapping("product")
    public String showProduct(Model model,
                              HttpServletRequest request,
                              @RequestParam(name="categoryId")int categoryId){
        HttpSession session= request.getSession();
        if(categoryId == 5){
            List<ProductEntity> productEntities = (List<ProductEntity>)productRepository.findAll();
            List<ProductEntity> products= productPageRepository.getProducts(1, productEntities);
            model.addAttribute("products",products);
        }else{
            List<ProductEntity> productEntities = (List<ProductEntity>)productRepository.getProductbyCategoryId(categoryId);
            List<ProductEntity> products= productPageRepository.getProducts(1, productEntities);
            model.addAttribute("products",products);
        }
        //sort
        model.addAttribute("categoryId",categoryId);
        session.setAttribute("categoryId",categoryId);
        return "product";
    }

    @RequestMapping(value = "product/{page}", method = POST)
    @ResponseBody
    public String getData(@PathVariable int page,
                          HttpServletRequest request) {
        HttpSession session= request.getSession();
        int categoryId= (int) session.getAttribute("categoryId");
        String result = "";

        if(categoryId == 5){
            List<ProductEntity> productEntities = (List<ProductEntity>)productRepository.findAll();
            List<ProductEntity> data= productPageRepository.getProducts(page, productEntities);
            for (ProductEntity product: data) {
                result += "<div class=\"col-sm-12 col-md-6 col-lg-4 p-b-50\">\n" +
                        "\t\t\t\t\t\t<!-- Block2 -->\n" +
                        "\n" +
                        "\t\t\t\t\t\t<div class=\"block2\">\n" +
                        "\t\t\t\t\t\t\t<div class=\"block2-img wrap-pic-w of-hidden pos-relative \">\n" +
                        "\t\t\t\t\t\t\t\t<img src=\"/resources/images/product/"+ product.getImageEntities().get(0).getImageName()+"\" alt=\"IMG-PRODUCT\"\n" +
                        "\t\t\t\t\t\t\t\t\t style=\"size: 720px; height: 351px;\" \\>\n" +
                        "\t\t\t\t\t\t\t\t<div class=\"block2-overlay trans-0-4\">\n" +
                        "\t\t\t\t\t\t\t\t\t<a  class=\"block2-btn-addwishlist hov-pointer trans-0-4\" onclick=\"favourite("+product.getId()+")\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t<i class=\"icon-wishlist icon_heart_alt\" aria-hidden=\"true\"></i>\n" +
                        "\t\t\t\t\t\t\t\t\t\t<i class=\"icon-wishlist icon_heart dis-none\" aria-hidden=\"true\"></i>\n" +
                        "\t\t\t\t\t\t\t\t\t</a>\n" +
                        "\n" +
                        "\t\t\t\t\t\t\t\t\t<div class=\"block2-btn-addcart w-size1 trans-0-4\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t<!-- Button -->\n" +
                        "\t\t\t\t\t\t\t\t\t\t<button class=\"flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4\" onclick=\"window.location.href='product-detail?productId="+product.getId()+"'\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t\tDetail\n" +
                        "\t\t\t\t\t\t\t\t\t\t</button>\n" +
                        "\t\t\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t\t</div>\n" +
                        "\n" +
                        "\t\t\t\t\t\t\t<div class=\"block2-txt p-t-20\">\n" +
                        "\t\t\t\t\t\t\t\t<a href=\"product-detail?productId="+product.getId()+"\" class=\"block2-name dis-block s-text3 p-b-5\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t"+ product.getProductName()+"\n" +
                        "\t\t\t\t\t\t\t\t</a>\n" +
                        "\t\t\t\t\t\t\t\t<span style=\"color: red;font-size: medium\" class=\"block2-price m-text6 p-r-5\">\n" +
                        "\t\t\t\t\t\t\t\t\t$"+product.getPrice()+"\n" +
                        "\t\t\t\t\t\t\t\t</span>\n" +
                        "\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t</div>\n" +
                        "\n" +
                        "\t\t\t\t\t</div>";
            }
            return result;

        }else{
            List<ProductEntity> productEntities = (List<ProductEntity>)productRepository.getProductbyCategoryId(categoryId);
            List<ProductEntity> data= productPageRepository.getProducts(page, productEntities);
            for (ProductEntity product: data) {
                result += "<div class=\"col-sm-12 col-md-6 col-lg-4 p-b-50\">\n" +
                        "\t\t\t\t\t\t<!-- Block2 -->\n" +
                        "\n" +
                        "\t\t\t\t\t\t<div class=\"block2\">\n" +
                        "\t\t\t\t\t\t\t<div class=\"block2-img wrap-pic-w of-hidden pos-relative \">\n" +
                        "\t\t\t\t\t\t\t\t<img src=\"/resources/images/product/"+ product.getImageEntities().get(0).getImageName()+"\" alt=\"IMG-PRODUCT\"\n" +
                        "\t\t\t\t\t\t\t\t\t style=\"size: 720px; height: 351px;\" \\>\n" +
                        "\t\t\t\t\t\t\t\t<div class=\"block2-overlay trans-0-4\">\n" +
                        "\t\t\t\t\t\t\t\t\t<a  class=\"block2-btn-addwishlist hov-pointer trans-0-4\" onclick=\"favourite("+product.getId()+")\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t<i class=\"icon-wishlist icon_heart_alt\" aria-hidden=\"true\"></i>\n" +
                        "\t\t\t\t\t\t\t\t\t\t<i class=\"icon-wishlist icon_heart dis-none\" aria-hidden=\"true\"></i>\n" +
                        "\t\t\t\t\t\t\t\t\t</a>\n" +
                        "\n" +
                        "\t\t\t\t\t\t\t\t\t<div class=\"block2-btn-addcart w-size1 trans-0-4\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t<!-- Button -->\n" +
                        "\t\t\t\t\t\t\t\t\t\t<button class=\"flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4\" onclick=\"window.location.href='product-detail?productId="+product.getId()+"'\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t\tDetail\n" +
                        "\t\t\t\t\t\t\t\t\t\t</button>\n" +
                        "\t\t\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t\t</div>\n" +
                        "\n" +
                        "\t\t\t\t\t\t\t<div class=\"block2-txt p-t-20\">\n" +
                        "\t\t\t\t\t\t\t\t<a href=\"product-detail?productId="+product.getId()+"\" class=\"block2-name dis-block s-text3 p-b-5\">\n" +
                        "\t\t\t\t\t\t\t\t\t\t"+ product.getProductName()+"\n" +
                        "\t\t\t\t\t\t\t\t</a>\n" +
                        "\t\t\t\t\t\t\t\t<span style=\"color: red;font-size: medium\" class=\"block2-price m-text6 p-r-5\">\n" +
                        "\t\t\t\t\t\t\t\t\t$"+product.getPrice()+"\n" +
                        "\t\t\t\t\t\t\t\t</span>\n" +
                        "\t\t\t\t\t\t\t</div>\n" +
                        "\t\t\t\t\t\t</div>\n" +
                        "\n" +
                        "\t\t\t\t\t</div>";
            }
            return result;
        }
    }



    @RequestMapping("sortHigh")
    public  String sortProductHigh(Model model,
                                   @RequestParam(value="categoryId") int categoryId){

        if(categoryId == 5){
            List<ProductEntity> productEntities = productRepository.sortAllProductByHighPrice();
            List<ProductEntity> products= productPageRepository.getProducts(1, productEntities);

            model.addAttribute("products",products);
        }else{
            List<ProductEntity> productEntities = productRepository.sortProductByHighPrice(categoryId);
            List<ProductEntity> products= productPageRepository.getProducts(1, productEntities);

            model.addAttribute("products",products);
        }
        //sort
        model.addAttribute("categoryId",categoryId);
        return"product";
    }

    @RequestMapping("sortLow")
    public  String sortProductLow(Model model,
                                  @RequestParam(value="categoryId") int categoryId){
        if(categoryId == 5){
            List<ProductEntity> productEntities = productRepository.sortAllProductByLowPrice();
            List<ProductEntity> products= productPageRepository.getProducts(1, productEntities);

            model.addAttribute("products",products);
        }else{
            List<ProductEntity> productEntities = productRepository.sortProductByLowPrice(categoryId);
            List<ProductEntity> products= productPageRepository.getProducts(1, productEntities);

            model.addAttribute("products",products);
        }
        //sort
        model.addAttribute("categoryId",categoryId);
        return"product";
    }

    @RequestMapping("sortView")
    public  String sortProductByView(Model model,
                                     @RequestParam(value="categoryId") int categoryId){
        if(categoryId == 5){
            List<ProductEntity> productEntities = productRepository.sortAllProductByView();
            List<ProductEntity> products= productPageRepository.getProducts(1, productEntities);

            model.addAttribute("products",products);
        }else{
            List<ProductEntity> productEntities = productRepository.sortProductByView(categoryId);
            List<ProductEntity> products= productPageRepository.getProducts(1, productEntities);

            model.addAttribute("products",products);
        }
        //sort
        model.addAttribute("categoryId",categoryId);
        return"product";
    }

    @RequestMapping(value = "searchProduct", method = RequestMethod.POST)
    public String searchProduct(Model model,
                                @RequestParam(value="productName")String productName){
        List<ProductEntity> products = productRepository.searchProductByName(productName);
        model.addAttribute("products",products);
        return "product";
    }
}
