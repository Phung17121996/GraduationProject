package graduation.controller;

import graduation.entity.ImageEntity;
import graduation.entity.ProductEntity;
import graduation.entity.ProductQuantityEntity;
import graduation.entity.UserEntity;
import graduation.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class AdminProductController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    ImageRepository imageRepository;
    @Autowired
    ProductQuantityRepository productQuantityRepository;
    @Autowired
    ProductPageRepository productPageRepository;
    @Autowired
    FavouriteRepository favouriteRepository;
    @Autowired
    OrderDetailRepository orderDetailRepository;
    @Autowired
    RoleRepository roleRepository;


    @RequestMapping(value = "admin_product",method = GET)
    public String showAdminPage(Model model,
                                HttpServletRequest request){
        HttpSession session= request.getSession();
        UserEntity admin= (UserEntity) session.getAttribute("user");
        if(admin != null && admin.getRoleEntity().getId() == roleRepository.findOne(2).getId()){
            List<ProductEntity> products= (List<ProductEntity>) productRepository.getProductsDESC();
            List<ProductEntity> productDisable= (List<ProductEntity>) productRepository.getProductsDisable();

            model.addAttribute("products", products);
            model.addAttribute("productDisable", productDisable);
            model.addAttribute("productEntity", new ProductEntity());
            return "admin_product";
        }
        else{
            return "404";
        }
    }

    @RequestMapping(value = "deleteProduct",method = POST)
    @ResponseBody
    public String deleteProduct(@RequestParam(name = "productId") int productId,
                                HttpServletRequest request) {
        ProductEntity productEntity = productRepository.findOne(productId);
        productEntity.setIsDel("false");
        productRepository.save(productEntity);

        List<ProductEntity> data =
                productPageRepository.getProducts(1,(List<ProductEntity>) productRepository.getProductsDESC());
        String result = "";
        for (ProductEntity product : data) {
            result += "<tr><td>" + product.getId() + "</td>" +
                    "<td><img src=\"/resources/images/product/" + product.getImageEntities().get(0).getImageName() + "\"\n" +
                    "style=\"height: 50px;\"></td>" +
                    "<td>" + product.getProductName() + "</td>" +
                    "<td>" + product.getPrice() + "</td>" +
                    "<td>" + product.getCategoryEntity().getCategoryName() + "</td>" +
                    "<td><button class=\"btn btn-primary\" \n" +
                    "onclick=\"window.location.href='editProduct?id=" + product.getId() + "'\"><strong>Edit</strong></button></td>\n" +
                    "<td><button class=\"confirm btn btn-danger\" onclick=\"deleteProduct(" + product.getId() + ")\">\n" +
                    "                        <strong>Delete</strong>\n" +
                    "                    </button></td></tr>";
        }

        List<ProductEntity> data1 =
                productPageRepository.getProducts(1,(List<ProductEntity>) productRepository.getProductsDisable());
        String result1 = "";
        for (ProductEntity product : data1) {
            result1 += "<tr><td>" + product.getId() + "</td>" +
                    "<td><img src=\"/resources/images/product/" + product.getImageEntities().get(0).getImageName() + "\"\n" +
                    "style=\"height: 50px;\"></td>" +
                    "<td>" + product.getProductName() + "</td>" +
                    "<td>" + product.getPrice() + "</td>" +
                    "<td>" + product.getCategoryEntity().getCategoryName() + "</td>" +
                    "<td><button class=\"btn btn-primary\" \n" +
                    "onclick=\"window.location.href='editProduct?id=" + product.getId() + "'\"><strong>Edit</strong></button></td>\n" +
                    "<td><button class=\"confirm btn btn-default\" onclick=\"enableProduct("+product.getId()+")\">\n" +
                    "                        <strong>Enable</strong>\n" +
                    "                    </button></td></tr>";
        }

        return result +"||" + result1;
    }

    @RequestMapping(value = "enableProduct",method = POST)
    @ResponseBody
    public String enableProduct(@RequestParam(name = "productId") int productId,
                                HttpServletRequest request) {
        ProductEntity productEntity = productRepository.findOne(productId);
        productEntity.setIsDel("true");
        productRepository.save(productEntity);

        List<ProductEntity> data =
                productPageRepository.getProducts(1,(List<ProductEntity>) productRepository.getProductsDESC());
        String result = "";
        for (ProductEntity product : data) {
            result += "<tr><td>" + product.getId() + "</td>" +
                    "<td><img src=\"/resources/images/product/" + product.getImageEntities().get(0).getImageName() + "\"\n" +
                    "style=\"height: 50px;\"></td>" +
                    "<td>" + product.getProductName() + "</td>" +
                    "<td>" + product.getPrice() + "</td>" +
                    "<td>" + product.getCategoryEntity().getCategoryName() + "</td>" +
                    "<td><button class=\"btn btn-primary\" \n" +
                    "onclick=\"window.location.href='editProduct?id=" + product.getId() + "'\"><strong>Edit</strong></button></td>\n" +
                    "<td><button class=\"confirm btn btn-danger\" onclick=\"deleteProduct(" + product.getId() + ")\">\n" +
                    "                        <strong>Delete</strong>\n" +
                    "                    </button></td></tr>";
        }

        List<ProductEntity> data1 =
                productPageRepository.getProducts(1,(List<ProductEntity>) productRepository.getProductsDisable());
        String result1 = "";
        for (ProductEntity product : data1) {
            result1 += "<tr><td>" + product.getId() + "</td>" +
                    "<td><img src=\"/resources/images/product/" + product.getImageEntities().get(0).getImageName() + "\"\n" +
                    "style=\"height: 50px;\"></td>" +
                    "<td>" + product.getProductName() + "</td>" +
                    "<td>" + product.getPrice() + "</td>" +
                    "<td>" + product.getCategoryEntity().getCategoryName() + "</td>" +
                    "<td><button class=\"btn btn-primary\" \n" +
                    "onclick=\"window.location.href='editProduct?id=" + product.getId() + "'\"><strong>Edit</strong></button></td>\n" +
                    "<td><button class=\"confirm btn btn-default\" onclick=\"enableProduct("+product.getId()+")\">\n" +
                    "                        <strong>Enable</strong>\n" +
                    "                    </button></td></tr>";
        }

        return result +"||" + result1;
    }



    @RequestMapping(value = "addProduct",headers = "content-type=multipart/*", method = POST)
    public String addProduct(ProductEntity productEntity,
                             @RequestParam(name = "categoryName") String category,
                             @RequestParam(name = "quantity") String quantity,
                             @RequestParam("file") MultipartFile[] file){
        try {
            for(int i=0; i<file.length; i++){
                byte[] bytes = file[i].getBytes();
                // Creating the directory to store file
                String pathName = "C:\\Users\\PC\\Downloads\\Compressed\\ManShop\\src\\main\\webapp\\resources\\images\\product";
                File dir = new File(pathName);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                // Create the file on server
                String fileSource = dir.getAbsolutePath() + File.separator + file[i].getOriginalFilename();
                File serverFile = new File(fileSource);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
            }

            productEntity.setCategoryEntity(categoryRepository.findByCategoryName(category));
            productEntity.setIsDel("true");

            List<ImageEntity> imageEntities = new ArrayList<>();

            ImageEntity image = new ImageEntity();
            image.setImageName(file[0].getOriginalFilename());
            image.setProductEntity(productEntity);
            imageEntities.add(image);


            ImageEntity image1 = new ImageEntity();
            image1.setImageName(file[1].getOriginalFilename());
            image1.setProductEntity(productEntity);
            imageEntities.add(image1);

            productEntity.setImageEntities(imageEntities);

            ProductQuantityEntity productQuantity= new ProductQuantityEntity();
            productQuantity.setQuantity(Integer.parseInt(quantity));
            productQuantity.setProductEntity(productEntity);


            productEntity.setProductQuantityEntity(productQuantity);

            productQuantityRepository.save(productQuantity);

            imageRepository.save(image);
            imageRepository.save(image1);

            productRepository.save(productEntity);

            return "redirect:admin_product";
        } catch (Exception e) {
            System.out.println(e);
            return "Error when uploading file"+ e;
        }
    }

    @RequestMapping("editProduct")
    public String editProduct(@RequestParam(name = "id") int id,
                              Model model){
        ProductEntity product= productRepository.findOne(id);
        model.addAttribute("product", product);
        return "admin_editproduct";
    }

    @RequestMapping(value = "editProduct", method = POST)
    public String doEdit(@RequestParam(name = "id") int id,
                         @RequestParam(name = "productName") String name,
                         @RequestParam(name = "description") String description,
                         @RequestParam(name = "price") double price,
                         @RequestParam(name = "quantity") int quantity){
        ProductEntity productEntity= productRepository.findOne(id);
        productEntity.setProductName(name);
        productEntity.setDescription(description);
        productEntity.setPrice(price);
        productEntity.getProductQuantityEntity().setQuantity(quantity);


        productRepository.save(productEntity);
        return "redirect:admin_product";
    }
}
