package kr.or.kosta.reservationmall.hotel.service;

import java.util.List;
import java.util.Map;

import kr.or.kosta.reservationmall.hotel.dao.HotelDao;
import kr.or.kosta.reservationmall.hotel.dto.HotelSearchParam;

public class HotelServiceImpl implements HotelService {

	private HotelDao hotelDao;

	public HotelDao getHotelDao() {
		return hotelDao;
	}

	public void setHotelDao(HotelDao hotelDao) {
		this.hotelDao = hotelDao;
	}

	@Override
	public List<Map<String, String>> searchHotelListsByLocation(HotelSearchParam hotelSearchParam) throws Exception {
		return hotelDao.searchHotelListsByLocation(hotelSearchParam);
	}
	
	@Override
	public List<Map<String, String>> searchHotelListsByHotel(HotelSearchParam hotelSearchParam) throws Exception {
		return hotelDao.searchHotelListsByHotel(hotelSearchParam);
	}
}
