package ptit;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.lang.Nullable;

import lombok.Data;

@Data
@Entity
@Table(name="lichhoc")
public class LichHoc implements Serializable{

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    
    @Id
    @Column(name="id")
    private int id;
    @NotNull
    @Column(name="ten")
    private String ten;
    
    @NotNull
    @JoinColumn(name="lhpid")
    @ManyToOne(targetEntity = LopHocPhan.class, cascade = CascadeType.ALL)
    private LopHocPhan lhp;

    @NotNull
    @OneToMany(mappedBy = "lh", cascade = CascadeType.ALL)
    private List<TuanHoc> tuanHoc;

    @NotNull
    @OneToMany(mappedBy = "lh", cascade = CascadeType.ALL)
    private List<NgayHoc> ngayHoc;

    @NotNull
    @OneToMany(mappedBy = "lh", cascade = CascadeType.ALL)
    private List<KipHoc> kipHoc;

    @Column(name="phong")
    private String phong;

    @Column(name="nhomth")
    private int nhomTH;

    @Nullable
    @JoinColumn(name="giangvienid")
    @ManyToOne(targetEntity = ThanhVien.class, cascade = CascadeType.ALL)
    private ThanhVien gv;
}
