package ptithcm.entity;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name="HOADON")
public class HOADON {
	@Id
   // @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "soHoaDon")
    private String soHoaDon;
    @Column(name = "ngayTao")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngayTao;
    @Column(name = "tongTien")
    private double tongTien;
    @Column(name = "maSoThue")
    private String maSoThue;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "soHoaDon")
    private List<GIOHANG> gHList;
    @JoinColumn(name = "maNV")
    @ManyToOne
    private NHANVIEN maNV;
	public HOADON() {
		super();
	}
	public HOADON(String soHoaDon, Date ngayTao, double tongTien, String maSoThue, List<GIOHANG> gHList,
			NHANVIEN maNV) {
		super();
		this.soHoaDon = soHoaDon;
		this.ngayTao = ngayTao;
		this.tongTien = tongTien;
		this.maSoThue = maSoThue;
		this.gHList = gHList;
		this.maNV = maNV;
	}
	public String getSoHoaDon() {
		return soHoaDon;
	}
	public void setSoHoaDon(String soHoaDon) {
		this.soHoaDon = soHoaDon;
	}
	public Date getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}
	public double getTongTien() {
		return tongTien;
	}
	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}
	public String getMaSoThue() {
		return maSoThue;
	}
	public void setMaSoThue(String maSoThue) {
		this.maSoThue = maSoThue;
	}
	public List<GIOHANG> getgHList() {
		return gHList;
	}
	public void setgHList(List<GIOHANG> gHList) {
		this.gHList = gHList;
	}
	public NHANVIEN getMaNV() {
		return maNV;
	}
	public void setMaNV(NHANVIEN maNV) {
		this.maNV = maNV;
	}

	
}
