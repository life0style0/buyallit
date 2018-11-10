package kr.or.kosta.reservationmall.admin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.reservationmall.admin.dto.Hotel;
import kr.or.kosta.reservationmall.admin.dto.Rooms;
import kr.or.kosta.reservationmall.common.web.Params;

public class MybatisAdminDao implements AdminDao {
	
	private static final String NAMESPACE = "kr.or.kosta.reservationmall.admin.";
	
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public boolean create_hotel_info(Hotel hotel) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean create_rooms_info(Rooms rooms) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<Hotel> getHotelList() throws Exception {
		ArrayList<Hotel> hotelList = new ArrayList<>();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		hotelList = (ArrayList)sqlSession.selectList(NAMESPACE+"getHotelList");
		sqlSession.close();
		return hotelList;
	}
	
	
	
}










