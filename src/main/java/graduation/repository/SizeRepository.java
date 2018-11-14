package graduation.repository;

import graduation.entity.SizeEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SizeRepository extends CrudRepository<SizeEntity,Integer> {
    @Query(value="SELECT s.* FROM size s where id between 1 and 4", nativeQuery = true)
    List<SizeEntity> getSize();

    @Query(value="SELECT s.* FROM size s where id between 5 and 8", nativeQuery = true)
    List<SizeEntity> getSizeJeans();
}
