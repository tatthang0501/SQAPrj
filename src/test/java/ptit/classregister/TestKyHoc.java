package ptit.classregister;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import ptit.KyHoc;
import ptit.data.KyHocRepository;
//Test khả năng lấy dữ liệu kỳ học từ CSDL
// Nguyễn Tất Thắng
@SpringBootTest
public class TestKyHoc {
    @Autowired
    KyHocRepository khRepo;

    @Test
    public void testGetKyHoc(){
        //Lấy danh sách tất cả các kỳ học
        ArrayList<KyHoc> listKH = (ArrayList<KyHoc>) khRepo.findAll();
        //Kiểm tra kì học có dữ liệu hay không
        assertNotNull(listKH);
        // Kiểm tra số kì học trả về
        assertEquals(listKH.size(), 2);
        // Kiểm tra đối tượng năm học được trả về
        assertEquals(listKH.get(0).getNh().getTen(),"2020-2021");
        assertEquals(listKH.get(1).getNh().getTen(),"2020-2021");
        // Kiểm tra đối tượng học kỳ được trả về
        assertEquals(listKH.get(0).getHk().getTen(), "Học kỳ 1");
        assertEquals(listKH.get(1).getHk().getTen(), "Học kỳ 2");
    }
}
