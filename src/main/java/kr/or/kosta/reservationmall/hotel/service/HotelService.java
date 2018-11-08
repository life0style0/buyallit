package kr.or.kosta.reservationmall.hotel.service;



import java.util.List;
import java.util.Map;

import kr.or.kosta.reservationmall.hotel.dto.HotelSearchParam;


/**
 * 로그인 관련 처리 
 * 로그인, 회원가입 등
 * @author 허재혁
 */
public interface HotelService {
	

	public List<Map<String, String>> searchHotelListsByLocation(HotelSearchParam hotelSearchParam) throws Exception;

	public List<Map<String, String>> searchHotelListsByHotel(HotelSearchParam hotelSearchParam) throws Exception;
}
