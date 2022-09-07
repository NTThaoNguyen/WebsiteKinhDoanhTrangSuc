package ptithcm.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import ptithcm.bean.Mailer;
import ptithcm.entity.CT_GH;
import ptithcm.entity.GIOHANG;
import ptithcm.entity.HANGTRANGSUC;
import ptithcm.entity.KHACHHANG;
import ptithcm.entity.LOAITRANGSUC;
import ptithcm.entity.QUYEN;
import ptithcm.entity.TAIKHOAN;
import ptithcm.entity.TRANGSUC;
import ptithcm.entity.TRANGTHAIDONHANG;
import ptithcm.entity.TRANGTHAITAIKHOAN;
import ptithcm.model.GioHangModel;
import ptithcm.model.InputSearchModel;

@Transactional
@Controller
@RequestMapping("/home/")
public class HomeController {
	public static TAIKHOAN tkKHHienTai = null;
	public static TAIKHOAN tkNVHienTai = null;
	@Autowired
	SessionFactory factory;
	public String getGiaVN(int gia) {
		// TODO Auto-generated method stub
		DecimalFormat formatter = new DecimalFormat("###,###,###");

		return formatter.format(gia)+" VNĐ";

	}
	// @Autowired
	// Mailer mailer;
	@RequestMapping("home")
	public String home(ModelMap model, HttpSession httpSession) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LOAITRANGSUC";
		Query query = session.createQuery(hql);
		List<LOAITRANGSUC> list = query.list();
		model.addAttribute("TypeTS", list);
		httpSession.setAttribute("TypeTS", list);
		TAIKHOAN user = (TAIKHOAN) httpSession.getAttribute("myLogin");
		if (user == null) {
			model.addAttribute("dangnhap", "Đăng nhập");
			model.addAttribute("dangki", "Đăng kí");
		} else {
			model.addAttribute("dangnhap", "Xin chào ");
			model.addAttribute("dangki", user.getKhachhang().getTen());
		}
		Session session2 = factory.getCurrentSession();
		String hql2 = "FROM TRANGSUC";
		Query query2 = session.createQuery(hql2);
		List<TRANGSUC> list2 = query2.list();
		model.addAttribute("TrangSuc", list2);
		List<TRANGSUC> listTSMoi = this.getDSMoi();
		for (TRANGSUC trangsuc : listTSMoi) {
			System.out.println(trangsuc.getTenTS()+"TSMoi nha!");
		}
		model.addAttribute("TSMoi", listTSMoi);
		/*List<TRANGSUC> listTSKM = this.getDSKhuyenMai();
		model.addAttribute("TSBKM", listTSKM);*/
		List<TRANGSUC> listTSBChay = this.getDSTSBanChay();
		model.addAttribute("TSBChay", listTSBChay);
		return "user2/index";
		// return "user2/navbar/navbar";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String dangNhap(ModelMap model, HttpSession httpSession) {
		model.addAttribute("user", new TAIKHOAN());
		TAIKHOAN user = (TAIKHOAN) httpSession.getAttribute("myLogin");
		if (user != null) {
			return "redirect:index.htm";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM LOAITRANGSUC";
		Query query = session.createQuery(hql);
		List<LOAITRANGSUC> list = query.list();
		model.addAttribute("TypeTS", list);
		return "user2/login/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(ModelMap model, @ModelAttribute("user") TAIKHOAN user, HttpSession httpSession,
			BindingResult errors) {
		boolean checkuser = false;
		if (user.getEmail().equals("")) {
			errors.rejectValue("email", "user", "Vui lòng nhập Username");
			checkuser = true;
		}
		if (user.getPassword().equals("")) {
			errors.rejectValue("password", "user", "Vui lòng nhập Password");
			checkuser = true;
		}
		if (checkuser == true) {
			return "user2/login/login";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM TAIKHOAN WHERE email = '" + user.getEmail() + "' AND password = '" + user.getPassword()
				+ "'";

		Query query = session.createQuery(hql);
		List<TAIKHOAN> result = query.list();

		if (result.isEmpty()) {
			model.addAttribute("message", "Tài khoản hoặc mật khẩu không chính xác");
		} else {
			// tkHienTai = result.get(0);
			if (result.get(0).getMaQuyen().getMaQuyen().equals("q01")) {
				tkNVHienTai = result.get(0);
				httpSession.setAttribute("myLogin", query.list().get(0));
				return "admin/index";
			}
			tkKHHienTai = result.get(0);
			httpSession.setAttribute("myLogin", query.list().get(0));
			return "user2/index";
		}
		return "user2/login/login";
	}

	@RequestMapping("logout")
	public String logout(HttpSession httpSession) {
		httpSession.setAttribute("myLogin", null);
		//httpSession.setAttribute("myOrder", null);
		return "user2/index";
	}

	// ==============================================
/*	public List<TRANGSUC> getDSKhuyenMai() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TRANGSUC ts order by ts.luotMua desc";
		Query query = session.createQuery(hql).setMaxResults(5);
		List<TRANGSUC> list = query.list();
		List<TRANGSUC> list2 = new ArrayList<>();
		for (TRANGSUC i : list) {
			list2.add(i);
			System.out.println(i.getHinhanhList().get(0).getTenHA()+"Sản phẩm khuyến mãi");
		}
		return list2;
	}*/
	public List<TRANGSUC> getDSMoi() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TRANGSUC ts where ts.is_new='true'";
		Query query = session.createQuery(hql).setMaxResults(5);
		List<TRANGSUC> list = query.list();
		List<TRANGSUC> list2 = new ArrayList<>();
		for (TRANGSUC i : list) {
			list2.add(i);
			System.out.println(i.getHinhanhList().get(0).getTenHA()+"Sản phẩm mới");
		}
		return list2;
	}
	public List<TRANGSUC> getDSTSBanChay() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TRANGSUC ts order by ts.luotMua desc";
		Query query = session.createQuery(hql).setMaxResults(10);
		List<TRANGSUC> list = query.list();
		List<TRANGSUC> list2 = new ArrayList<>();
		for (TRANGSUC i : list) {
			list2.add(i);
			System.out.println(i.getHinhanhList().get(0).getTenHA());
		}
		return list2;
	}
	@RequestMapping("register2")
	public String register2() {

		return "user2/login/register";
	}

	@RequestMapping("gioithieu")
	public String gioiThieu() {

		return "user2/tinTuc-lienHe/gioithieu";
	}

	@RequestMapping("lienhe")
	public String lienHe() {

		return "user2/tinTuc-lienHe/lienhe";
	}

	@RequestMapping("tintuc")
	public String tinTuc() {

		return "user2/tinTuc-lienHe/tintuc";
	}

	@RequestMapping("tintuc1")
	public String tinTuc1() {

		return "user2/tinTuc-lienHe/tintuc1";
	}

	@RequestMapping("tintuc2")
	public String tinTuc2() {

		return "user2/tinTuc-lienHe/tintuc2";
	}

	// --------------------ĐĂNG KÝ---------------------------
	String maKH = "kh";
	String maTK = "tk";

	@RequestMapping("index")
	public String index() {
		return "user2/index";
	}

	public int getidKH() {
		Session session = factory.getCurrentSession();
		String hql = "FROM KHACHHANG";
		Query query = session.createQuery(hql).setMaxResults(100);
		List<KHACHHANG> list = query.list();
		int[] dskh = new int[list.size()];
		for (int i = 0; i < list.size(); i++) {
			char[] ch = list.get(i).getMaKH().toCharArray();
			dskh[i] = Integer.valueOf(String.copyValueOf(ch, 2, list.get(i).getMaKH().length() - 2));
		}
		int max = dskh[0];
		for (int i = 0; i < dskh.length; i++) {
			if (max < dskh[i]) {
				max = dskh[i];
			}
		}
		return max + 1;
	}

	public int getidTK() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TAIKHOAN";
		Query query = session.createQuery(hql).setMaxResults(100);
		List<TAIKHOAN> list = query.list();
		int[] dstk = new int[list.size()];
		for (int i = 0; i < list.size(); i++) {
			char[] ch = list.get(i).getMaTK().toCharArray();
			dstk[i] = Integer.valueOf(String.copyValueOf(ch, 2, list.get(i).getMaTK().length() - 2));
		}
		//System.out.println(list.size()+"hihi");
		int max = dstk[0];
		for (int i = 0; i < dstk.length; i++) {
			if (max < dstk[i]) {
				max = dstk[i];
			}
			//System.out.println(dstk[i]+" ");
		}
		return max + 1;
	}

	public int insertObject(Object object) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(object);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			//System.out.println("exception: " + e);
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	@RequestMapping(value = "register")
	public String register1() {
		return "user2/login/register2";
	}

	@RequestMapping(value = "register", params = "btnDangKy")
	public String register(ModelMap model, HttpServletRequest request) throws InterruptedException {
		String email = request.getParameter("email");
		String matkhau = request.getParameter("matkhau");
		String ho = request.getParameter("ho");
		String ten = request.getParameter("ten");
		String gioiTinh = request.getParameter("gioiTinh");
		String sdt = request.getParameter("sdt");
		String diachi = request.getParameter("diachi");
		String ma = maKH + String.valueOf(getidKH());
		KHACHHANG kh = new KHACHHANG();
		kh.setDiaChi(diachi);
		kh.setMaKH(ma);
		kh.setSdt(sdt);
		kh.setTen(ten);
		kh.setHo(ho);
		kh.setGioiTinh(gioiTinh);
		TAIKHOAN tk = new TAIKHOAN();
		QUYEN q = new QUYEN();
		q.setMaQuyen("q02");
		q.setTenQuyen("Khách hàng");
		TRANGTHAITAIKHOAN tt = new TRANGTHAITAIKHOAN();
		tt.setMaTrangThaiTK("TT01");
		tt.setTenTrangThaiTK("Hoạt động");
		String idTK = maTK + String.valueOf(getidTK());
		tk.setEmail(email);
		tk.setMaQuyen(q);
		tk.setMaTK(idTK);
		tk.setPassword(matkhau);
		tk.setMaTrangThaiTK(tt);
		kh.setMaTK(tk);
		int checkTK = this.insertObject(tk);
		Thread.sleep(1000);
		//System.out.println("Ma KH " + ma + " Ma TK " + idTK);
		if (checkTK != 0) {
			int check = this.insertObject(kh);
			model.addAttribute("message", "Tạo tài khoản thành công!");
			if (check != 0) {
				kh.setMaTK(tk);
				model.addAttribute("message", "Tạo tài khoản thành công!");
			} else {
				model.addAttribute("message", "Tạo tài khoản thất bại!");
			}
		} else {
			model.addAttribute("message", "Tạo tài khoản thất bại. Vui lòng nhập đầy đủ thông tin!");
		}
		return "user2/login/register2";
	}
	// -------------------------QUÊN MẬT KHẨU---------------------------------
	@Autowired
	Mailer mailer;

	@RequestMapping("forget")
	public String matKhau() {
		return "user2/login/forget";
	}

	public String taoMatKhau() {
		Random generator = new Random();
		int value = generator.nextInt((999999 - 100000) + 1) + 100000;
		return value + "";
	}

	public TAIKHOAN get1TaiKhoan(String ma) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoan where username = :ma";
		Query query = session.createQuery(hql);
		query.setParameter("ma", ma);
		TAIKHOAN list = (TAIKHOAN) query.list().get(0);
		return list;
	}

	@RequestMapping("reset")
	public String datLaiMK(HttpServletRequest rq, ModelMap model) {
		String email = rq.getParameter("email");
		Session session = factory.getCurrentSession();
		String hql = "FROM TAIKHOAN WHERE email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		List<TAIKHOAN> list = query.list();
		if (list.size() == 0) {
			model.addAttribute("message0", "Email không tồn tại, vui lòng kiểm tra lại!");
			return "user2/login/forget";
		}
		if (list.size() != 0) {
			String mk = taoMatKhau();
			// Cập nhật mật khẩu
			try {
				mailer.send("nttnguyen05072000@gmail.com", email, "Reset your password",
						"\nYour new password is: " + mk);
				model.addAttribute("message1", "Mật khẩu mới đã được gửi đến email của bạn!");
			} catch (Exception e) {
				model.addAttribute("message0", "Gửi email lỗi!");
			}
			TAIKHOAN tk = (TAIKHOAN) query.list().get(0);
			tk.setPassword(mk);
		}
		return "user2/login/forget";
	}

	// -----------------------------ĐỔI MẬT KHẨU---------------------------------
	@RequestMapping("changepw")
	public String change(HttpServletRequest rq, ModelMap model) {
		String email = rq.getParameter("email");
		String pass = rq.getParameter("oldpassword");
		Session session = factory.getCurrentSession();
		String hql = "FROM TAIKHOAN WHERE email = :email and password = :pass";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		query.setParameter("pass", pass);
		List<TAIKHOAN> list = query.list();
		if (list.size() == 0) {
			model.addAttribute("message0",
					"Email không tồn tại hoặc mật khẩu bị sai, vui lòng kiểm tra lại!");
			return "user2/login/changepassword";
		} else {
			TAIKHOAN tk = (TAIKHOAN) query.list().get(0);
			String npass = rq.getParameter("newpassword");
			tk.setPassword(npass);
			return "user2/tinTuc-lienHe/index";//Nhớ coi lại nha- làm xong fun khách hàng sửa thông tin 
		}
	}
	//=============================XEM LỊCH SỬ ĐẶT HÀNG================================
	@RequestMapping("don-hang-cua-toi")
	public String nhap() {

		return "user2/don-hang-cua-toi/don-hang-cua-toi";
	}
	public List<GIOHANG> getGioHangTheoTT(String maTT, String maKH) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM TRANGTHAIDONHANG WHERE maTrangThaiDonHang = :ma");
		query.setParameter("ma", maTT);
		TRANGTHAIDONHANG trangThai = (TRANGTHAIDONHANG) query.list().get(0);
		List<GIOHANG> result = trangThai.getGioHang();
		for(int i = 0; i < result.size(); i++) {
			if(!result.get(i).getMaKH().getMaKH().equals(maKH)) {
				result.remove(i);
				i--;
			}
		}
		return result;
	}
	public GIOHANG getGioHang(String maGH) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM GIOHANG WHERE maGioHang = :ma");
		query.setParameter("ma", maGH);
		GIOHANG result = (GIOHANG) query.list().get(0);
		return result;
	}
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkChiTiet")
	public String xemThongTin(ModelMap model, @PathVariable("maGioHang") String maGH) {
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
		String tongTienVND = this.getGiaVN(tongTien);
		model.addAttribute("dSSP", listSP);
		model.addAttribute("tongTien", tongTienVND);
		model.addAttribute("gioHang", gioHang);
		model.addAttribute("loaiTrang", "choXacNhan");
		model.addAttribute("name", "chờ xác nhận");
		model.addAttribute("taiKhoan", HomeController.tkKHHienTai);
		model.addAttribute("inputSearch", new InputSearchModel());
		return "user2/don-hang-cua-toi/xem-chi-tiet-don-hang";
	}
	@RequestMapping(value = "/{maGioHang}.htm", params = "linkChiTiet2")
	public String xemThongTin2(ModelMap model, @PathVariable("maGioHang") String maGH) {
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
		String tongTienVND = this.getGiaVN(tongTien);
		model.addAttribute("dSSP", listSP);
		model.addAttribute("tongTien", tongTienVND);
		model.addAttribute("gioHang", gioHang);
		model.addAttribute("taiKhoan", HomeController.tkKHHienTai);
		model.addAttribute("inputSearch", new InputSearchModel());
		return "user2/don-hang-cua-toi/xem-chi-tiet-don-hang";
	}
	@RequestMapping("donhangchoxacnhan")
	public String donhangchoxacnhan(HttpServletRequest request, ModelMap model) {
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH01", HomeController.tkKHHienTai.getKhachhang().getMaKH());
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() < result.get(j).getNgayDat().getTime()) {
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
		model.addAttribute("taiKhoan",tkKHHienTai);
		model.addAttribute("inputSearch", new InputSearchModel());
		return "user2/don-hang-cua-toi/don-hang-cho-xac-nhan";
	}
	@RequestMapping("donhangdaxacnhan")
	public String donhangDaXacNhan(HttpServletRequest request, ModelMap model) {
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH02", HomeController.tkKHHienTai.getKhachhang().getMaKH());
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() < result.get(j).getNgayDat().getTime()) {
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
		model.addAttribute("taiKhoan",tkKHHienTai);
		model.addAttribute("inputSearch", new InputSearchModel());
		return "user2/don-hang-cua-toi/don-hang-da-xac-nhan";
	}
	@RequestMapping("donhangdanggiao")
	public String donhangDangGiao(HttpServletRequest request, ModelMap model) {
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH03", HomeController.tkKHHienTai.getKhachhang().getMaKH());
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() < result.get(j).getNgayDat().getTime()) {
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
		model.addAttribute("taiKhoan",tkKHHienTai);
		model.addAttribute("inputSearch", new InputSearchModel());
		return "user2/don-hang-cua-toi/don-hang-dang-giao";
	}
	@RequestMapping("donhangdanhan")
	public String donhangDaNhan(HttpServletRequest request, ModelMap model) {
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH04", HomeController.tkKHHienTai.getKhachhang().getMaKH());
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() < result.get(j).getNgayDat().getTime()) {
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
		model.addAttribute("taiKhoan",tkKHHienTai);
		model.addAttribute("inputSearch", new InputSearchModel());
		return "user2/don-hang-cua-toi/don-hang-da-nhan";
	}
	@RequestMapping("donhangdahuy")
	public String donhangDaHuy(HttpServletRequest request, ModelMap model) {
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH05", HomeController.tkKHHienTai.getKhachhang().getMaKH());
		for(int i = 0; i < result.size(); i++) {
			for(int j = i +1; j< result.size(); j++) {
				if(result.get(i).getNgayDat().getTime() < result.get(j).getNgayDat().getTime()) {
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
		model.addAttribute("taiKhoan",tkKHHienTai);
		model.addAttribute("inputSearch", new InputSearchModel());
		return "user2/don-hang-cua-toi/don-hang-da-huy";
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
			int sLM = ctgh.getMaTS().getSoLuongTon()+ctgh.getSoLuong();
			this.updateSoLuong(maTS, sLM);
		}
		
		List<GIOHANG> result = this.getGioHangTheoTT("TTGH01", HomeController.tkKHHienTai.getKhachhang().getMaKH());
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
		model.addAttribute("taiKhoan", tkKHHienTai);
		return "redirect:/home/donhangchoxacnhan.htm";
	}

}
