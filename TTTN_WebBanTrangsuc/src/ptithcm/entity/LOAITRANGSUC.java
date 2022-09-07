package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@Table(name="LOAITRANGSUC")
public class LOAITRANGSUC {
	@Id
    @Column(name = "maLoai")
	@NotBlank(message = "Mã loại trang sức không được để trống!")
    private String maLoai;
    @Column(name = "tenLoai")
    @NotBlank(message = "Tên loại trang sức không được để trống!")
    private String tenLoai;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maLoai")
    private List<TRANGSUC> trangsucList;
	public LOAITRANGSUC() {
		super();
	}
	public LOAITRANGSUC(String maLoai, String tenLoai, List<TRANGSUC> trangsucList) {
		super();
		this.maLoai = maLoai;
		this.tenLoai = tenLoai;
		this.trangsucList = trangsucList;
	}
	public String getMaLoai() {
		return maLoai;
	}
	public void setMaLoai(String maLoai) {
		this.maLoai = maLoai;
	}
	public String getTenLoai() {
		return tenLoai;
	}
	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
	}
	public List<TRANGSUC> getTrangsucList() {
		return trangsucList;
	}
	public void setTrangsucList(List<TRANGSUC> trangsucList) {
		this.trangsucList = trangsucList;
	}

}
