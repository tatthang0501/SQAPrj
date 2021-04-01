// package ptit.web;

// import java.util.ArrayList;

// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpSession;

// import org.springframework.stereotype.Controller;
// import org.springframework.ui.Model;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PutMapping;
// import org.springframework.web.bind.annotation.RequestMapping;

// import ptit.BoMon;
// import ptit.GiangVienKhoa;
// import ptit.KyHoc;
// import ptit.LichHoc;
// import ptit.LopHocPhan;
// import ptit.MonHoc;
// import ptit.MonHocKyHoc;
// import ptit.NhanVien;
// import ptit.data.BoMonRepository;
// import ptit.data.GiangVienKhoaRepository;
// import ptit.data.HocKyRepository;
// import ptit.data.KipHocRepository;
// import ptit.data.KyHocRepository;
// import ptit.data.LichHocRepository;
// import ptit.data.LopHocPhanRepository;
// import ptit.data.MonHocKyHocRepository;
// import ptit.data.MonHocRepository;
// import ptit.data.NgayHocRepository;
// import ptit.data.TuanHocRepository;

// @Controller
// @RequestMapping("/")
// public class DangKyController {
//     private final KyHocRepository kyhocRepo;
//     private final MonHocKyHocRepository mhkhRepo;
//     private final MonHocRepository mhRepo;
//     private final LopHocPhanRepository lhpRepo;
//     private final LichHocRepository lhRepo;
//     private final KipHocRepository khRepo;
//     private final NgayHocRepository nhRepo;
//     private final TuanHocRepository thRepo;
//     private final GiangVienKhoaRepository gvkRepo;
//     private final BoMonRepository bmRepo;

//     public DangKyController(KyHocRepository kyhocRepo, MonHocKyHocRepository mhkhRepo, MonHocRepository mhRepo,
//             LopHocPhanRepository lhpRepo, LichHocRepository lhRepo, KipHocRepository khRepo, NgayHocRepository nhRepo,
//             TuanHocRepository thRepo, HocKyRepository hkRepo,
//             GiangVienKhoaRepository gvkRepo, BoMonRepository bmRepo) {
//         this.kyhocRepo = kyhocRepo;
//         this.mhkhRepo = mhkhRepo;
//         this.mhRepo = mhRepo;
//         this.lhpRepo = lhpRepo;
//         this.lhRepo = lhRepo;
//         this.khRepo = khRepo;
//         this.nhRepo = nhRepo;
//         this.thRepo = thRepo;
//         this.gvkRepo = gvkRepo;
//         this.bmRepo = bmRepo;
//     }

//     @GetMapping("/chonmonhoc")
//     private String getDSMonHoc(HttpServletRequest request, Model model) {
//         try {
//             HttpSession session = request.getSession();
//             NhanVien giangvien = (NhanVien) session.getAttribute("giangvien");
//             if (giangvien == null) {
//                 return "redirect:/login?err=timeout";
//             }
//             GiangVienKhoa gvk = gvkRepo.getGVK(giangvien.getId()).get(0);
//             ArrayList<BoMon> listBoMonKhoa = bmRepo.getListBoMon(gvk.getKhoa().getId());
//             ArrayList<Integer> listIdMon = new ArrayList<Integer>();
//             for (BoMon bm : listBoMonKhoa) {
//                 ArrayList<MonHoc> listMH = mhRepo.getListMHByBoMonID(bm.getId());
//                 for (MonHoc mh : listMH) {
//                     listIdMon.add(mh.getId());
//                 }
//                 bm.setDsMonHoc((MonHoc[]) listMH.toArray());
//             }
//             ArrayList<KyHoc> listKy = (ArrayList<KyHoc>) kyhocRepo.findAll();
//             KyHoc newestKH = listKy.get(listKy.size() - 1);
//             ArrayList<MonHocKyHoc> listMHKH = mhkhRepo.getListMHKH(newestKH.getId());
//             for (MonHocKyHoc mhkh : listMHKH) {
//                 if (!listIdMon.contains(mhkh.getMh().getId())) {
//                     listMHKH.remove(mhkh);
//                 } else {
//                     MonHoc mh = mhRepo.findById(mhkh.getMh().getId()).get();
//                     mhkh.setMh(mh);
//                 }
//             }

