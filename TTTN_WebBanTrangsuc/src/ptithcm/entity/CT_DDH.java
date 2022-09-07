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
@Table(name="CT_DDH")
public class CT_DDH {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCTDDH")
    private Integer idCTDDH;
    @Column(name = "soLuong")
    private int soLuong;
    @Column(name = "gia")
    private double gia;
    @JoinColumn(name = "idPD")
    @ManyToOne
    private PHIEUDAT idPD;
    @JoinColumn(name = "maTS")
    @ManyToOne
    private TRANGSUC maTS;
	public CT_DDH() {
		super();
	}
	public CT_DDH(Integer idCTDDH, int soLuong, double gia, PHIEUDAT idPD, TRANGSUC maTS) {
		super();
		this.idCTDDH = idCTDDH;
		this.soLuong = soLuong;
		this.gia = gia;
		this.idPD = idPD;
		this.maTS = maTS;
	}
	public Integer getIdCTDDH() {
		return idCTDDH;
	}
	public void setIdCTDDH(Integer idCTDDH) {
		this.idCTDDH = idCTDDH;
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
	public PHIEUDAT getIdPD() {
		return idPD;
	}
	public void setIdPD(PHIEUDAT idPD) {
		this.idPD = idPD;
	}
	public TRANGSUC getMaTS() {
		return maTS;
	}
	public void setMaTS(TRANGSUC maTS) {
		this.maTS = maTS;
	}
    
}
