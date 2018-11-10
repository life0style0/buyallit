package kr.or.kosta.reservationmall.individual.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

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
	public void writeReview(Review review) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		if(sqlSession.insert(NAMESPACE+"writeReview",review) >0) {
			sqlSession.commit();
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
}










