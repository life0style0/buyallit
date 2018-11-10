package kr.or.kosta.reservationmall.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.kosta.reservationmall.board.dto.Article;
import kr.or.kosta.reservationmall.board.dto.Board;
import kr.or.kosta.reservationmall.board.dto.Notes;
import kr.or.kosta.reservationmall.board.service.ArticleService;
import kr.or.kosta.reservationmall.board.service.ArticleServiceImpl;
import kr.or.kosta.reservationmall.board.service.BoardService;
import kr.or.kosta.reservationmall.board.service.NoteService;
import kr.or.kosta.reservationmall.board.service.NoteServiceImpl;
import kr.or.kosta.reservationmall.common.controller.Controller;
import kr.or.kosta.reservationmall.common.controller.ModelAndView;
import kr.or.kosta.reservationmall.common.factory.XMLObjectFactory;
import kr.or.kosta.reservationmall.login.service.LoginService;
import kr.or.kosta.reservationmall.login.service.LoginServiceImpl;

/**
 * /user/list.mall에 대한 요청 처리 컨트롤러
 * @author 김기정
 *
 */
public class NoteController implements Controller {
	
	private NoteService noteService;
	Logger logger = Logger.getLogger(Controller.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		noteService = (NoteService)factory.getBean(NoteServiceImpl.class);

		System.out.println("노트 컨트롤러 서비스 스타트");

		request.getParameter("user_id");
		request.getParameter("note_question");
		
		
		
		
		return mav;
		
	}
	

}
