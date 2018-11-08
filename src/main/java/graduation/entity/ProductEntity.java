package graduation.entity;

import javax.persistence.*;
import java.util.List;

/**
 * Created by PhunHV on 08/11/2018.
 */
@Entity
@Table(name="product")
public class ProductEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="productName")
    private String productName;

    @Column(name="description")
    private String description;

    @Column(name="price")
    private double price;

    @Column(name="isDel")
    private String isDel;

    @OneToMany(mappedBy = "productEntity", fetch = FetchType.EAGER)
    private List<OrderDetailEntity> orderDetailEntities;

    @OneToMany(mappedBy = "productEntity",fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    private List<ImageEntity> imageEntities;

    @OneToOne(cascade = {CascadeType.ALL})
    @PrimaryKeyJoinColumn
    private ProductQuantityEntity productQuantityEntity;

    @OneToOne(cascade = {CascadeType.ALL})
    @PrimaryKeyJoinColumn
    private ViewEntity viewEntity;

    @OneToMany(mappedBy = "productEntity", fetch = FetchType.EAGER)
    private List<FavouriteEntity> favouriteEntities;

    @OneToMany(mappedBy = "productEntity", fetch = FetchType.EAGER)
    private List<RecentlyEntity> recentlyEntities;

    @ManyToOne
    @JoinColumn(name="categoryId")
    private CategoryEntity categoryEntity;

    public ProductEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIsDel() {
        return isDel;
    }

    public void setIsDel(String isDel) {
        this.isDel = isDel;
    }

    public double getPrice() {
        return price;
    }


    public void setPrice(double price) {
        this.price = price;
    }


    public List<OrderDetailEntity> getOrderDetailEntities() {
        return orderDetailEntities;
    }

    public void setOrderDetailEntities(List<OrderDetailEntity> orderDetailEntities) {
        this.orderDetailEntities = orderDetailEntities;
    }

    public List<ImageEntity> getImageEntities() {
        return imageEntities;
    }

    public void setImageEntities(List<ImageEntity> imageEntities) {
        this.imageEntities = imageEntities;
    }

    public ProductQuantityEntity getProductQuantityEntity() {
        return productQuantityEntity;
    }

    public void setProductQuantityEntity(ProductQuantityEntity productQuantityEntity) {
        this.productQuantityEntity = productQuantityEntity;
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

    public ViewEntity getViewEntity() {
        return viewEntity;
    }

    public void setViewEntity(ViewEntity viewEntity) {
        this.viewEntity = viewEntity;
    }

    public CategoryEntity getCategoryEntity() {
        return categoryEntity;
    }

    public void setCategoryEntity(CategoryEntity categoryEntity) {
        this.categoryEntity = categoryEntity;
    }
}
