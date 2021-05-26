package ptit.web;

import java.io.IOException;
import java.util.ArrayList;

import java.util.NoSuchElementException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ptit.common.JwtUtils;
import ptit.data.BoMonRepository;
import ptit.data.GiangVienKhoaRepository;

import ptit.data.KyHocRepository;
import ptit.data.LichHocRepository;
import ptit.data.LopHocPhanRepository;
import ptit.data.MonHocKyHocRepository;
import ptit.data.MonHocRepository;

import ptit.data.ThanhVienRepository;
import ptit.dto.JwtResponse;
import ptit.dto.LoginForm;
import ptit.exception.RegisteredException;
import ptit.exception.SameDateException;
import ptit.exception.ZeroSizeException;
import ptit.models.BoMon;
import ptit.models.GiangVienKhoa;

import ptit.models.KyHoc;
import ptit.models.LichHoc;
import ptit.models.LichHocView;
import ptit.models.LopHocPhan;

import ptit.models.MonHocKyHoc;
import ptit.models.MonHocKyHocView;

import ptit.models.ThanhVien;

import ptit.services.UserDetailsImpl;

@RestController
@CrossOrigin("*")
@RequestMapping("")
public class RegisterAPI {
    @Autowired
    private KyHocRepository kyhocRepo;
    @Autowired
    private final MonHocKyHocRepository mhkhRepo;
    @Autowired
    private final MonHocRepository mhRepo;
    @Autowired
    private final LopHocPhanRepository lhpRepo;
    @Autowired
    private final LichHocRepository lhRepo;

    @Autowired
    private final GiangVienKhoaRepository gvkRepo;
    @Autowired
    private final BoMonRepository bmRepo;

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    ThanhVienRepository userRepository;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    JwtUtils jwtUtils;

    public RegisterAPI(KyHocRepository kyhocRepo, MonHocKyHocRepository mhkhRepo, MonHocRepository mhRepo,
            LopHocPhanRepository lhpRepo, LichHocRepository lhRepo, GiangVienKhoaRepository gvkRepo,
            BoMonRepository bmRepo) {
        this.kyhocRepo = kyhocRepo;
        this.mhkhRepo = mhkhRepo;
        this.mhRepo = mhRepo;
        this.lhpRepo = lhpRepo;
        this.lhRepo = lhRepo;
        this.gvkRepo = gvkRepo;
        this.bmRepo = bmRepo;
    }

    // private ThanhVien getInstanceUser() {
    // Authentication authentication =
    // SecurityContextHolder.getContext().getAuthentication();
    // String currentPrincipalName = authentication.getName();
    // ThanhVien tv = userRepository.findByUsername(currentPrincipalName).get();
    // return tv;
    // }

