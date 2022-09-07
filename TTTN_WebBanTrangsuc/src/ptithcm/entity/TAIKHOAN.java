package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
@Table(name = "TAIKHOAN")
public class TAIKHOAN {
	@Id
	@Column(name = "maTK")
	@NotBlank(message = "Mã tài khoản không được để trống!")
	private String maTK;
	@Column(name = "email")
	@NotBlank(message = "Email không được để trống!")
	private String email;
	@Column(name = "password")
	@NotBlank(message = "Mật khẩu phải ít nhất 6 kí tự chứ số, chữ hoa, chữ thường và kí tự đặc biệt!")
	private String password;
	@JoinColumn(name = "maQuyen")
	@ManyToOne
	private QUYEN maQuyen;
	@JoinColumn(name = "maTrangThaiTK")
    @ManyToOne
    private TRANGTHAITAIKHOAN maTrangThaiTK;
	@OneToOne(cascade = CascadeType.REFRESH, mappedBy = "maTK")
	private KHACHHANG khachhang;
	@OneToOne(cascade = CascadeType.REFRESH, mappedBy = "maTK")
	private NHANVIEN nhanvien;
	public TAIKHOAN() {
		super();
	}
	public TAIKHOAN(String maTK, String email, String password, QUYEN maQuyen, TRANGTHAITAIKHOAN maTrangThaiTK,
			KHACHHANG khachhang, NHANVIEN nhanvien) {
		super();
		this.maTK = maTK;
		this.email = email;
		this.password = password;
		this.maQuyen = maQuyen;
		this.maTrangThaiTK = maTrangThaiTK;
		this.khachhang = khachhang;
		this.nhanvien = nhanvien;
	}
	public String getMaTK() {
		return maTK;
	}
	public void setMaTK(String maTK) {
		this.maTK = maTK;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public QUYEN getMaQuyen() {
		return maQuyen;
	}
	public void setMaQuyen(QUYEN maQuyen) {
		this.maQuyen = maQuyen;
	}
	public TRANGTHAITAIKHOAN getMaTrangThaiTK() {
		return maTrangThaiTK;
	}
	public void setMaTrangThaiTK(TRANGTHAITAIKHOAN maTrangThaiTK) {
		this.maTrangThaiTK = maTrangThaiTK;
	}
	public KHACHHANG getKhachhang() {
		return khachhang;
	}
	public void setKhachhang(KHACHHANG khachhang) {
		this.khachhang = khachhang;
	}
	public NHANVIEN getNhanvien() {
		return nhanvien;
	}
	public void setNhanvien(NHANVIEN nhanvien) {
		this.nhanvien = nhanvien;
	}

}
