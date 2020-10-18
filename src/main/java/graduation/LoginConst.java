package graduation;

public class LoginConst {
    public static final int EMAIL_ERROR = 1;
    public static final int PASSWORD_ERROR = 2;
    public static final int USER_NULL = 3;
    public static final int BANNED_USER = 4;
    public static final int LOCKED_USER = 5;

    public static final long TIME_LOCK_USER = 86400000; //milisecond
    public static final int NUMER_MAX_LOGIN_FAIL = 5;
    public static final int NUMER_LOGIN_FAIL = 0;
}
