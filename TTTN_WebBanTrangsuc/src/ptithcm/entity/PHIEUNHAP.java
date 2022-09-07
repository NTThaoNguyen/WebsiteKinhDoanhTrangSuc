package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="PHIEUNHAP")
public class PHIEUNHAP {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idPN")
    private Integer idPN;
    @Column(name = "ngayTao")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngayTao;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "idPN")
    private List<CT_PHIEUNHAP> ctPhieunhapList;
    @JoinColumn(name = "maNV")
    @ManyToOne
    private NHANVIEN maNV;
    @JoinColumn(name = "idPD")
    @OneToOne
    private PHIEUDAT idPD;
	public PHIEUNHAP() {
		super();
	}
	public PHIEUNHAP(Integer idPN, Date ngayTao, List<CT_PHIEUNHAP> ctPhieunhapList, NHANVIEN maNV, PHIEUDAT idPD) {
		super();
		this.idPN = idPN;
		this.ngayTao = ngayTao;
		this.ctPhieunhapList = ctPhieunhapList;
		this.maNV = maNV;
		this.idPD = idPD;
	}
	public Integer getIdPN() {
		return idPN;
	}
	public void setIdPN(Integer idPN) {
		this.idPN = idPN;
	}
	public Date getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}
	public List<CT_PHIEUNHAP> getCtPhieunhapList() {
		return ctPhieunhapList;
	}
	public void setCtPhieunhapList(List<CT_PHIEUNHAP> ctPhieunhapList) {
		this.ctPhieunhapList = ctPhieunhapList;
	}
	public NHANVIEN getMaNV() {
		return maNV;
	}
	public void setMaNV(NHANVIEN maNV) {
		this.maNV = maNV;
	}
	public PHIEUDAT getIdPD() {
		return idPD;
	}
	public void setIdPD(PHIEUDAT idPD) {
		this.idPD = idPD;
	}
    
}
