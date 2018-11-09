package kr.or.kosta.reservationmall.admin.dao;

import kr.or.kosta.reservationmall.admin.dto.Hotel;
import kr.or.kosta.reservationmall.admin.dto.Rooms;

/**
 * Dao 패턴 적용을 위한 인터페이스 선언
 * @author 김기정
 *
 */
public interface AdminDao {
	
	public boolean create_hotel_info(Hotel hotel) throws Exception;
	public boolean create_rooms_info(Rooms rooms) throws Exception;
	
	
}
