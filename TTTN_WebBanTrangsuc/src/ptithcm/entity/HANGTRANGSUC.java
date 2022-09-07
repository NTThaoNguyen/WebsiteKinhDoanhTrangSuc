package ptithcm.entity;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="HANGTRANGSUC")
public class HANGTRANGSUC {
	@Id
    @Column (name = "maHang")
	@NotBlank(message = "Mã hãng trang sức không được để trống!")
    private String maHang;
    @Column(name = "tenHang")
    @NotBlank(message = "Tên hãng trang sức không được để trống!")
    private String tenHang;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maHang")
    private List<TRANGSUC> trangsucList;
	public HANGTRANGSUC() {
		super();
	}
	public HANGTRANGSUC(String maHang, String tenHang, List<TRANGSUC> trangsucList) {
		super();
		this.maHang = maHang;
		this.tenHang = tenHang;
		this.trangsucList = trangsucList;
	}
	public String getMaHang() {
		return maHang;
	}
	public void setMaHang(String maHang) {
		this.maHang = maHang;
	}
	public String getTenHang() {
		return tenHang;
	}
	public void setTenHang(String tenHang) {
		this.tenHang = tenHang;
	}
	public List<TRANGSUC> getTrangsucList() {
		return trangsucList;
	}
	public void setTrangsucList(List<TRANGSUC> trangsucList) {
		this.trangsucList = trangsucList;
	}

}
