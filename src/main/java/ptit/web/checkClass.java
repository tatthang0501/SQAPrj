package ptit.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import ptit.BoMon;
import ptit.data.BoMonRepository;


public class checkClass {
    @Autowired
    static BoMonRepository bmRepo;
    public static void main(String[] args) {
        try{
            List<BoMon> listBM = bmRepo.getListBoMon(1);
            System.out.println(listBM.size());
            System.out.println(listBM.get(0).getId());
            System.out.println(listBM.get(0).getTen());
            System.out.println(listBM.get(0).getMota());
            System.out.println(listBM.get(0).getKhoa().getId());
            System.out.println(listBM.get(0).getDsGiangVien().size());
            System.out.println(listBM.get(0).getDsMonHoc().size());
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
