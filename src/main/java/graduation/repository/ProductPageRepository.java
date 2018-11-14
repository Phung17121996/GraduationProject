package graduation.repository;

import graduation.entity.ProductEntity;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductPageRepository {
    private static final int dataPerPage = 12;

    public List<ProductEntity> getProducts(int page, List<ProductEntity> productEntities){
        // simulate paging, you can replace by MySQL data retrieving for example.
        List<ProductEntity> result = new ArrayList<>();
        int start = (page - 1) * dataPerPage;
        for (int i = start; i < start + dataPerPage; i++) {
            if (productEntities.size() <= i) break;
            else{
                result.add(productEntities.get(i));
            }
        }
        return result;
    }
}
