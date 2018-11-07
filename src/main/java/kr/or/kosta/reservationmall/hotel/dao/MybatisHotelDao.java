package kr.or.kosta.reservationmall.hotel.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.reservationmall.common.web.Params;
import kr.or.kosta.reservationmall.hotel.dto.Hotel;

public class MybatisHotelDao implements HotelDao {
	
	private static final String NAMESPACE = "kr.or.kosta.reservationmall.login.";
	
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<Hotel> searchHotelLists(String id, String passwd) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}










