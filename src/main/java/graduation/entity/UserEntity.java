package graduation.entity;

import javax.persistence.*;
import java.util.List;

/**
 * Created by PhunHV on 08/11/2018.
 */
@Entity
@Table(name="user")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="email")
    private String email;

    @Column(name="address")
    private String address;

    @Column(name="fullName")
    private String fullName;

    @Column(name="phone")
    private String phone;

    private String isDel;

    public String getIsDel() {
        return isDel;
    }

    public void setIsDel(String isDel) {
        this.isDel = isDel;
    }

    @ManyToOne
    @JoinColumn(name="roleId")
    private RoleEntity roleEntity;

    @OneToOne(cascade = {CascadeType.ALL})
    @PrimaryKeyJoinColumn
    private PasswordEntity passwordEntity;

    @OneToMany(mappedBy = "userEntity", fetch = FetchType.EAGER)
    private List<OrdersEntity> ordersEntities;

    @OneToMany(mappedBy = "userEntity", fetch = FetchType.EAGER)
    private List<FavouriteEntity> favouriteEntities ;

    @OneToMany(mappedBy = "userEntity", fetch = FetchType.EAGER)
    private List<RecentlyEntity> recentlyEntities;

    @OneToMany(mappedBy = "userEntity",fetch = FetchType.EAGER)
    private List<MessageEntity> messageEntities;

    public UserEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public RoleEntity getRoleEntity() {
        return roleEntity;
    }

    public void setRoleEntity(RoleEntity roleEntity) {
        this.roleEntity = roleEntity;
    }

    public PasswordEntity getPasswordEntity() {
        return passwordEntity;
    }

    public void setPasswordEntity(PasswordEntity passwordEntity) {
        this.passwordEntity = passwordEntity;
    }

    public List<OrdersEntity> getOrdersEntities() {
        return ordersEntities;
    }

    public void setOrdersEntities(List<OrdersEntity> ordersEntities) {
        this.ordersEntities = ordersEntities;
    }

    public List<FavouriteEntity> getFavouriteEntities() {
        return favouriteEntities;
    }

    public void setFavouriteEntities(List<FavouriteEntity> favouriteEntities) {
        this.favouriteEntities = favouriteEntities;
    }

    public List<RecentlyEntity> getRecentlyEntities() {
        return recentlyEntities;
    }

    public void setRecentlyEntities(List<RecentlyEntity> recentlyEntities) {
        this.recentlyEntities = recentlyEntities;
    }

    public List<MessageEntity> getMessageEntities() {
        return messageEntities;
    }

    public void setMessageEntities(List<MessageEntity> messageEntities) {
        this.messageEntities = messageEntities;
    }
}
