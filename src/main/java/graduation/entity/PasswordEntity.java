package graduation.entity;

import javax.persistence.*;

/**
 * Created by PhunHV on 08/11/2018.
 */
@Entity
@Table(name="pass_word")
public class PasswordEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="hashedPass")
    private String hashedPass;

    @Column(name="keyHash")
    private  String keyHash;

    @OneToOne(mappedBy = "passwordEntity")
    private UserEntity userEntity;


    public PasswordEntity() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHashedPass() {
        return hashedPass;
    }

    public void setHashedPass(String hashedPass) {
        this.hashedPass = hashedPass;
    }

    public String getKeyHash() {
        return keyHash;
    }

    public void setKeyHash(String keyHash) {
        this.keyHash = keyHash;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }
}
