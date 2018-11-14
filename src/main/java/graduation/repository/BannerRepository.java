package graduation.repository;

import graduation.entity.BannerEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BannerRepository extends CrudRepository<BannerEntity,Integer> {
    @Query(value="SELECT b.* FROM banner b WHERE b.enable = 'true' ORDER BY b.id desc limit 4", nativeQuery = true)
    List<BannerEntity> getBanners();

    @Query(value="SELECT b.* FROM banner b WHERE b.enable = 'false' ORDER BY b.id desc", nativeQuery = true)
    List<BannerEntity> getBannerDisable();
}
