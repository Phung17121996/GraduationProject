package graduation.repository;

import graduation.entity.ProductQuantityEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface ProductQuantityRepository extends CrudRepository<ProductQuantityEntity,Integer> {
    @Query(value="select pq.* from product p, product_quantity pq where p.id=?1 and pq.productId = p.id", nativeQuery = true)
    ProductQuantityEntity getQuantityByProductId(int id);

    @Query(value="select pq.* from product_quantity pq where pq.id = (select max(id) from  product_quantity)",nativeQuery = true)
    ProductQuantityEntity findLastId();
}
