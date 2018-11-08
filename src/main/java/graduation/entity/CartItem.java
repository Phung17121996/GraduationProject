package graduation.entity;

/**
 * Created by PhunHV on 08/11/2018.
 */
public class CartItem {
    private ProductEntity product;
    private int quantityProductCart;
    private double subTotal;
    private String size;

    public CartItem() {

    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public int getQuantityProductCart() {
        return quantityProductCart;
    }

    public void setQuantityProductCart(int quantityProductCart) {
        this.quantityProductCart = quantityProductCart;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
}
