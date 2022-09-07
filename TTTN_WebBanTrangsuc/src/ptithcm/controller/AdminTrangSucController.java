package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import ptithcm.entity.HANGTRANGSUC;
import ptithcm.entity.LOAITRANGSUC;
import ptithcm.entity.NHACUNGCAP;
import ptithcm.entity.TRANGSUC;

@Transactional
@Controller
@RequestMapping("/adminTS/")
public class AdminTrangSucController {
	@Autowired
	SessionFactory factory;

	public boolean insertLoaiTS(LOAITRANGSUC loaiTS) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(loaiTS);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public boolean updateLoaiTS(LOAITRANGSUC loaiTS) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(loaiTS);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public boolean deleteLoaiTS(LOAITRANGSUC loaiTS) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(loaiTS);
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

	// ====================LOAI TRANG SUC=============================
	public LOAITRANGSUC getloaiTS(String maLoai) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM LOAITRANGSUC where maLoai = :ma");
		query.setParameter("ma", maLoai);
		LOAITRANGSUC loaiTS = (LOAITRANGSUC) query.list().get(0);
		return loaiTS;
	}

	// danh sách loại trang sức
	@ModelAttribute("loaitrangsuc")
	public List<LOAITRANGSUC> getDSloaitrangsuc() {
		Session session = factory.getCurrentSession();
		String hql = "FROM LOAITRANGSUC";
		Query query = session.createQuery(hql);
		List<LOAITRANGSUC> list = query.list();
		return list;
	}

	@RequestMapping(value = "quan-li-loai-trang-suc", method = RequestMethod.GET)
	public String quanLiLoaiTrangSuc(ModelMap model, HttpServletRequest request) {
		PagedListHolder pagedListHolder = new PagedListHolder(this.getDSloaitrangsuc());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("loaiTS", new LOAITRANGSUC());
		return "admin/quan-li-loai-trang-suc/quan-li-loai-trang-suc";
	}

	@RequestMapping(value = "form-add-loai-trang-suc", method = RequestMethod.GET)
	public String themLoaiTrangSuc(ModelMap model) {
		model.addAttribute("loaiTS", new LOAITRANGSUC());
		return "admin/quan-li-loai-trang-suc/form-add-loai-trang-suc";
	}

	@RequestMapping("themLoaiTrangSuc")
	public String themLoaiTrangSuc(HttpServletRequest request, ModelMap model,
			@Validated @ModelAttribute("loaiTS") LOAITRANGSUC loaiTS, BindingResult errors) {
		boolean checkAdd = this.insertLoaiTS(loaiTS);
		String msg = "";
		String url = "";
		if (checkAdd == true) {
			msg = "Thêm loại trang sức thành công!";
			url = "admin/quan-li-loai-trang-suc/quan-li-loai-trang-suc";
			PagedListHolder pagedListHolder = new PagedListHolder(this.getDSloaitrangsuc());
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setMaxLinkedPages(5);
			pagedListHolder.setPageSize(10);
			model.addAttribute("pagedListHolder", pagedListHolder);
		} else {
			msg = "Thêm loại trang sức thất bại!";
			url = "admin/quan-li-loai-trang-suc/form-add-loai-trang-suc";
		}
		model.addAttribute("msg", msg);
		return url;
	}

	@RequestMapping(value = "/{maLoai}.htm", params = "linkEdit")
	public String suaLoaiTS(ModelMap model, @PathVariable("maLoai") String maLoai) {
		model.addAttribute("loaiTS", this.getloaiTS(maLoai));
		return "admin/quan-li-loai-trang-suc/form-sua-loai-trang-suc";
	}

	@RequestMapping("sualoaitrangsuc")
	public String suaLoaiTrangSuc(HttpServletRequest request, ModelMap model,
			@Validated @ModelAttribute("loaiTS") LOAITRANGSUC loaiTS, BindingResult errors) {
		boolean checkUpdate = this.updateLoaiTS(loaiTS);
		String msg = "";
		String url = "";
		if (checkUpdate == true) {
			msg = "Chỉnh sửa thông tin loại trang sức thành công!";
			model.addAttribute("loaiTS", this.getloaiTS(loaiTS.getMaLoai()));

			url = "admin/quan-li-loai-trang-suc/quan-li-loai-trang-suc";
			PagedListHolder pagedListHolder = new PagedListHolder(this.getDSloaitrangsuc());
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setMaxLinkedPages(5);
			pagedListHolder.setPageSize(10);
			model.addAttribute("pagedListHolder", pagedListHolder);
		} else {
			msg = "Chỉnh sửa thông tin loại trang sức thất bại!";
			url = "admin/quan-li-loai-trang-suc/form-sua-loai-trang-suc";
		}
		model.addAttribute("msg", msg);
		return url;
	}

	@RequestMapping(value = "/{maLoai}.htm", params = "linkDeleteLoaiTS")
	public String xoaLoaiTrangSuc(HttpServletRequest request, ModelMap model, @PathVariable("maLoai") String maLoai) {
		LOAITRANGSUC loai = this.getloaiTS(maLoai);
		boolean checkDelete = this.deleteLoaiTS(loai);
		String msg = "";
		if (checkDelete == true) {
			msg = "Xoá loại trang sức thành công!";
		} else
			msg = "Xoá loại trang sức thất bại, đã xảy ra lỗi!";
		PagedListHolder pagedListHolder = new PagedListHolder(this.getDSloaitrangsuc());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("msg", msg);
		return "admin/quan-li-loai-trang-suc/quan-li-loai-trang-suc";
	}

	// ====================HANG TRANG SUC=============================
	public boolean insertHangTS(HANGTRANGSUC hangTS) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(hangTS);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public boolean updateHangTS(HANGTRANGSUC hangTS) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(hangTS);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public boolean deleteHangTS(HANGTRANGSUC hangTS) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(hangTS);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public HANGTRANGSUC getHangTS(String maHang) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM HANGTRANGSUC where maHang = :ma");
		query.setParameter("ma", maHang);
		HANGTRANGSUC hangTS = (HANGTRANGSUC) query.list().get(0);
		return hangTS;
	}

	// danh sách hãng trang sức
	@ModelAttribute("hangtrangsuc")
	public List<HANGTRANGSUC> getDSHangtrangsuc() {
		Session session = factory.getCurrentSession();
		String hql = "FROM HANGTRANGSUC";
		Query query = session.createQuery(hql);
		List<HANGTRANGSUC> list = query.list();
		return list;
	}

	@RequestMapping(value = "quan-li-hang-trang-suc", method = RequestMethod.GET)
	public String quanLiHangTrangSuc(ModelMap model, HttpServletRequest request) {
		PagedListHolder pagedListHolder = new PagedListHolder(this.getDSHangtrangsuc());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("hangTS", new HANGTRANGSUC());
		return "admin/quan-li-hang-trang-suc/quan-li-hang-trang-suc";
	}

	@RequestMapping(value = "form-add-hang-trang-suc", method = RequestMethod.GET)
	public String themHangTrangSuc(ModelMap model) {
		model.addAttribute("hangTS", new HANGTRANGSUC());
		return "admin/quan-li-hang-trang-suc/form-add-hang-trang-suc";
	}

	@RequestMapping("themHangTrangSuc")
	public String themHangTrangSuc(HttpServletRequest request, ModelMap model,
			@Validated @ModelAttribute("hangTS") HANGTRANGSUC hangTS, BindingResult errors) {
		boolean checkAdd = this.insertHangTS(hangTS);
		String msg = "";
		String url = "";
		if (checkAdd == true) {
			msg = "Thêm hãng trang sức thành công!";
			url = "admin/quan-li-hang-trang-suc/quan-li-hang-trang-suc";
			PagedListHolder pagedListHolder = new PagedListHolder(this.getDSHangtrangsuc());
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setMaxLinkedPages(5);
			pagedListHolder.setPageSize(10);
			model.addAttribute("pagedListHolder", pagedListHolder);
		} else {
			msg = "Thêm hang trang sức thất bại!";
			url = "admin/quan-li-hang-trang-suc/form-add-hang-trang-suc";
		}
		model.addAttribute("msg", msg);
		return url;
	}

	@RequestMapping(value = "/{maHang}.htm", params = "linkEditHangTS")
	public String suaHangTS(ModelMap model, @PathVariable("maHang") String maHang) {
		model.addAttribute("hangTS", this.getHangTS(maHang));
		return "admin/quan-li-hang-trang-suc/form-sua-hang-trang-suc";
	}

	@RequestMapping("suahangtrangsuc")
	public String suaHangTrangSuc(HttpServletRequest request, ModelMap model,
			@Validated @ModelAttribute("hangTS") HANGTRANGSUC hangTS, BindingResult errors) {
		boolean checkUpdate = this.updateHangTS(hangTS);
		String msg = "";
		String url = "";
		if (checkUpdate == true) {
			msg = "Chỉnh sửa thông tin hãng trang sức thành công!";
			model.addAttribute("hangTS", this.getHangTS(hangTS.getMaHang()));
			url = "admin/quan-li-hang-trang-suc";
			PagedListHolder pagedListHolder = new PagedListHolder(this.getDSHangtrangsuc());
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setMaxLinkedPages(5);
			pagedListHolder.setPageSize(10);
			model.addAttribute("pagedListHolder", pagedListHolder);
		} else {
			msg = "Chỉnh sửa thông tin hãng trang sức thất bại!";
			url = "admin/quan-li-hang-trang-suc/form-sua-hang-trang-suc";
		}
		model.addAttribute("msg", msg);
		return url;
	}

	@RequestMapping(value = "/{maHang}.htm", params = "linkDeleteHangTS")
	public String xoaHangTrangSuc(HttpServletRequest request, ModelMap model, @PathVariable("maHang") String maHang) {
		HANGTRANGSUC hang = this.getHangTS(maHang);
		boolean checkDelete = this.deleteHangTS(hang);
		String msg = "";
		if (checkDelete == true) {
			msg = "Xoá hãng trang sức thành công!";
		} else
			msg = "Xoá hãng trang sức thất bại, đã xảy ra lỗi!";
		PagedListHolder pagedListHolder = new PagedListHolder(this.getDSHangtrangsuc());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("msg", msg);
		return "admin/quan-li-hang-trang-suc/quan-li-hang-trang-suc";
	}

	// =========================QUAN LY KHUYEN MAI=================================
	@RequestMapping("form-add-khuyen-mai")
	public String tempView() {

		return "admin/quan-li-san-pham/form-add-khuyen-mai";
	}

	// =================QUẢN LÝ SẢN PHẨM==============================================
	public boolean insertTS(TRANGSUC ts) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(ts);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public boolean updateTS(TRANGSUC ts) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(ts);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public boolean deleteTS(TRANGSUC ts) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(ts);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	// ==========================Load combobox add trang sức=============================
	@ModelAttribute("trangthaisanpham")
	public List<String> getTenTrangThai() {
		List<String> DSTT = new ArrayList<>();
		DSTT.add("Còn hàng");
		DSTT.add("Đang nhập hàng");
		DSTT.add("Hết hàng");
		return DSTT;
	}

