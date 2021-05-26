package ptit.web;

import java.util.ArrayList;
import java.util.List;

import ptit.data.LichHocRepository;
import ptit.models.KipHoc;
import ptit.models.LichHoc;
import ptit.models.LichHocView;
import ptit.models.LopHocPhan;
import ptit.models.NgayHoc;
import ptit.models.TuanHoc;

public class DSLHPFunction {

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

    public static void fixLopHocPhanData(ArrayList<LopHocPhan> listLHPFound, ArrayList<LichHoc> listLichLHP, LichHocRepository lhRepo){
        for (LopHocPhan lhp : listLHPFound) {
            ArrayList<LichHoc> listLichHoc = (ArrayList<LichHoc>) lhRepo.findLichLHP(lhp.getId());
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
    }
}
