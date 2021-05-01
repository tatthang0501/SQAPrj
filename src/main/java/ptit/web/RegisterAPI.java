package ptit.web;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ptit.BoMon;
import ptit.GiangVienKhoa;
import ptit.KyHoc;
import ptit.LichHoc;
import ptit.LichHocView;
import ptit.ListDaDK_ListCoTheDK;
import ptit.LopHocPhan;
import ptit.MonHoc;
import ptit.MonHocKyHoc;
import ptit.MonHocKyHocView;
import ptit.data.BoMonRepository;
import ptit.data.GiangVienKhoaRepository;
import ptit.data.KipHocRepository;
import ptit.data.KyHocRepository;
import ptit.data.LichHocRepository;
import ptit.data.LopHocPhanRepository;
import ptit.data.MonHocKyHocRepository;
import ptit.data.MonHocRepository;
import ptit.data.NgayHocRepository;
import ptit.data.TuanHocRepository;
import ptit.data.UserRepository;
import ptit.dto.JwtResponse;

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
            TuanHocRepository thRepo, GiangVienKhoaRepository gvkRepo, BoMonRepository bmRepo) {
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

    @GetMapping(produces = "application/json")
    public ResponseEntity<?> getDSMonHocByGvId(HttpServletRequest request, HttpServletResponse response, Model model)
            throws IOException {
        try {
            HttpSession session = request.getSession();
            JwtResponse jwtResponse = (JwtResponse) session.getAttribute("user");
            System.out.println(jwtResponse.getId());
            GiangVienKhoa gvk = gvkRepo.findById(jwtResponse.getId()).get();
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
            ArrayList<MonHocKyHocView> listMHKHView = new ArrayList<MonHocKyHocView>();
            for (MonHocKyHoc mhkh : listMHKH) {
                if (!listIdMon.contains(mhkh.getMh().getId())) {
                    listMHKH.remove(mhkh);
                } else {
                    MonHoc mh = mhRepo.findById(mhkh.getMh().getId()).get();
                    mhkh.setMh(mh);
                }
            }

            for (MonHocKyHoc mhkh : listMHKH) {
                MonHocKyHocView mhkhv = new MonHocKyHocView();
                mhkhv.setId(mhkh.getId());
                mhkhv.setMota(mhkh.getMh().getMota());
                mhkhv.setSoTC(mhkh.getMh().getSoTC());
                mhkhv.setTen(mhkh.getMh().getTen());
                listMHKHView.add(mhkhv);
            }
            model.addAttribute("msg", "Lấy danh sách môn học thành công");
            return new ResponseEntity<>(listMHKHView, HttpStatus.OK);
        } catch (Exception e) {
            model.addAttribute("msg", "Có lỗi xảy ra khi chọn môn học");
            return new ResponseEntity<>("fail", HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping(value = "/dslhp/{id}", produces = "application/json")
    public ResponseEntity<?> getDSLHP(@PathVariable int id, HttpServletRequest request, Model model,
            HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            JwtResponse jwtResponse = (JwtResponse) session.getAttribute("user");
            System.out.println("id day" + jwtResponse.getId());
            ArrayList<LichHoc> listLichLHP = new ArrayList<LichHoc>();
            ArrayList<LopHocPhan> listLHPFound = (ArrayList<LopHocPhan>) lhpRepo.getLHPByMHKHId(id);

            for (LopHocPhan lhp : listLHPFound) {
                ArrayList<LichHoc> listLichHoc = (ArrayList<LichHoc>) lhRepo.findLichLHP(lhp.getId());
                LichHoc lh = listLichHoc.get(0);
                lh.setLhp(lhp);
                lh.setTuanhoc(thRepo.findById(lh.getTuanhoc().getId()).get());
                lh.setNgayhoc(nhRepo.findById(lh.getNgayhoc().getId()).get());
                lh.setKiphoc(khRepo.findById(lh.getKiphoc().getId()).get());
                listLichLHP.add(lh);
            }

            ArrayList<LichHoc> listLichDaDK = (ArrayList<LichHoc>) lhRepo.findDaDKLHP(jwtResponse.getId());

            ArrayList<LichHocView> listLichViewDaDK = new ArrayList<LichHocView>();
            ArrayList<LichHocView> listLichViewLHP = new ArrayList<LichHocView>();
            for (LichHoc lh : listLichLHP) {
                LichHocView lhv = new LichHocView();
                lhv.setId(lh.getId());
                lhv.setKiphoc(lh.getKiphoc().getTen());
                lhv.setNgayhoc(lh.getNgayhoc().getTen());
                lhv.setSoTC(lh.getLhp().getMhkh().getMh().getSoTC());
                lhv.setTuanhoc(lh.getTuanhoc().getTen());
                lhv.setTen(lh.getTen());
                listLichViewLHP.add(lhv);
            }
            for (LichHoc lh : listLichDaDK) {
                LichHocView lhv = new LichHocView();
                lhv.setId(lh.getId());
                lhv.setKiphoc(lh.getKiphoc().getTen());
                lhv.setNgayhoc(lh.getNgayhoc().getTen());
                lhv.setSoTC(lh.getLhp().getMhkh().getMh().getSoTC());
                lhv.setTuanhoc(lh.getTuanhoc().getTen());
                lhv.setTen(lh.getTen());
                listLichViewDaDK.add(lhv);
            }
            ListDaDK_ListCoTheDK list = new ListDaDK_ListCoTheDK();
            list.setListLichDaDK(listLichViewDaDK);
            list.setListLichLHP(listLichViewLHP);
            session.setAttribute("listDaDK", listLichDaDK);
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            model.addAttribute("msg", "Có lỗi xảy ra khi lấy danh sách lớp học phần");
            return new ResponseEntity<>("fail", HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping(value = "/updatedangky", produces = "application/json")
    public ResponseEntity<?> updateDKHP(@RequestBody ArrayList<LichHocView> listDK, HttpServletRequest request,
            HttpServletResponse response, Model model) {
                HttpSession session = request.getSession();
        try {
            
            JwtResponse jwtResponse = (JwtResponse) session.getAttribute("user");
            ArrayList<LichHoc> listLichDaDK = (ArrayList<LichHoc>) session.getAttribute("listDaDK");
            for (LichHocView lh : listDK) {
                for (LichHoc lhDaDK : listLichDaDK) {
                    if (lhDaDK.getKiphoc().getTen() == lh.getKiphoc()
                            && lhDaDK.getNgayhoc().getTen() == lh.getNgayhoc()) {
                        String msg = "Bị trùng lịch giảng dạy môn " + lh.getTen() + ", " + lh.getKiphoc() + ", "
                                + lh.getNgayhoc() + " hàng tuần";
                        model.addAttribute("msg", msg);
                        response.sendRedirect("/dangky/dslophocphan?error");
                    }
                }
            }
            for (LichHocView lh : listDK) {
                lhRepo.updateDangKy(jwtResponse.getId(), lh.getId());
            }
            String msg = "Lưu đăng ký thành công";
            model.addAttribute("msg", msg);
            session.removeAttribute("listDaDK");
            return new ResponseEntity<>("update successful", HttpStatus.OK);
        } catch (Exception e) {
            String msg = "Có lỗi xảy ra khi lưu danh sách đăng ký";
            session.removeAttribute("listDaDK");
            model.addAttribute("msg", msg);
            return new ResponseEntity<>("fail", HttpStatus.NOT_MODIFIED);
        }
    }
}
