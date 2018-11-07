package kr.or.kosta.reservationmall.hotel.service;



import java.util.List;


/**
 * 로그인 관련 처리 
 * 로그인, 회원가입 등
 * @author 허재혁
 */
public interface HotelService {
	
	/**회워 로그인**/
	public Boolean checkLogin_hjh(String id, String pw) throws Exception;
	


}
