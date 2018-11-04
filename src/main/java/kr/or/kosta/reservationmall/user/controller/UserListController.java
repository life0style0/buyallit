package kr.or.kosta.reservationmall.user.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.reservationmall.common.controller.Controller;
import kr.or.kosta.reservationmall.common.controller.ModelAndView;
import kr.or.kosta.reservationmall.common.factory.XMLObjectFactory;
import kr.or.kosta.reservationmall.user.domain.User;
import kr.or.kosta.reservationmall.user.service.UserService;
import kr.or.kosta.reservationmall.user.service.UserServiceImpl;

/**
 * /user/list.mall에 대한 요청 처리 컨트롤러
 * @author 김기정
 *
 */
public class UserListController implements Controller {
	
	private UserService userService;

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		ModelAndView mav = new ModelAndView();
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		userService = (UserService)factory.getBean(UserServiceImpl.class);
		
		List<User> list = null;
		try {
			list = userService.list();
		} catch (Exception e) {
			throw new ServletException("UserService.list() 예외 발생", e);
		}
		mav.addObject("list", list);
		mav.setView("/user/list.jsp");
		
		return mav;

	}
	
	

}
