package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

import java.text.DecimalFormat;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

@Entity
@Table(name="TRANGSUC")
public class TRANGSUC {

    @Id
    @Column(name = "maTS")
    @NotBlank(message = "Mã trang sức không được để trống!")
    private String maTS;
    @Column(name = "tenTS")
    @NotBlank(message = "Tên trang sức không được để trống!")
    private String tenTS;
    @Column(name = "soLuongTon")
    private int soLuongTon;
    @Column(name = "moTaNgan")
    private String moTaNgan;
    @Column(name = "moTa")
    private String moTa;
    @NotBlank(message = "Mô tả không được để trống!")
    @Column(name = "trangThaiSP")
    private String trangThaiSP;
    @Column(name = "gia")
    private int gia;
    @Column(name = "luotMua")
    private int luotMua;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maTS")
    private List<CT_PHIEUNHAP> ctPhieunhapList;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maTS")
    private List<CT_KHUYENMAI> ctKhuyenmaiList;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maTS")
    private List<CT_GH> ctGhList;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maTS")
    private List<THAYDOIGIA> thaydoigiaList;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maTS")
    private List<CT_DDH> ctDdhList;
    @JoinColumn(name = "maHang")
    @ManyToOne
    private HANGTRANGSUC maHang;
    @JoinColumn(name = "maLoai")
    @ManyToOne
    private LOAITRANGSUC maLoai;
    @JoinColumn(name = "maNCC")
    @ManyToOne
    private NHACUNGCAP maNCC;
    @OneToMany(cascade = CascadeType.REFRESH, mappedBy = "maTS")
    private List<HINHANH> hinhanhList;
    @Column(name = "is_new")
    private boolean is_new;
	public TRANGSUC() {
		super();
	}
	
	public String getMaTS() {
		return maTS;
	}

	public void setMaTS(String maTS) {
		this.maTS = maTS;
	}

	public String getTenTS() {
		return tenTS;
	}

	public void setTenTS(String tenTS) {
		this.tenTS = tenTS;
	}

	public int getSoLuongTon() {
		return soLuongTon;
	}

	public void setSoLuongTon(int soLuongTon) {
		this.soLuongTon = soLuongTon;
	}

	public String getMoTaNgan() {
		return moTaNgan;
	}

	public void setMoTaNgan(String moTaNgan) {
		this.moTaNgan = moTaNgan;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getTrangThaiSP() {
		return trangThaiSP;
	}

	public void setTrangThaiSP(String trangThaiSP) {
		this.trangThaiSP = trangThaiSP;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public int getLuotMua() {
		return luotMua;
	}

	public void setLuotMua(int luotMua) {
		this.luotMua = luotMua;
	}

	public List<CT_PHIEUNHAP> getCtPhieunhapList() {
		return ctPhieunhapList;
	}

	public void setCtPhieunhapList(List<CT_PHIEUNHAP> ctPhieunhapList) {
		this.ctPhieunhapList = ctPhieunhapList;
	}

	public List<CT_KHUYENMAI> getCtKhuyenmaiList() {
		return ctKhuyenmaiList;
	}

	public void setCtKhuyenmaiList(List<CT_KHUYENMAI> ctKhuyenmaiList) {
		this.ctKhuyenmaiList = ctKhuyenmaiList;
	}

	public List<CT_GH> getCtGhList() {
		return ctGhList;
	}

	public void setCtGhList(List<CT_GH> ctGhList) {
		this.ctGhList = ctGhList;
	}

	public List<THAYDOIGIA> getThaydoigiaList() {
		return thaydoigiaList;
	}

	public void setThaydoigiaList(List<THAYDOIGIA> thaydoigiaList) {
		this.thaydoigiaList = thaydoigiaList;
	}

	public List<CT_DDH> getCtDdhList() {
		return ctDdhList;
	}

	public void setCtDdhList(List<CT_DDH> ctDdhList) {
		this.ctDdhList = ctDdhList;
	}

	public HANGTRANGSUC getMaHang() {
		return maHang;
	}

	public void setMaHang(HANGTRANGSUC maHang) {
		this.maHang = maHang;
	}

	public LOAITRANGSUC getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(LOAITRANGSUC maLoai) {
		this.maLoai = maLoai;
	}

	public NHACUNGCAP getMaNCC() {
		return maNCC;
	}

	public void setMaNCC(NHACUNGCAP maNCC) {
		this.maNCC = maNCC;
	}

	public List<HINHANH> getHinhanhList() {
		return hinhanhList;
	}

	public void setHinhanhList(List<HINHANH> hinhanhList) {
		this.hinhanhList = hinhanhList;
	}

	public boolean isIs_new() {
		return is_new;
	}

	public void setIs_new(boolean is_new) {
		this.is_new = is_new;
	}

	public TRANGSUC(String maTS, String tenTS, int soLuongTon, String moTaNgan, String moTa, String trangThaiSP,
			int gia, int luotMua, List<CT_PHIEUNHAP> ctPhieunhapList, List<CT_KHUYENMAI> ctKhuyenmaiList,
			List<CT_GH> ctGhList, List<THAYDOIGIA> thaydoigiaList, List<CT_DDH> ctDdhList, HANGTRANGSUC maHang,
			LOAITRANGSUC maLoai, NHACUNGCAP maNCC, List<HINHANH> hinhanhList, boolean is_new) {
		super();
		this.maTS = maTS;
		this.tenTS = tenTS;
		this.soLuongTon = soLuongTon;
		this.moTaNgan = moTaNgan;
		this.moTa = moTa;
		this.trangThaiSP = trangThaiSP;
		this.gia = gia;
		this.luotMua = luotMua;
		this.ctPhieunhapList = ctPhieunhapList;
		this.ctKhuyenmaiList = ctKhuyenmaiList;
		this.ctGhList = ctGhList;
		this.thaydoigiaList = thaydoigiaList;
		this.ctDdhList = ctDdhList;
		this.maHang = maHang;
		this.maLoai = maLoai;
		this.maNCC = maNCC;
		this.hinhanhList = hinhanhList;
		this.is_new = is_new;
	}

	public String getGiaVN() {
		// TODO Auto-generated method stub
		DecimalFormat formatter = new DecimalFormat("###,###,###");

		return formatter.format(gia)+" VNĐ";

	}
}
