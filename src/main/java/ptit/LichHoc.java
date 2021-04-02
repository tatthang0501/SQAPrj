package ptit;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

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
    @JoinColumn(name="tuanid")
    @ManyToOne(targetEntity = TuanHoc.class, cascade = CascadeType.ALL)
    private TuanHoc tuanhoc;

    @NotNull
    @JoinColumn(name="ngayid")
    @ManyToOne(targetEntity = NgayHoc.class, cascade = CascadeType.ALL)
    private NgayHoc ngayhoc;

    @NotNull
    @JoinColumn(name="kipid")
    @ManyToOne(targetEntity = KipHoc.class, cascade = CascadeType.ALL)
    private KipHoc kiphoc;

    @JoinColumn(name="giangvienid")
    @ManyToOne(targetEntity = ThanhVien.class, cascade = CascadeType.ALL)
    private ThanhVien gv;
}
