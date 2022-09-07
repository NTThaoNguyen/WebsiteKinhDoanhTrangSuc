package ptithcm.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TRANGTHAIDONHANG")
public class TRANGTHAIDONHANG {
	@Id
	@Column(name = "maTrangThaiDonHang")
	private String maTrangThaiDonHang;
	
	@Column(name = "tenTrangThaiDonHang")
	private String tenTrangThaiDonHang;
	
	@OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maTrangThaiDonHang")
	private List<GIOHANG> gioHang;

	public TRANGTHAIDONHANG() {
		super();
	}

	public TRANGTHAIDONHANG(String maTrangThaiDonHang, String tenTrangThaiDonHang) {
		super();
		this.maTrangThaiDonHang = maTrangThaiDonHang;
		this.tenTrangThaiDonHang = tenTrangThaiDonHang;
	}

	public String getMaTrangThaiDonHang() {
		return maTrangThaiDonHang;
	}

	public void setMaTrangThaiDonHang(String maTrangThaiDonHang) {
		this.maTrangThaiDonHang = maTrangThaiDonHang;
	}

	public String getTenTrangThaiDonHang() {
		return tenTrangThaiDonHang;
	}

	public void setTenTrangThaiDonHang(String tenTrangThaiDonHang) {
		this.tenTrangThaiDonHang = tenTrangThaiDonHang;
	}

	public List<GIOHANG> getGioHang() {
		return gioHang;
	}

	public void setGioHang(List<GIOHANG> gioHang) {
		this.gioHang = gioHang;
	}
	
}
