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
        assertNotNull(actual);
    }
}
