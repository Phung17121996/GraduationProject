package graduation.entity;

import javax.persistence.*;
import java.util.List;

/**
 * Created by PhunHV on 08/11/2018.
 */
@Entity
@Table(name="orders")
public class OrdersEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="created_date")
    private String createdDate;

    @Column(name="email")
    private String email;

    @Column(name="fullname")
    private String fullName;

    @Column(name="address")
    private String address;

    @Column(name="phone")
    private String phone;

    @Column(name="note")
    private String note;

    @Column(name="discount")
    private int discount;

    @Column(name="shippingFee")
    private double shippingFee;

    @Column(name="orderSubtotal")
    private double orderSubtotal;

    @Column(name="orderTotal")
    private double orderTotal;

    @ManyToOne
    @JoinColumn(name="stateId")
    private StateEntity stateEntity;

    @OneToMany(mappedBy = "ordersEntity", fetch = FetchType.EAGER)
    private List<OrderDetailEntity> orderDetailEntity;

    @ManyToOne
    @JoinColumn(name="userEntityId")
    private UserEntity userEntity;

    public OrdersEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public double getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(double shippingFee) {
        this.shippingFee = shippingFee;
    }

    public double getOrderSubtotal() {
        return orderSubtotal;
    }

    public void setOrderSubtotal(double orderSubtotal) {
        this.orderSubtotal = orderSubtotal;
    }

    public double getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(double orderTotal) {
        this.orderTotal = orderTotal;
    }

    public List<OrderDetailEntity> getOrderDetailEntity() {
        return orderDetailEntity;
    }

    public void setOrderDetailEntity(List<OrderDetailEntity> orderDetailEntity) {
        this.orderDetailEntity = orderDetailEntity;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public StateEntity getStateEntity() {
        return stateEntity;
    }

    public void setStateEntity(StateEntity stateEntity) {
        this.stateEntity = stateEntity;
    }
}
