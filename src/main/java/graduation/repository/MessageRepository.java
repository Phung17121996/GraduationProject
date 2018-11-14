package graduation.repository;

import graduation.entity.MessageEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepository extends CrudRepository<MessageEntity,Integer> {
    @Query(value="SELECT m.* FROM message m where isRep !='false' ORDER BY m.id desc limit 10", nativeQuery = true)
    List<MessageEntity> getMessageDESC();
}
