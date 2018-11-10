package kr.or.kosta.reservationmall.common.filter;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import kr.or.kosta.reservationmall.admin.dto.Hotel;
import kr.or.kosta.reservationmall.admin.service.AdminService;
import kr.or.kosta.reservationmall.admin.service.AdminServiceImpl;
import kr.or.kosta.reservationmall.common.factory.XMLObjectFactory;
import kr.or.kosta.reservationmall.login.service.LoginService;

/**
 * 요청파라메터 한글인코딩 처리 필터
 */
public class IndexDataFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		
		chain.doFilter(request, response);
		// 후처리
	}

	@Override
	public void destroy() {	}

	

}
