package kr.or.kosta.reservationmall.hotel.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.reservationmall.hotel.dto.HotelSearchParam;

public class MybatisHotelDao implements HotelDao {

	private static final String NAMESPACE = "kr.or.kosta.reservationmall.hotel.";

	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<Map<String, String>> searchHotelListsByLocation(HotelSearchParam hotelSearchParam) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Map<String, String>> result = sqlSession.selectList(NAMESPACE + "searchHotelListsByLocation", hotelSearchParam);
		sqlSession.close();
		return result;
	}
	
	@Override
	public List<Map<String, String>> searchHotelListsByHotel(HotelSearchParam hotelSearchParam) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Map<String, String>> result = sqlSession.selectList(NAMESPACE + "searchHotelListsByHotel", hotelSearchParam);
		sqlSession.close();
		return result;
	}
}
