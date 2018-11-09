package kr.or.kosta.reservationmall.hotel.service;

import java.util.List;

import kr.or.kosta.reservationmall.hotel.dao.HotelDao;
import kr.or.kosta.reservationmall.hotel.dto.HotelSearchParam;
import kr.or.kosta.reservationmall.hotel.dto.HotelSearchResult;

public class HotelServiceImpl implements HotelService {

	private HotelDao hotelDao;

	public HotelDao getHotelDao() {
		return hotelDao;
	}

	public void setHotelDao(HotelDao hotelDao) {
		this.hotelDao = hotelDao;
	}

	@Override
	public List<HotelSearchResult> searchHotelListsByLocation(HotelSearchParam hotelSearchParam) throws Exception {
		return hotelDao.searchHotelListsByLocation(hotelSearchParam);
	}
	
	@Override
	public List<HotelSearchResult> searchHotelListsByHotel(HotelSearchParam hotelSearchParam) throws Exception {
		return hotelDao.searchHotelListsByHotel(hotelSearchParam);
	}
}
