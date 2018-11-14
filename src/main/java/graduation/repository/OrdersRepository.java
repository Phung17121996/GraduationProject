package graduation.repository;

import graduation.entity.OrdersEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrdersRepository extends CrudRepository<OrdersEntity,Integer> {
    @Query(value="SELECT o.* FROM orders o, user u where u.id=?1 and u.id = o.userEntityId ORDER BY o.id desc; ",nativeQuery = true)
    List<OrdersEntity> getOrderByUserId(int id);

    @Query(value="select o.* from orders o where stateId = ?1 ; ",nativeQuery = true)
    List<OrdersEntity> getOrdersByState(int id);

    @Query(value="SELECT o.* FROM orders o ORDER BY o.id desc; ",nativeQuery = true)
    List<OrdersEntity> getOrdersDESC();

    @Query(value="SELECT o.* FROM orders o, user u where u.id=?1 and u.id = o.userEntityId and o.stateId !=4 order by o.id desc",nativeQuery = true)
    List<OrdersEntity> getsuccessfullOrderByUserId(int userId);
}
