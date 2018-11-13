package kr.or.kosta.reservationmall.hotel.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.reservationmall.hotel.dto.HotelRateAvg;
import kr.or.kosta.reservationmall.hotel.dto.HotelRoomAvg;

public class MybatisHotelStatisDao implements HotelStatisDao {

	private static final String NAMESPACE = "kr.or.kosta.reservationmall.statis.";

	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public HotelRateAvg getHotelRateAvg() throws Exception {
		HotelRateAvg hotelRateAvg = new HotelRateAvg();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		hotelRateAvg = sqlSession.selectOne(NAMESPACE + "getHotelRateAvg");
		sqlSession.close();
		return hotelRateAvg;
	}

	@Override
	public HotelRoomAvg getHotelRoomAvg() throws Exception {
		HotelRoomAvg hotelRoomAvg = new HotelRoomAvg();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		hotelRoomAvg = sqlSession.selectOne(NAMESPACE + "getHotelRoomAvg");
		sqlSession.close();
		return hotelRoomAvg;
	}

	
}
