package ptit.classregister.testFunction;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import ptit.data.LichHocRepository;
import ptit.data.LopHocPhanRepository;
import ptit.models.KipHoc;
import ptit.models.LichHoc;
import ptit.models.LichHocView;
import ptit.models.LopHocPhan;
import ptit.models.NgayHoc;
import ptit.models.ThanhVien;
import ptit.models.TuanHoc;
import ptit.web.DSLHPFunction;

//Test các phương thức của lớp chức năng DSLHPFunction
//Nguyễn Tất Thắng
@SpringBootTest
public class TestDSLHPFunction {

    @Autowired
    LopHocPhanRepository lhpRepo;

    @Autowired
    LichHocRepository lhRepo;
    // Test phương thức fixLopHocPhanData
    // Mảng listLichLHP có dữ liệu, đầy đủ dữ liệu ở các trường

    @Test
    public void testFixSuccess() {
        // Chuẩn bị dữ liệu, lấy danh sách LopHocPhan qua idMonHocKyHoc = 1
        ArrayList<LopHocPhan> listLHPFound = (ArrayList<LopHocPhan>) lhpRepo.getLHPByMHKHId(1);
        ArrayList<LichHoc> listLichLHP = new ArrayList<>();
        // Kiểm tra dữ liệu lấy ra
        assertNotEquals(0, listLHPFound.size());
        // Chạy phương thức
        DSLHPFunction.fixLopHocPhanData(listLHPFound, listLichLHP, lhRepo);
        // Kiểm tra dữ liệu sau khi thực hiện phương thức
        assertEquals(listLHPFound.size(), listLichLHP.size());
    }

    // Test phương thức fixLopHocPhanData
    // Mảng listLichLHP không có dữ liệu

    @Test
    public void testFixBlankList() {
        // Khởi tạo mảng listLHPFound, để trống
        ArrayList<LopHocPhan> listLHPFound = new ArrayList<>();
        ArrayList<LichHoc> listLichLHP = new ArrayList<>();
        // Chạy phương thức
        DSLHPFunction.fixLopHocPhanData(listLHPFound, listLichLHP, lhRepo);
        // Kiểm tra dữ liệu sau khi thực hiện phương thức
        assertEquals(0, listLHPFound.size());
        assertEquals(listLHPFound.size(), listLichLHP.size());
    }

    // Test phương thức convertLHToLHV
    // Mảng listLHFound có đầy đủ dữ liệu, các trường đầy đủ dữ liệu
    @Test
    public void testConvertSuccess() {
        // Khởi tạo mảng dữ liệu
        ArrayList<LichHoc> listLichHoc = new ArrayList<LichHoc>();
        // Thêm dữ liệu vào mảng listLichHoc
        LichHoc lh1 = lhRepo.findById(1).get();

        // Thêm dữ liệu KipHoc
        ArrayList<KipHoc> kip = new ArrayList<KipHoc>();
        for (int i = 1; i <= 2; i++) {
            KipHoc testKH = new KipHoc();
            testKH.setTen(i);
            kip.add(testKH);
        }

        // Thêm dữ liệu TuanHoc
        ArrayList<TuanHoc> tuan = new ArrayList<TuanHoc>();
        for (int i = 1; i <= 16; i++) {
            TuanHoc testTH = new TuanHoc();
            testTH.setTen(i);
            tuan.add(testTH);
        }

        // Thêm dữ liệu NgayHoc
        ArrayList<NgayHoc> ngay = new ArrayList<NgayHoc>();
        NgayHoc testNH = new NgayHoc();
        testNH.setTen(2);
        ngay.add(testNH);
        lh1.setNgayHoc(ngay);
        lh1.setTuanHoc(tuan);
        lh1.setKipHoc(kip);
        listLichHoc.add(lh1);

        //Thêm trường GiangVien
        ThanhVien gv = new ThanhVien();
        gv.setId(1);
        lh1.setGv(gv);
        // Kiểm tra các trường dữ liệu
        // assertNotNull(lh1);
        assertEquals("Nhập môn công nghệ phần mềm", lh1.getTen());
        assertEquals(1, lh1.getNgayHoc().size());
        assertEquals(16, lh1.getTuanHoc().size());
        assertEquals(2, lh1.getKipHoc().size());
        assertEquals(1, lh1.getGv().getId());
        //Thực hiện phương thức
        ArrayList<LichHocView> listLichViewLHP = DSLHPFunction.convertLHToLHV(listLichHoc);

        // Kiểm tra dữ liệu sau khi thực hiện convert
        assertEquals(1, listLichViewLHP.size());
        assertEquals(1, listLichViewLHP.get(0).getNgayHoc().size());
        assertEquals(2, listLichViewLHP.get(0).getKipHoc().size());
        assertEquals(16, listLichViewLHP.get(0).getTuanHoc().size());
        // Nếu có trường idGiangVien, trường DaDK là true
        assertEquals(true, listLichViewLHP.get(0).isDaDK());
    }

