package ptit.classregister.testFunction;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;

import ptit.data.BoMonRepository;
import ptit.data.KyHocRepository;
import ptit.data.MonHocKyHocRepository;
import ptit.data.MonHocRepository;
import ptit.models.BoMon;
import ptit.models.KyHoc;
import ptit.models.MonHocKyHoc;
import ptit.models.MonHocKyHocView;
import ptit.web.DangKyFunction;

// Test các chức năng của lớp DangKyFunction sử dụng trong request /dangky
// Nguyễn Tất Thắng
@SpringBootTest
@AutoConfigureMockMvc
public class TestDangKyFunction {

    @Autowired
    private MonHocRepository mhRepo;
    @Autowired
    private BoMonRepository bmRepo;

    @Autowired
    KyHocRepository kyhocRepo;

    @Autowired
    MonHocKyHocRepository mhkhRepo;

    private ArrayList<Integer> listIdMon;
    private ArrayList<MonHocKyHoc> listMHKH = new ArrayList<MonHocKyHoc>();
    // Test phương thức setDataListBMKAnListIdMon
    // Test trường hợp mảng listBoMonKhoa truyền vào có dữ liệu
    @Test
    public void testSetDataSuccessful() {
        // Chuẩn bị dữ liệu, mảng listBoMonKhoa tương ứng với các bộ môn thuộc khoa của
        // giảng viên
        // Lấy ra mảng tương ứng với bộ môn có khoaid = 1

        ArrayList<BoMon> listBoMonKhoa = ((ArrayList<BoMon>) bmRepo.getListBoMon(1));
        // Kiểm tra dữ liệu khả dụng
        assertNotNull(listBoMonKhoa);
        assertEquals(2, listBoMonKhoa.size());
        // Kiểm tra thuộc tính mảng chưa được lấy ra từ CSDL
        for (BoMon bm : listBoMonKhoa) {
            assertEquals(bm.getDsMonHoc().size(), 0);
        }
        // Khởi tạo mảng trống listIdMon lưu các môn học thuộc các khoa trên
        // chạy phương thức
        DangKyFunction.setDataListBMKAndListIdMon(listBoMonKhoa, listIdMon, mhRepo);
        // Kiểm tra dữ liệu sau khi chạy phương thức
        for (BoMon bm : listBoMonKhoa) {
            assertNotEquals(0, bm.getDsMonHoc().size());
        }
        // Kiểm tra dữ liệu ở mảng Id
        assertNotEquals(0, listIdMon.size());
    }

    // Test trường hợp mảng listBoMonKhoa truyền vào không có dữ liệu
    @Test
    public void testSetDataBlankList() {
         //Khởi tạo mảng rỗng
        ArrayList<BoMon> listBoMonKhoa = new ArrayList<>();
        // Kiểm tra thuộc tính mảng chưa được lấy ra từ CSDL
        for (BoMon bm : listBoMonKhoa) {
            assertEquals(bm.getDsMonHoc().size(), 0);
        }
        // Khởi tạo mảng trống listIdMon lưu các môn học thuộc các khoa trên
        // chạy phương thức
        ArrayList<Integer> listIdMon = new ArrayList<Integer>();
        DangKyFunction.setDataListBMKAndListIdMon(listBoMonKhoa, listIdMon, mhRepo);
        // Kiểm tra dữ liệu sau khi chạy phương thức
        for (BoMon bm : listBoMonKhoa) {
            assertEquals(0, bm.getDsMonHoc().size());
        }
        // Kiểm tra dữ liệu ở mảng Id
        assertEquals(0, listIdMon.size());
    }

    // Test phương thức MHKHFilter
    // Test trường hợp mảng listMHKHTemp truyền vào có dữ liệu, mảng listIdMon có dữ
    // liệu
    @Test
    public void testFullDataFilter() {
        // Chuẩn bị dữ liệu, mảng listMHKHTemp là danh sách môn học theo kỳ học mới nhất hiện tại
        ArrayList<KyHoc> listKy = (ArrayList<KyHoc>) kyhocRepo.findAll();
        KyHoc newestKH = listKy.get(listKy.size() - 1);
        ArrayList<MonHocKyHoc> listMHKHTemp = (ArrayList<MonHocKyHoc>) mhkhRepo.getListMHKH(newestKH.getId());
        //Kiểm tra dữ liệu mảng listMHKHTemp vừa lấy ra
        assertNotEquals(0, listMHKHTemp.size());
        
        // Khởi tạo list output được lọc từ listMHKHTemp
        
        assertEquals(0, listMHKH.size());

        //Thêm dữ liệu cho mảng listIdMon
        listIdMon = new ArrayList<>();
        listIdMon.add(1);
        listIdMon.add(2);
        DangKyFunction.MHKHFilter(listMHKHTemp, listMHKH, listIdMon, mhRepo);

        //Kiểm tra dữ liệu sau khi thực hiện lọc
        assertNotEquals(0, listMHKH.size());
    }

