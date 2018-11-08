package kr.or.kosta.reservationmall.hotel.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import kr.or.kosta.reservationmall.hotel.dto.HotelSearchParam;

public class TestHotelDao {
	MybatisHotelDao dao;
	
	@Before
	public void init() throws IOException {
		dao = new MybatisHotelDao();
		Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
		dao.setSqlSessionFactory(new SqlSessionFactoryBuilder().build(reader,"development"));
	}
	
	@Test
	public void test() throws Exception {
		HotelSearchParam param = new HotelSearchParam("강남구", "2018-11-09", "2018-11-11", "1", "0", "100000", "200000", "searchServiceRate", "1");
		System.out.println(dao.searchHotelLists(param));
		HotelSearchParam param2 = new HotelSearchParam("강남구", "2018-11-09", "2018-11-11", "1", "0", "", null, null, "");
		System.out.println(dao.searchHotelLists(param2));
	}
	
	//@Test
	public void test2() {
		String a = "searchMinMoney";
		System.out.println(a.startsWith("search"));
		System.out.println(a.substring("search".length()));
		System.out.println("1".equals(String.valueOf(1)));
	}
}
