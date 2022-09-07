package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@Table(name = "QUYEN")
public class QUYEN {
	@Id
	@Column(name = "maQuyen")
	private String maQuyen;
	@Column(name = "tenQuyen")
	private String tenQuyen;
	@OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maQuyen")
	private List<TAIKHOAN> taikhoanList;
	public QUYEN() {
		super();
	}
	public QUYEN(String maQuyen, String tenQuyen, List<TAIKHOAN> taikhoanList) {
		super();
		this.maQuyen = maQuyen;
		this.tenQuyen = tenQuyen;
		this.taikhoanList = taikhoanList;
	}
	public String getMaQuyen() {
		return maQuyen;
	}
	public void setMaQuyen(String maQuyen) {
		this.maQuyen = maQuyen;
	}
	public String getTenQuyen() {
		return tenQuyen;
	}
	public void setTenQuyen(String tenQuyen) {
		this.tenQuyen = tenQuyen;
	}
	public List<TAIKHOAN> getTaikhoanList() {
		return taikhoanList;
	}
	public void setTaikhoanList(List<TAIKHOAN> taikhoanList) {
		this.taikhoanList = taikhoanList;
	}

}
