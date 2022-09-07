package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="GIOHANG")
public class GIOHANG implements Serializable{
	@Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maGioHang")
    private String maGioHang;
    @Column(name = "ngayDat")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayDat;
    @Column(name = "hoTen")
    private String hoTen;
    @Column(name = "diaChiNhan")
    private String diaChiNhan;
    @Column(name = "emailNhan")
    private String emailNhan;
    @Column(name = "SDTNhan")
    private String sDTNhan;
    @Column(name = "ngayGiaoDuKien")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayGiaoDuKien;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maGioHang")
    private List<CT_GH> ctGhList;
    @JoinColumn(name = "maKH")
    @ManyToOne
    private KHACHHANG maKH;
    @JoinColumn(name = "maNVDuyet")
    @ManyToOne
    private NHANVIEN maNVDuyet;
    @JoinColumn(name = "maNVGiao")
    @ManyToOne
    private NHANVIEN maNVGiao;
    @ManyToOne
    @JoinColumn(name = "soHoaDon")
    private HOADON soHoaDon;
    @ManyToOne
	@JoinColumn(name = "maTrangThaiDonHang")
	private TRANGTHAIDONHANG maTrangThaiDonHang;
	public GIOHANG() {
		super();
	}
	public GIOHANG(String maGioHang, Date ngayDat, String hoTen, String diaChiNhan, String emailNhan, String sDTNhan,
			Date ngayGiaoDuKien, List<CT_GH> ctGhList, KHACHHANG maKH, NHANVIEN maNVDuyet, NHANVIEN maNVGiao,
			HOADON soHoaDon, TRANGTHAIDONHANG maTrangThaiDonHang) {
		super();
		this.maGioHang = maGioHang;
		this.ngayDat = ngayDat;
		this.hoTen = hoTen;
		this.diaChiNhan = diaChiNhan;
		this.emailNhan = emailNhan;
		this.sDTNhan = sDTNhan;
		this.ngayGiaoDuKien = ngayGiaoDuKien;
		this.ctGhList = ctGhList;
		this.maKH = maKH;
		this.maNVDuyet = maNVDuyet;
		this.maNVGiao = maNVGiao;
		this.soHoaDon = soHoaDon;
		this.maTrangThaiDonHang = maTrangThaiDonHang;
	}
	public String getMaGioHang() {
		return maGioHang;
	}
	public void setMaGioHang(String maGioHang) {
		this.maGioHang = maGioHang;
	}
	public Date getNgayDat() {
		return ngayDat;
	}
	public void setNgayDat(Date ngayDat) {
		this.ngayDat = ngayDat;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getDiaChiNhan() {
		return diaChiNhan;
	}
	public void setDiaChiNhan(String diaChiNhan) {
		this.diaChiNhan = diaChiNhan;
	}
	public String getEmailNhan() {
		return emailNhan;
	}
	public void setEmailNhan(String emailNhan) {
		this.emailNhan = emailNhan;
	}
	public String getsDTNhan() {
		return sDTNhan;
	}
	public void setsDTNhan(String sDTNhan) {
		this.sDTNhan = sDTNhan;
	}
	public Date getNgayGiaoDuKien() {
		return ngayGiaoDuKien;
	}
	public void setNgayGiaoDuKien(Date ngayGiaoDuKien) {
		this.ngayGiaoDuKien = ngayGiaoDuKien;
	}
	public List<CT_GH> getCtGhList() {
		return ctGhList;
	}
	public void setCtGhList(List<CT_GH> ctGhList) {
		this.ctGhList = ctGhList;
	}
	public KHACHHANG getMaKH() {
		return maKH;
	}
	public void setMaKH(KHACHHANG maKH) {
		this.maKH = maKH;
	}
	public NHANVIEN getMaNVDuyet() {
		return maNVDuyet;
	}
	public void setMaNVDuyet(NHANVIEN maNVDuyet) {
		this.maNVDuyet = maNVDuyet;
	}
	public NHANVIEN getMaNVGiao() {
		return maNVGiao;
	}
	public void setMaNVGiao(NHANVIEN maNVGiao) {
		this.maNVGiao = maNVGiao;
	}
	public HOADON getSoHoaDon() {
		return soHoaDon;
	}
	public void setSoHoaDon(HOADON soHoaDon) {
		this.soHoaDon = soHoaDon;
	}
	public TRANGTHAIDONHANG getMaTrangThaiDonHang() {
		return maTrangThaiDonHang;
	}
	public void setMaTrangThaiDonHang(TRANGTHAIDONHANG maTrangThaiDonHang) {
		this.maTrangThaiDonHang = maTrangThaiDonHang;
	}
	
}
