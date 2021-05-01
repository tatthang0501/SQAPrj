package ptit;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

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
	// @Id
	// @GeneratedValue(strategy = GenerationType.IDENTITY)
	// private int id;

	// @NotBlank
	// @Size(max = 20)
	// private String username;

	// @NotBlank
	// @Size(max = 50)
	// @Email
	// private String email;

	// @NotBlank
	// @Size(max = 120)
	// private String password;

	// public User() {
	// }

	// public User(String username, String email, String password) {
	// this.username = username;
	// this.email = email;
	// this.password = password;
	// }

	// public int getId() {
	// return id;
	// }

	// public void setId(int id) {
	// this.id = id;
	// }

	// public String getUsername() {
	// return username;
	// }

	// public void setUsername(String username) {
	// this.username = username;
	// }

	// public String getEmail() {
	// return email;
	// }

	// public void setEmail(String email) {
	// this.email = email;
	// }

	// public String getPassword() {
	// return password;
	// }
	// public void setPassword(String password) {
	// this.password = password;
	// }
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
