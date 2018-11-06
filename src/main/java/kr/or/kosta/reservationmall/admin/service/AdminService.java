package kr.or.kosta.reservationmall.admin.service;



import java.util.List;

import kr.or.kosta.reservationmall.admin.dto.Hotel;
import kr.or.kosta.reservationmall.admin.dto.Rooms;


/**
 * 로그인 관련 처리 
 * 로그인, 회원가입 등
 * @author 허재혁
 */
public interface AdminService {
	
	/**회워 로그인**/
	public boolean create_hotel_info(Hotel hotel) throws Exception;
	public boolean create_rooms_info(Rooms rooms) throws Exception;
	


}
