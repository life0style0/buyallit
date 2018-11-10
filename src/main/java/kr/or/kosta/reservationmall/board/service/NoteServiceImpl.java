package kr.or.kosta.reservationmall.board.service;



import java.util.List;

import kr.or.kosta.reservationmall.board.dao.ArticleDao;
import kr.or.kosta.reservationmall.board.dao.NoteDao;
import kr.or.kosta.reservationmall.board.dto.Article;
import kr.or.kosta.reservationmall.board.dto.Notes;
import kr.or.kosta.reservationmall.common.web.Params;


public class NoteServiceImpl implements NoteService {

	private NoteDao noteDao;

	public NoteDao getNoteDao() {
		return noteDao;
	}

	public void setNoteDao(NoteDao noteDao) {
		this.noteDao = noteDao;
	}

	@Override
	public void create_hr(Notes note) throws Exception {
	}

	@Override
	public Notes read_hr(String id) throws Exception {
		return noteDao.read_hr(id);
	}

	@Override
	public void update_hr(Notes note) throws Exception {
		
	}

	@Override
	public void delete_hr(String id) throws Exception {
		
	}

	@Override
	public List<Notes> listAll_hr() throws Exception {
		return noteDao.listAll_hr();
	}





}





