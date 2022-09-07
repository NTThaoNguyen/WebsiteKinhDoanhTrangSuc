package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
@Table(name="KHACHHANG")
public class KHACHHANG {
	@Id
    @Column(name = "maKH")
    private String maKH;
    @Column(name = "ho")
    @NotBlank(message = "Họ và tên đệm không được để trống!")
    private String ho;
    @Column(name = "ten")
    @NotBlank(message = "Tên không được để trống!")
    private String ten;
    @Column(name = "gioiTinh")
    private String gioiTinh;
    @Column(name = "diaChi")
    @NotBlank(message = "Địa chỉ không được để trống!")
    private String diaChi;
    @Column(name = "SDT")
    @NotBlank(message = "Số điện thoại không được để trống!")
    private String sdt;
    @Column(name = "maSoThue")
    private String maSoThue;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maKH")
    private List<GIOHANG> giohangList;
    @JoinColumn(name = "maTK")
    @OneToOne
    private TAIKHOAN maTK;
	public KHACHHANG() {
		super();
	}
	public KHACHHANG(String maKH, String ho, String ten, String gioiTinh, String diaChi, String sdt, String maSoThue,
			List<GIOHANG> giohangList, TAIKHOAN maTK) {
		super();
		this.maKH = maKH;
		this.ho = ho;
		this.ten = ten;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.sdt = sdt;
		this.maSoThue = maSoThue;
		this.giohangList = giohangList;
		this.maTK = maTK;
	}
	public String getMaKH() {
		return maKH;
	}
	public void setMaKH(String maKH) {
		this.maKH = maKH;
	}
	public String getHo() {
		return ho;
	}
	public void setHo(String ho) {
		this.ho = ho;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getMaSoThue() {
		return maSoThue;
	}
	public void setMaSoThue(String maSoThue) {
		this.maSoThue = maSoThue;
	}
	public List<GIOHANG> getGiohangList() {
		return giohangList;
	}
	public void setGiohangList(List<GIOHANG> giohangList) {
		this.giohangList = giohangList;
	}
	public TAIKHOAN getMaTK() {
		return maTK;
	}
	public void setMaTK(TAIKHOAN maTK) {
		this.maTK = maTK;
	}
    
}
