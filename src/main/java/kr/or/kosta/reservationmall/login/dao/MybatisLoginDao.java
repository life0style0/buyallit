package kr.or.kosta.reservationmall.login.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.reservationmall.common.web.Params;

public class MybatisLoginDao implements LoginDao {

	private static final String NAMESPACE = "kr.or.kosta.reservationmall.login.";

	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public boolean checkLogin_hjh(String id, String passwd) throws Exception {
		Integer user_pw = 0;

		SqlSession sqlSession = sqlSessionFactory.openSession();
		user_pw = sqlSession.selectOne(NAMESPACE + "checkLoginHjh", id);
		if (user_pw == null) {
			return false;
		}
		sqlSession.close();
		return (user_pw == Integer.parseInt(passwd)) ? true : false;
	}

}
