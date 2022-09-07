package ptithcm.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.CT_GH;
import ptithcm.entity.CT_KHUYENMAI;
import ptithcm.entity.GIOHANG;
import ptithcm.entity.HANGTRANGSUC;
import ptithcm.entity.HINHANH;
import ptithcm.entity.HOADON;
import ptithcm.entity.KHACHHANG;
import ptithcm.entity.KHUYENMAI;
import ptithcm.entity.LOAITRANGSUC;
import ptithcm.entity.NHACUNGCAP;
import ptithcm.entity.NHANVIEN;
import ptithcm.entity.QUYEN;
import ptithcm.entity.TAIKHOAN;
import ptithcm.entity.THAYDOIGIA;
import ptithcm.entity.TRANGSUC;
import ptithcm.entity.TRANGTHAIDONHANG;
import ptithcm.entity.TRANGTHAITAIKHOAN;
import ptithcm.model.GioHangModel;
import ptithcm.model.HoaDonModel;
import ptithcm.model.InputSearchModel;
import ptithcm.model.ThongKeModel;

@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminController {
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	TRANGSUC tsHienTai = null;
	int TongTien;
	long millis;
	List<HoaDonModel> LISTTHONGKE = new ArrayList<>();
	DateFormat dateFormat2 = new SimpleDateFormat("MM-yyyy");
	String NBD;
	String NKT;
	int TONG;
	@Autowired
	SessionFactory factory;
	public String getGiaVN(int gia) {
		// TODO Auto-generated method stub
		DecimalFormat formatter = new DecimalFormat("###,###,###");

		return formatter.format(gia)+" VNĐ";

	}
	@RequestMapping("/index")
	public String index() {
		return "admin/index";
	}
	
	//=============================QUẢN LÝ GIÁ========================================
	public boolean insertGia(THAYDOIGIA tdGia) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(tdGia);
			t.commit();
		} catch (Exception e) {
			//System.out.println(e);
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}
	public boolean deleteGia(THAYDOIGIA tdg) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(tdg);
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

	public THAYDOIGIA getTDG(int id) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM THAYDOIGIA where idThayDoi = :id");
		query.setParameter("id", id);
		THAYDOIGIA tdg = (THAYDOIGIA) query.list().get(0);
		return tdg;
	}
	@RequestMapping(value = "/{maTS}.htm", params = "linkPrice")
	public String DSGia(ModelMap model, @PathVariable("maTS") String maTS) {
		TRANGSUC trangSuc = this.getTrangSuc(maTS);
		tsHienTai = trangSuc;
		List<THAYDOIGIA> list=trangSuc.getThaydoigiaList();
		for (THAYDOIGIA thaydoigia : list) {
			System.out.println(thaydoigia.getMaTS());
		}
		model.addAttribute("danhsachgia", list);
		model.addAttribute("name", tsHienTai.getTenTS());
		return "admin/quan-li-san-pham/danh-sach-gia";
	}
	@RequestMapping(value = "themGia", method = RequestMethod.GET)
	public String themGia(ModelMap model) {
		model.addAttribute("giaTS", new THAYDOIGIA());
		return "admin/quan-li-san-pham/form-add-gia";
	}
	@RequestMapping("themGiaTS")
	public String insertGia(HttpServletRequest request, ModelMap model, @Validated @ModelAttribute("giaTS") THAYDOIGIA gia, BindingResult errors) throws ParseException {
		THAYDOIGIA tdg1 = new THAYDOIGIA();
		//String ngay = dateFormat.format(gia.getNgayApDung());
		tdg1.setNgayApDung(gia.getNgayApDung());
		tdg1.setMaTS(tsHienTai);
		tdg1.setMaNV(HomeController.tkNVHienTai.getNhanvien());
		tdg1.setGia(gia.getGia());
		boolean checkAdd = this.insertGia(tdg1);
		String msg = "";
		String url = "";
		if(checkAdd == true) {
			msg = "Thêm giá thành công!";
			url = "admin/danh-sach-gia";
			List<THAYDOIGIA> list=tsHienTai.getThaydoigiaList();
			for (THAYDOIGIA thaydoigia : list) {
				System.out.println(thaydoigia.getMaTS());
			}
			model.addAttribute("danhsachgia", list);
			return "redirect:/admin/"+tsHienTai.getMaTS()+".htm?linkPrice";
		}
		else {
			msg = "Thêm giá thất bại!";
			url = "admin/quan-li-san-pham/form-add-gia";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("name", tsHienTai.getTenTS());
		return url;
	}
	@RequestMapping(value = "/{id}.htm", params = "Delete")
	public String deleteGia(ModelMap model, @PathVariable("id") int id) {
		String msg = "";
		THAYDOIGIA tdg = this.getTDG(id);
		boolean checkDelete = this.deleteGia(tdg);
		if(checkDelete == true) {
			msg = "Xoá giá cho sản phẩm thành công!";
			return "redirect:/admin/"+tsHienTai.getMaTS()+".htm?linkPrice";
		} else msg = "Xoá giá cho sản phẩm thất bại";
		model.addAttribute("name", tsHienTai.getTenTS());
		return "";
	}
	
	//============================QUẢN LÝ HÌNH ẢNH=====================================
	public boolean insertHA(HINHANH hinhanh) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(hinhanh);
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
	public boolean deleteHA(HINHANH hinhanh) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(hinhanh);
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
	public HINHANH getHinhAnh(int id) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM HINHANH where maHA = :id");
		query.setParameter("id", id);
		HINHANH ha = (HINHANH) query.list().get(0);
		return ha;
	}
	public TRANGSUC getTrangSuc(String maTS) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM TRANGSUC where maTS = :ma");
		query.setParameter("ma", maTS);
		TRANGSUC trangSuc = (TRANGSUC) query.list().get(0);
		return trangSuc;
	}
	@RequestMapping(value = "/{maTS}.htm", params = "linkImage")
	public String index(ModelMap model, @PathVariable("maTS") String maTS) {
		TRANGSUC trangSuc = this.getTrangSuc(maTS);
		tsHienTai = trangSuc;
		List<HINHANH> dSHA = trangSuc.getHinhanhList();
		for (HINHANH i : dSHA) {
			System.out.println(i.getTenHA());
		}
		model.addAttribute("name", trangSuc.getTenTS());
		model.addAttribute("dSHinhAnh", dSHA);
		return "admin/quan-li-san-pham/danh-sach-hinh-anh";
	}
	@RequestMapping("/them")
	public String themHA(ModelMap model) {
		model.addAttribute("hinhAnh", new HINHANH());
		model.addAttribute("name", tsHienTai.getTenTS());
		return "admin/quan-li-san-pham/form-add-hinh-anh";
	}
	@RequestMapping("/themHinhAnh") 
	public String inserHinhAnh(ModelMap model, @Validated @ModelAttribute("hinhAnh") HINHANH hinhAnh, BindingResult errors) {
		String maTS = tsHienTai.getMaTS();
		hinhAnh.setMaTS(tsHienTai);
		boolean checkAdd = this.insertHA(hinhAnh);
		List<HINHANH> dSHA = this.getTrangSuc(maTS).getHinhanhList();
		for (HINHANH i : dSHA) {
			System.out.println(i.getTenHA());
		}
		model.addAttribute("dSHinhAnh", dSHA);
		model.addAttribute("name", hinhAnh.getMaTS().getTenTS());
		return "redirect:/admin/" + tsHienTai.getMaTS() +".htm?linkImage";
	}
	@RequestMapping(value = "/{maHA}.htm", params = "linkDeleteHinhAnh")
	public String deleteHA(ModelMap model, @PathVariable("maHA") int id) {
		HINHANH ha = this.getHinhAnh(id);
		boolean checkDelete = this.deleteHA(ha);
		TRANGSUC ts = ha.getMaTS();
		String maTS = ts.getMaTS();
		List<HINHANH> dSHA =  this.getTrangSuc(maTS).getHinhanhList();
		for (HINHANH i : dSHA) {
			System.out.println(i.getTenHA());
		}
		model.addAttribute("dSHinhAnh", dSHA);
		model.addAttribute("name", ha.getMaTS().getTenTS());
		return "redirect:/admin/" + tsHienTai.getMaTS() +".htm?linkImage";
	}
	//===========================QUẢN LÝ KHUYẾN MÃI===================================
	public boolean insertKM(KHUYENMAI km) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(km);
			t.commit();
		} catch (Exception e) {
			//System.out.println(e);
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}
	public boolean deleteKM(KHUYENMAI km) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(km);
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
	public KHUYENMAI getKhuyenMai(int id) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM KHUYENMAI where maKM = :id");
		query.setParameter("id", id);
		KHUYENMAI km = (KHUYENMAI) query.list().get(0);
		return km;
	}
	@RequestMapping(value = "/{maTS}.htm", params = "linkKM")
	public String indexKM(ModelMap model, @PathVariable("maTS") String maTS) {
		TRANGSUC trangSuc = this.getTrangSuc(maTS);
		tsHienTai = trangSuc;
		List<CT_KHUYENMAI> dSKM = trangSuc.getCtKhuyenmaiList();
		for (CT_KHUYENMAI i : dSKM) {
			System.out.println(i.getMaCTKM());
		}
		model.addAttribute("name", trangSuc.getTenTS());
		model.addAttribute("dSKhuyenMai", dSKM);
		return "admin/quan-li-san-pham/danh-sach-khuyen-mai";
	}
	@RequestMapping("/themKM")
	public String themKM(ModelMap model) {
		model.addAttribute("khuyenMai", new KHUYENMAI());
		model.addAttribute("name", tsHienTai.getTenTS());
		return "admin/quan-li-san-pham/form-add-khuyen-mai";
	}
	//===========================Quản lý đơn hàng======================================
	@RequestMapping("quan-li-don-hang")
	public String quanLiDonHang() {
		return "admin/quan-li-don-hang/quan-li-don-hang";
	}

	@RequestMapping("form-add-don-hang")
	public String themDH() {
		return "admin/quan-li-don-hang/form-add-don-hang";
	}
	public List<GIOHANG> getGioHangTheoTT(String maTT) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM TRANGTHAIDONHANG WHERE maTrangThaiDonHang = :ma");
		query.setParameter("ma", maTT);
		TRANGTHAIDONHANG trangThai = (TRANGTHAIDONHANG) query.list().get(0);
		List<GIOHANG> result = trangThai.getGioHang();
		return result;
	}
	@RequestMapping("choxacnhan")
	public String trangThaiChoXacNhan(HttpServletRequest request, ModelMap model) {
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH01");
//		for (GIOHANG giohang : result) {
//			System.out.println(giohang.getHoTen());
//		}
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() > result.get(j).getNgayDat().getTime()) {
					GIOHANG temp = result.get(i);
					result.set(i, result.get(j));
					result.set(j,  temp);
				}
			}
		}
		PagedListHolder pagedListHolder = new PagedListHolder(result);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
