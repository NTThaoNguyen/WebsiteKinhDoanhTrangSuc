package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Table(name="CT_GH")
public class CT_GH {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCTGH")
    private Integer idCTGH;
    @Column(name = "soLuong")
    private int soLuong;
    @Column(name = "gia")
    private double gia;
    @JoinColumn(name = "maGioHang")
    @ManyToOne
    private GIOHANG maGioHang;
    @JoinColumn(name = "maTS")
    @ManyToOne
    private TRANGSUC maTS;
	public CT_GH() {
		super();
	}
	public CT_GH(Integer idCTGH, int soLuong, double gia, GIOHANG maGioHang, TRANGSUC maTS) {
		super();
		this.idCTGH = idCTGH;
		this.soLuong = soLuong;
		this.gia = gia;
		this.maGioHang = maGioHang;
		this.maTS = maTS;
	}
	public Integer getIdCTGH() {
		return idCTGH;
	}
	public void setIdCTGH(Integer idCTGH) {
		this.idCTGH = idCTGH;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public double getGia() {
		return gia;
	}
	public void setGia(double gia) {
		this.gia = gia;
	}
	public GIOHANG getMaGioHang() {
		return maGioHang;
	}
	public void setMaGioHang(GIOHANG maGioHang) {
		this.maGioHang = maGioHang;
	}
	public TRANGSUC getMaTS() {
		return maTS;
	}
	public void setMaTS(TRANGSUC maTS) {
		this.maTS = maTS;
	}
    
}
