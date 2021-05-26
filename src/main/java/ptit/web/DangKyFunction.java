package ptit.web;

import java.util.ArrayList;

import ptit.data.MonHocRepository;
import ptit.models.BoMon;
import ptit.models.MonHoc;
import ptit.models.MonHocKyHoc;
import ptit.models.MonHocKyHocView;

public class DangKyFunction {

    public static void setDataListBMKAndListIdMon (ArrayList<BoMon> listBoMonKhoa, ArrayList<Integer> listIdMon, MonHocRepository mhRepo){
        for (BoMon bm : listBoMonKhoa) {
            ArrayList<MonHoc> listMH = (ArrayList<MonHoc>) mhRepo.getListMHByBoMonID(bm.getId());
            for (MonHoc mh : listMH) {
                listIdMon.add(mh.getId());
            }
            bm.setDsMonHoc(listMH);
        }
    }

    public static void MHKHFilter(ArrayList<MonHocKyHoc> listMHKHTemp, ArrayList<MonHocKyHoc> listMHKH, ArrayList<Integer> listIdMon, MonHocRepository mhRepo){
        for (MonHocKyHoc mhkh : listMHKHTemp) {
            if (listIdMon.contains(mhkh.getMh().getId())) {
                MonHoc mh = mhRepo.findById(mhkh.getMh().getId()).get();
                mhkh.setMh(mh);
                listMHKH.add(mhkh);
            }
        }
    }

    public static ArrayList<MonHocKyHocView> convertToMHKHView(ArrayList<MonHocKyHoc> listMHKH){
        ArrayList<MonHocKyHocView> listMHKHView = new ArrayList<>();
        for (MonHocKyHoc mhkh : listMHKH) {
            MonHocKyHocView mhkhv = new MonHocKyHocView();
            mhkhv.setId(mhkh.getId());
            mhkhv.setMota(mhkh.getMh().getMota());
            mhkhv.setSoTC(mhkh.getMh().getSoTC());
            mhkhv.setTen(mhkh.getMh().getTen());
            listMHKHView.add(mhkhv);
        }
        return listMHKHView;
    }
}
