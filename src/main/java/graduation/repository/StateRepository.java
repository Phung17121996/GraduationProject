package graduation.repository;

import graduation.entity.StateEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface StateRepository extends CrudRepository<StateEntity, Integer> {
    @Query(value="select s.* from state s where s.id > ?1", nativeQuery = true)
    List<StateEntity> getStates(int id);
}
