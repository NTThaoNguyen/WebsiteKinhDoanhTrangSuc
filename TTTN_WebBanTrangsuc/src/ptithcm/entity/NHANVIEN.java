package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="NHANVIEN")
public class NHANVIEN {
	@Id
    @Column(name = "maNV")
	@NotBlank(message = "Mã nhân viên không được để trống!")
    private String maNV;
    @Column(name = "ho")
    @NotBlank(message = "Họ và tên lót không được để trống!")
    private String ho;
    @Column(name = "ten")
    @NotBlank(message = "Tên không được để trống!")
    private String ten;
    @Column(name = "gioiTinh")
    private String gioiTinh;
    @Column(name = "ngaySinh")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngaySinh;
    @Column(name = "diaChi")
    @NotBlank(message = "Địa chỉ không được để trống!")
    private String diaChi;
    @Column(name = "SDT")
    @NotBlank(message = "Số điện thoại không được để trống!")
    private String sdt;
    @Column(name = "email")
    @NotBlank(message = "Email không được để trống!")
    private String email;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maNV")
    private List<PHIEUNHAP> phieunhapList;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maNV")
    private List<KHUYENMAI> khuyenmaiList;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maNV")
    private List<PHIEUDAT> phieudatList;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maNVDuyet")
    private List<GIOHANG> giohangList;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maNVGiao")
    private List<GIOHANG> giohangList1;
    @JoinColumn(name = "maTK")
    @OneToOne
    private TAIKHOAN maTK;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maNV")
    private List<THAYDOIGIA> thaydoigiaList;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maNV")
    private List<HOADON> hoadonList;
	public NHANVIEN() {
		super();
	}
	public NHANVIEN(String maNV, String ho, String ten, String gioiTinh, Date ngaySinh, String diaChi, String sdt,
			String email, List<PHIEUNHAP> phieunhapList, List<KHUYENMAI> khuyenmaiList, List<PHIEUDAT> phieudatList,
			List<GIOHANG> giohangList, List<GIOHANG> giohangList1, TAIKHOAN maTK, List<THAYDOIGIA> thaydoigiaList,
			List<HOADON> hoadonList) {
		super();
		this.maNV = maNV;
		this.ho = ho;
		this.ten = ten;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.diaChi = diaChi;
		this.sdt = sdt;
		this.email = email;
		this.phieunhapList = phieunhapList;
		this.khuyenmaiList = khuyenmaiList;
		this.phieudatList = phieudatList;
		this.giohangList = giohangList;
		this.giohangList1 = giohangList1;
		this.maTK = maTK;
		this.thaydoigiaList = thaydoigiaList;
		this.hoadonList = hoadonList;
	}
	public String getMaNV() {
		return maNV;
	}
	public void setMaNV(String maNV) {
		this.maNV = maNV;
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
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public List<PHIEUNHAP> getPhieunhapList() {
		return phieunhapList;
	}
	public void setPhieunhapList(List<PHIEUNHAP> phieunhapList) {
		this.phieunhapList = phieunhapList;
	}
	public List<KHUYENMAI> getKhuyenmaiList() {
		return khuyenmaiList;
	}
	public void setKhuyenmaiList(List<KHUYENMAI> khuyenmaiList) {
		this.khuyenmaiList = khuyenmaiList;
	}
	public List<PHIEUDAT> getPhieudatList() {
		return phieudatList;
	}
	public void setPhieudatList(List<PHIEUDAT> phieudatList) {
		this.phieudatList = phieudatList;
	}
	public List<GIOHANG> getGiohangList() {
		return giohangList;
	}
	public void setGiohangList(List<GIOHANG> giohangList) {
		this.giohangList = giohangList;
	}
	public List<GIOHANG> getGiohangList1() {
		return giohangList1;
	}
	public void setGiohangList1(List<GIOHANG> giohangList1) {
		this.giohangList1 = giohangList1;
	}
	public TAIKHOAN getMaTK() {
		return maTK;
	}
	public void setMaTK(TAIKHOAN maTK) {
		this.maTK = maTK;
	}
	public List<THAYDOIGIA> getThaydoigiaList() {
		return thaydoigiaList;
	}
	public void setThaydoigiaList(List<THAYDOIGIA> thaydoigiaList) {
		this.thaydoigiaList = thaydoigiaList;
	}
	public List<HOADON> getHoadonList() {
		return hoadonList;
	}
	public void setHoadonList(List<HOADON> hoadonList) {
		this.hoadonList = hoadonList;
	}
    

}
