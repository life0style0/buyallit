package kr.or.kosta.reservationmall.hotel.service;



import java.util.List;
import java.util.Map;

import kr.or.kosta.reservationmall.hotel.dto.HotelSearchParam;
import kr.or.kosta.reservationmall.hotel.dto.HotelSearchResult;
import kr.or.kosta.reservationmall.room.dto.Room;


/**
 * 로그인 관련 처리 
 * 로그인, 회원가입 등
 * @author 허재혁
 */
public interface HotelService {
	

	public List<HotelSearchResult> searchHotelListsByLocation(HotelSearchParam hotelSearchParam) throws Exception;

	public List<HotelSearchResult> searchHotelListsByHotel(HotelSearchParam hotelSearchParam) throws Exception;

	public Room getRoomInfo(String hotelId, String roomName) throws Exception;

	public Map<String,List<String>> getHotelImages(String hotelIds) throws Exception;
	
	public List<String> getRoomImages(int hotelId, String roomName) throws Exception;
}