    // Test phương thức MHKHFilter
    // Test trường hợp mảng listMHKHTemp truyền vào không có dữ liệu, mảng listIdMon có dữ
    // liệu
    @Test
    public void testBlankMHKHTempFilter() {
        // Chuẩn bị dữ liệu, mảng listMHKHTemp là danh sách môn học theo kỳ học mới nhất hiện tại
        ArrayList<MonHocKyHoc> listMHKHTemp = new ArrayList<>();
        //Kiểm tra dữ liệu mảng listMHKHTemp vừa lấy ra
        assertEquals(0, listMHKHTemp.size());
        
        // Khởi tạo list output được lọc từ listMHKHTemp
        
        assertEquals(0, listMHKH.size());

        //Thêm dữ liệu cho mảng listIdMon
        listIdMon = new ArrayList<>();
        listIdMon.add(1);
        listIdMon.add(2);
        DangKyFunction.MHKHFilter(listMHKHTemp, listMHKH, listIdMon, mhRepo);

        //Kiểm tra dữ liệu sau khi thực hiện lọc
        assertEquals(0, listMHKH.size());
    }

    // Test phương thức MHKHFilter
    // Test trường hợp mảng listMHKHTemp truyền vào có dữ liệu, mảng listIdMon có dữ
    // liệu
    @Test
    public void testListIdBlankFilter() {
        // Chuẩn bị dữ liệu, mảng listMHKHTemp là danh sách môn học theo kỳ học mới nhất hiện tại
        ArrayList<KyHoc> listKy = (ArrayList<KyHoc>) kyhocRepo.findAll();
        KyHoc newestKH = listKy.get(listKy.size() - 1);
        ArrayList<MonHocKyHoc> listMHKHTemp = (ArrayList<MonHocKyHoc>) mhkhRepo.getListMHKH(newestKH.getId());
        //Kiểm tra dữ liệu mảng listMHKHTemp vừa lấy ra
        assertNotEquals(0, listMHKHTemp.size());
        
        // Khởi tạo list output được lọc từ listMHKHTemp
        
        assertEquals(0, listMHKH.size());

        //Khởi tạo mảng listIdMon, để rỗng
        listIdMon = new ArrayList<>();
        DangKyFunction.MHKHFilter(listMHKHTemp, listMHKH, listIdMon, mhRepo);

        //Kiểm tra dữ liệu sau khi thực hiện lọc
        assertEquals(0, listMHKH.size());
    }

    //Test phương thức convertToMHKHView, chuyển đổi MonHocKyHoc qua dạng hiển thị
    // Test trường hợp mảng listMHKH truyền vào có dữ liệu, sử dụng mảng ở trên
    @Test
    public void testConvertMHKHSuccess(){
        //Khởi tạo dữ liệu mảng listMHKH
        listIdMon = new ArrayList<>();
        listIdMon.add(1);
        listIdMon.add(2);
        ArrayList<KyHoc> listKy = (ArrayList<KyHoc>) kyhocRepo.findAll();
        KyHoc newestKH = listKy.get(listKy.size() - 1);
        ArrayList<MonHocKyHoc> listMHKHTemp = (ArrayList<MonHocKyHoc>) mhkhRepo.getListMHKH(newestKH.getId());
        DangKyFunction.MHKHFilter(listMHKHTemp, listMHKH, listIdMon, mhRepo);
        //Kiểm tra dữ liệu mảng listMHKH
        assertNotEquals(0, listMHKH.size());

        //Thực hiện phương thức convertToMHKHView
        ArrayList<MonHocKyHocView> listMHKHView = DangKyFunction.convertToMHKHView(listMHKH);

        //Kiểm tra dữ liệu đã thực hiện chuyển đổi/
        // Nếu lọc thành công, số lượng phần tử trong mảng mới bằng mảng cũ
        assertNotEquals(0, listMHKHView);
        assertEquals(listMHKH.size(), listMHKHView.size());
    }

    //Test phương thức convertToMHKHView, chuyển đổi MonHocKyHoc qua dạng hiển thị
    // Test trường hợp mảng listMHKH truyền vào không có dữ liệu, sử dụng mảng ở trên
    @Test
    public void testConvertMHKH(){
        //Khởi tạo dữ liệu mảng listMHKH, để trống
        ArrayList<MonHocKyHoc> listMHKHTemp = new ArrayList<>();
        //Kiểm tra dữ liệu mảng listMHKH
        assertEquals(0, listMHKH.size());

        //Thực hiện phương thức convertToMHKHView
        ArrayList<MonHocKyHocView> listMHKHView = DangKyFunction.convertToMHKHView(listMHKH);

        //Kiểm tra dữ liệu đã thực hiện chuyển đổi
        assertEquals(0, listMHKHView.size());
        
    }
}
