package ptit.test;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import ptit.BoMon;
import ptit.data.BoMonRepository;

@SpringBootTest
public class TestBoMon{
    @Autowired
    BoMonRepository bmRepo;

    @Test
    // Test lấy danh sách bộ môn qua id khoa
    // Nguyễn Tất Thắng
    public void testGetListByKhoaId(){
        List<BoMon> list =  bmRepo.getListBoMon(1);
        assertNotNull(list);
    }
}