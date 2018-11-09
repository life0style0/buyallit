package kr.or.kosta.reservationmall.individual.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import kr.or.kosta.reservationmall.login.dto.User;



public class MybatisUserDao implements UserDao {
	
	private static final String NAMESPACE = "kr.or.kosta.reservationmall.individual.";
	
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}


	@Override
	public void create(User user) throws Exception {
		// 회원 등록
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"createUser",user);
		} catch (Exception e) {
			e.getStackTrace();
		}
		if (res >0) {
			sqlSession.commit();
		}
		sqlSession.close();
	}

	@Override
	public void update(User user) throws Exception {
		// 회원 정보 수정 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update(NAMESPACE+"updateUser",user);
		sqlSession.close();
	}

	@Override
	public void delete(String id) throws Exception {
		// 회원 탈퇴
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete(NAMESPACE+"deleteUser",id);
		sqlSession.close();
	}
	
	
}










