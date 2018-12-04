package graduation.helper;
import java.util.UUID;
public class GenCaptchaUtil {
    public static String getCaptcha() {
        String uuid = UUID.randomUUID().toString();
        String[] arrayList = uuid.split("-");
        if (arrayList.length <= 0) {
            return "abcZYx123";
        }
        int index1 = myRandom(0, arrayList.length);
        int index2 = myRandom(0, arrayList.length);
        return arrayList[index1] + arrayList[index2];
    }

    public static int myRandom(int min, int max) {
        return (int)(Math.random() * max + min);
    }
}
