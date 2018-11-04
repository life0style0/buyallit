package kr.or.kosta.shoppingmall.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.shoppingmall.common.controller.Controller;
import kr.or.kosta.shoppingmall.common.controller.ModelAndView;

/**
 * hello.mall 요청에 대한 처리 클래스
 * @author HeoJaehyeok
 *
 */
public class AjaxController implements Controller{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException{
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		String opp = request.getParameter("opp");
		float result = 0;
		
		switch(opp){
			case "1" :
				result = num1 + num2;
				break;
			case "2" :
				result = num1 * num2;
				break;
			case "3": 
				result = num1 - num2;
				break;
			case "4": 
				result = num1 / num2;
				break;
			default:
				result = Float.MAX_VALUE;
		
		}
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = null;
		try {
			out= response.getWriter();
			out.println(result);
		}catch(IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
