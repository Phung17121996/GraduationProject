package graduation.entity;

import javax.persistence.*;

/**
 * Created by PhunHV on 08/11/2018.
 */
@Entity
@Table(name="order_detail")
public class OrderDetailEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="quantity")
    private int quantity;

    @Column(name="subTotal")
    private double subTotal;

    @Column(name="size")
    private String size;

    @ManyToOne
    @JoinColumn(name="productId")
    private ProductEntity productEntity;

    @ManyToOne
    @JoinColumn(name="orderId")
    private OrdersEntity ordersEntity;


    public OrderDetailEntity() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    public ProductEntity getProductEntity() {
        return productEntity;
    }

    public void setProductEntity(ProductEntity productEntity) {
        this.productEntity = productEntity;
    }

    public OrdersEntity getOrdersEntity() {
        return ordersEntity;
    }

    public void setOrdersEntity(OrdersEntity ordersEntity) {
        this.ordersEntity = ordersEntity;
    }
}
