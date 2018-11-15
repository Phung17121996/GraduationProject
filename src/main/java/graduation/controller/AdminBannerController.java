package graduation.controller;

import graduation.entity.BannerEntity;
import graduation.entity.UserEntity;
import graduation.repository.BannerRepository;
import graduation.repository.ImageRepository;
import graduation.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class AdminBannerController {
    @Autowired
    ImageRepository imageRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    BannerRepository bannerRepository;


    @RequestMapping(value = "admin_banner",method = GET)
    public String showAdminPage(Model model,
                                HttpServletRequest request){
        HttpSession session= request.getSession();
        UserEntity admin= (UserEntity) session.getAttribute("user");
        if(admin != null && admin.getRoleEntity().getId() == roleRepository.findOne(2).getId()){
            List<BannerEntity> banners= bannerRepository.getBanners();
            List<BannerEntity> bannerDisable= bannerRepository.getBannerDisable();
            model.addAttribute("banners", banners);
            model.addAttribute("bannerDisable", bannerDisable);

            return "admin_banner";
        }
        else{
            return "404";
        }
    }

    @RequestMapping(value = "disableBanner",method = POST)
    @ResponseBody
    public String disableBanner(@RequestParam(name = "bannerId") int bannerId,
                                HttpServletRequest request) {
        BannerEntity bannerEntity= bannerRepository.findOne(bannerId);
        bannerEntity.setEnable("false");
        bannerRepository.save(bannerEntity);

        List<BannerEntity> data = bannerRepository.getBanners();
        String result = "";
        for (BannerEntity banner : data) {
            result += "<tr>" +
                    "<td><img src=\"/resources/images/banner/"+banner.getBannerName()+"\"\n" +
                    "                             style=\"height: 80px;\"/></td>\n" +
                    "                    <td></td>\n" +
                    "                    <td><button class=\"confirm btn btn-danger\" onclick=\"disableBanner("+banner.getId()+")\">\n" +
                    "                        <strong>Disable</strong>\n" +
                    "                    </button></td>" +
                    "</tr>";
        }

        List<BannerEntity> data1 = bannerRepository.getBannerDisable();
        String result1 = "";
        for (BannerEntity banner : data1) {
            result1 += "<tr>\n" +
                    "                    <td><img src=\"/resources/images/banner/"+banner.getBannerName()+"\"\n" +
                    "                             style=\"height: 80px;\"/></td>\n" +
                    "                    <td><button class=\"btn btn-primary\"\n" +
                    "                                onclick=\"enableBanner("+banner.getId()+")\">\n" +
                    "                        <strong>Enable</strong></button></td>\n" +
                    "                </tr>";
        }



        return result +"||" + result1;
    }

    @RequestMapping(value = "enableBanner",method = POST)
    @ResponseBody
    public String enableBanner(@RequestParam(name = "bannerId") int bannerId,
                               HttpServletRequest request) {
        BannerEntity bannerEntity= bannerRepository.findOne(bannerId);
        bannerEntity.setEnable("true");
        bannerRepository.save(bannerEntity);

        List<BannerEntity> data = bannerRepository.getBanners();
        String result = "";
        for (BannerEntity banner : data) {
            result += "<tr>" +
                    "<td><img src=\"/resources/images/banner/"+banner.getBannerName()+"\"\n" +
                    "                             style=\"height: 80px;\"/></td>\n" +
                    "                    <td></td>\n" +
                    "                    <td><button class=\"confirm btn btn-danger\" onclick=\"disableBanner("+banner.getId()+")\">\n" +
                    "                        <strong>Disable</strong>\n" +
                    "                    </button></td>" +
                    "</tr>";
        }

        List<BannerEntity> data1 = bannerRepository.getBannerDisable();
        String result1 = "";
        for (BannerEntity banner : data1) {
            result1 += "<tr>\n" +
                    "                    <td><img src=\"/resources/images/banner/"+banner.getBannerName()+"\"\n" +
                    "                             style=\"height: 80px;\"/></td>\n" +
                    "                    <td><button class=\"btn btn-primary\"\n" +
                    "                                onclick=\"enableBanner("+banner.getId()+")\">\n" +
                    "                        <strong>Enable</strong></button></td>\n" +
                    "                </tr>";
        }



        return result +"||" + result1;
    }



    @RequestMapping(value = "addBanner",headers = "content-type=multipart/*", method = POST)
    public String addProduct(@RequestParam("file") MultipartFile[] file){
        try {
            for(int i=0; i<file.length; i++){
                byte[] bytes = file[i].getBytes();
                // Creating the directory to store file
                String pathName = "C:\\Users\\PC\\Downloads\\Compressed\\ManShop\\src\\main\\webapp\\resources\\images\\banner";
                File dir = new File(pathName);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                // Create the file on server
                String fileSource = dir.getAbsolutePath() + File.separator + file[i].getOriginalFilename();
                File serverFile = new File(fileSource);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
            }

            List<BannerEntity> bannerEntities = new ArrayList<>();

            for(int j=0; j< file.length; j++){
                BannerEntity banner= new BannerEntity();
                banner.setBannerName(file[j].getOriginalFilename());
                banner.setEnable("true");
                bannerEntities.add(banner);
                bannerRepository.save(banner);
            }

            return "redirect:admin_banner";
        } catch (Exception e) {
            System.out.println(e);
            return "Error when uploading file"+ e;
        }
    }
}
