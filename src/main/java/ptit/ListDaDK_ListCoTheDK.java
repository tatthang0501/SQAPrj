package ptit;

import java.util.ArrayList;

public class ListDaDK_ListCoTheDK {
    private ArrayList<LichHoc> listLichDaDK;
    private ArrayList<LichHoc> listLichLHP;


    public ListDaDK_ListCoTheDK() {
    }


    public ListDaDK_ListCoTheDK(ArrayList<LichHoc> listLichDaDK, ArrayList<LichHoc> listLichLHP) {
        this.listLichDaDK = listLichDaDK;
        this.listLichLHP = listLichLHP;
    }

    public ArrayList<LichHoc> getListLichDaDK() {
        return this.listLichDaDK;
    }

    public void setListLichDaDK(ArrayList<LichHoc> listLichDaDK) {
        this.listLichDaDK = listLichDaDK;
    }

    public ArrayList<LichHoc> getListLichLHP() {
        return this.listLichLHP;
    }

    public void setListLichLHP(ArrayList<LichHoc> listLichLHP) {
        this.listLichLHP = listLichLHP;
    }

}