    // Test phương thức convertLHToLHV
    // Mảng listLHFound có đầy đủ dữ liệu, không có dữ liệu về NgayHoc
    @Test
    public void testConvertLackingDay() {
        // Khởi tạo mảng dữ liệu
        ArrayList<LichHoc> listLichHoc = new ArrayList<LichHoc>();
        // Thêm dữ liệu vào mảng listLichHoc
        LichHoc lh1 = lhRepo.findById(1).get();

        // Thêm dữ liệu KipHoc
        ArrayList<KipHoc> kip = new ArrayList<KipHoc>();
        for (int i = 1; i <= 2; i++) {
            KipHoc testKH = new KipHoc();
            testKH.setTen(i);
            kip.add(testKH);
        }

        // Thêm dữ liệu TuanHoc
        ArrayList<TuanHoc> tuan = new ArrayList<TuanHoc>();
        for (int i = 1; i <= 16; i++) {
            TuanHoc testTH = new TuanHoc();
            testTH.setTen(i);
            tuan.add(testTH);
        }

        // Để trống mảng ngay
        ArrayList<NgayHoc> ngay = new ArrayList<NgayHoc>();

        lh1.setNgayHoc(ngay);
        lh1.setTuanHoc(tuan);
        lh1.setKipHoc(kip);
        listLichHoc.add(lh1);

        //Thêm trường GiangVien
        ThanhVien gv = new ThanhVien();
        gv.setId(1);
        lh1.setGv(gv);
        // Kiểm tra các trường dữ liệu
        // assertNotNull(lh1);
        assertEquals("Nhập môn công nghệ phần mềm", lh1.getTen());
        assertEquals(0, lh1.getNgayHoc().size());
        assertEquals(16, lh1.getTuanHoc().size());
        assertEquals(2, lh1.getKipHoc().size());
        assertEquals(1, lh1.getGv().getId());
        //Thực hiện phương thức
        ArrayList<LichHocView> listLichViewLHP = DSLHPFunction.convertLHToLHV(listLichHoc);

        // Kiểm tra dữ liệu sau khi thực hiện convert
        assertEquals(1, listLichViewLHP.size());
        assertEquals(0, listLichViewLHP.get(0).getNgayHoc().size());
        assertEquals(2, listLichViewLHP.get(0).getKipHoc().size());
        assertEquals(16, listLichViewLHP.get(0).getTuanHoc().size());
        // Nếu có trường idGiangVien, trường DaDK là true
        assertEquals(true, listLichViewLHP.get(0).isDaDK());
    }

    // Test phương thức convertLHToLHV
    // Mảng listLHFound có đầy đủ dữ liệu, không có dữ liệu về TuanHoc
    @Test
    public void testConvertLackingWeek() {
        // Khởi tạo mảng dữ liệu
        ArrayList<LichHoc> listLichHoc = new ArrayList<LichHoc>();
        // Thêm dữ liệu vào mảng listLichHoc
        LichHoc lh1 = lhRepo.findById(1).get();

        // Thêm dữ liệu KipHoc
        ArrayList<KipHoc> kip = new ArrayList<KipHoc>();
        for (int i = 1; i <= 2; i++) {
            KipHoc testKH = new KipHoc();
            testKH.setTen(i);
            kip.add(testKH);
        }

        // Để trống mảng tuan
        ArrayList<TuanHoc> tuan = new ArrayList<TuanHoc>();

        // Thêm dữ liệu NgayHoc
        ArrayList<NgayHoc> ngay = new ArrayList<NgayHoc>();
        NgayHoc testNH = new NgayHoc();
        testNH.setTen(2);
        ngay.add(testNH);

        lh1.setNgayHoc(ngay);
        lh1.setTuanHoc(tuan);
        lh1.setKipHoc(kip);
        listLichHoc.add(lh1);

        //Thêm trường GiangVien
        ThanhVien gv = new ThanhVien();
        gv.setId(1);
        lh1.setGv(gv);
        // Kiểm tra các trường dữ liệu
        // assertNotNull(lh1);
        assertEquals("Nhập môn công nghệ phần mềm", lh1.getTen());
        assertEquals(1, lh1.getNgayHoc().size());
        assertEquals(0, lh1.getTuanHoc().size());
        assertEquals(2, lh1.getKipHoc().size());
        assertEquals(1, lh1.getGv().getId());
        //Thực hiện phương thức
        ArrayList<LichHocView> listLichViewLHP = DSLHPFunction.convertLHToLHV(listLichHoc);

        // Kiểm tra dữ liệu sau khi thực hiện convert
        assertEquals(1, listLichViewLHP.size());
        assertEquals(1, listLichViewLHP.get(0).getNgayHoc().size());
        assertEquals(2, listLichViewLHP.get(0).getKipHoc().size());
        assertEquals(0, listLichViewLHP.get(0).getTuanHoc().size());
        // Nếu có trường idGiangVien, trường DaDK là true
        assertEquals(true, listLichViewLHP.get(0).isDaDK());
    }

