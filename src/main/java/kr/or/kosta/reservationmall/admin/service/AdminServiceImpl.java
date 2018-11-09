package kr.or.kosta.reservationmall.admin.service;



import kr.or.kosta.reservationmall.admin.dao.AdminDao;
import kr.or.kosta.reservationmall.admin.dto.Hotel;
import kr.or.kosta.reservationmall.admin.dto.Rooms;
import kr.or.kosta.reservationmall.login.dao.LoginDao;


public class AdminServiceImpl implements AdminService {

	private AdminDao adminDao;
	
	public AdminDao getloginDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public boolean create_hotel_info(Hotel hotel) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean create_rooms_info(Rooms rooms) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	
	

}





