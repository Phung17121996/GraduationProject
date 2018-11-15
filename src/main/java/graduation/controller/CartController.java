package graduation.controller;

import graduation.entity.CartItem;
import graduation.entity.ProductEntity;
import graduation.repository.OrderDetailRepository;
import graduation.repository.OrdersRepository;
import graduation.repository.ProductRepository;
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
public class CartController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    OrdersRepository ordersRepository;
    @Autowired
    OrderDetailRepository orderDetailRepository;

    @RequestMapping(value = "addToCart", method = RequestMethod.POST)
    public String cartPage(Model model,
                           @RequestParam(name = "productId") int productId,
                           @RequestParam(name="size") String size,
                           HttpServletRequest request) {
        ProductEntity product = productRepository.findOne(productId);
        HttpSession session = request.getSession();
        List<CartItem> carts = (List<CartItem>) session.getAttribute("carts");

        double subTotal = 0;
        if (carts != null) {
            boolean isExistingId = false;
            for (CartItem cart : carts) {
                if (cart.getProduct().getId() == productId && cart.getSize().equals(size)) {
                    cart.setQuantityProductCart(cart.getQuantityProductCart() + 1);
                    subTotal = product.getPrice() * cart.getQuantityProductCart();
                    cart.setSubTotal(subTotal);
                    cart.setSize(size);
                    isExistingId = true;
                    break;
                }
            }
            if (!isExistingId) {
                CartItem cart = new CartItem();
                cart.setQuantityProductCart(1);
                subTotal = product.getPrice() * cart.getQuantityProductCart();
                cart.setProduct(product);
                cart.setSubTotal(subTotal);
                cart.setSize(size);
                carts.add(cart);
            }
        } else {
            carts = new ArrayList<>();
            CartItem cart = new CartItem();
            cart.setQuantityProductCart(1);
            subTotal = product.getPrice() * cart.getQuantityProductCart();
            cart.setProduct(product);
            cart.setSubTotal(subTotal);
            cart.setSize(size);
            carts.add(cart);
        }

        double orderSubtotal = 0;
        int  cartQuantity =0;
        for(CartItem cart : carts){
            orderSubtotal += cart.getSubTotal();
            cartQuantity += 1;
        }
        session.setAttribute("cartQuantity",cartQuantity);
        session.setAttribute("orderSubtotal",orderSubtotal);
        session.setAttribute("carts",carts);
        int categoryId= (int) session.getAttribute("categoryId");
        return "redirect:product?categoryId="+categoryId ;
    }

    @RequestMapping(value = "viewCart")
    public String viewCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<CartItem> carts = (List<CartItem>) session.getAttribute("carts");
        if(carts == null || carts.size() == 0){
            return "empty_cart";
        }else{
            return "cart";
        }
    }

    @RequestMapping(value = "updateCart",method = RequestMethod.POST)
    public String updateCart(Model model,
                             HttpServletRequest request,
                             @RequestParam(name="productId") int [] productId,
                             @RequestParam(name="size") String[] size,
                             @RequestParam(name="quantity") int [] quantity){
        HttpSession session = request.getSession();
        List<CartItem> carts = (List<CartItem>) session.getAttribute("carts");
        double subTotal = 0;

        for (int i = 0; i < productId.length; i++) {
            for (CartItem cart: carts) {
                if (cart.getProduct().getId() == productId[i] && cart.getSize().equalsIgnoreCase(size[i])) {
                    ProductEntity product = productRepository.findOne(productId[i]);
                    cart.setQuantityProductCart(quantity[i]);
                    subTotal = product.getPrice() * quantity[i];
                    cart.setSubTotal(subTotal);
                }
            }
        }

        double orderSubtotal = 0;
        for(CartItem cart : carts){
            orderSubtotal += cart.getSubTotal();
        }
        session.setAttribute("orderSubtotal",orderSubtotal);
        session.setAttribute("carts", carts);
        return "cart";
    }

    @RequestMapping(value = "deleteCartItem", method = RequestMethod.POST)
    @ResponseBody
    public String deleteCartItem(@RequestParam(name = "productId") int productId,
                                 @RequestParam(name = "size") String size,
                                 HttpServletRequest request){
        HttpSession session = request.getSession();
        List<CartItem> carts = (List<CartItem>) session.getAttribute("carts");
        String result= "";
        int cartQuantity= (int) session.getAttribute("cartQuantity");
        for(CartItem cart: carts){
            if(cart.getProduct().getId()== productId && cart.getSize().equalsIgnoreCase(size)){
                carts.remove(cart);
                cartQuantity--;
                session.setAttribute("cartQuantity",cartQuantity);
            }
        }
        for(CartItem cart: carts){
            result+="<tr class=\"table-row\">\n" +
                    "                                <td class=\"column-1\"><a href=\"index\">\n" +
                    "                                    <div class=\"cart-img-product b-rad-4 o-f-hidden\">\n" +
                    "                                        <img src=\"/resources/images/product/"+cart.getProduct().getImageEntities().get(0).getImageName()+"\"\n" +
                    "                                             alt=\"IMG-PRODUCT\">\n" +
                    "                                    </div>\n" +
                    "                                </a>\n" +
                    "                                </td>\n" +
                    "                                <input type=\"hidden\" value=\""+cart.getProduct().getId()+"\" name=\"productId\" id=\"productId\">\n" +
                    "                                <td class=\"column-2\" ><a\n" +
                    "                                        href=\"product-detail?productId="+cart.getProduct().getId()+"\"><strong style=\"font-size: 16px;\">"+cart.getProduct().getProductName()+"</strong></a>\n" +
                    "                                </td>\n" +
                    "                                <td class=\"column-3\"><strong>"+cart.getSize()+"</strong></td>\n" +
                    "                                <input type=\"hidden\" value=\""+cart.getSize()+"\" name=\"size\" id=\"size\">\n" +
                    "                                <td><strong>$ "+cart.getProduct().getPrice()+"</strong></td>\n" +
                    "                                <td class=\"column-5\">\n" +
                    "                                    <div class=\"flex-w bo5 of-hidden w-size17\">\n" +
                    "                                        <button class=\"btn-num-product-down color1 flex-c-m size7 bg8 eff2\">\n" +
                    "                                            <i class=\"fs-12 fa fa-minus\" aria-hidden=\"true\"></i>\n" +
                    "                                        </button>\n" +
                    "\n" +
                    "                                        <input id=\"quantity\" class=\"size8 m-text18 t-center num-product\"\n" +
                    "                                               type=\"number\" name=\"quantity\" max=\""+cart.getProduct().getProductQuantityEntity().getQuantity()+"\" value=\""+cart.getQuantityProductCart()+"\">\n" +
                    "\n" +
                    "                                        <button class=\"btn-num-product-up color1 flex-c-m size7 bg8 eff2\" >\n" +
                    "                                            <i class=\"fs-12 fa fa-plus\" aria-hidden=\"true\"></i>\n" +
                    "                                        </button>\n" +
                    "                                    </div>\n" +
                    "                                    <br>\n" +
                    "                                    <span style=\"color: #bd2130\">${message}</span>\n" +
                    "                                </td>\n" +
                    "                                <td class=\"column-6\" style=\"color: red;\"><strong>$ "+cart.getSubTotal()+"</strong></td>\n" +
                    "                                <td>\n" +
                    "                                    <button class=\"btn btn-danger\" onclick=\"deleteCartItem("+cart.getProduct().getId()+")\">\n" +
                    "                                        <span class=\"glyphicon glyphicon-trash\"></span>\n" +
                    "                                    </button>\n" +
                    "                                </td>\n" +
                    "                            </tr>";

        }
        return result;
    }
}
