package ptit;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.Data;
import ptit.controllers.ThanhVien;
@Data
@Entity
@Table(name="giangvienkhoa")
public class GiangVienKhoa implements Serializable{

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    
    @GeneratedValue
    @Id
    private int id;

    @JoinColumn(name="giangvienid")
    @NotNull
    @ManyToOne(targetEntity = ThanhVien.class, cascade = CascadeType.ALL)
    private ThanhVien giangVien;

    @JoinColumn(name="k_id")
    @ManyToOne(targetEntity = Khoa.class, cascade = CascadeType.ALL)
    private Khoa khoa;
}