/*	@ModelAttribute("hangtrangsuc")
	public List<HANGTRANGSUC> getDSHangtrangsuc() {
		Session session = factory.getCurrentSession();
		String hql = "FROM HANGTRANGSUC";
		Query query = session.createQuery(hql);
		List<HANGTRANGSUC> list = query.list();
		return list;
	}

	@ModelAttribute("loaitrangsuc")
	public List<LOAITRANGSUC> getDSloaitrangsuc() {
		Session session = factory.getCurrentSession();
		String hql = "FROM LOAITRANGSUC";
		Query query = session.createQuery(hql);
		List<LOAITRANGSUC> list = query.list();
		return list;
	}*/

	@ModelAttribute("nhacungcap")
	public List<NHACUNGCAP> getDSNhaCungCap() {
		Session session = factory.getCurrentSession();
		String hql = "FROM NHACUNGCAP";
		Query query = session.createQuery(hql);
		List<NHACUNGCAP> list = query.list();
		return list;
	}
	public TRANGSUC getTrangSuc(String maTS) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM TRANGSUC where maTS = :ma");
		query.setParameter("ma", maTS);
		TRANGSUC trangSuc = (TRANGSUC) query.list().get(0);
		return trangSuc;
	}
	public List<TRANGSUC> getDSTrangSuc() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM TRANGSUC");
		List<TRANGSUC> result = query.list();
		return result;
	}
	@RequestMapping(value = "quan-li-san-pham", method = RequestMethod.GET)
	public String quanLiSanPham(ModelMap model, HttpServletRequest request) {
		PagedListHolder pagedListHolder = new PagedListHolder(this.getDSTrangSuc());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("trangSuc", new TRANGSUC());
		return "admin/quan-li-san-pham/quan-li-san-pham";
	}
	@RequestMapping(value = "form-add-san-pham", method = RequestMethod.GET)
	public String themTrangSuc(ModelMap model) {
		model.addAttribute("trangsuc", new TRANGSUC());
		return "admin/quan-li-san-pham/form-add-san-pham";
	}
	@RequestMapping("themTrangSuc")
	public String themTrangSuc(HttpServletRequest request, ModelMap model,
			@Validated @ModelAttribute("trangsuc") TRANGSUC ts, BindingResult errors) {
/*		boolean check = false;
		if (ts.getTenTS().equals("")) {

			errors.rejectValue("tenTS", "trangsuc", "Vui lòng nhập tên trang sức");
			check = true;
		}
		if (ts.getSoLuongTon() < 0) {
			errors.rejectValue("soLuongTon", "trangsuc", "Số lượng phải lớn hơn 0");
			check = true;
		}*/

		
		boolean checkAdd = this.insertTS(ts);
		String msg = "";
		String url = "";
		if (checkAdd == true) {
			msg = "Thêm trang sức thành công!";
			url = "admin/quan-li-san-pham/quan-li-san-pham";
			PagedListHolder pagedListHolder = new PagedListHolder(this.getDSTrangSuc());
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setMaxLinkedPages(5);
			pagedListHolder.setPageSize(10);
			model.addAttribute("pagedListHolder", pagedListHolder);
		} else {
			msg = "Thêm trang sức thất bại!";
			url = "admin/quan-li-san-pham/form-add-san-pham";
		}
		model.addAttribute("msg", msg);
		return url;
	}
	@RequestMapping(value = "/{maTS}.htm", params = "linkEditTS")
	public String suaTS(ModelMap model, @PathVariable("maTS") String maTS) {
		model.addAttribute("trangsuc", this.getTrangSuc(maTS));
		return "admin/quan-li-san-pham/form-sua-trang-suc";
	}

	@RequestMapping("suatrangsuc")
	public String suaTrangSuc(HttpServletRequest request, ModelMap model,
			@Validated @ModelAttribute("trangsuc") TRANGSUC trangsuc, BindingResult errors) {
		boolean checkUpdate = this.updateTS(trangsuc);
		String msg = "";
		String url = "";
		if (checkUpdate == true) {
			msg = "Chỉnh sửa thông tin trang sức thành công!";
			model.addAttribute("trangsuc", this.getTrangSuc(trangsuc.getMaTS()));
			url = "admin/quan-li-san-pham";
			PagedListHolder pagedListHolder = new PagedListHolder(this.getDSHangtrangsuc());
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setMaxLinkedPages(5);
			pagedListHolder.setPageSize(10);
			model.addAttribute("pagedListHolder", pagedListHolder);
		} else {
			msg = "Chỉnh sửa thông tin trang sức thất bại!";
			url = "admin/quan-li-san-pham/form-sua-trang-suc";
		}
		model.addAttribute("msg", msg);
		return url;
	}
}
