package graduation.entity;

import javax.persistence.*;

/**
 * Created by PhunHV on 08/11/2018.
 */
@Entity
@Table(name="recently_product")
public class RecentlyEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name="userId")
    private UserEntity userEntity;

    @ManyToOne
    @JoinColumn(name="productId")
    private ProductEntity productEntity;

    public RecentlyEntity() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public ProductEntity getProductEntity() {
        return productEntity;
    }

    public void setProductEntity(ProductEntity productEntity) {
        this.productEntity = productEntity;
    }
}
