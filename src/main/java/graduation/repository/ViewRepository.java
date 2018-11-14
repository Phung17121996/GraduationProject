package graduation.repository;

import graduation.entity.ViewEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface ViewRepository extends CrudRepository<ViewEntity,Integer> {
    @Query(value = "select v.* from product p, view v where p.id=?1 and p.id = v.id",nativeQuery = true)
    ViewEntity getViewByProductId(int productId);
}
