package kr.or.kosta.reservationmall.hotel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.kosta.reservationmall.hotel.dao.HotelDao;
import kr.or.kosta.reservationmall.hotel.dto.HotelSearchParam;
import kr.or.kosta.reservationmall.hotel.dto.HotelSearchResult;
import kr.or.kosta.reservationmall.room.dto.Room;

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

	@Override
	public Room getRoomInfo(String hotelId, String roomName) throws Exception {
		return hotelDao.getRoomInfo(hotelId, roomName);
	}

	@Override
	public Map<String, List<String>> getHotelImages(String hotelIds) throws Exception {
		List<Map<String, String>> result = hotelDao.getHotelImages(hotelIds);
		Map<String, List<String>> images = new HashMap<>();
		String hotelId = null;
		for (Map<String, String> map : result) {
			hotelId = String.valueOf(map.get("hotelId"));
			if (!images.containsKey(hotelId)) {
				images.put(hotelId, new ArrayList<>());
			}
			images.get(hotelId).add(map.get("imageDirectory"));
		}
		return images;
	}
	
	@Override
	public List<String> getRoomImages(int hotelId, String roomName) throws Exception {
		return hotelDao.getRoomImages(hotelId, roomName);
	}
}
