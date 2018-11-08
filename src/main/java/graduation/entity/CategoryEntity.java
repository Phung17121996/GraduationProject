package graduation.entity;

import javax.persistence.*;
import java.util.List;

/**
 * Created by PhunHV on 08/11/2018.
 */
@Entity
@Table(name="category")
public class CategoryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="categoryName")
    private String categoryName;

    @OneToMany(mappedBy = "categoryEntity", fetch = FetchType.EAGER)
    private List<ProductEntity> ProductEntities;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public List<ProductEntity> getProductEntities() {
        return ProductEntities;
    }

    public void setProductEntities(List<ProductEntity> productEntities) {
        ProductEntities = productEntities;
    }
}
