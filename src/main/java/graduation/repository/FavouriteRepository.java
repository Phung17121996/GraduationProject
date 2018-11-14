package graduation.repository;

import graduation.entity.FavouriteEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface FavouriteRepository extends CrudRepository<FavouriteEntity,Integer> {
    @Query(value="SELECT f.* FROM favourite f, user u where u.id=?1 and u.id = f.userId ORDER BY f.id desc",nativeQuery = true)
    List<FavouriteEntity> getFavouriteListByUserId(int userId);
}
