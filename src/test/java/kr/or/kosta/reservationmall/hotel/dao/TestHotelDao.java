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
						if (info.getServiceRate() ==null) {
							info.setLocationRate(hotelSearchResult.getLocationRate());
						}
						if (info.getPriceRate() ==null) {
							info.setPriceRate(hotelSearchResult.getPriceRate());
						}
						if (info.getServiceRate() ==null) {
							info.setServiceRate(hotelSearchResult.getServiceRate());
						}
						info.addRoomNames(i + 1,
								info.getRoomNames().get(i + 1) == null ? hotelSearchResult.getRoomName() : info.getRoomNames().get(i + 1)  + "," + hotelSearchResult.getRoomName());
					}
				}
			}
			if (info.getRoomNames().size() > 0) {
				hotelInfo.add(info);
			}
		}
		long 끝시간 = System.currentTimeMillis();

		long 걸린시간 = 끝시간 - 시작시간;

		System.out.println("걸린 시간: " + 걸린시간 + " 밀리초");
		
		시작시간 = System.currentTimeMillis();
		for (int hotelId : hotelIdSet) {
			info = new HotelInfo();
			info.setHotelId(hotelId);
			for (int i = 0; i < searchResult.size(); i++) {
				for (HotelSearchResult hotelSearchResult : searchResult.get(i)) {
					if (hotelSearchResult.getHotelId() == hotelId) {
						info.setCleanRate(hotelSearchResult.getCleanRate());
						info.setFoodRate(hotelSearchResult.getFoodRate());
						info.setLocationRate(hotelSearchResult.getLocationRate());
						info.setPriceRate(hotelSearchResult.getPriceRate());
						info.setServiceRate(hotelSearchResult.getServiceRate());
						info.addRoomNames(i + 1,
								info.getRoomNames().get(i + 1) == null ? hotelSearchResult.getRoomName() : info.getRoomNames().get(i + 1)  + "," + hotelSearchResult.getRoomName());
					}
				}
			}
			if (info.getRoomNames().size() > 0) {
				hotelInfo.add(info);
			}
		}
		끝시간 = System.currentTimeMillis();
		걸린시간 = 끝시간 - 시작시간;
		System.out.println("걸린 시간: " + 걸린시간 + " 밀리초");
	}

//	@Test
	public void test2() {
		HotelSearchResult result1 = new HotelSearchResult(1, null,null, null, null, null, "hi");
		HotelSearchResult result2 = new HotelSearchResult(1, null,null, null, null, null, "hi");
		System.out.println(result1.equals(result2));

		List<Integer> lists = new ArrayList<>();
		for (int i = 0; i < 100; i++) {
			lists.add(i);
		}
		System.out.println(lists);
		int max = 100;
		for (int i = 0; i < max; i++) {
			if (lists.get(i) == 1) {
				lists.remove(i--);
				max--;
				System.out.println(lists);
			}
			if (lists.get(i) == 3) {
				lists.remove(i--);
				max--;
				System.out.println(lists);
			}
		}
		System.out.println(lists.get(0));
		System.out.println(lists.get(1));

	}
	
//	@Test
	public void test3() {
		String a = "1234";
		System.out.println(a.substring(1, 3));
	}
}
