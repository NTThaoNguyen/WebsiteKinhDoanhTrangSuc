package ptithcm.model;

import java.text.DecimalFormat;

public class GioHangModel {
	String maTS;
	String tenTS;
	int gia;
	int soLuong;
	String tenHA;
	public GioHangModel() {
		super();
	}
	public GioHangModel(String maTS, String tenTS, int gia, int soLuong, String tenHA) {
		super();
		this.maTS = maTS;
		this.tenTS = tenTS;
		this.gia = gia;
		this.soLuong = soLuong;
		this.tenHA = tenHA;
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
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getTenHA() {
		return tenHA;
	}
	public void setTenHA(String tenHA) {
		this.tenHA = tenHA;
	}
	//Thành tiền
	public String getGiaVN() {
		// TODO Auto-generated method stub
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		return formatter.format(gia)+" VNĐ";

	}
	//Giá
	public String getTongGiaVN() {
		// TODO Auto-generated method stub
		DecimalFormat formatter = new DecimalFormat("###,###,###");

		return formatter.format(gia/soLuong)+" VNĐ";

	}
	
}
