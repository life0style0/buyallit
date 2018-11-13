package kr.or.kosta.reservationmall.individual.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import kr.or.kosta.reservationmall.hotel.service.HotelService;
import kr.or.kosta.reservationmall.hotel.service.HotelServiceImpl;
import kr.or.kosta.reservationmall.individual.dto.ReservationInfo;
import kr.or.kosta.reservationmall.individual.service.GetWishlistService;
import kr.or.kosta.reservationmall.individual.service.GetWishlistServiceImpl;
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
	private HotelService hotelService;
	private GetWishlistService getWishlistService;
	
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
    	reservationService= (ReservationService) factory.getBean(ReservationServiceImpl.class); //예약정보
    	getWishlistService= (GetWishlistService)factory.getBean(GetWishlistServiceImpl.class); //위시리스트 호텔 아이디 목록 가져오기
    	hotelService = (HotelService)factory.getBean(HotelServiceImpl.class); //위시리스트 호텔 이미지 가져오기
    	
    	
		String userId= (String) request.getAttribute("userId");
		logger.debug("MypageLoadFilter : "+userId);
		if(userId != null) {
			User user= new User();
			List<ReservationInfo> resList= new ArrayList<ReservationInfo>(); //예약정보 
			List<Integer> wishlist= new ArrayList<Integer>(); //위시리스트의 호텔id
			Map<String, List<String>> wishHotelImages = null; //위시리스트의 호텔id별 이미지들
			Map<String, List<String>> resHotelImages = null; //예약리스트의 호텔id별 이미지들
			
			try {
				//해당 userId로 유저 정보, 예약 정보, 위시리스트 정보 가져오기
				user= userService.searchById(userId);
				logger.debug("~~~~~"+user.getUser_id()+" : "+user.getUser_pw());
				resList= reservationService.listAllReservations(userId);
				logger.debug("~~~~예약정보 !! "+resList);
				wishlist= getWishlistService.getWishlist(userId);
				logger.debug("~~~~~wishlist"+wishlist);
				
				String wishHotelIds = "";
				for (int hotelId : wishlist) {
					wishHotelIds += hotelId + ",";
				}
				logger.debug("~~~~~wishHotelIds"+wishHotelIds);
				wishHotelImages = hotelService.getHotelImages(wishHotelIds.substring(0, wishHotelIds.length() - 1));
				logger.debug("~~~~~wishHotelImages"+wishHotelImages);
				
				String resHotelIds = "";
				for (ReservationInfo resInfo : resList) {
					//int hId= resInfo.getHotel_id();
					resHotelIds += resInfo.getHotel_id() + ",";
				}
				logger.debug("~~~~~resHotelIds"+resHotelIds);
				resHotelImages = hotelService.getHotelImages(resHotelIds.substring(0, resHotelIds.length() - 1));
				logger.debug("~~~~~resHotelImages"+resHotelImages);
				
				// request.setAttribute(유저 정보, 예약 정보, 위시리스트 정보) 
				request.setAttribute("user", user);
				request.setAttribute("resList", resList);
				request.setAttribute("resHotelImages", resHotelImages);
				request.setAttribute("wishlistIds", wishlist);
				request.setAttribute("wishHotelImages", wishHotelImages);
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
