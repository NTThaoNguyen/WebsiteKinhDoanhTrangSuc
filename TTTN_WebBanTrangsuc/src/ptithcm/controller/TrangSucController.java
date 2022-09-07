package ptithcm.controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.HANGTRANGSUC;
import ptithcm.entity.LOAITRANGSUC;
import ptithcm.entity.TAIKHOAN;
import ptithcm.entity.THAYDOIGIA;
import ptithcm.entity.TRANGSUC;
import ptithcm.model.GioHangModel;
import ptithcm.model.InputSearchModel;

@Transactional
@Controller
@RequestMapping("/product/")
public class TrangSucController {
	@Autowired
	SessionFactory factory;
	public String getTongGiaVN(Float a) {
		// TODO Auto-generated method stub
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		return formatter.format(a) + " VNĐ";

	}
	public int layGiaHienTai(TRANGSUC ts){
        List<THAYDOIGIA> ds = ts.getThaydoigiaList();
        DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date currentDate = new Date();
        String now = simpleDateFormat.format(currentDate);
        Date hienTai = new Date();
        try{
            hienTai = simpleDateFormat.parse(now);
        } catch (Exception e){
            System.out.println(e);
        }
        long min = 100000000;
        int vt = 0;
        for(int i = 0; i < ds.size(); i++){
            long getDiff = hienTai.getTime() - ds.get(i).getNgayApDung().getTime();
            long getDaysDiff = getDiff / (24 * 60 * 60 * 1000);
            if(getDaysDiff >= 0 && getDaysDiff < min){
                min = getDaysDiff;
                vt = i;
            }
        }
        if(ds.size() > 0) return ds.get(vt).getGia();
        return 0;
    }
	@ModelAttribute("hangtrangsuc")
	public List<HANGTRANGSUC> getDSHangtrangsuc() {
		Session session = factory.getCurrentSession();
		String hql = "FROM HANGTRANGSUC";
		Query query = session.createQuery(hql);
		List<HANGTRANGSUC> list = query.list();
		return list;
	}
	public TRANGSUC getTrangSuc(String maTS) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM TRANGSUC where maTS = :ma");
		query.setParameter("ma", maTS);
		TRANGSUC ts = (TRANGSUC) query.list().get(0);
		return ts;
	}
	//get danh sách trang sức
	List<TRANGSUC> getTS() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM TRANGSUC");
		List<TRANGSUC> result = query.list();
		for(int i = 0; i < result.size(); i++) {
			TRANGSUC ts = result.get(i);
			result.get(i).setGia(this.layGiaHienTai(ts));
		}
		for (TRANGSUC i : result) {
			System.out.println(i.getHinhanhList().get(0).getTenHA());
		}
		return result;
	}
	public List<TRANGSUC> getDSKhuyenMai() {
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
	}
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
		Query query = session.createQuery(hql).setMaxResults(5);
		List<TRANGSUC> list = query.list();
		List<TRANGSUC> list2 = new ArrayList<>();
		for (TRANGSUC i : list) {
			list2.add(i);
			System.out.println(i.getHinhanhList().get(0).getTenHA()+"Sản phẩm bán chạy");
		}
		return list2;
	}
	//Search function
	public static String removeDiacriticalMarks(String string) {
        return Normalizer.normalize(string, Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
    }
	String chuanHoaChuoi(String str) {
		str = str.trim();
		str = str.replaceAll("\\s+", " ");
        str = str.toLowerCase();
        str = removeDiacriticalMarks(str);
		return str;
	}
	@RequestMapping("timkiem")
	public String timKiem(ModelMap model,HttpServletRequest request, @ModelAttribute("inputSearch") InputSearchModel inputSearch) {
		List<TRANGSUC> list = this.getTS();
		for (TRANGSUC trangsuc : list) {
			System.out.println(trangsuc.getTenTS()+"hihihaha");
		}
		List<TRANGSUC> listResult = new ArrayList<>();
		for (TRANGSUC ts : list) {
			if((this.chuanHoaChuoi(ts.getTenTS()).contains(this.chuanHoaChuoi(inputSearch.getInput()))) && (!inputSearch.getInput().trim().isEmpty())) {
				listResult.add(ts);
			}
		}
		PagedListHolder pagedListHolder = new PagedListHolder(listResult);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(12);
		model.addAttribute("pagedListHolder", pagedListHolder);
		//model.addAttribute("dSSanPham", listResult);
		model.addAttribute("inputSearch", new InputSearchModel());
		return "user2/san-pham/sanpham";
	}
	@RequestMapping("sanpham")
	public String sanPham(ModelMap model,HttpServletRequest request) {
		List<TRANGSUC> list = this.getTS();
		for (int i = 0; i < list.size(); i++) {
			if(null == list.get(i).getHinhanhList() || list.get(i).getGia() <= 0) {
				list.remove(i);
				i--;
			}
			else {
				System.out.println(list.get(i).getHinhanhList().get(0).getTenHA()+"Sản phẩm");
			}
		}
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(12);
		model.addAttribute("pagedListHolder", pagedListHolder);
		//model.addAttribute("dSSanPham", list);
		List<HANGTRANGSUC> dshangts = this.getDSHangtrangsuc();
		model.addAttribute("dshangTS", dshangts);
		List<TRANGSUC> listTSMoi = this.getDSMoi();
		for (TRANGSUC trangsuc : listTSMoi) {
			System.out.println(trangsuc.getTenTS()+"TSMoi nha!");
		}
		model.addAttribute("TSMoi", listTSMoi);
		List<TRANGSUC> listTSKM = this.getDSKhuyenMai();
		model.addAttribute("TSBKM", listTSKM);
		List<TRANGSUC> listTSBChay = this.getDSTSBanChay();
		model.addAttribute("TSBChay", listTSBChay);
		model.addAttribute("inputSearch", new InputSearchModel());
		return "user2/san-pham/sanpham";
	}
	public List<TRANGSUC> getTrangSucLienQuan(String maLoai) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM LOAITRANGSUC where maLoai = :ma");
		query.setParameter("ma", maLoai);
		LOAITRANGSUC loai = (LOAITRANGSUC)query.list().get(0);
		List<TRANGSUC> listLienQuan = loai.getTrangsucList();
		for (int i = 0; i < listLienQuan.size(); i++) {
			for (int j = i+1; j < listLienQuan.size(); j++) {
				if(listLienQuan.get(i).getLuotMua()<listLienQuan.get(j).getLuotMua()){
					TRANGSUC tsTemp = listLienQuan.get(i);
					listLienQuan.set(i, listLienQuan.get(j));
					listLienQuan.set(j, tsTemp);
				}
			}			
		}
		List<TRANGSUC> listLienQuan2 = new ArrayList<>();
		listLienQuan2.add(listLienQuan.get(0));
		listLienQuan2.add(listLienQuan.get(1));
		listLienQuan2.add(listLienQuan.get(2));
		listLienQuan2.add(listLienQuan.get(3));
		for (TRANGSUC i : listLienQuan2) {
//			System.out.println(i.getTenTS()+"hihi");
			System.out.println(i.getHinhanhList().get(0).getTenHA());
		}
		return listLienQuan2;
	}
	@RequestMapping(value = "/{maTS}.htm",params = "linkDemo")
	public String demo_sanPham(ModelMap model, @PathVariable("maTS") String maTS) {
		TRANGSUC ts = this.getTrangSuc(maTS);
		model.addAttribute("trangsuc", ts);
		model.addAttribute("hinhanh", ts.getHinhanhList().get(0).getTenHA());
		GioHangModel gioHang = new GioHangModel();
		gioHang.setMaTS(ts.getMaTS());
		gioHang.setGia(ts.getGia());
		model.addAttribute("gioHang", gioHang);
		List<TRANGSUC> tsLienQuan = this.getTrangSucLienQuan(ts.getMaLoai().getMaLoai());
		model.addAttribute("tsLienQuan", tsLienQuan);
		return "user2/san-pham/demo_sanpham";
	}
	public List<TRANGSUC> getTrangSucTheoHang(String maHang) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM TRANGSUC where maHang = :ma");
		query.setParameter("ma", maHang);
		List<TRANGSUC> ts = (List<TRANGSUC>) query.list();
		return ts;
	}
	@RequestMapping(value = "/{maHang}.htm",params = "linkHang")
	public String loadSanPhamTheoHang(ModelMap model, @PathVariable("maHang") String maHang) {
		
		List<TRANGSUC> dsts = this.getTrangSucTheoHang(maHang);
		model.addAttribute("dSSanPham", dsts);
		List<HANGTRANGSUC> hangts = this.getDSHangtrangsuc();
		model.addAttribute("hangTS", hangts);
		return "user2/san-pham/sanpham";
	}
}
