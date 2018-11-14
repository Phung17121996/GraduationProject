package graduation.repository;

import graduation.entity.UserEntity;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UserPageRepository {
    private static final int dataPerPage = 10;

    public List<UserEntity> getUsers(int page, List<UserEntity> userEntities){
        // simulate paging, you can replace by MySQL data retrieving for example.
        List<UserEntity> result = new ArrayList<>();
        int start = (page - 1) * dataPerPage;
        for (int i = start; i < start + dataPerPage; i++) {
            if (userEntities.size() <= i) break;
            else{
                result.add(userEntities.get(i));
            }
        }
        return result;
    }
}
