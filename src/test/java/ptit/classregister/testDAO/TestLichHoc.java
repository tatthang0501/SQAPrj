package ptit.classregister.testDAO;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import ptit.LichHoc;
import ptit.LopHocPhan;
import ptit.ThanhVien;
import ptit.data.LichHocRepository;
import ptit.data.LopHocPhanRepository;
import ptit.data.UserRepository;


//Test các chức năng của lớp LichHocRepository
//Nguyễn Tất Thắng
@SpringBootTest
@TestMethodOrder(OrderAnnotation.class)
public class TestLichHoc {
    @Autowired
    LichHocRepository khRepo;
    @Autowired
    LichHocRepository lhRepo;
    @Autowired
    LopHocPhanRepository lhpRepo;
    @Autowired
    UserRepository tvRepo;

    //Test tạo một dòng trong bảng LichHoc
    @Test
    @Order(1)
    public void testCreate() {
        LichHoc test = new LichHoc();
        test.setId(100);
        test.setTuanHoc(null);
        test.setKipHoc(null);
        test.setNgayHoc(null);
        test.setTen("test ten");
        test.setPhong("test phong");
        test.setNhomTH(100);

        LopHocPhan lhp = lhpRepo.findById(1).get();
        ThanhVien gv = tvRepo.findById(1).get();
        test.setLhp(lhp);
        test.setGv(gv);
        khRepo.save(test);
        assertNotNull(khRepo.findById(100).get());
    }

    //Test lấy một dòng trong bảng LichHoc
    @Test
    @Order(2)
    public void testSingle(){
        LichHoc test = khRepo.findById(100).get();
        assertNotNull(test);
        assertEquals(test.getGv().getId(), 1);
        assertEquals(test.getLhp().getId(), 1);
        assertEquals(test.getTen(), "test ten");
    }

    //Test lấy tất cả các dòng trong bảng LichHoc
    @Test
    @Order(3)
    public void testGetAll(){
        List<LichHoc>listFound = (List<LichHoc>) khRepo.findAll();
        assertNotNull(listFound);
        assertNotEquals(listFound.size(), 0);
    }

    //Test sửa một dòng trong bảng LichHoc
    @Test
    @Order(4)
    public void testUpdate(){
        LichHoc test = khRepo.findById(100).get();
        test.setTen("sua ten");
        khRepo.save(test);
        assertEquals(khRepo.findById(100).get().getTen(), "sua ten");
    }

    //Test xóa một dòng trong bảng LichHoc
    @Test
    @Order(5)
    public void testDelete(){
        khRepo.deleteById(100);
        assertEquals(khRepo.existsById(100), false);
    }
}
