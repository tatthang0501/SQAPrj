package ptit.classregister;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;

import ptit.BoMon;
import ptit.Khoa;
import ptit.data.BoMonRepository;
import ptit.data.HocKyRepository;

//Test Các chức năng liên quan đến đối tượng BoMon
// Nguyễn Tất Thắng
@SpringBootTest
@TestMethodOrder(OrderAnnotation.class)
public class TestBoMon {
    
    @Autowired
    BoMonRepository bmRepo;

    @Autowired
    HocKyRepository hkRepo;
    
    //Test tạo đối tượng bộ môn
    @Test
    @Order(1)
    public void testCreate(){
        BoMon bm = new BoMon();
        bm.setId(1000);
        bm.setTen("Bộ môn test 1");
        Khoa k = new Khoa();
        k.setId(1);
        bm.setKhoa(k);
        bm.setMota("Bộ môn test 1");
        bm.setDsMonHoc(null);
        bm.setDsGiangVien(null);
        bmRepo.save(bm);
        assertNotNull(bmRepo.findById(1000).get());
    }

    // Test lấy tất cả các dòng trong bảng bộ môn   
    @Test
    @Order(2)
    public void testReadAll(){
        List<BoMon> listFound = (List<BoMon>) bmRepo.findAll();
        assertNotNull(listFound);
        assertNotEquals(listFound.size(), 0);
    }

    //Test lấy dòng vừa thêm vào bảng
    @Test
    @Order(3)
    public void testSingleRow(){
        BoMon bm = bmRepo.findById(1000).get();
        assertEquals(bm.getTen(),"Bộ môn test 1");
        assertEquals(bm.getKhoa().getId(), 1);
    }
    
    //Test sửa dữ liệu trong bảng
    @Test
    @Order(4)
    public void testUpdate(){
        BoMon bm = bmRepo.findById(1000).get();
        bm.setTen("Sửa bộ môn test 1");
        bmRepo.save(bm);
        assertNotEquals("Bộ môn test 1", bmRepo.findById(1000).get().getTen());
        assertEquals("Sửa bộ môn test 1", bmRepo.findById(1000).get().getTen());
    }

    //Test xóa dữ liệu trong bảng
    @Test
    @Order(5)
    public void testDelete(){
        bmRepo.deleteById(1000);
        assertEquals(bmRepo.existsById(1000), false);
    }
}
