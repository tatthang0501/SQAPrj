package ptit.web;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

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

import ptit.BoMon;
import ptit.GiangVienKhoa;
import ptit.KipHoc;
import ptit.KyHoc;
import ptit.LichHoc;
import ptit.LichHocView;
import ptit.LopHocPhan;
import ptit.MonHoc;
import ptit.MonHocKyHoc;
import ptit.MonHocKyHocView;
import ptit.NgayHoc;
import ptit.ThanhVien;
import ptit.TuanHoc;
import ptit.common.JwtUtils;
import ptit.data.BoMonRepository;
import ptit.data.GiangVienKhoaRepository;
import ptit.data.KyHocRepository;
import ptit.data.LichHocRepository;
import ptit.data.LopHocPhanRepository;
import ptit.data.MonHocKyHocRepository;
import ptit.data.MonHocRepository;
import ptit.data.UserRepository;
import ptit.dto.JwtResponse;
import ptit.dto.LoginForm;
import ptit.dto.MessageResponse;
import ptit.dto.SignupRequest;
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
    UserRepository userRepository;

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

    private ThanhVien getInstanceUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        ThanhVien tv = userRepository.findByUsername(currentPrincipalName).get();
        return tv;
    }

    // @GetMapping("/getuserid")
    // public String getUser() {
    //     Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    //     String currentPrincipalName = authentication.getName();
    //     return currentPrincipalName;
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

    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest signUpRequest) {
        if (userRepository.existsByUsername(signUpRequest.getUsername())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Error: Username is already taken!"));
        }

        if (userRepository.existsByEmail(signUpRequest.getEmail())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Error: Email is already in use!"));
        }

        // Create new user's account
        ThanhVien user = new ThanhVien(signUpRequest.getUsername(), signUpRequest.getEmail(),
                encoder.encode(signUpRequest.getPassword()));
        user.setDem("thang");
        user.setDt("0337971060");
        user.setHo("thang");
        user.setTen("thang");
        user.setNgaySinh("19990501");
        user.setGhichu("ghichu");
        user.setVitri("giangvien");
        user.setDiaChi(null);
        userRepository.save(user);

        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
    }

    @GetMapping(value = "/dangky", produces = "application/json")
    public ResponseEntity<?> getDSMonHocByGvId(HttpServletRequest request, Model model) throws IOException {
        try {
            ThanhVien tv = getInstanceUser();
            GiangVienKhoa gvk = gvkRepo.findById(tv.getId()).get();
            ArrayList<BoMon> listBoMonKhoa = (ArrayList<BoMon>) bmRepo.getListBoMon(gvk.getKhoa().getId());
            ArrayList<Integer> listIdMon = new ArrayList<Integer>();
            for (BoMon bm : listBoMonKhoa) {
                ArrayList<MonHoc> listMH = (ArrayList<MonHoc>) mhRepo.getListMHByBoMonID(bm.getId());
                for (MonHoc mh : listMH) {
                    listIdMon.add(mh.getId());
                }
                bm.setDsMonHoc(listMH);
            }
            ArrayList<KyHoc> listKy = (ArrayList<KyHoc>) kyhocRepo.findAll();
            KyHoc newestKH = listKy.get(listKy.size() - 1);
            ArrayList<MonHocKyHoc> listMHKHTemp = (ArrayList<MonHocKyHoc>) mhkhRepo.getListMHKH(newestKH.getId());
            ArrayList<MonHocKyHoc> listMHKH = new ArrayList<MonHocKyHoc>();

            for (MonHocKyHoc mhkh : listMHKHTemp) {
                if (listIdMon.contains(mhkh.getMh().getId())) {
                    MonHoc mh = mhRepo.findById(mhkh.getMh().getId()).get();
                    mhkh.setMh(mh);
                    listMHKH.add(mhkh);
                }
            }

            ArrayList<MonHocKyHocView> listMHKHView = new ArrayList<MonHocKyHocView>();
            for (MonHocKyHoc mhkh : listMHKH) {
                MonHocKyHocView mhkhv = new MonHocKyHocView();
                mhkhv.setId(mhkh.getId());
                mhkhv.setMota(mhkh.getMh().getMota());
                mhkhv.setSoTC(mhkh.getMh().getSoTC());
                mhkhv.setTen(mhkh.getMh().getTen());
                listMHKHView.add(mhkhv);
            }
            return new ResponseEntity<>(listMHKHView, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Có lỗi xảy ra trong quá trình lấy danh sách môn học", HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping(value = "/dangky/dslhp/{id}", produces = "application/json")
    public ResponseEntity<?> getDSLHP(@PathVariable int id, HttpSession session, Model model,
            HttpServletResponse response) {
        try {

            ArrayList<LopHocPhan> listLHPFound = (ArrayList<LopHocPhan>) lhpRepo.getLHPByMHKHId(id);
            ArrayList<LichHoc> listLichLHP = new ArrayList<>();
            System.out.println(listLichLHP.size());
            for (LopHocPhan lhp : listLHPFound) {
                ArrayList<LichHoc> listLichHoc = (ArrayList<LichHoc>) lhRepo.findLichLHP(lhp.getId());
                System.out.println(listLichHoc.size());
                LichHoc lh = listLichHoc.get(0);
                lh.setLhp(lhp);
                List<KipHoc> kh = lh.getKipHoc();
                for (KipHoc kip : kh) {
                    kip.setLh(null);
                }
                lh.setKipHoc(kh);

                List<NgayHoc> nh = lh.getNgayHoc();
                for (NgayHoc ngay : nh) {
                    ngay.setLh(null);
                }
                lh.setNgayHoc(nh);

                List<TuanHoc> th = lh.getTuanHoc();
                for (TuanHoc tuan : th) {
                    tuan.setLh(null);
                }
                lh.setTuanHoc(th);
                listLichLHP.add(lh);
            }

            ArrayList<LichHocView> listLichViewLHP = LichHocConverter.convertLHToLHV(listLichLHP);
            return new ResponseEntity<>(listLichViewLHP, HttpStatus.OK);
        } catch (Exception e) {
            model.addAttribute("msg", "Có lỗi xảy ra khi lấy danh sách lớp học phần");
            return new ResponseEntity<>("fail", HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping(value = "/updatedangky", produces = "application/json")
    public ResponseEntity<?> updateDKHP(@RequestBody ArrayList<LichHocView> listDK, HttpServletRequest request,
            HttpServletResponse response, Model model) {
        try {
            ThanhVien tv = getInstanceUser();
            for (LichHocView lh : listDK) {
                if (lh.isDaDK() == false) {
                    int count = lhRepo.updateDangKy(tv.getId(), lh.getId());
                    if (count != 1) {
                        return new ResponseEntity<>("Có lỗi hệ thống trong quá trình update", HttpStatus.NOT_MODIFIED);
                    }
                } else {
                    return new ResponseEntity<>("Lớp đã có người đăng kí, phát hiện gian lận", HttpStatus.NOT_MODIFIED);
                }
            }
            System.out.println("Luu dang ky thah cong");
            // model.addAttribute("msg", msg);
            return new ResponseEntity<>("Cập nhật danh sách lớp học phần thành công", HttpStatus.OK);
        } catch (Exception e) {
            // String msg = "Có lỗi xảy ra khi lưu danh sách đăng ký";
            // model.addAttribute("msg", msg);
            return new ResponseEntity<>("Có lỗi xảy ra trong quá trình update", HttpStatus.NOT_MODIFIED);
        }
    }

    @GetMapping(value = "/xemtkb", produces = "application/json")
    public ResponseEntity<?> updateDKHP(HttpServletRequest request, HttpServletResponse response) {
        try {
            ThanhVien tv = getInstanceUser();
            ArrayList<LichHoc> listLHFound = (ArrayList<LichHoc>) lhRepo.findDaDKLHP(tv.getId());
            ArrayList<LichHocView> listLichViewLHP = LichHocConverter.convertLHToLHV(listLHFound);
            return new ResponseEntity<>(listLichViewLHP, HttpStatus.OK);
        } catch (NullPointerException e) {
            return new ResponseEntity<>("Chưa đăng ký lịch giảng dạy, không thể xem thời khóa biểu",
                    HttpStatus.NO_CONTENT);
        }
    }

    @PutMapping(value = "/suadangky", produces = "application/json")
    public ResponseEntity<?> updateDKHP(@RequestBody ArrayList<LichHocView> listDK, HttpServletRequest request,
            HttpServletResponse response) {
        try {
            ThanhVien tv = getInstanceUser();
            lhRepo.xoaHetDangKy(tv.getId());
            for (LichHocView lh : listDK) {
                    int count = lhRepo.updateDangKy(tv.getId(), lh.getId());
                    if (count != 1) {
                        return new ResponseEntity<>("Có lỗi hệ thống trong quá trình update", HttpStatus.NOT_MODIFIED);
                    }
            }
            return new ResponseEntity<>("Cập nhật danh sách lớp học phần thành công", HttpStatus.OK);
        } catch (NullPointerException e) {
            return new ResponseEntity<>("Không có dữ liệu trong danh sách sửa đăng ký", HttpStatus.NO_CONTENT);
        }
    }
}
