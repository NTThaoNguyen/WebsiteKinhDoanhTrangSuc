package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Table(name="CT_KHUYENMAI")
public class CT_KHUYENMAI {
	@Id
    @Column(name = "maCTKM")
    private String maCTKM;
    @Column(name = "phanTramGiam")
    private double phanTramGiam;
    @JoinColumn(name = "maKM")
    @ManyToOne
    private KHUYENMAI maKM;
    @JoinColumn(name = "maTS")
    @ManyToOne
    private TRANGSUC maTS;
	public CT_KHUYENMAI() {
		super();
	}
	public CT_KHUYENMAI(String maCTKM, double phanTramGiam, KHUYENMAI maKM, TRANGSUC maTS) {
		super();
		this.maCTKM = maCTKM;
		this.phanTramGiam = phanTramGiam;
		this.maKM = maKM;
		this.maTS = maTS;
	}
	public String getMaCTKM() {
		return maCTKM;
	}
	public void setMaCTKM(String maCTKM) {
		this.maCTKM = maCTKM;
	}
	public double getPhanTramGiam() {
		return phanTramGiam;
	}
	public void setPhanTramGiam(double phanTramGiam) {
		this.phanTramGiam = phanTramGiam;
	}
	public KHUYENMAI getMaKM() {
		return maKM;
	}
	public void setMaKM(KHUYENMAI maKM) {
		this.maKM = maKM;
	}
	public TRANGSUC getMaTS() {
		return maTS;
	}
	public void setMaTS(TRANGSUC maTS) {
		this.maTS = maTS;
	}

}
