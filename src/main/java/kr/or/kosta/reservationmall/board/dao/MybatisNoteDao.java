package kr.or.kosta.reservationmall.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.kosta.reservationmall.board.dto.Notes;
import kr.or.kosta.reservationmall.common.web.Params;

public class MybatisNoteDao implements NoteDao {
	
	private static final String NAMESPACE = "kr.or.kosta.reservationmall.board.";
	
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public void create_hr(Notes note) throws Exception {
		
	}

	@Override
	public Notes read_hr(String id) throws Exception {
		return null;
	}

	@Override
	public void update_hr(Notes article) throws Exception {
		
	}

	@Override
	public void delete_hr(String id) throws Exception {
		
	}

	@Override
	public List<Notes> listAll_hr() throws Exception {
		List<Notes> list = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		list = sqlSession.selectList(NAMESPACE + "listAll_hr");
		sqlSession.close();
		return list;
	}

	

	
}










