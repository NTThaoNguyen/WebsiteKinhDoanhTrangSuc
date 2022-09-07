package ptithcm.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TRANGTHAITAIKHOAN")
public class TRANGTHAITAIKHOAN {
	@Id
    @Column(name = "maTrangThaiTK")
    private String maTrangThaiTK;
    @Column(name = "tenTrangThaiTK")
    private String tenTrangThaiTK;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maTrangThaiTK")
    private List<TAIKHOAN> taikhoanList;
	public TRANGTHAITAIKHOAN() {
		super();
	}
	public TRANGTHAITAIKHOAN(String maTrangThaiTK, String tenTrangThaiTK) {
		super();
		this.maTrangThaiTK = maTrangThaiTK;
		this.tenTrangThaiTK = tenTrangThaiTK;
	}
	public TRANGTHAITAIKHOAN(String maTrangThaiTK, String tenTrangThaiTK, List<TAIKHOAN> taikhoanList) {
		super();
		this.maTrangThaiTK = maTrangThaiTK;
		this.tenTrangThaiTK = tenTrangThaiTK;
		this.taikhoanList = taikhoanList;
	}
	public String getMaTrangThaiTK() {
		return maTrangThaiTK;
	}
	public void setMaTrangThaiTK(String maTrangThaiTK) {
		this.maTrangThaiTK = maTrangThaiTK;
	}
	public String getTenTrangThaiTK() {
		return tenTrangThaiTK;
	}
	public void setTenTrangThaiTK(String tenTrangThaiTK) {
		this.tenTrangThaiTK = tenTrangThaiTK;
	}
	public List<TAIKHOAN> getTaikhoanList() {
		return taikhoanList;
	}
	public void setTaikhoanList(List<TAIKHOAN> taikhoanList) {
		this.taikhoanList = taikhoanList;
	}

}
