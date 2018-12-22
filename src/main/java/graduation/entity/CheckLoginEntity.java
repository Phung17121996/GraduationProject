package graduation.entity;

import javax.persistence.*;

@Entity
@Table(name="check_login")
public class CheckLoginEntity {
    @Id
    private int id;

    @Column(name="numberLoginFail")
    private int numberLoginFail;

    @Column(name = "lastLogin")
    private long lastLogin;

    public CheckLoginEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumberLoginFail() {
        return numberLoginFail;
    }

    public void setNumberLoginFail(int numberLoginFail) {
        this.numberLoginFail = numberLoginFail;
    }

    public long getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(long lastLogin) {
        this.lastLogin = lastLogin;
    }
}
