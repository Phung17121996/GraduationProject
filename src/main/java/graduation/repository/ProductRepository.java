package graduation.repository;

import graduation.entity.ProductEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProductRepository extends CrudRepository<ProductEntity,Integer> {
    @Query(value="SELECT p.* FROM product p, view v where p.id = v.id and p.isDel = 'true' ORDER BY count desc limit 8", nativeQuery = true)
    List<ProductEntity> getHotProduct();

    @Query(value="SELECT p.* FROM product p, view v , category c where c.id = ?1 and p.id = v.id and c.id = p.categoryId  and p.isDel = 'true' ORDER BY v.count desc limit 8", nativeQuery = true)
    List<ProductEntity> getHotProductByCategoryID(int categoryId);

    @Query(value="SELECT p.* FROM product p, category c where c.id = ?1 and p.categoryId = c.id  and p.isDel = 'true' ORDER BY p.id Desc", nativeQuery = true)
    List<ProductEntity> getProductbyCategoryId(int categoryId);

    @Query(value="SELECT p.* FROM product p, view v where p.price = ?1 and p.categoryId = ?2 and  p.id != ?3 and p.id = v.id  and p.isDel = 'true' order by v.count desc limit 3",nativeQuery = true)
    List<ProductEntity> getProductbyPriceAndCategoryId(double price, int categoryId, int productId);

    @Query(value="Select p.* from product p, category c where c.id = ?1 and p.categoryId = c.id  and p.isDel = 'true' order by p.price desc",nativeQuery = true)
    List<ProductEntity> sortProductByHighPrice(int categoryId);

    @Query(value="Select p.* from product p, category c where c.id = ?1 and p.categoryId = c.id  and p.isDel = 'true' order by p.price asc",nativeQuery = true)
    List<ProductEntity> sortProductByLowPrice(int categoryId);

    @Query(value="Select p.* from product p  where p.isDel = 'true' order by p.price desc",nativeQuery = true)
    List<ProductEntity> sortAllProductByHighPrice();

    @Query(value="Select p.* from product p  where p.isDel = 'true' order by p.price asc",nativeQuery = true)
    List<ProductEntity> sortAllProductByLowPrice();

    @Query(value="SELECT p.* FROM product p, view v where p.id = v.id and p.isDel = 'true' ORDER BY v.count desc",nativeQuery = true)
    List<ProductEntity> sortAllProductByView();

    @Query(value="SELECT p.* FROM product p, view v , category c where c.id = ?1 and p.id = v.id and c.id = p.categoryId  and p.isDel = 'true' ORDER BY v.count desc",nativeQuery = true)
    List<ProductEntity> sortProductByView(int categoryId);

    @Query(value="Select p.* from product p where p.productName LIKE %?1%  and p.isDel = 'true'" , nativeQuery = true)
    List<ProductEntity> searchProductByName(String productName);

    @Query(value="SELECT p.* FROM product p WHERE p.isDel != 'false' ORDER BY p.id desc", nativeQuery = true)
    List<ProductEntity> getProductsDESC();

    @Query(value="SELECT p.* FROM product p WHERE p.isDel = 'false' ORDER BY p.id desc", nativeQuery = true)
    List<ProductEntity> getProductsDisable();

    @Query(value="select p.* from product p where p.id = (select max(id) from  product)", nativeQuery = true)
    ProductEntity findLastId();
}
