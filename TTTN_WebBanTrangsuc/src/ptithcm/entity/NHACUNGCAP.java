package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

@Entity
@Table(name="NHACUNGCAP")
public class NHACUNGCAP {
	@Id
    @Column(name = "maNCC")
    private String maNCC;
    @Column(name = "tenNCC")
    private String tenNCC;
    @Column(name = "diaChi")
    private String diaChi;
    @Column(name = "email")
    private String email;
    @Column(name = "SDT")
    private String sdt;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maNCC")
    private List<PHIEUDAT> phieudatList;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maNCC")
    private List<TRANGSUC> trangsucList;
	public NHACUNGCAP() {
		super();
	}
	public NHACUNGCAP(String maNCC, String tenNCC, String diaChi, String email, String sdt, List<PHIEUDAT> phieudatList,
			List<TRANGSUC> trangsucList) {
		super();
		this.maNCC = maNCC;
		this.tenNCC = tenNCC;
		this.diaChi = diaChi;
		this.email = email;
		this.sdt = sdt;
		this.phieudatList = phieudatList;
		this.trangsucList = trangsucList;
	}
	public String getMaNCC() {
		return maNCC;
	}
	public void setMaNCC(String maNCC) {
		this.maNCC = maNCC;
	}
	public String getTenNCC() {
		return tenNCC;
	}
	public void setTenNCC(String tenNCC) {
		this.tenNCC = tenNCC;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public List<PHIEUDAT> getPhieudatList() {
		return phieudatList;
	}
	public void setPhieudatList(List<PHIEUDAT> phieudatList) {
		this.phieudatList = phieudatList;
	}
	public List<TRANGSUC> getTrangsucList() {
		return trangsucList;
	}
	public void setTrangsucList(List<TRANGSUC> trangsucList) {
		this.trangsucList = trangsucList;
	}
    

}
