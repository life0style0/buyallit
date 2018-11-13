package kr.or.kosta.reservationmall.individual.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.reservationmall.individual.dto.Review;



public class MybatisReviewDao implements ReviewDao {
	
	private static final String NAMESPACE = "kr.or.kosta.reservationmall.myreview.";
	
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public void writeReview(int reservation_id, Review review) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int hotel_id=sqlSession.selectOne(NAMESPACE+"searchHotelById",reservation_id);
		review.setHotel_id(hotel_id);
		String user_id=sqlSession.selectOne(NAMESPACE+"searchUserById",reservation_id);
		review.setUser_id(user_id);
		review.setReservation_id(reservation_id);
		
		if(sqlSession.insert(NAMESPACE+"writeReview",review) >0) {
			if(sqlSession.update(NAMESPACE+"setWritingStatus",reservation_id)>0) {
				sqlSession.commit();
			}
		}
		sqlSession.close();
	}

	@Override
	public Review searchReviewById(int review_id) throws Exception {
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Review review= sqlSession.selectOne(NAMESPACE+"searchReviewById",review_id);
		sqlSession.close();
		return review;
	}

	@Override
	public void deleteReview(int review_id) throws Exception {
		
	}

	@Override
	public Review searchReviewByResId(int reservation_id) throws Exception {
		//예약번호로 리뷰 조회 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Review review= sqlSession.selectOne(NAMESPACE+"searchReviewByResId",reservation_id);
		sqlSession.close();
		return review;
	}
	
	@Override
	public List<kr.or.kosta.reservationmall.hotel.dto.Review> getReviewsByHotelId(String hotelId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<kr.or.kosta.reservationmall.hotel.dto.Review> reviews = sqlSession.selectList(NAMESPACE+"getReviewsByHotelId", hotelId);
		sqlSession.close();
		return reviews;
	}
}










