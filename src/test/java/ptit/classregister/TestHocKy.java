package ptit.classregister;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import ptit.HocKy;
import ptit.data.HocKyRepository;
//Test khả năng lấy dữ liệu học kỳ từ CSDL
// Nguyễn Tất Thắng
@SpringBootTest
public class TestHocKy {
    @Autowired
    HocKyRepository hkRepo;

    @Test
    public void testGetHocKy(){
        ArrayList<HocKy> listHK = (ArrayList<HocKy>) hkRepo.findAll();
        //Kiểm tra có dữ liệu trả về
        assertNotNull(listHK);
        //Kiểm tra số lượng đối tượng trả về
        assertEquals(listHK.size(), 2);
        //Kiểm tra dữ liệu trả về trùng khớp
        // ArrayList<HocKy> listHKExpected = new ArrayList<>();
        // HocKy hk1 = new HocKy();
        // hk1.setId(0);
        // hk1.setTen("Học kỳ 1");
        // hk1.setMota(null);
        // HocKy hk2 = new HocKy();
        // hk1.setId(0);
        // hk2.setTen("Học kỳ 2");
        // hk2.setMota(null);
        // listHKExpected.add(hk2);
        // listHKExpected.add(hk1);

        // assertEquals(listHK, listHKExpected);
    }
}
