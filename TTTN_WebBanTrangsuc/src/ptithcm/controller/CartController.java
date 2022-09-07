package ptithcm.controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.CT_GH;
import ptithcm.entity.GIOHANG;
import ptithcm.entity.TRANGSUC;
import ptithcm.entity.TRANGTHAIDONHANG;
import ptithcm.model.GioHangModel;
import ptithcm.model.InputSearchModel;


@Transactional
@Controller
@RequestMapping("/cart/")
public class CartController {
	List<GioHangModel> listGH = null;
	GIOHANG GH = null;
	long millis;
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	@Autowired
	SessionFactory factory;
	public String getTongGiaVN(int tongTien) {
		// TODO Auto-generated method stub
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		return formatter.format(tongTien) + " VNĐ";
	}
	public TRANGSUC get1SP(String maTS) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM TRANGSUC where maTS = :ma");
		query.setParameter("ma", maTS);
		TRANGSUC ts = (TRANGSUC) query.list().get(0);
		return ts;
	}
	String checkKhongTrungSp(List<GioHangModel> listCTGH, TRANGSUC SP) {
		if(listCTGH == null) {
			return "rong";
		}
		for (GioHangModel sp : listGH) {
			if(sp.getMaTS().equals(SP.getMaTS())) {
				return "trung";
			}
		}
		return "khongtrung";
	}
	@RequestMapping(value = "/{maTS}.htm", params = "linkDelete")
	public String xoaGioHang(ModelMap model, @PathVariable("maTS") String maTS) {
		for (int i = 0; i < listGH.size(); i++) {
			if (maTS.equals(listGH.get(i).getMaTS())) {
				listGH.remove(i);
				i--;
			}
		}
		model.addAttribute("listSP", listGH);
		int tongTien = 0;
		if (listGH != null) {
			for (GioHangModel i : listGH) {
				tongTien = tongTien + i.getGia();
			}
		}
		model.addAttribute("tongTien", getTongGiaVN(tongTien));
		//return "user2/cart";
		return "user2/gio-hang";//test
	}
	@RequestMapping("themgiohang")
	public String themVaoGioHang(ModelMap model, @ModelAttribute("gioHang") GioHangModel gioHang) {
		GioHangModel gh = new GioHangModel();
		gh.setGia(gioHang.getGia() * gioHang.getSoLuong());
		String maTS = gioHang.getMaTS();
		TRANGSUC ts =this.get1SP(maTS);
		gh.setMaTS(maTS);
		gh.setTenTS(ts.getTenTS());
		gh.setSoLuong(gioHang.getSoLuong());
		gh.setTenHA(ts.getHinhanhList().get(0).getTenHA());
		String check = this.checkKhongTrungSp(listGH, ts);
		if(check.equals("rong")) {
			listGH = new ArrayList<>();
			listGH.add(gh);
			//msg = "Thêm sản phẩm vào giỏ hàng thành công!";
		} else if(check.equals("trung")){
			for (GioHangModel sp : listGH) {
				if(sp.getMaTS().equals(ts.getMaTS())) {
					sp.setSoLuong(gh.getSoLuong() + sp.getSoLuong());;
					sp.setGia(sp.getGia() + gh.getGia());
				}
			}
			//msg = "Thêm sản phẩm vào giỏ hàng thành công!";
		} else if(check.equals("khongtrung")) {
			listGH.add(gh);
			//msg = "Thêm sản phẩm vào giỏ hàng thành công!";
		}
		for (GioHangModel gioHangModel : listGH) {
			System.out.println(gioHangModel.getTenTS());
		}
		model.addAttribute("trangsuc", ts);
		GioHangModel ctgh = new GioHangModel();
		ctgh.setMaTS(ts.getMaTS());
		ctgh.setGia(ts.getGia());
		model.addAttribute("gioHang", ctgh);
		//model.addAttribute("msg", msg);
		return "redirect:/product/" + maTS + ".htm?linkDemo";
	}
	@RequestMapping("index")
	public String index(ModelMap model) {
		model.addAttribute("listSP", listGH);
		int tongTien = 0;
		if (listGH != null) {
			for (GioHangModel i : listGH) {
				tongTien = tongTien + i.getGia();
			}
		}
		model.addAttribute("tongTien", getTongGiaVN(tongTien));
		//return "user2/cart";
		return "user2/gio-hang";//test
	}
	@RequestMapping("preOrder")
	public String preOrder(ModelMap model) {
		int tongTien = 0;
		for (GioHangModel i : listGH) {
			tongTien = tongTien + i.getGia();
		}
		model.addAttribute("dSSP", listGH);
		model.addAttribute("tongTien", tongTien);
		GIOHANG phieuDatHang = new GIOHANG();
		phieuDatHang.setMaGioHang("");
		phieuDatHang.setHoTen(HomeController.tkKHHienTai.getKhachhang().getHo() + HomeController.tkKHHienTai.getKhachhang().getTen());
		phieuDatHang.setDiaChiNhan(HomeController.tkKHHienTai.getKhachhang().getDiaChi());
		phieuDatHang.setsDTNhan(HomeController.tkKHHienTai.getKhachhang().getSdt());
		millis = System.currentTimeMillis();
		java.util.Date dateDat = new java.util.Date(millis);
		Long dateGiao = dateDat.getTime() + 86400000 * 3;
		phieuDatHang.setNgayDat(dateDat);
		phieuDatHang.setNgayGiaoDuKien(new Date(dateGiao));
		model.addAttribute("phieuDatHang", phieuDatHang);
		model.addAttribute("taiKhoan", HomeController.tkKHHienTai);
		model.addAttribute("inputSearch", new InputSearchModel());
		//return "user2/info_theorder";
		return "user2/dat-hang";
	}

	public boolean insertGioHang(GIOHANG gH) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(gH);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			System.out.println(e);
			return false;
		} finally {
			session.close();
		}
		return true;
	}
	public boolean insertCTGH(CT_GH cTGH) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(cTGH);
			t.commit();
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}
	public GIOHANG getGioHang(String maGH) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM GIOHANG WHERE maGioHang = :ma");
		query.setParameter("ma", maGH);
		GIOHANG result = (GIOHANG) query.list().get(0);
		return result;
	}
	public void updateSoLuong (String maTS, int sLM) {
		Session session = factory.openSession();
		Query query = session.createQuery("UPDATE TRANGSUC ts SET ts.soLuongTon = :slm WHERE ts.maTS = :ma");
		query.setParameter("slm", sLM);
		query.setParameter("ma", maTS);
		query.executeUpdate();
	}
	@RequestMapping(value = "order", params = "btnSave")
	public String datHang(ModelMap model, @Valid @ModelAttribute("phieuDatHang") GIOHANG phieuDatHang,
			BindingResult errors) {
		/*if(errors.hasErrors()) {
			model.addAttribute("dSSP", listGH);
			return "webapp/giohang/dathang";
		}*/
		millis = System.currentTimeMillis();
		phieuDatHang.setMaGioHang(String.valueOf(new java.util.Date(millis)));
		phieuDatHang.setMaKH(HomeController.tkKHHienTai.getKhachhang());
		TRANGTHAIDONHANG tTGH = new TRANGTHAIDONHANG("TTGH01", "Vừa đặt hàng");
		phieuDatHang.setMaTrangThaiDonHang(tTGH);
		if(phieuDatHang.getHoTen().equals("")){
			phieuDatHang.setHoTen(null);
		}
		if(phieuDatHang.getDiaChiNhan().equals("")) {
			phieuDatHang.setDiaChiNhan(null);
		}
		if(phieuDatHang.getsDTNhan().equals("")) {
			phieuDatHang.setsDTNhan(null);
		}
		if(phieuDatHang.getEmailNhan().equals("")) {
			phieuDatHang.setEmailNhan(null);
		}
		GH = phieuDatHang;	
		boolean check = this.insertGioHang(phieuDatHang);
		String status = "";
		if (check == true) { 
			boolean check2 = true;
			for (GioHangModel i : listGH) {
				CT_GH ctgh = new CT_GH();
				ctgh.setSoLuong(i.getSoLuong());
				ctgh.setGia(i.getGia());
				ctgh.setMaTS(this.get1SP(i.getMaTS()));
				ctgh.setMaGioHang(GH);
				check2 = this.insertCTGH(ctgh);
			}
			if (check2 == true) {
				status = "success";
			} else {
				status = "fail";
			}
		} else {
			status = "fail";
		}
		if(status.equals("success")) {
			listGH = null;
			// Chỉnh số lượng tồn
			List<CT_GH> listCTGH = this.getGioHang(phieuDatHang.getMaGioHang()).getCtGhList();
			for (CT_GH ctgh : listCTGH) {
				String maTS = ctgh.getMaTS().getMaTS();
				int sLM = ctgh.getMaTS().getSoLuongTon() - ctgh.getSoLuong();
				this.updateSoLuong(maTS, sLM);
			}
			model.addAttribute("msg", "Đặt hàng thành công!");
			System.out.println("Đặt hàng thành công");
			return "redirect:/home/donhangchoxacnhan.htm";
		}
		return "redirect:/cart/preOrder.htm";//NHỚ COI LẠI
	}
	
}
