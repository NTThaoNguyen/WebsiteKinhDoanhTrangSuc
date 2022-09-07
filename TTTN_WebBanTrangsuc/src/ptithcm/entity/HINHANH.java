package ptithcm.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "HINHANH")
public class HINHANH {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maHA")
    private Integer maHA;
    @Column(name = "tenHA")
    private String tenHA;
    @JoinColumn(name = "maTS")
    @ManyToOne
    private TRANGSUC maTS;
	public HINHANH() {
		super();
	}
	public HINHANH(Integer maHA, String tenHA, TRANGSUC maTS) {
		super();
		this.maHA = maHA;
		this.tenHA = tenHA;
		this.maTS = maTS;
	}
	public Integer getMaHA() {
		return maHA;
	}
	public void setMaHA(Integer maHA) {
		this.maHA = maHA;
	}
	public String getTenHA() {
		return tenHA;
	}
	public void setTenHA(String tenHA) {
		this.tenHA = tenHA;
	}
	public TRANGSUC getMaTS() {
		return maTS;
	}
	public void setMaTS(TRANGSUC maTS) {
		this.maTS = maTS;
	}
	
}