//             model.addAttribute("dsmon", listMHKH);
//             model.addAttribute("msg", "Lay danh sach mon hoc thanh cong");
//         } catch (Exception e) {
//             return "redirect:/chonmonhoc?error";
//         }
//         return "dslophocphan";
//     }

//     @GetMapping("/dslophocphan")
//     private String getDSLHP(HttpServletRequest request, Model model, int mhkhId) {
//         try {
//             HttpSession session = request.getSession();
//             NhanVien giangvien = (NhanVien) session.getAttribute("giangvien");
//             if (giangvien == null) {
//                 return "redirect:/login?err=timeout";
//             }
//             ArrayList<LopHocPhan> listLHPFound = lhpRepo.getLHPByMHKHId(mhkhId);
//             ArrayList<LichHoc> listLichLHP = new ArrayList<LichHoc>();
//             for (LopHocPhan lhp : listLHPFound) {
//                 ArrayList<LichHoc> listLichHoc = lhRepo.findLichLHP(lhp.getId());
//                 LichHoc lh = listLichHoc.get(0);
//                 lh.setLhp(lhp);
//                 lh.setTuanhoc(thRepo.findById(lh.getTuanhoc().getId()).get());
//                 lh.setNgayhoc(nhRepo.findById(lh.getNgayhoc().getId()).get());
//                 lh.setKiphoc(khRepo.findById(lh.getKiphoc().getId()).get());
//                 listLichLHP.add(lh);
//             }
//             ArrayList<LichHoc> listLichDaDK = new ArrayList<LichHoc>();
//             for (LichHoc lh : listLichLHP) {
//                 if (lh.getGv().getId() == giangvien.getId()) {
//                     listLichDaDK.add(lh);
//                     listLichLHP.remove(lh);
//                 }
//             }
//             model.addAttribute("lichDaDK", listLichDaDK);
//             model.addAttribute("lichHocLHP", listLichLHP);
//         } catch (Exception e) {
//             return "redirect:/dangky/chonmonhoc?error";
//         }
//         return "dslophocphan";
//     }

//     @PutMapping("/updateDangKy")
//     private String updateDangky(HttpServletRequest request, Model model, ArrayList<LichHoc> listLHDangKy) {
//         try {
//             HttpSession session = request.getSession();
//             NhanVien giangvien = (NhanVien) session.getAttribute("giangvien");
//             if (giangvien == null) {
//                 return "redirect:/login?err=timeout";
//             }
//             ArrayList<LichHoc> listLichDaDK = (ArrayList<LichHoc>) model.getAttribute("lichDaDK");
//             for (LichHoc lh : listLHDangKy) {
//                 for (LichHoc lhDaDK : listLichDaDK) {
//                     if (lhDaDK.getKiphoc().getId() == lh.getKiphoc().getId()
//                             && lhDaDK.getNgayhoc().getId() == lh.getNgayhoc().getId()) {
//                         String msg = "Bị trùng lịch giảng dạy môn " + lh.getTen() + ", kíp " + lh.getKiphoc().getTen()
//                                 + ", thứ " + lh.getNgayhoc().getTen() + " hàng tuần";
//                         model.addAttribute("msg", msg);
//                         return "redirect:/dangky/dslophocphan?error";
//                     }
//                 }
//             }
//             for (LichHoc lh : listLHDangKy) {
//                 lhRepo.updateDangKy(giangvien.getId(), lh.getId());
//             }
//         } catch (Exception e) {
//             String msg = "Có lỗi xảy ra";
//             model.addAttribute("msg", msg);
//             return "redirect:/dangky/dslophocphan?error";
//         }
//         String msg = "Lưu đăng ký thành công";
//         model.addAttribute("msg", msg);
//         return "redirect:/";
//     }
// }
