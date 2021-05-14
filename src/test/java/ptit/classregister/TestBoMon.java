package ptit.classregister;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.junit.jupiter.api.Test;

import ptit.BoMon;
import ptit.data.BoMonRepository;
import ptit.data.HocKyRepository;

//Test khả năng lấy dữ liệu bộ môn từ CSDL
// Nguyễn Tất Thắng
@SpringBootTest
public class TestBoMon {
    
    @Autowired
    BoMonRepository bmRepo;

    @Autowired
    HocKyRepository hkRepo;
    
    //Test lấy tất cả dữ liệu bộ môn qua id của khoa
    @Test
    public void testGetDsBoMonByKhoaID(){
        List<BoMon> listBM =  bmRepo.getListBoMon(1);
        //Kiểm tra list lấy từ CSDL khác null
        assertNotNull(listBM);
        //Kiểm tra số lượng bộ môn lấy được từ CSDL
        assertEquals(listBM.size(), 2);
        //Kiểm tra id của bộ môn thứ nhất
        assertEquals(listBM.get(0).getId(), 1);
        // //Kiểm tra id của bộ môn thứ hai
        assertEquals(listBM.get(1).getId(), 2);
        // //Kiểm tra tên của bộ môn thứ nhất
        assertEquals(listBM.get(0).getTen(), "Công nghệ phần mềm");
        // //Kiểm tra tên của bộ môn thứ hai
        assertEquals(listBM.get(1).getTen(), "Trí tuệ nhân tạo");
        // //Kiểm tra id khoa của 2 bộ môn
        assertEquals(listBM.get(0).getKhoa().getId(), 1);
        assertEquals(listBM.get(1).getKhoa().getId(), 1);
    }

    // Test lấy tất cả dữ liệu từ bảng bộ môn
    @Test
    public void test
    
}
