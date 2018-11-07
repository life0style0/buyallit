package kr.or.kosta.reservationmall.hotel.dao;

import java.util.List;
import java.util.Map;

import kr.or.kosta.reservationmall.common.web.Params;
import kr.or.kosta.reservationmall.hotel.dto.Hotel;

/**
 * Dao 패턴 적용을 위한 인터페이스 선언
 * @author 김기정
 *
 */
public interface HotelDao {
	
	public List<Hotel> searchHotelLists(String id, String passwd) throws Exception;
	
}
