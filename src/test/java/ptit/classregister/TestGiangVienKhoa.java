package ptit.classregister;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import ptit.GiangVienKhoa;
import ptit.data.GiangVienKhoaRepository;

//Test khả năng lấy dữ liệu giảng viên khoa từ CSDL
// Nguyễn Tất Thắng
@SpringBootTest
public class TestGiangVienKhoa {
    
    @Autowired
    GiangVienKhoaRepository gvkRepo;

    @Test
    public void testGetGVK(){
        GiangVienKhoa gvk = gvkRepo.findById(1).get();
        //Check lấy dữ liệu khác null
        assertNotNull(gvk);
        //Check đối tượng giảng viên lấy từ bảng liên kết với bảng giảng viên khoa
        assertEquals(gvk.getGiangVien().getTen(),"thang");
        assertEquals(gvk.getGiangVien().getTen(),"thang");
        assertEquals(gvk.getGiangVien().getId(),1);
    }
}
