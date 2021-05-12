package ptit;

import javax.persistence.*;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Entity
@Table(name = "thanhvien", uniqueConstraints = { @UniqueConstraint(columnNames = "username"),
		@UniqueConstraint(columnNames = "email") })
@Data
public class ThanhVien {
	public ThanhVien() {
	}

	public ThanhVien(String username, String email, String password) {
		this.username = username;
		this.email = email;
		this.password = password;
	}

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;
	@NotNull
	@Column(name = "username")
	private String username;
	@NotNull
	@Column(name = "password")
	private String password;
	@NotNull
	@Column(name = "ngaysinh")
	private String ngaySinh;

	@NotNull
	@Column(name = "email")
	private String email;
	@NotNull
	@Column(name = "dt")
	private String dt;
	@NotNull
	@Column(name = "ghichu")
	private String ghichu;
	@NotNull
	@Column(name = "vitri")
	private String vitri;
	@NotNull
	@Column(name = "ho")
	private String ho;
	@NotNull
	@Column(name = "dem")
	private String dem;
	@NotNull
	@Column(name = "ten")
	private String ten;

	@OneToOne
	@JoinColumn(name = "diachiid", referencedColumnName = "id")
	private DiaChi diaChi;
}
