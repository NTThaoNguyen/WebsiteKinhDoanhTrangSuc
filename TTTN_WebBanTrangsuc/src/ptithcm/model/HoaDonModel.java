package ptithcm.model;

import java.text.DecimalFormat;
import java.util.Date;

public class HoaDonModel {
	private Date ngayTao;
	private String ngayTao2;
	private int tongTien;
	private String ngayTaoTN;
	private String soHoaDon;
	private String tenKH;
	private String nhanVienLap;
	public HoaDonModel() {
		super();
	}
	public HoaDonModel(Date ngayTao, int tongTien) {
		super();
		this.ngayTao = ngayTao;
		this.tongTien = tongTien;
		//this.ngayTaoTN = ngayTaoTN;
	}
	
	public String getNgayTao2() {
		return ngayTao2;
	}
	public void setNgayTao2(String ngayTao2) {
		this.ngayTao2 = ngayTao2;
	}
	public Date getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}
	public int getTongTien() {
		return tongTien;
	}
	public void setTongTien(int tongTien) {
		this.tongTien = tongTien;
	}
	public String getNgayTaoTN() {
		return ngayTaoTN;
	}
	public void setNgayTaoTN(String ngayTaoTN) {
		this.ngayTaoTN = ngayTaoTN;
	}
	public String getSoHoaDon() {
		return soHoaDon;
	}
	public void setSoHoaDon(String soHoaDon) {
		this.soHoaDon = soHoaDon;
	}
	public String getTenKH() {
		return tenKH;
	}
	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
	}
	public String getNhanVienLap() {
		return nhanVienLap;
	}
	public void setNhanVienLap(String nhanVienLap) {
		this.nhanVienLap = nhanVienLap;
	}
	public String getGiaVN() {
		// TODO Auto-generated method stub
		DecimalFormat formatter = new DecimalFormat("###,###,###");

		return formatter.format(tongTien)+" VNĐ";
	}
	
	
}
