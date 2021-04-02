package ptit;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
@Table(name = "thanhvien")
@Entity
public class ThanhVien implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    @Column(name="id")
    private int id;
    @NotNull
    @Column(name="username")
    private String username;
    @NotNull
    @Column(name="password")
    private String password;
    @NotNull
    @Column(name="ngaysinh")
    private String ngaySinh;
    @NotNull
    @OneToOne
    @JoinColumn(name="diachiid",referencedColumnName = "id")
    private DiaChi diaChi;
    @NotNull
    @Column(name="email")
    private String email;
    @NotNull
    @Column(name="dt")
    private String dt;
    @NotNull
    @Column(name="ghichu")
    private String ghichu;
    @NotNull
    @Column(name="vitri")
    private String vitri;
    @NotNull
    @Column(name="ho")
    private String ho;
    @NotNull
    @Column(name="dem")
    private String dem;
    @NotNull
    @Column(name="ten")
    private String ten;
    
    
    
}
