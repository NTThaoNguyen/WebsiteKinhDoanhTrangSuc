package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="KHUYENMAI")
public class KHUYENMAI {
	@Id
    @Column(name = "maKM")
    private String maKM;
    @Column(name = "ngayBD")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngayBD;
    @Column(name = "ngayKT")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngayKT;
    @Column(name = "moTa")
    private String moTa;
    @JoinColumn(name = "maNV")
    @ManyToOne
    private NHANVIEN maNV;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maKM")
    private List<CT_KHUYENMAI> ctKhuyenmaiList;
	public KHUYENMAI() {
		super();
	}
	public KHUYENMAI(String maKM, Date ngayBD, Date ngayKT, String moTa, NHANVIEN maNV,
			List<CT_KHUYENMAI> ctKhuyenmaiList) {
		super();
		this.maKM = maKM;
		this.ngayBD = ngayBD;
		this.ngayKT = ngayKT;
		this.moTa = moTa;
		this.maNV = maNV;
		this.ctKhuyenmaiList = ctKhuyenmaiList;
	}
	public String getMaKM() {
		return maKM;
	}
	public void setMaKM(String maKM) {
		this.maKM = maKM;
	}
	public Date getNgayBD() {
		return ngayBD;
	}
	public void setNgayBD(Date ngayBD) {
		this.ngayBD = ngayBD;
	}
	public Date getNgayKT() {
		return ngayKT;
	}
	public void setNgayKT(Date ngayKT) {
		this.ngayKT = ngayKT;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public NHANVIEN getMaNV() {
		return maNV;
	}
	public void setMaNV(NHANVIEN maNV) {
		this.maNV = maNV;
	}
	public List<CT_KHUYENMAI> getCtKhuyenmaiList() {
		return ctKhuyenmaiList;
	}
	public void setCtKhuyenmaiList(List<CT_KHUYENMAI> ctKhuyenmaiList) {
		this.ctKhuyenmaiList = ctKhuyenmaiList;
	}
	
}
