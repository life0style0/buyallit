package kr.or.kosta.reservationmall.note.controller;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.kosta.reservationmall.common.controller.Controller;
import kr.or.kosta.reservationmall.common.controller.ModelAndView;
import kr.or.kosta.reservationmall.common.factory.XMLObjectFactory;
import kr.or.kosta.reservationmall.note.dto.Notes;
import kr.or.kosta.reservationmall.note.service.NoteService;
import kr.or.kosta.reservationmall.note.service.NoteServiceImpl;

/**
 * 노트 등록 처리 
 * note 추가를 위한 요청 컨트롤러 설정 
 * @author 이혜림
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

		System.out.println("################## 노트 컨트롤러 서비스 스타트 ##################");

		String user_id = request.getParameter("user_id");
		String note_email = request.getParameter("note_email");
		String note_question = request.getParameter("note_question");
		
		Notes note = new Notes();
		note.setUser_id(user_id);
		note.setNote_email(note_email);
		note.setNote_question(note_question);
		
		System.out.println(user_id);
		System.out.println(note_email);
		System.out.println(note_question);

		try {
			System.out.println(note);
			
			noteService.create_hr(note);
			
			mav.addObject("addResult", "success");
			System.out.println("쪽지 등록 중 : " + note);
			
			System.out.println("모델 & 뷰 내용 확인" + mav);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			
			mav.addObject("addResult", "fail");
		}
		
		// 쪽지 등록 확인 페이지로 이동
		mav.setView("redirect:/reservationmall/index.jsp");
		return mav;
		
	}
	

}
