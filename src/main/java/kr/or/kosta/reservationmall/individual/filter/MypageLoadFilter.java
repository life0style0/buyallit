package kr.or.kosta.reservationmall.individual.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;

import kr.or.kosta.reservationmall.common.factory.XMLObjectFactory;
import kr.or.kosta.reservationmall.individual.dto.ReservationInfo;
import kr.or.kosta.reservationmall.individual.service.ReservationService;
import kr.or.kosta.reservationmall.individual.service.ReservationServiceImpl;
import kr.or.kosta.reservationmall.individual.service.UserService;
import kr.or.kosta.reservationmall.individual.service.UserServiceImpl;
import kr.or.kosta.reservationmall.login.dto.User;


/**
 * 마이페이지로 이동 시 사용자 정보/ 예약 정보/ 위시리스트 정보 받아오기
 */
public class MypageLoadFilter implements Filter {
	
	private Logger logger = Logger.getLogger(MypageLoadFilter.class);
	
//	private String loginPage = "/user/login.jsp";
//	private String loginPage;
	private UserService userService;
	private ReservationService reservationService;

    @Override
	public void init(FilterConfig filterConfig) throws ServletException {
    //	loginPage = filterConfig.getInitParameter("loginPage");
	}

    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	logger.debug("MypageLoadFilter 실행..");
		//boolean isLogin = false;
    	XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
    	userService= (UserService) factory.getBean(UserServiceImpl.class);
    	reservationService= (ReservationService) factory.getBean(ReservationServiceImpl.class);
    	
		String userId= (String) request.getAttribute("userId");
		logger.debug("MypageLoadFilter : "+userId);
		if(userId != null) {
			User user= new User();
			List<ReservationInfo> resList= new ArrayList<ReservationInfo>();
			
			try {
				//해당 userId로 유저 정보, 예약 정보, 위시리스트 정보 가져오기
				user= userService.searchById(userId);
				logger.debug(user);
				logger.debug(user.getUser_id()+" : "+user.getUser_pw());
				System.out.println("userId :" + userId );
				resList= reservationService.listAllReservations(userId);
				logger.debug(resList);
				
				// request.setAttribute(유저 정보, 예약 정보, 위시리스트 정보) 
				request.setAttribute("user", user);
				request.setAttribute("resList", resList);
			} catch (Exception e) {
				logger.debug(" * MypageFilter 에러 ");
				logger.debug(e.getMessage());
			}
		}
		
		chain.doFilter(request, response);
		
	}
    
    @Override
	public void destroy() {}

}
