package graduation.repository;

import graduation.entity.DiscountCodeEntity;
import org.springframework.data.repository.CrudRepository;

public interface DiscountCodeRepository extends CrudRepository<DiscountCodeEntity,Integer> {
    DiscountCodeEntity findByCode(String code);
}
