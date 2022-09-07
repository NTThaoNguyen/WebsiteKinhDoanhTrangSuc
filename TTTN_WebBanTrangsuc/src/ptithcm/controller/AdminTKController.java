package ptithcm.controller;

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

import ptithcm.entity.KHACHHANG;
import ptithcm.entity.NHANVIEN;
import ptithcm.entity.QUYEN;
import ptithcm.entity.TAIKHOAN;
import ptithcm.entity.TRANGTHAITAIKHOAN;

@Transactional
@Controller
@RequestMapping("/adminTK/")
public class AdminTKController {
	// ========== QUẢN LÝ NHÂN VIÊN===========================
	@Autowired
	SessionFactory factory;
	public boolean insertNV(NHANVIEN nv) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(nv);
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

	public boolean updateNV(NHANVIEN nv) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(nv);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public boolean deleteNV(NHANVIEN nv) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(nv);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}
	public NHANVIEN getNhanVien(String maNV) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM NHANVIEN where maNV = :ma");
		query.setParameter("ma", maNV);
		NHANVIEN nhanVien = (NHANVIEN) query.list().get(0);
		return nhanVien;
	}

	public List<NHANVIEN> getDSNhanVien() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM NHANVIEN");
		List<NHANVIEN> result = query.list();
		return result;
	}

	@RequestMapping(value = "quan-li-nhan-vien", method = RequestMethod.GET)
	public String quanLiNhanVien(ModelMap model, HttpServletRequest request) {
		PagedListHolder pagedListHolder = new PagedListHolder(this.getDSNhanVien());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("user", new NHANVIEN());
		return "admin/quan-li-nhan-vien/quan-li-nhan-vien";
	}

	@RequestMapping(value = "form-add-nhan-vien", method = RequestMethod.GET)
	public String themNV(ModelMap model) {
		model.addAttribute("nhanvien", new NHANVIEN());
		return "admin/quan-li-nhan-vien/form-add-nhan-vien";
	}

	@RequestMapping("themnhanvien")
	public String themNhanVien(HttpServletRequest request, ModelMap model,
			@Validated @ModelAttribute("nhanvien") NHANVIEN nv, BindingResult errors) {
		boolean checkAdd = this.insertNV(nv);
		String msg = "";
		String url = "";
		if (checkAdd == true) {
			msg = "Thêm nhân viên thành công!";
			url = "admin/quan-li-nhan-vien/quan-li-nhan-vien";
			PagedListHolder pagedListHolder = new PagedListHolder(this.getDSTaiKhoan());
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setMaxLinkedPages(5);
			pagedListHolder.setPageSize(10);
			model.addAttribute("pagedListHolder", pagedListHolder);
		} else {
			msg = "Thêm nhân viên thất bại!";
			url = "admin/quan-li-nhan-vien/form-add-nhan-vien";
		}
		model.addAttribute("msg", msg);
		return url;
	}

	// ==========QUẢN LÝ KHÁCH HÀNG============
	public KHACHHANG getKhachHang(String maKH) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM KHACHHANG where maKH = :ma");
		query.setParameter("ma", maKH);
		KHACHHANG nhanVien = (KHACHHANG) query.list().get(0);
		return nhanVien;
	}

	public List<KHACHHANG> getDSKhachHang() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM KHACHHANG");
		List<KHACHHANG> result = query.list();
		return result;
	}

	@RequestMapping(value = "quan-li-khach-hang", method = RequestMethod.GET)
	public String quanLiKhachHang(ModelMap model, HttpServletRequest request) {
		PagedListHolder pagedListHolder = new PagedListHolder(this.getDSKhachHang());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("user", new KHACHHANG());
		return "admin/quan-li-khach-hang/quan-li-khach-hang";
	}

	@RequestMapping(value = "form-add-khach-hang", method = RequestMethod.GET)
	public String themKH(ModelMap model) {
		model.addAttribute("user", new KHACHHANG());
		return "admin/quan-li-khach-hang/form-add-khach-hang";
	}

	// ============================TÀI KHOẢN============================================
	public boolean insertTaiKhoan(TAIKHOAN tk) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(tk);
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

	public boolean updateTaiKhoan(TAIKHOAN tk) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(tk);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	public boolean deleteTaiKhoan(TAIKHOAN tk) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(tk);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		return true;
	}

	@ModelAttribute("quyen")
	public List<QUYEN> getQuyen() {
		Session session = factory.getCurrentSession();
		String hql = "FROM QUYEN";
		Query query = session.createQuery(hql);
		List<QUYEN> list = query.list();
		return list;
	}

	public TAIKHOAN getTaiKhoan(String maTK) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM TAIKHOAN where maTK = :ma");
		query.setParameter("ma", maTK);
		TAIKHOAN taiKhoan = (TAIKHOAN) query.list().get(0);
		return taiKhoan;
	}

	public List<TAIKHOAN> getDSTaiKhoan() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM TAIKHOAN");
		List<TAIKHOAN> result = query.list();
		return result;
	}

	@RequestMapping(value = "quan-li-tai-khoan", method = RequestMethod.GET)
	public String quanLiTaiKhoan(ModelMap model, HttpServletRequest request) {
		PagedListHolder pagedListHolder = new PagedListHolder(this.getDSTaiKhoan());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("user", new TAIKHOAN());
		return "admin/quan-li-tai-khoan/quan-li-tai-khoan";
	}

	@RequestMapping(value = "form-add-tai-khoan", method = RequestMethod.GET)
	public String themTK(ModelMap model) {
		model.addAttribute("user", new TAIKHOAN());
		return "admin/quan-li-tai-khoan/form-add-tai-khoan";
	}

	@RequestMapping("themtaikhoan")
	public String themTaiKhoan(HttpServletRequest request, ModelMap model,
			@Validated @ModelAttribute("user") TAIKHOAN tk, BindingResult errors) {
		TRANGTHAITAIKHOAN trangThaiTK = new TRANGTHAITAIKHOAN("TT01", "Hoạt động");
		tk.setMaTrangThaiTK(trangThaiTK);
		boolean checkAdd = this.insertTaiKhoan(tk);
		String msg = "";
		String url = "";
		if (checkAdd == true) {
			msg = "Thêm tài khoản thành công!";
			url = "admin/quan-li-tai-khoan/quan-li-tai-khoan";
			PagedListHolder pagedListHolder = new PagedListHolder(this.getDSTaiKhoan());
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setMaxLinkedPages(5);
			pagedListHolder.setPageSize(10);
			model.addAttribute("pagedListHolder", pagedListHolder);
		} else {
			msg = "Thêm tài khoản thất bại!";
			url = "admin/quan-li-tai-khoan/form-add-tai-khoan";
		}
		model.addAttribute("msg", msg);
		return url;
	}

	@RequestMapping(value = "/{maTK}.htm", params = "linkEdit")
	public String suaTK(ModelMap model, @PathVariable("maTK") String maTK) {
		model.addAttribute("user", this.getTaiKhoan(maTK));
		return "admin/quan-li-tai-khoan/form-sua-tai-khoan";
	}

	@RequestMapping("suataikhoan")
	public String suaTaiKhoan(HttpServletRequest request, ModelMap model,
			@Validated @ModelAttribute("user") TAIKHOAN tk, BindingResult errors) {
		boolean checkUpdate = this.updateTaiKhoan(tk);
		String msg = "";
		String url = "";
		if (checkUpdate == true) {
			msg = "Chỉnh sửa thông tin tài khoản thành công!";
			model.addAttribute("user", this.getTaiKhoan(tk.getMaTK()));

			url = "admin/quan-li-tai-khoan/quan-li-tai-khoan";
			PagedListHolder pagedListHolder = new PagedListHolder(this.getDSTaiKhoan());
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setMaxLinkedPages(5);
			pagedListHolder.setPageSize(10);
			model.addAttribute("pagedListHolder", pagedListHolder);
		} else {
			msg = "Chỉnh sửa thông tin tài khoản thất bại!";
			url = "admin/quan-li-tai-khoan/form-sua-tai-khoan";
		}
		model.addAttribute("msg", msg);
		return url;
	}

	@RequestMapping(value = "/{maTK}.htm", params = "linkDelete")
	public String xoaTaiKhoan(HttpServletRequest request, ModelMap model, @PathVariable("maTK") String maTK) {
		TAIKHOAN tK = this.getTaiKhoan(maTK);
		boolean checkDelete = this.deleteTaiKhoan(tK);
		String msg = "";
		if (checkDelete == true) {
			msg = "Xoá tài khoản thành công!";
		} else
			msg = "Xoá tài khoản thất bại, đã xảy ra lỗi!";
		PagedListHolder pagedListHolder = new PagedListHolder(this.getDSTaiKhoan());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("msg", msg);
		return "admin/quan-li-tai-khoan/quan-li-tai-khoan";
	}
}
