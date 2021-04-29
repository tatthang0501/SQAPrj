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
import javax.persistence.OrderColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.Data;
import ptit.controllers.ThanhVien;

@Data
@Entity
@Table(name="bomon")
public class BoMon implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @NotNull
    private int id;

    @NotNull
    @Column(name="ten")
    private String ten;
    @NotNull
    @Column(name="mota")
    private String mota;

    @NotNull
    @ManyToOne(targetEntity= Khoa.class, cascade={CascadeType.ALL})
    @JoinColumn(name="khoa_id")
    private Khoa khoa;

    @NotNull
    @OneToMany(targetEntity = MonHoc.class, cascade = CascadeType.ALL)
    @OrderColumn
    private List<MonHoc> dsMonHoc;

    @NotNull
    @OneToMany(targetEntity = ThanhVien.class, cascade = CascadeType.ALL)
    @OrderColumn
    private List<ThanhVien> dsGiangVien;
}
