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
	public List<Map<String, String>> searchHotelLists(HotelSearchParam hotelSearchParam) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Map<String, String>> result = sqlSession.selectList(NAMESPACE + "searchHotelLists", hotelSearchParam);
		sqlSession.close();
		return result;
	}
}
