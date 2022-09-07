package ptithcm.entity;

import java.text.DecimalFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="THAYDOIGIA")
public class THAYDOIGIA {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idThayDoi")
    private Integer idThayDoi;
    @Column(name = "gia")
    @NotNull(message = "Giá không được để trống!")
    private int gia;
    @Column(name = "ngayApDung")
    @Temporal(TemporalType.DATE)
//    @DateTimeFormat(pattern = "MM/dd/yyyy")
    @NotNull(message = "Ngày áp dụng không được để trống!")
    private Date ngayApDung;
    @JoinColumn(name = "maNV")
    @ManyToOne
    private NHANVIEN maNV;
    @JoinColumn(name = "maTS")
    @ManyToOne
    private TRANGSUC maTS;
	public THAYDOIGIA() {
		super();
	}
	public THAYDOIGIA(Integer idThayDoi, int gia, Date ngayApDung, NHANVIEN maNV, TRANGSUC maTS) {
		super();
		this.idThayDoi = idThayDoi;
		this.gia = gia;
		this.ngayApDung = ngayApDung;
		this.maNV = maNV;
		this.maTS = maTS;
	}
	public Integer getIdThayDoi() {
		return idThayDoi;
	}
	public void setIdThayDoi(Integer idThayDoi) {
		this.idThayDoi = idThayDoi;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public Date getNgayApDung() {
		return ngayApDung;
	}
	public void setNgayApDung(Date ngayApDung) {
		this.ngayApDung = ngayApDung;
	}
	public NHANVIEN getMaNV() {
		return maNV;
	}
	public void setMaNV(NHANVIEN maNV) {
		this.maNV = maNV;
	}
	public TRANGSUC getMaTS() {
		return maTS;
	}
	public void setMaTS(TRANGSUC maTS) {
		this.maTS = maTS;
	}
	public String getGiaVN() {
		// TODO Auto-generated method stub
		DecimalFormat formatter = new DecimalFormat("###,###,###");

		return formatter.format(gia)+" VNĐ";

	}
}
