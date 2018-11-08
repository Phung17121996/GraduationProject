package graduation.entity;

import javax.persistence.*;
import java.util.List;

/**
 * Created by PhunHV on 08/11/2018.
 */
@Entity
@Table(name="role")
public class RoleEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="roleName")
    private String roleName;

    @OneToMany(mappedBy = "roleEntity",fetch = FetchType.EAGER)
    private List<UserEntity> userEntities;

    public RoleEntity() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<UserEntity> getUserEntities() {
        return userEntities;
    }

    public void setUserEntities(List<UserEntity> userEntities) {
        this.userEntities = userEntities;
    }
}
