package graduation.repository;

import graduation.entity.OrdersEntity;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class OrderPageRepository {
    private static final int dataPerPage = 10;

    public List<OrdersEntity> getOrders(int page, List<OrdersEntity> ordersEntities){
        // simulate paging, you can replace by MySQL data retrieving for example.
        List<OrdersEntity> result = new ArrayList<>();
        int start = (page - 1) * dataPerPage;
        for (int i = start; i < start + dataPerPage; i++) {
            if (ordersEntities.size() <= i) break;
            else{
                result.add(ordersEntities.get(i));
            }
        }
        return result;
    }
}
