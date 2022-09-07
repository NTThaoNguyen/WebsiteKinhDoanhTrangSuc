package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="PHIEUDAT")
public class PHIEUDAT {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idPD")
    private Integer idPD;
    @Column(name = "idPN")
    private int idPN;
    @Column(name = "ngayDat")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngayDat;
    @OneToOne(cascade = CascadeType.REFRESH, mappedBy = "idPD")
    private PHIEUNHAP phieunhap;
    @JoinColumn(name = "maNCC")
    @ManyToOne
    private NHACUNGCAP maNCC;
    @JoinColumn(name = "maNV")
    @ManyToOne
    private NHANVIEN maNV;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "idPD")
    private List<CT_DDH> ctDdhList;
	public PHIEUDAT() {
		super();
	}
	public PHIEUDAT(Integer idPD, int idPN, Date ngayDat, PHIEUNHAP phieunhap, NHACUNGCAP maNCC, NHANVIEN maNV,
			List<CT_DDH> ctDdhList) {
		super();
		this.idPD = idPD;
		this.idPN = idPN;
		this.ngayDat = ngayDat;
		this.phieunhap = phieunhap;
		this.maNCC = maNCC;
		this.maNV = maNV;
		this.ctDdhList = ctDdhList;
	}
	public Integer getIdPD() {
		return idPD;
	}
	public void setIdPD(Integer idPD) {
		this.idPD = idPD;
	}
	public int getIdPN() {
		return idPN;
	}
	public void setIdPN(int idPN) {
		this.idPN = idPN;
	}
	public Date getNgayDat() {
		return ngayDat;
	}
	public void setNgayDat(Date ngayDat) {
		this.ngayDat = ngayDat;
	}
	public PHIEUNHAP getPhieunhap() {
		return phieunhap;
	}
	public void setPhieunhap(PHIEUNHAP phieunhap) {
		this.phieunhap = phieunhap;
	}
	public NHACUNGCAP getMaNCC() {
		return maNCC;
	}
	public void setMaNCC(NHACUNGCAP maNCC) {
		this.maNCC = maNCC;
	}
	public NHANVIEN getMaNV() {
		return maNV;
	}
	public void setMaNV(NHANVIEN maNV) {
		this.maNV = maNV;
	}
	public List<CT_DDH> getCtDdhList() {
		return ctDdhList;
	}
	public void setCtDdhList(List<CT_DDH> ctDdhList) {
		this.ctDdhList = ctDdhList;
	}

}
