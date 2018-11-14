package graduation.repository;

import graduation.entity.OrderDetailEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrderDetailRepository extends CrudRepository<OrderDetailEntity,Integer> {
    @Query(value="SELECT od.* FROM orders o, order_detail od where o.id=?1 and o.id = od.orderId; ",nativeQuery = true)
    List<OrderDetailEntity> getOrderDetailByOrdersId(int orderId);
}
