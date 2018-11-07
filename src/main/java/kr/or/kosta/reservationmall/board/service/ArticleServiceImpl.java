package kr.or.kosta.reservationmall.board.service;



import java.util.List;

import kr.or.kosta.reservationmall.board.dao.ArticleDao;
import kr.or.kosta.reservationmall.board.dto.Article;
import kr.or.kosta.reservationmall.common.web.Params;


public class ArticleServiceImpl implements ArticleService {

	private ArticleDao articleDao;

	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	@Override
	public void create_hr(Article article) throws Exception {
	}

	@Override
	public Article read_hr(String id) throws Exception {
		return articleDao.read_hr(id);
	}

	@Override
	public void update_hr(Article article) throws Exception {
		
	}

	@Override
	public void delete_hr(String id) throws Exception {
		
	}

	@Override
	public List<Article> listAll_hr() throws Exception {
		return articleDao.listAll_hr();
	}

	@Override
	public List<Article> listByPage_hr(int page) throws Exception {
		return null;
	}

	@Override
	public List<Article> listByPage_hr(int page, int listSize, String searchType, String searchValue) throws Exception {
		return null;
	}

	@Override
	public List<Article> listByPage_hr(Params params) throws Exception {
		return null;
	}

	@Override
	public int countBySearch_hr(String searchType, String searchValue) throws Exception {
		return 0;
	}

	@Override
	public int countBySearch_hr(Params params) throws Exception {
		return 0;
	}

	@Override
	public void increaseHitCount_hr(String id) throws Exception {
		
	}
	






}