    // Test phương thức convertLHToLHV
    // Mảng listLHFound có đầy đủ dữ liệu, để trống dữ liệu KipHoc
    @Test
    public void testConvertLackingShift() {
        // Khởi tạo mảng dữ liệu
        ArrayList<LichHoc> listLichHoc = new ArrayList<LichHoc>();
        // Thêm dữ liệu vào mảng listLichHoc
        LichHoc lh1 = lhRepo.findById(1).get();

        // Để trống mảng kip
        ArrayList<KipHoc> kip = new ArrayList<KipHoc>();
        // Thêm dữ liệu TuanHoc
        ArrayList<TuanHoc> tuan = new ArrayList<TuanHoc>();
        for (int i = 1; i <= 16; i++) {
            TuanHoc testTH = new TuanHoc();
            testTH.setTen(i);
            tuan.add(testTH);
        }

        // Thêm dữ liệu NgayHoc
        ArrayList<NgayHoc> ngay = new ArrayList<NgayHoc>();
        NgayHoc testNH = new NgayHoc();
        testNH.setTen(2);
        ngay.add(testNH);
        lh1.setNgayHoc(ngay);
        lh1.setTuanHoc(tuan);
        lh1.setKipHoc(kip);
        listLichHoc.add(lh1);

        //Thêm trường GiangVien
        ThanhVien gv = new ThanhVien();
        gv.setId(1);
        lh1.setGv(gv);
        // Kiểm tra các trường dữ liệu
        // assertNotNull(lh1);
        assertEquals("Nhập môn công nghệ phần mềm", lh1.getTen());
        assertEquals(1, lh1.getNgayHoc().size());
        assertEquals(16, lh1.getTuanHoc().size());
        assertEquals(0, lh1.getKipHoc().size());
        assertEquals(1, lh1.getGv().getId());
        //Thực hiện phương thức
        ArrayList<LichHocView> listLichViewLHP = DSLHPFunction.convertLHToLHV(listLichHoc);

        // Kiểm tra dữ liệu sau khi thực hiện convert
        assertEquals(1, listLichViewLHP.size());
        assertEquals(1, listLichViewLHP.get(0).getNgayHoc().size());
        assertEquals(0, listLichViewLHP.get(0).getKipHoc().size());
        assertEquals(16, listLichViewLHP.get(0).getTuanHoc().size());
        // Nếu có trường idGiangVien, trường DaDK là true
        assertEquals(true, listLichViewLHP.get(0).isDaDK());
    }

    // Test phương thức convertLHToLHV
    // Mảng listLHFound có đầy đủ dữ liệu, không có trường GiangVien
    @Test
    public void testConvertLackingLecturer() {
        // Khởi tạo mảng dữ liệu
        ArrayList<LichHoc> listLichHoc = new ArrayList<LichHoc>();
        // Thêm dữ liệu vào mảng listLichHoc
        LichHoc lh1 = lhRepo.findById(1).get();

        // Thêm dữ liệu KipHoc
        ArrayList<KipHoc> kip = new ArrayList<KipHoc>();
        for (int i = 1; i <= 2; i++) {
            KipHoc testKH = new KipHoc();
            testKH.setTen(i);
            kip.add(testKH);
        }

        // Thêm dữ liệu TuanHoc
        ArrayList<TuanHoc> tuan = new ArrayList<TuanHoc>();
        for (int i = 1; i <= 16; i++) {
            TuanHoc testTH = new TuanHoc();
            testTH.setTen(i);
            tuan.add(testTH);
        }

        // Thêm dữ liệu NgayHoc
        ArrayList<NgayHoc> ngay = new ArrayList<NgayHoc>();
        NgayHoc testNH = new NgayHoc();
        testNH.setTen(2);
        ngay.add(testNH);
        lh1.setNgayHoc(ngay);
        lh1.setTuanHoc(tuan);
        lh1.setKipHoc(kip);
        listLichHoc.add(lh1);

        //Để trống trường GiangVien
        lh1.setGv(null);
        // Kiểm tra các trường dữ liệu
        // assertNotNull(lh1);
        assertEquals("Nhập môn công nghệ phần mềm", lh1.getTen());
        assertEquals(1, lh1.getNgayHoc().size());
        assertEquals(16, lh1.getTuanHoc().size());
        assertEquals(2, lh1.getKipHoc().size());
        assertEquals(null, lh1.getGv());
        //Thực hiện phương thức
        ArrayList<LichHocView> listLichViewLHP = DSLHPFunction.convertLHToLHV(listLichHoc);

        // Kiểm tra dữ liệu sau khi thực hiện convert
        assertEquals(1, listLichViewLHP.size());
        assertEquals(1, listLichViewLHP.get(0).getNgayHoc().size());
        assertEquals(2, listLichViewLHP.get(0).getKipHoc().size());
        assertEquals(16, listLichViewLHP.get(0).getTuanHoc().size());
        // Nếu có trường idGiangVien, trường DaDK là true
        assertEquals(false, listLichViewLHP.get(0).isDaDK());
    }

}
