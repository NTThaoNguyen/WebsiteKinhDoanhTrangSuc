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
@Table(name="CT_PHIEUNHAP")
public class CT_PHIEUNHAP {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCTPN")
    private Integer idCTPN;
    @Column(name = "soLuong")
    private int soLuong;
    @Column(name = "gia")
    private double gia;
    @JoinColumn(name = "idPN")
    @ManyToOne
    private PHIEUNHAP idPN;
    @JoinColumn(name = "maTS")
    @ManyToOne
    private TRANGSUC maTS;
	public CT_PHIEUNHAP() {
		super();
	}
	public CT_PHIEUNHAP(Integer idCTPN, int soLuong, double gia, PHIEUNHAP idPN, TRANGSUC maTS) {
		super();
		this.idCTPN = idCTPN;
		this.soLuong = soLuong;
		this.gia = gia;
		this.idPN = idPN;
		this.maTS = maTS;
	}
	public Integer getIdCTPN() {
		return idCTPN;
	}
	public void setIdCTPN(Integer idCTPN) {
		this.idCTPN = idCTPN;
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
	public PHIEUNHAP getIdPN() {
		return idPN;
	}
	public void setIdPN(PHIEUNHAP idPN) {
		this.idPN = idPN;
	}
	public TRANGSUC getMaTS() {
		return maTS;
	}
	public void setMaTS(TRANGSUC maTS) {
		this.maTS = maTS;
	}

}