//		for (GIOHANG i : result) {
//			System.out.println(i.getHoTen());
//		}
		return "admin/quan-li-don-hang/trang-thai-cho-xac-nhan";
	}
	@RequestMapping("daxacnhan")
	public String trangthaiDaXacNhan(HttpServletRequest request, ModelMap model) {
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH02");
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() > result.get(j).getNgayDat().getTime()) {
					GIOHANG temp = result.get(i);
					result.set(i, result.get(j));
					result.set(j,  temp);
				}
			}
		}
		PagedListHolder pagedListHolder = new PagedListHolder(result);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/quan-li-don-hang/trang-thai-da-xac-nhan";
	}
	@RequestMapping("danggiao")
	public String trangThaiDangGiao(HttpServletRequest request, ModelMap model) {
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH03");
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() > result.get(j).getNgayDat().getTime()) {
					GIOHANG temp = result.get(i);
					result.set(i, result.get(j));
					result.set(j,  temp);
				}
			}
		}
		PagedListHolder pagedListHolder = new PagedListHolder(result);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/quan-li-don-hang/trang-thai-dang-giao";
	}
	@RequestMapping("danhan")
	public String trangthaiDaNhan(HttpServletRequest request, ModelMap model) {
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH04");
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() > result.get(j).getNgayDat().getTime()) {
					GIOHANG temp = result.get(i);
					result.set(i, result.get(j));
					result.set(j,  temp);
				}
			}
		}
		PagedListHolder pagedListHolder = new PagedListHolder(result);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/quan-li-don-hang/trang-thai-da-nhan";
	}
	@RequestMapping("dahuy")
	public String trangthaiDaHuy(HttpServletRequest request, ModelMap model) {
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH05");
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() > result.get(j).getNgayDat().getTime()) {
					GIOHANG temp = result.get(i);
					result.set(i, result.get(j));
					result.set(j,  temp);
				}
			}
		}
		PagedListHolder pagedListHolder = new PagedListHolder(result);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/quan-li-don-hang/trang-thai-da-huy";
	}
	public GIOHANG getGioHang(String maGH) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM GIOHANG WHERE maGioHang = :ma");
		query.setParameter("ma", maGH);
		GIOHANG result = (GIOHANG) query.list().get(0);
		return result;
	}
	@ModelAttribute("nhanvien")
	public List<NHANVIEN> getNhanVien() {
		Session session = factory.getCurrentSession();
		String hql = "FROM NHANVIEN";
		Query query = session.createQuery(hql);
		List<NHANVIEN> list = query.list();
		return list;
	}
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkChiTiet")
	public String xemThongTin(ModelMap model, @PathVariable("maGioHang") String maGH) {
		GIOHANG gioHang = this.getGioHang(maGH);
		List<CT_GH> listGH = gioHang.getCtGhList();
		List<GioHangModel> listSP = new ArrayList<GioHangModel>();
		for (CT_GH i : listGH) {
			GioHangModel gh  = new GioHangModel();
			gh.setTenHA(i.getMaTS().getHinhanhList().get(0).getTenHA());
			gh.setTenTS(i.getMaTS().getTenTS());
			gh.setGia((int)i.getGia());
			gh.setSoLuong(i.getSoLuong());
			listSP.add(gh);
		}
		int tongTien = 0;
		if (listSP != null) {
			for (GioHangModel i : listSP) {
				tongTien = tongTien + (int)i.getGia();
			}
		}
		TongTien = tongTien;
		String tongTienVND = this.getGiaVN(TongTien);
		model.addAttribute("dSSP", listSP);
		model.addAttribute("tongTien", tongTienVND);
		model.addAttribute("gioHang", gioHang);
		model.addAttribute("loaiTrang", "choXacNhan");
		model.addAttribute("name", "chờ xác nhận");
		return "admin/quan-li-don-hang/xem-chi-tiet";
	}
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkChiTietDaXacNhan")
	public String xemThongTinDaXacNhan(ModelMap model, @PathVariable("maGioHang") String maGH) {
		GIOHANG gioHang = this.getGioHang(maGH);
		List<CT_GH> listGH = gioHang.getCtGhList();
		List<GioHangModel> listSP = new ArrayList<GioHangModel>();
		for (CT_GH i : listGH) {
			GioHangModel gh  = new GioHangModel();
			gh.setTenHA(i.getMaTS().getHinhanhList().get(0).getTenHA());
			gh.setTenTS(i.getMaTS().getTenTS());
			gh.setGia((int)i.getGia());
			gh.setSoLuong(i.getSoLuong());
			listSP.add(gh);
		}
		int tongTien = 0;
		if (listSP != null) {
			for (GioHangModel i : listSP) {
				tongTien = tongTien + (int)i.getGia();
			}
		}
		TongTien = tongTien;
		String tongTienVND = this.getGiaVN(TongTien);
		model.addAttribute("dSSP", listSP);
		model.addAttribute("tongTien", tongTienVND);
		model.addAttribute("gioHang", gioHang);
		model.addAttribute("loaiTrang", "daXacNhan");
		model.addAttribute("name", "đã xác nhận");
		return "admin/quan-li-don-hang/xem-chi-tiet";
	}
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkChiTietDangGiao")
	public String xemThongTinDangGiao(ModelMap model, @PathVariable("maGioHang") String maGH) {
		GIOHANG gioHang = this.getGioHang(maGH);
		List<CT_GH> listGH = gioHang.getCtGhList();
		List<GioHangModel> listSP = new ArrayList<GioHangModel>();
		for (CT_GH i : listGH) {
			GioHangModel gh  = new GioHangModel();
			gh.setTenHA(i.getMaTS().getHinhanhList().get(0).getTenHA());
			gh.setTenTS(i.getMaTS().getTenTS());
			gh.setGia((int)i.getGia());
			gh.setSoLuong(i.getSoLuong());
			listSP.add(gh);
		}
		int tongTien = 0;
		if (listSP != null) {
			for (GioHangModel i : listSP) {
				tongTien = tongTien + (int)i.getGia();
			}
		}
		TongTien = tongTien;
		String tongTienVND = this.getGiaVN(TongTien);
		model.addAttribute("dSSP", listSP);
		model.addAttribute("tongTien", tongTienVND);
		model.addAttribute("gioHang", gioHang);
		model.addAttribute("loaiTrang", "dangGiao");
		model.addAttribute("name", "Đang Giao");
		return "admin/quan-li-don-hang/xem-chi-tiet";
	}
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkChiTietDaHuy")
	public String xemThongTinDaHuy(ModelMap model, @PathVariable("maGioHang") String maGH) {
		GIOHANG gioHang = this.getGioHang(maGH);
		List<CT_GH> listGH = gioHang.getCtGhList();
		List<GioHangModel> listSP = new ArrayList<GioHangModel>();
		for (CT_GH i : listGH) {
			GioHangModel gh  = new GioHangModel();
			gh.setTenHA(i.getMaTS().getHinhanhList().get(0).getTenHA());
			gh.setTenTS(i.getMaTS().getTenTS());
			gh.setGia((int)i.getGia());
			gh.setSoLuong(i.getSoLuong());
			listSP.add(gh);
		}
		int tongTien = 0;
		if (listSP != null) {
			for (GioHangModel i : listSP) {
				tongTien = tongTien + (int)i.getGia();
			}
		}
		TongTien = tongTien;
		String tongTienVND = this.getGiaVN(TongTien);
		model.addAttribute("dSSP", listSP);
		model.addAttribute("tongTien", tongTienVND);
		model.addAttribute("gioHang", gioHang);
		model.addAttribute("name", "Đã hủy");
		return "admin/quan-li-don-hang/xem-chi-tiet";
	}
	public boolean insertHoaDon(HOADON hD) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(hD);
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
	//================Chuyển số sang chữ=========================
	public static HashMap<String, String> hm_tien = new HashMap<String, String>() {
        {
            put("0", "không");
            put("1", "một");
            put("2", "hai");
            put("3", "ba");
            put("4", "bốn");
            put("5", "năm");
            put("6", "sáu");
            put("7", "bảy");
            put("8", "tám");
            put("9", "chín");
        }
    };
    public static HashMap<String, String> hm_hanh = new HashMap<String, String>() {
        {
            put("1", "đồng");
            put("2", "mươi");
            put("3", "trăm");
            put("4", "nghìn");
            put("5", "mươi");
            put("6", "trăm");
            put("7", "triệu");
            put("8", "mươi");
            put("9", "trăm");
            put("10", "tỷ");
            put("11", "mươi");
            put("12", "trăm");
            put("13", "nghìn");
            put("14", "mươi");
            put("15", "trăm");

        }
    };
	public static String ChuyenSangChu(String x) {
        StringBuilder kq = new StringBuilder();
        x = x.replace(".", "");
        String[] arr_temp = x.split(",");
        String m = arr_temp[0];
        int dem = m.length();
        String dau = "";
        int flag10 = 1;
        while (!m.equals("")) {
            if (m.length() <= 3 && m.length() > 1 && Long.parseLong(m) == 0) {

            } else {
                dau = m.substring(0, 1);
                if (dem % 3 == 1 && m.startsWith("1") && flag10 == 0) {
                    kq.append("mốt ");
                } else if (dem % 3 == 1 && m.startsWith("5") && flag10 == 0) {
                    kq.append("lăm ");
                } else if (dem % 3 == 2 && m.startsWith("1")) {
                    kq.append("mười ");
                    flag10 = 1;
                } else if (dem % 3 == 2 && m.startsWith("0") && m.charAt(1) != '0') {
                    //System.out.println("a  "+m.substring(1, 2));
                    kq.append("lẻ ");
                    flag10 = 1;
                } else {
                    if (!m.startsWith("0")) {
                        kq.append(hm_tien.get(dau)).append(" ");
                        flag10 = 0;
                    }
                }
                if (dem % 3 != 1 && m.startsWith("0")) {
                } else {
                    if (dem % 3 == 2 && (m.startsWith("1") || m.startsWith("0"))) {//mười
                    } else {
                        kq.append(hm_hanh.get(dem + "")).append(" ");
                    }
                }
            }
            m = m.substring(1);
            dem = m.length();
        }
        kq = new StringBuilder(kq.substring(0, kq.length() - 1));
        return kq.toString();
    }
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkXacNhan")
	public String xacNhanDonHang(HttpServletRequest request, ModelMap model, @PathVariable("maGioHang") String maGH) throws ParseException {
		Session session = factory.openSession();
		Query query = session.createQuery("UPDATE GIOHANG gh SET gh.maTrangThaiDonHang = 'TTGH02' WHERE gh.maGioHang = :ma");
		query.setParameter("ma", maGH);
		query.executeUpdate();
		
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH01");
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() > result.get(j).getNgayDat().getTime()) {
					GIOHANG temp = result.get(i);
					result.set(i, result.get(j));
					result.set(j,  temp);
				}
			}
		}
		
		//Lập hoá đơn
		HOADON hoaDon = new HOADON();
		millis = System.currentTimeMillis();
		hoaDon.setSoHoaDon(String.valueOf(new java.util.Date(millis)));
		hoaDon.setNgayTao(new java.util.Date(millis));
		hoaDon.setTongTien(TongTien);
		if(this.getGioHang(maGH).getMaKH().getMaSoThue() != null && !this.getGioHang(maGH).getMaKH().getMaSoThue().equals("")) {
			hoaDon.setMaSoThue(this.getGioHang(maGH).getMaKH().getMaSoThue());
		}
		hoaDon.setMaNV(HomeController.tkNVHienTai.getNhanvien());
		this.insertHoaDon(hoaDon);
		
		
		
		GIOHANG gHUpdate = this.getGioHang(maGH);
		gHUpdate.setMaNVDuyet(HomeController.tkNVHienTai.getNhanvien());
		gHUpdate.setSoHoaDon(hoaDon);
		
		PagedListHolder pagedListHolder = new PagedListHolder(result);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		for (GIOHANG i : result) {
			System.out.println(i.getHoTen());
		}
		
		GIOHANG gioHang = this.getGioHang(maGH);
		List<CT_GH> listGH = gioHang.getCtGhList();
		List<GioHangModel> listSP = new ArrayList<GioHangModel>();
		for (CT_GH i : listGH) {
			GioHangModel gh  = new GioHangModel();
			gh.setTenTS(i.getMaTS().getTenTS());
			gh.setGia((int)i.getGia());
			gh.setSoLuong(i.getSoLuong());
			listSP.add(gh);
		}
		int tongTien = 0;
		if (listSP != null) {
			for (GioHangModel i : listSP) {
				tongTien = tongTien + (int)i.getGia();
			}
		}
		model.addAttribute("gioHang", gHUpdate);
		model.addAttribute("nhanVien", HomeController.tkNVHienTai.getNhanvien());
		model.addAttribute("hoaDon", hoaDon);
		model.addAttribute("ngayTao", dateFormat.format(hoaDon.getNgayTao()));
		model.addAttribute("msg", "Xác nhận đơn hàng thành công!");
		model.addAttribute("dSSP", listSP);
		model.addAttribute("tongTien", tongTien);
		model.addAttribute("tienChu", ChuyenSangChu(String.valueOf(tongTien)));
		return "admin/quan-li-don-hang/trang-thai-cho-xac-nhan";
	}
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkGiao")
	public String xacNhanGiaoDonHang(HttpServletRequest request, ModelMap model, @PathVariable("maGioHang") String maGH){
		Session session = factory.openSession();
		Query query = session.createQuery("UPDATE GIOHANG gh SET gh.maTrangThaiDonHang = 'TTGH03' WHERE gh.maGioHang = :ma");
		query.setParameter("ma", maGH);
		query.executeUpdate();
		
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH02");
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() > result.get(j).getNgayDat().getTime()) {
					GIOHANG temp = result.get(i);
					result.set(i, result.get(j));
					result.set(j,  temp);
				}
			}
		}
		//Nhân viên giao 
		String maNVGiao = request.getParameter("nhanVienGiao");
		System.out.println(maNVGiao+"Mã nhân viên giao");
		
		//GIOHANG gHUpdate = this.getGioHang(maGH);
		//gHUpdate.setMaNVGiao(this.getNhanVien(maNVGiao));//
		PagedListHolder pagedListHolder = new PagedListHolder(result);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		for (GIOHANG i : result) {
			System.out.println(i.getHoTen());
		}
		model.addAttribute("msg", "Xác nhận đơn hàng thành công!");
		return "admin/quan-li-don-hang/trang-thai-dang-giao";
	}
	public void congLuotMua(String maTS, int lMHT) {
		int lmm = lMHT + 1;
		Session session = factory.openSession();
		Query query = session.createQuery("UPDATE TRANGSUC ts SET ts.luotMua = :lmm WHERE ts.maTS = :ma");
		query.setParameter("lmm", lmm);
		query.setParameter("ma", maTS);
		query.executeUpdate();
	}
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkDaGiao")
	public String xacNhanDaGiaoDonHang(HttpServletRequest request, ModelMap model, @PathVariable("maGioHang") String maGH) {
		Session session = factory.openSession();
		Query query = session.createQuery("UPDATE GIOHANG gh SET gh.maTrangThaiDonHang = 'TTGH04' WHERE gh.maGioHang = :ma");
		query.setParameter("ma", maGH);
		query.executeUpdate();
		
		//cộng lượt mua
		List<CT_GH> listCTGH = this.getGioHang(maGH).getCtGhList();
		for (CT_GH ctgh : listCTGH) {
			String maSVC = ctgh.getMaTS().getMaTS();
			int lMHT = ctgh.getMaTS().getLuotMua();
			this.congLuotMua(maSVC, lMHT);
		}
		
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH03");
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() > result.get(j).getNgayDat().getTime()) {
					GIOHANG temp = result.get(i);
					result.set(i, result.get(j));
					result.set(j,  temp);
				}
			}
		}
		PagedListHolder pagedListHolder = new PagedListHolder(result);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		for (GIOHANG i : result) {
			System.out.println(i.getHoTen());
		}
		model.addAttribute("msg", "Xác nhận đã giao đơn hàng thành công!");
		return "admin/quan-li-don-hang/trang-thai-dang-giao";
	}
	public void updateSoLuong (String maTS, int sLM) {
		Session session = factory.openSession();
		Query query = session.createQuery("UPDATE TRANGSUC ts SET ts.soLuongTon = :slm WHERE ts.maTS = :ma");
		query.setParameter("slm", sLM);
		query.setParameter("ma", maTS);
		query.executeUpdate();
	}
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkHuy")
	public String huyDonHang(HttpServletRequest request, ModelMap model, @PathVariable("maGioHang") String maGH) {
		Session session = factory.openSession();
		Query query = session.createQuery("UPDATE GIOHANG gh SET gh.maTrangThaiDonHang = 'TTGH05' WHERE gh.maGioHang = :ma");
		query.setParameter("ma", maGH);
		query.executeUpdate();
		// Chỉnh số lượng tồn
		List<CT_GH> listCTGH = this.getGioHang(maGH).getCtGhList();
		for (CT_GH ctgh : listCTGH) {
			String maTS = ctgh.getMaTS().getMaTS();
			int sLM = ctgh.getMaTS().getSoLuongTon() + ctgh.getSoLuong();
			this.updateSoLuong(maTS, sLM);
		}
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH01");
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() > result.get(j).getNgayDat().getTime()) {
					GIOHANG temp = result.get(i);
					result.set(i, result.get(j));
					result.set(j,  temp);
				}
			}
		}
		PagedListHolder pagedListHolder = new PagedListHolder(result);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		for (GIOHANG i : result) {
			System.out.println(i.getHoTen());
		}
		model.addAttribute("msg", "Huỷ đơn hàng thành công!");
		return "admin/quan-li-don-hang/trang-thai-cho-xac-nhan";
	}
	//===============XEM HOA DON===========================
	
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkHoaDon")
	public String xemThongTinHoaDon(ModelMap model, @PathVariable("maGioHang") String maGH) {
		GIOHANG gioHang = this.getGioHang(maGH);
		HOADON hoadon = gioHang.getSoHoaDon();
		HoaDonModel hoaDon2 = new HoaDonModel();
		List<CT_GH> listGH = gioHang.getCtGhList();
		List<GioHangModel> listSP = new ArrayList<GioHangModel>();
		for (CT_GH i : listGH) {
			GioHangModel gh  = new GioHangModel();
			gh.setTenTS(i.getMaTS().getTenTS());
			gh.setGia((int)i.getGia());
			gh.setSoLuong(i.getSoLuong());
			listSP.add(gh);
		}
		int tongTien = 0;
		if (listSP != null) {
			for (GioHangModel i : listSP) {
				tongTien = tongTien + (int)i.getGia();
			}
		}
		String tongTienVND = this.getGiaVN(tongTien);
		hoaDon2.setNgayTao2(dateFormat.format(hoadon.getNgayTao()));
		//hoaDon2.setNgayTaoTN(ngayTaoTN);
		hoaDon2.setSoHoaDon(hoadon.getSoHoaDon());
		hoaDon2.setNhanVienLap(HomeController.tkNVHienTai.getNhanvien().getHo()+" "+HomeController.tkNVHienTai.getNhanvien().getTen());
		hoaDon2.setTenKH(gioHang.getMaKH().getHo()+" "+gioHang.getMaKH().getTen());
		hoaDon2.setTongTien(tongTien);
		model.addAttribute("dSSP", listSP);
		model.addAttribute("tongTien", tongTienVND);
		model.addAttribute("xemHoaDon", hoaDon2);
		model.addAttribute("tienChu", ChuyenSangChu(String.valueOf(tongTien)));
		return "admin/quan-li-don-hang/xem-chi-tiet-hoa-don";
	}
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkHoaDonKH")
	public String xemThongTinHoaDonKH(ModelMap model, @PathVariable("maGioHang") String maGH) {
		GIOHANG gioHang = this.getGioHang(maGH);
		HOADON hoadon = gioHang.getSoHoaDon();
		HoaDonModel hoaDon2 = new HoaDonModel();
		List<CT_GH> listGH = gioHang.getCtGhList();
		List<GioHangModel> listSP = new ArrayList<GioHangModel>();
		for (CT_GH i : listGH) {
			GioHangModel gh  = new GioHangModel();
			gh.setTenTS(i.getMaTS().getTenTS());
			gh.setGia((int)i.getGia());
			gh.setSoLuong(i.getSoLuong());
			listSP.add(gh);
		}
		int tongTien = 0;
		if (listSP != null) {
			for (GioHangModel i : listSP) {
				tongTien = tongTien + (int)i.getGia();
			}
		}
		String tongTienVND = this.getGiaVN(tongTien);
		hoaDon2.setNgayTao2(dateFormat.format(hoadon.getNgayTao()));
		//hoaDon2.setNgayTaoTN(ngayTaoTN);
		hoaDon2.setSoHoaDon(hoadon.getSoHoaDon());
		hoaDon2.setNhanVienLap(HomeController.tkNVHienTai.getNhanvien().getHo()+" "+HomeController.tkNVHienTai.getNhanvien().getTen());
		hoaDon2.setTenKH(gioHang.getMaKH().getHo()+" "+gioHang.getMaKH().getTen());
		hoaDon2.setTongTien(tongTien);
		model.addAttribute("dSSP", listSP);
		model.addAttribute("tongTien", tongTienVND);
		model.addAttribute("xemHoaDon", hoaDon2);
		model.addAttribute("tienChu", ChuyenSangChu(String.valueOf(tongTien)));
		return "user2/don-hang-cua-toi/xem-chi-tiet-hoa-don-KH";
	}
	//==============Quan-li-doanh-thu==========================
	@RequestMapping("quan-li-doanh-thu")
	public String quanLiDoanhThu(ModelMap model) {
		model.addAttribute("thongKe", new ThongKeModel());
		return "admin/quan-li-bao-cao/quan-li-bao-cao";
	}
	List<HOADON> getSoLieu(Date ngayBD, Date ngayKT) {
		List<HOADON> data = null;
		Session session = factory.getCurrentSession();
		String hql = "from HOADON where ngayTao >= :ngayBD and ngayTao <= :ngayKT order by ngayTao";
		Query query = session.createQuery(hql);
		query.setParameter("ngayBD", ngayBD);
		query.setParameter("ngayKT", ngayKT);
		data = query.list();
		return data;
	}
	@RequestMapping("/laysolieu")
	public String laySoLieu(ModelMap model, @ModelAttribute("thongKe") ThongKeModel thongKe) throws ParseException {
		String bd = dateFormat.format(thongKe.getNgayBD());
		String kt = dateFormat.format(thongKe.getNgayKT());
		List<HOADON> listHD = this.getSoLieu(dateFormat.parse(bd), dateFormat.parse(kt));
		List<HoaDonModel> listTemp = new ArrayList<HoaDonModel>();
		int dem = 0;
		for(int i = 0; i < listHD.size(); i++) {
			if(i==0) {
				HoaDonModel hd = new HoaDonModel(listHD.get(i).getNgayTao(), (int)listHD.get(i).getTongTien());
				listTemp.add(hd);
			} else if(listTemp.get(dem).getNgayTao().toString().substring(0, 7).equals(listHD.get(i).getNgayTao().toString().substring(0, 7))) {
				listTemp.get(dem).setTongTien(listTemp.get(dem).getTongTien() + (int)listHD.get(i).getTongTien());
			} else {
				HoaDonModel hd = new HoaDonModel(listHD.get(i).getNgayTao(), (int)listHD.get(i).getTongTien());
				listTemp.add(hd);
				dem ++;
			}
		}
		LISTTHONGKE = listTemp;
		int tong = 0;
		for (HoaDonModel i : listTemp) {
			//System.out.println(dateFormat2.format(i.getNgayTao()) + " " + i.getTongTien());
			tong = tong + i.getTongTien();
			String thangNam = dateFormat2.format(i.getNgayTao());
			i.setNgayTaoTN(thangNam);
		} 
		NBD = bd;
		NKT = kt;
		TONG = tong;
		String tongTienVND = this.getGiaVN(TONG);
		model.addAttribute("nbd", bd);
		model.addAttribute("nkt", kt);
		model.addAttribute("thongKe", new ThongKeModel());
		model.addAttribute("kq", "kq");
		model.addAttribute("listKQ", listTemp);
		model.addAttribute("tong", tongTienVND);
		return "admin/quan-li-bao-cao/quan-li-bao-cao";
	}
	//Xuất file excel
	/*@RequestMapping(value = "/exportCSV", method = RequestMethod.GET)
    public String exportCsv(ModelMap model, HttpServletResponse servletResponse) throws IOException {
        servletResponse.setContentType("text/csv");
        servletResponse.addHeader("Content-Disposition","attachment; filename=\"export-csv.csv\"");
        List<String> header = new ArrayList<>();
        header.add("THONG KE");
        CSVPrinter csvPrinter1 = new CSVPrinter(servletResponse.getWriter(), CSVFormat.DEFAULT.withHeader(header.toArray(new String[0])));
        header = new ArrayList<>();
        header.addAll(Arrays.asList("Ngay bat dau: ", NBD));
        csvPrinter1 = new CSVPrinter(servletResponse.getWriter(), CSVFormat.DEFAULT.withHeader(header.toArray(new String[0])));
        header = new ArrayList<>();
        header.addAll(Arrays.asList("Ngay ket thuc: ", NKT));
        csvPrinter1 = new CSVPrinter(servletResponse.getWriter(), CSVFormat.DEFAULT.withHeader(header.toArray(new String[0])));
        header = new ArrayList<>();
        header.addAll(Arrays.asList("Thoi gian (Thang - Nam)", "Doanh thu (VND)"));
        csvPrinter1 = new CSVPrinter(servletResponse.getWriter(), CSVFormat.DEFAULT.withHeader(header.toArray(new String[0])));
        try (CSVPrinter csvPrinter = new CSVPrinter(servletResponse.getWriter(), CSVFormat.DEFAULT)) {
            for (HoaDonModel h : LISTTHONGKE) {
                csvPrinter.printRecord(h.getNgayTaoTN(), h.getTongTien());
            }
            csvPrinter.printRecord("TONG CONG: ", TONG+"");
        } catch (IOException e) {
            System.out.println(e + "abc");
        }
        csvPrinter1.flush();
        csvPrinter1.close();
        model.addAttribute("thongKe", new ThongKeModel());
        return  "admin/quan-li-bao-cao/quan-li-bao-cao";
    }*/
	DateFormat df1 = new SimpleDateFormat("dd");
	DateFormat df2 = new SimpleDateFormat("MM");
	DateFormat df3 = new SimpleDateFormat("yyyy");
	@RequestMapping(value = "/exportCSV", method = RequestMethod.GET)
	public String exportCsv(ModelMap model, HttpServletResponse servletResponse) throws IOException {
    	Date now = new Date();
		servletResponse.setContentType("text/csv");
		servletResponse.addHeader("Content-Disposition", "attachment; filename=\"export-csv.csv\"");
		try (CSVPrinter csvPrinter = new CSVPrinter(servletResponse.getWriter(), CSVFormat.EXCEL.withHeader("\ufeff"))) {
			csvPrinter.printRecord("=====THONG KE DOANH THU=====");
			csvPrinter.printRecord("Cửa hàng Vivian JEWELS");
			csvPrinter.printRecord("Ngày bắt đầu: ", NBD);
			csvPrinter.printRecord("Ngày kết thúc: ", NKT);
			csvPrinter.printRecord("Nhân viên lập: ", HomeController.tkNVHienTai.getNhanvien().getHo() + " " + HomeController.tkNVHienTai.getNhanvien().getTen());
			csvPrinter.printRecord("Thời gian (Thang - Nam)", "Doanh thu");
			for (HoaDonModel h : LISTTHONGKE) {
				csvPrinter.printRecord(dateFormat2.format(h.getNgayTao()), h.getTongTien()+" VND");
			}
			csvPrinter.printRecord("TỔNG CỘNG: ", TONG + " VND");
			csvPrinter.printRecord("TP HCM, ngày " + df1.format(now) + " tháng " + df2.format(now) + " năm " + df3.format(now));
			csvPrinter.flush();
			csvPrinter.close();
		} catch (IOException e) {
			System.out.println(e + "abc");
		}
		model.addAttribute("thongKe", new ThongKeModel());
		return "admin/quan-li-bao-cao/quan-li-bao-cao";
	}
}
