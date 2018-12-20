package graduation.util;

import graduation.RoleConst;
import graduation.entity.UserEntity;
import graduation.helper.GmailSender;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AdminUtil {
    public static boolean checkRoleAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        UserEntity userEntity = (UserEntity) session.getAttribute("user");
        if(userEntity == null || userEntity.getRoleEntity().getId() != RoleConst.ROLE_ADMIN){
            return false;
        }

        return true;
    }
}
