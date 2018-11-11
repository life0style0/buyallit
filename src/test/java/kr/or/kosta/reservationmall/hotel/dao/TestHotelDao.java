package kr.or.kosta.reservationmall.hotel.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import com.google.common.collect.Sets;

import kr.or.kosta.reservationmall.hotel.dto.HotelInfo;
import kr.or.kosta.reservationmall.hotel.dto.HotelSearchParam;
import kr.or.kosta.reservationmall.hotel.dto.HotelSearchResult;

public class TestHotelDao {
	MybatisHotelDao dao;

	@Before
	public void init() throws IOException {
		dao = new MybatisHotelDao();
		Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
		dao.setSqlSessionFactory(new SqlSessionFactoryBuilder().build(reader, "development"));
	}
	
	@Test
	public void test() throws Exception {

		List<List<HotelSearchResult>> searchResult = new ArrayList<>();
		HotelSearchParam param = new HotelSearchParam(null, "강남구", "2018-11-09", "2018-11-10", "1", "0", null, null,
				null, null);
		searchResult.add(dao.searchHotelListsByLocation(param));
		HotelSearchParam param2 = new HotelSearchParam(null, "강남구", "2018-11-09", "2018-11-10", "1", "0", null, null,
				null, null);
		searchResult.add(dao.searchHotelListsByLocation(param2));
		HotelSearchParam param3 = new HotelSearchParam(null, "강남구", "2018-11-09", "2018-11-10", "1", "0", null, null,
				null, null);
		searchResult.add(dao.searchHotelListsByLocation(param3));

		Set<Integer> hotelIdSetTemp = null;
		Set<Integer> hotelIdSet = new HashSet<>();
		for (HotelSearchResult hotelSearchResult : searchResult.get(0)) {
			hotelIdSet.add(hotelSearchResult.getHotelId());
		}
		for (int i = 1; i < searchResult.size(); i++) {
			hotelIdSetTemp = new HashSet<>();
			for (HotelSearchResult hotelSearchResult : searchResult.get(i)) {
				hotelIdSetTemp.add(hotelSearchResult.getHotelId());
			}
			hotelIdSet = Sets.intersection(hotelIdSet, hotelIdSetTemp);
		}

		long 시작시간 = System.currentTimeMillis();
		List<HotelInfo> hotelInfo = new ArrayList<>();
		HotelInfo info = null;
		for (int hotelId : hotelIdSet) {
			info = new HotelInfo();
			info.setHotelId(hotelId);
			for (int i = 0; i < searchResult.size(); i++) {
				for (HotelSearchResult hotelSearchResult : searchResult.get(i)) {
					if (hotelSearchResult.getHotelId() == hotelId) {
						if (info.getCleanRate() == null) {
							info.setCleanRate(hotelSearchResult.getCleanRate());
						}
						if (info.getFoodRate() == null) {
							info.setFoodRate(hotelSearchResult.getFoodRate());
						}
						if (info.getServiceRate() == null) {
							info.setLocationRate(hotelSearchResult.getLocationRate());
						}
						if (info.getPriceRate() == null) {
							info.setPriceRate(hotelSearchResult.getPriceRate());
						}
						if (info.getServiceRate() == null) {
							info.setServiceRate(hotelSearchResult.getServiceRate());
						}
						try {
							if (!info.isExistRoom(i + 1, hotelSearchResult.getRoomName())) {
								info.addRooms(i + 1,
										dao.getRoomInfo(String.valueOf(hotelId), hotelSearchResult.getRoomName()));
							}
							for (String string : info.getRooms().get(i+1).get(0).getDetail()) {
								System.out.println(string);
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
			if (info.getRooms().size() > 0) {
				hotelInfo.add(info);
			}
		}
		long 끝시간 = System.currentTimeMillis();

		long 걸린시간 = 끝시간 - 시작시간;

		System.out.println("걸린 시간: " + 걸린시간 + " 밀리초");
	}

	@Test
	public void test3() {
		String a = "고급 침구<?!>LCD TV<?!>객실 금고<?!>무료 생수<?!>에어컨<?!>미니 냉장고<?!>슬리퍼<?!>암막 커튼";
		String[] b = a.split("<\\?!>");
		for (String string : b) {
			System.out.println(string);
		}
	}
}
