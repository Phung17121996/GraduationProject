package graduation.repository;

import graduation.entity.CheckLoginEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface CheckLoginRepository extends CrudRepository<CheckLoginEntity, Integer> {
    CheckLoginEntity findById(int id);
    @Query(value="SELECT c.numberLoginFail FROM check_login c WHERE c.id = ?1", nativeQuery = true)
    int getNumberLoginFailById(int id);
}
