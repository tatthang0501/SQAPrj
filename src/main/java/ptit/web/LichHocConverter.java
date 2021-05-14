package ptit.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import ptit.KipHoc;
import ptit.LichHoc;
import ptit.LichHocView;
import ptit.LopHocPhan;
import ptit.NgayHoc;
import ptit.TuanHoc;
import ptit.data.LichHocRepository;

public class LichHocConverter {

    // public LichHocRepository lhRepo;

    
    // public LichHocConverter(LichHocRepository lhRepo) {
    //     this.lhRepo = lhRepo;
    // }

    public static ArrayList<LichHocView> convertLHToLHV(ArrayList<LichHoc> listLHFound) {
        ArrayList<LichHocView> listLichViewLHP = new ArrayList<LichHocView>();
        for (LichHoc lh : listLHFound) {
            LichHocView lhv = new LichHocView();
            lhv.setId(lh.getId());
            lhv.setTen(lh.getTen());
            lhv.setSoTC(lh.getLhp().getMhkh().getMh().getSoTC());
            lhv.setPhong(lh.getPhong());
            lhv.setNhomTH(lh.getNhomTH());
            lhv.setSiSoToiDa(lh.getLhp().getSisotoida());

            List<KipHoc> kh = lh.getKipHoc();
            List<Integer> listKH = new ArrayList<>();
            for (KipHoc kip : kh) {
                listKH.add(kip.getTen());
            }
            lhv.setKipHoc(listKH);

            List<NgayHoc> nh = lh.getNgayHoc();
            List<Integer> listNH = new ArrayList<>();
            for (NgayHoc ngay : nh) {
                listNH.add(ngay.getTen());
            }
            lhv.setNgayHoc(listNH);

            List<TuanHoc> th = lh.getTuanHoc();
            List<Integer> listTH = new ArrayList<>();
            for (TuanHoc tuan : th) {
                listTH.add(tuan.getTen());
            }
            lhv.setTuanHoc(listTH);

            listLichViewLHP.add(lhv);
            if (lh.getGv() != null) {
                lhv.setDaDK(true);
            }
        }
        return listLichViewLHP;
    }

    // public static ArrayList<LichHoc> convertLHPToLH(ArrayList<LopHocPhan> listLHPFound) {
    //     ArrayList<LichHoc> listLichLHP = new ArrayList<LichHoc>();
    //     for (LopHocPhan lhp : listLHPFound) {
    //         ArrayList<LichHoc> listLichHoc = (ArrayList<LichHoc>) lhRepo.findLichLHP(lhp.getId());
    //         System.out.println(listLichHoc.size());
    //         LichHoc lh = listLichHoc.get(0);
    //         lh.setLhp(lhp);
    //         List<KipHoc> kh = lh.getKipHoc();
    //         for (KipHoc kip : kh) {
    //             kip.setLh(null);
    //         }
    //         lh.setKipHoc(kh);

    //         List<NgayHoc> nh = lh.getNgayHoc();
    //         for (NgayHoc ngay : nh) {
    //             ngay.setLh(null);
    //         }
    //         lh.setNgayHoc(nh);

    //         List<TuanHoc> th = lh.getTuanHoc();
    //         for (TuanHoc tuan : th) {
    //             tuan.setLh(null);
    //         }
    //         lh.setTuanHoc(th);
    //         listLichLHP.add(lh);
    //     }
    //     return listLichLHP;
    // }
}
