package ptit.web;

import java.io.IOException;
// import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PathVariable;
// import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ptit.BoMon;
import ptit.GiangVienKhoa;
import ptit.KyHoc;
import ptit.LichHoc;
import ptit.ListDaDK_ListCoTheDK;
import ptit.LopHocPhan;
import ptit.MonHoc;
import ptit.MonHocKyHoc;
import ptit.ThanhVien;
import ptit.data.BoMonRepository;
import ptit.data.GiangVienKhoaRepository;
import ptit.data.KipHocRepository;
import ptit.data.KyHocRepository;
import ptit.data.LichHocRepository;
import ptit.data.LopHocPhanRepository;
import ptit.data.MonHocKyHocRepository;
import ptit.data.MonHocRepository;
import ptit.data.NgayHocRepository;
import ptit.data.ThanhVienRepository;
import ptit.data.TuanHocRepository;

@RestController
@CrossOrigin("*")
@RequestMapping("/dangky")
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
    private final KipHocRepository khRepo;
    @Autowired
    private final NgayHocRepository nhRepo;
    @Autowired
    private final TuanHocRepository thRepo;
    @Autowired
    private final GiangVienKhoaRepository gvkRepo;
    @Autowired
    private final BoMonRepository bmRepo;


    public RegisterAPI(KyHocRepository kyhocRepo, MonHocKyHocRepository mhkhRepo, MonHocRepository mhRepo,
            LopHocPhanRepository lhpRepo, LichHocRepository lhRepo, KipHocRepository khRepo, NgayHocRepository nhRepo,
            TuanHocRepository thRepo, GiangVienKhoaRepository gvkRepo, BoMonRepository bmRepo, ThanhVienRepository tvRepo) {
        this.kyhocRepo = kyhocRepo;
        this.mhkhRepo = mhkhRepo;
        this.mhRepo = mhRepo;
        this.lhpRepo = lhpRepo;
        this.lhRepo = lhRepo;
        this.khRepo = khRepo;
        this.nhRepo = nhRepo;
        this.thRepo = thRepo;
        this.gvkRepo = gvkRepo;
        this.bmRepo = bmRepo;
    }

    @GetMapping()
    public ResponseEntity<?> getDSMonHocByGvId(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        // ResponseEntity rs = null;
        try {
            HttpSession session = request.getSession();
            ThanhVien giangvien = (ThanhVien) session.getAttribute("giangvien");
            if (giangvien == null) {
                response.sendRedirect("/login?err=timeout");
            }
            GiangVienKhoa gvk = gvkRepo.findById(giangvien.getId()).get();
            System.out.println(gvk.getId());
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
            ArrayList<MonHocKyHoc> listMHKH = (ArrayList<MonHocKyHoc>) mhkhRepo.getListMHKH(newestKH.getId());
            for (MonHocKyHoc mhkh : listMHKH) {
                if (!listIdMon.contains(mhkh.getMh().getId())) {
                    listMHKH.remove(mhkh);
                } else {
                    MonHoc mh = mhRepo.findById(mhkh.getMh().getId()).get();
                    mhkh.setMh(mh);
                }
            }
            model.addAttribute("msg", "Lấy danh sách môn học thành công");
            System.out.println(listMHKH.size());
            return new ResponseEntity<>(listMHKH, HttpStatus.OK);
        } catch (Exception e) {
            model.addAttribute("msg", "Có lỗi xảy ra khi chọn môn học");
            return new ResponseEntity<>("fail", HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping(name = "/dslophocphan", produces = "application/json")
    public ResponseEntity<?> getDSLHP(@RequestParam(name = "id") int id, HttpServletRequest request, Model model,
            HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            ThanhVien giangvien = (ThanhVien) session.getAttribute("giangvien");
            if (giangvien == null) {
                response.sendRedirect("/login?err=timeout");
            }
            ArrayList<LichHoc> listLichLHP = new ArrayList<LichHoc>();
            ArrayList<LopHocPhan> listLHPFound = (ArrayList<LopHocPhan>) lhpRepo.getLHPByMHKHId(id);
            int x = 0;
            for (LopHocPhan lhp : listLHPFound) {
                ArrayList<LichHoc> listLichHoc = (ArrayList<LichHoc>) lhRepo.findLichLHP(lhp.getId());
                LichHoc lh = listLichHoc.get(0);
                lh.setLhp(lhp);
                lh.setTuanhoc(thRepo.findById(lh.getTuanhoc().getId()).get());
                lh.setNgayhoc(nhRepo.findById(lh.getNgayhoc().getId()).get());
                lh.setKiphoc(khRepo.findById(lh.getKiphoc().getId()).get());
                listLichLHP.add(lh);
                System.out.println(listLichLHP.size());
                x = listLichLHP.size();
            }
            System.out.println(x);
            ArrayList<LichHoc> listLichDaDK = new ArrayList<LichHoc>();
            
            for (LichHoc lh : listLichLHP) {
                System.out.println(lh.getGv().getId());
                if (lh.getGv().getId() == giangvien.getId()) {
                    listLichDaDK.add(lh);
                    listLichLHP.remove(lh);
                }
            }
            model.addAttribute("lichDaDK", listLichDaDK);
            
            ListDaDK_ListCoTheDK list = new ListDaDK_ListCoTheDK(listLichDaDK, listLichLHP);
            System.out.println(listLichDaDK.size());
            
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            model.addAttribute("msg", "Có lỗi xảy ra khi lấy danh sách lớp học phần");
            return new ResponseEntity<>("fail", HttpStatus.NOT_FOUND);
        //     try {
        //         response.sendRedirect("/chonmonhoc?error");
        //     } catch (IOException e1) {
        //         e1.printStackTrace();
        //         return new ResponseEntity("fail", HttpStatus.NOT_FOUND);
        //     }
        }
    }

    @PutMapping(name="/updateDangKy", produces = "application/json")
    public ResponseEntity<?> updateDKHP(@RequestBody ArrayList<LichHoc> listDK, HttpServletRequest request,
            HttpServletResponse response, Model model) {
        try {
            HttpSession session = request.getSession();
            ThanhVien giangvien = (ThanhVien) session.getAttribute("giangvien");
            if (giangvien == null) {
                response.sendRedirect("/login?err=timeout");
            }
            ArrayList<LichHoc> listLichDaDK = (ArrayList<LichHoc>) model.getAttribute("lichDaDK");
            for (LichHoc lh : listDK) {
                for (LichHoc lhDaDK : listLichDaDK) {
                    if (lhDaDK.getKiphoc().getId() == lh.getKiphoc().getId()
                            && lhDaDK.getNgayhoc().getId() == lh.getNgayhoc().getId()) {
                        String msg = "Bị trùng lịch giảng dạy môn " + lh.getTen() + ", kíp " + lh.getKiphoc().getTen()
                                + ", thứ " + lh.getNgayhoc().getTen() + " hàng tuần";
                        model.addAttribute("msg", msg);
                        response.sendRedirect("/dangky/dslophocphan?error");
                    }
                }
            }
            for (LichHoc lh : listDK) {
                lhRepo.updateDangKy(giangvien.getId(), lh.getId());
            }
            String msg = "Lưu đăng ký thành công";
            model.addAttribute("msg", msg);
            return new ResponseEntity<>("update successful", HttpStatus.OK); 
        } catch (Exception e) {
            String msg = "Có lỗi xảy ra khi lưu danh sách đăng ký";
            model.addAttribute("msg", msg);
            return new ResponseEntity<>("fail", HttpStatus.NOT_FOUND);
        }
    }
}
