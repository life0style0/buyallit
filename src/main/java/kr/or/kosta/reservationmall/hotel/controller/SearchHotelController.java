package kr.or.kosta.reservationmall.hotel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.kosta.reservationmall.common.controller.Controller;
import kr.or.kosta.reservationmall.common.controller.ModelAndView;
import kr.or.kosta.reservationmall.common.factory.XMLObjectFactory;
import kr.or.kosta.reservationmall.hotel.dto.HotelSearchParam;
import kr.or.kosta.reservationmall.hotel.service.HotelService;
import kr.or.kosta.reservationmall.hotel.service.HotelServiceImpl;
import kr.or.kosta.reservationmall.login.service.LoginService;

/**
 * hello.mall 요청에 대한 처리 클래스
 * 
 * @author HeoJaehyeok
 *
 */
public class SearchHotelController implements Controller {
	private HotelService hotelService;
	Logger logger = Logger.getLogger(Controller.class);
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		
		XMLObjectFactory factory = (XMLObjectFactory)request.getServletContext().getAttribute("objectFactory");
		hotelService = (HotelService)factory.getBean(HotelServiceImpl.class);
		Map<String, Object> paramMap = new HashMap<>();
		Map<String, String[]> parameterMap = request.getParameterMap();
		String type = "search";
		Set<String> set = parameterMap.keySet();
		for (String key : set) {
			if (key.startsWith(type)) {
				String typeRemovedKey = key.substring(type.length());
				String[] parameters = request.getParameterValues(key);
				if (parameters.length > 1) {
					paramMap.put(typeRemovedKey, parameters);
				} else {
					paramMap.put(typeRemovedKey, parameters[0]);
				}
			}
		}
		List<HotelSearchParam> hotelSearchParams = new ArrayList<>();
		HotelSearchParam hotelSearchParam = null;
		System.out.println(paramMap);
		for (int i = 1; i <= Integer.parseInt((String) paramMap.get("RoomNumber")); i++) {
			hotelSearchParam = new HotelSearchParam();
			addParameterValue(hotelSearchParam, paramMap, i);
			hotelSearchParams.add(hotelSearchParam);
		}
		System.out.println(hotelSearchParams.size());
		for (HotelSearchParam hotelSearchParamT : hotelSearchParams) {
			try {
				hotelService.searchHotelLists(hotelSearchParamT);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	private void addParameterValue(Object bean, Map<String, Object> paramMap, int roomNumber) {
		Class cls = bean.getClass();
		Method method = null;
		Method[] methods = bean.getClass().getDeclaredMethods();
		Set<String> set = paramMap.keySet();
		for (Method method2 : methods) {
			String[] temp = method2.getName().split("\\.");
			for (String key : set) {
				String keyTemp = key;
				if (key.substring(key.length() - 1).equals(String.valueOf(roomNumber))) {
					keyTemp = key.substring(0, key.length() - 1);
				}
				if (temp[temp.length - 1].equals("set" + keyTemp)) {
					method = method2;
					String value = (String) paramMap.get(key);
					try {
						method.invoke(bean, value);
					} catch (Exception e) {
						e.printStackTrace();
					}
					break;
				}
			}
		}
	}
}