    @PostMapping("/login")
    public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginForm loginRequest) {

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        JwtResponse jwtResponse = new JwtResponse(jwt, userDetails.getId(), userDetails.getUsername(),
                userDetails.getEmail());
        return ResponseEntity.ok(jwtResponse);
    }

    @GetMapping(value = "/dangky", produces = "application/json")
    public ResponseEntity<?> getDSMonHocByGvId(HttpServletRequest request, Model model) throws IOException {
        ThanhVien tv;
        try {
            tv = MainFunction.getInstanceUser(userRepository);
            GiangVienKhoa gvk = gvkRepo.findById(tv.getId()).get();
            ArrayList<BoMon> listBoMonKhoa = (ArrayList<BoMon>) bmRepo.getListBoMon(gvk.getKhoa().getId());
            ArrayList<Integer> listIdMon = new ArrayList<Integer>();

            DangKyFunction.setDataListBMKAndListIdMon(listBoMonKhoa, listIdMon, mhRepo);
            ArrayList<KyHoc> listKy = (ArrayList<KyHoc>) kyhocRepo.findAll();
            KyHoc newestKH = listKy.get(listKy.size() - 1);
            ArrayList<MonHocKyHoc> listMHKHTemp = (ArrayList<MonHocKyHoc>) mhkhRepo.getListMHKH(newestKH.getId());
            ArrayList<MonHocKyHoc> listMHKH = new ArrayList<MonHocKyHoc>();

            DangKyFunction.MHKHFilter(listMHKHTemp, listMHKH, listIdMon, mhRepo);
            ArrayList<MonHocKyHocView> listMHKHView = DangKyFunction.convertToMHKHView(listMHKH);
            return new ResponseEntity<>(listMHKHView, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>("Chưa đăng nhập, vui lòng đăng nhập trước khi thực hiện đăng ký môn học",
                    HttpStatus.UNAUTHORIZED);
        }

    }

    @GetMapping(value = "/dangky/dslhp/{id}", produces = "application/json")
    public ResponseEntity<?> getDSLHP(@PathVariable int id, HttpSession session, Model model,
            HttpServletResponse response) {
        try {
            MainFunction.getInstanceUser(userRepository);
            try {
                ArrayList<LopHocPhan> listLHPFound = (ArrayList<LopHocPhan>) lhpRepo.getLHPByMHKHId(id);
                ArrayList<LichHoc> listLichLHP = new ArrayList<>();

                DSLHPFunction.fixLopHocPhanData(listLHPFound, listLichLHP, lhRepo);
                ArrayList<LichHocView> listLichViewLHP = DSLHPFunction.convertLHToLHV(listLichLHP);
                if (listLichViewLHP.size() == 0)
                    throw new ZeroSizeException();
                return new ResponseEntity<>(listLichViewLHP, HttpStatus.OK);
            } catch (ZeroSizeException ex) {
                return new ResponseEntity<>("Không tìm thấy lớp học phần nào, vui lòng chọn môn học khác",
                        HttpStatus.NOT_FOUND);
            }

        } catch (NoSuchElementException e) {
            return new ResponseEntity<>("Chưa đăng nhập, vui lòng đăng nhập trước khi thực hiện đăng ký môn học",
                    HttpStatus.UNAUTHORIZED);
        }
    }

    @PutMapping(value = "/updatedangky", produces = "application/json")
    public ResponseEntity<?> updateDKHP(@RequestBody ArrayList<LichHocView> listDK, HttpServletRequest request,
            HttpServletResponse response, Model model) {
        ThanhVien tv;
        try {
            tv = MainFunction.getInstanceUser(userRepository);
            try {
                if (listDK.size() == 0)
                    throw new ZeroSizeException();
                ArrayList<LichHocView> listDKTemp = new ArrayList<>();
                for (LichHocView lhv : listDK) {
                    listDKTemp.add(lhv);
                }
                ArrayList<LichHocView> listNgay = CheckDuplicate.checkTrungLapNgayHoc(listDKTemp);
                if (listNgay.size() != 0) {
                    boolean check = CheckDuplicate.checkTrungLapKipHoc(listNgay, listDKTemp);
                    if (check == true)
                        throw new SameDateException();
                }
                for (LichHocView lh : listDK) {
                    if (lh.isDaDK() == true) {
                        throw new RegisteredException();
                    }
                    lhRepo.updateDangKy(tv.getId(), lh.getId());
                }
                return new ResponseEntity<>("Cập nhật danh sách lớp học phần thành công", HttpStatus.OK);
            } catch (RegisteredException e) {
                return new ResponseEntity<>("Lớp học này đã được đăng ký!", HttpStatus.FORBIDDEN);
            } catch (SameDateException e) {
                return new ResponseEntity<>("Có lớp học bị trùng lịch, vui lòng thử lại", HttpStatus.NOT_ACCEPTABLE);
            } catch (ZeroSizeException ex) {
                return new ResponseEntity<>("Không có lớp học phần nào được chọn, vui lòng thử lại",
                        HttpStatus.NOT_ACCEPTABLE);
            }
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>("Chưa đăng nhập, vui lòng đăng nhập trước khi thực hiện đăng ký môn học",
                    HttpStatus.UNAUTHORIZED);
        }
    }

    @GetMapping(value = "/xemtkb", produces = "application/json")
    public ResponseEntity<?> updateDKHP(HttpServletRequest request, HttpServletResponse response) {
        ThanhVien tv;
        try {
            tv = MainFunction.getInstanceUser(userRepository);
            try {
                ArrayList<LichHoc> listLHFound = (ArrayList<LichHoc>) lhRepo.findDaDKLHP(tv.getId());
                ArrayList<LichHocView> listLichViewLHP = DSLHPFunction.convertLHToLHV(listLHFound);
                if (listLichViewLHP.size() == 0)
                    throw new ZeroSizeException();
                return new ResponseEntity<>(listLichViewLHP, HttpStatus.OK);
            } catch (ZeroSizeException e) {
                return new ResponseEntity<>("Chưa đăng ký lịch giảng dạy, không thể xem thời khóa biểu",
                        HttpStatus.NOT_FOUND);
            }
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>("Chưa đăng nhập, vui lòng đăng nhập trước khi thực hiện xem thời khóa biểu",
                    HttpStatus.UNAUTHORIZED);
        }
    }

    @PutMapping(value = "/suadangky", produces = "application/json")
    public ResponseEntity<?> updateDKHP(@RequestBody ArrayList<LichHocView> listDK, HttpServletRequest request,
            HttpServletResponse response) {
        ThanhVien tv;
        try {
            tv = MainFunction.getInstanceUser(userRepository);
            try {
                if (listDK.size() == 0)
                    throw new ZeroSizeException();
                ArrayList<LichHocView> listDKTemp = new ArrayList<>();
                for (LichHocView lhv : listDK) {
                    listDKTemp.add(lhv);
                }
                ArrayList<LichHocView> listNgay = CheckDuplicate.checkTrungLapNgayHoc(listDKTemp);
                if (listNgay.size() != 0) {
                    boolean check = CheckDuplicate.checkTrungLapKipHoc(listNgay, listDKTemp);
                    if (check == true)
                        throw new SameDateException();
                }
                lhRepo.xoaHetDangKy(tv.getId());
                for (LichHocView lh : listDK) {
                    int count = lhRepo.updateDangKy(tv.getId(), lh.getId());
                    if (count != 1) {
                        return new ResponseEntity<>("Có lỗi hệ thống trong quá trình update", HttpStatus.NOT_MODIFIED);
                    }
                }
                return new ResponseEntity<>("Cập nhật danh sách lớp học phần thành công", HttpStatus.OK);
            } catch (SameDateException e) {
                return new ResponseEntity<>("Có lớp học bị trùng lịch, vui lòng thử lại", HttpStatus.NOT_ACCEPTABLE);
            } catch (ZeroSizeException e) {
                return new ResponseEntity<>("Không có dữ liệu trong danh sách sửa đăng ký", HttpStatus.NOT_ACCEPTABLE);
            }
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>("Chưa đăng nhập, vui lòng đăng nhập trước khi thực hiện sửa đăng ký môn học",
                    HttpStatus.UNAUTHORIZED);
        }
    }
}
