package kr.or.kosta.reservationmall.hotel.controller;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.common.collect.Sets;

import kr.or.kosta.reservationmall.common.controller.Controller;
import kr.or.kosta.reservationmall.common.controller.ModelAndView;
import kr.or.kosta.reservationmall.common.factory.XMLObjectFactory;
import kr.or.kosta.reservationmall.hotel.dto.HotelInfo;
import kr.or.kosta.reservationmall.hotel.dto.HotelSearchParam;
import kr.or.kosta.reservationmall.hotel.dto.HotelSearchResult;
import kr.or.kosta.reservationmall.hotel.service.HotelService;
import kr.or.kosta.reservationmall.hotel.service.HotelServiceImpl;
import kr.or.kosta.reservationmall.room.dto.Room;

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
		ModelAndView mav = new ModelAndView();
		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		hotelService = (HotelService) factory.getBean(HotelServiceImpl.class);
		Map<String, Object> paramMap = new HashMap<>();

		String type = "search";
		Set<String> set = request.getParameterMap().keySet();
		for (String key : set) {
			if (key.startsWith(type)) {
				String typeRemovedKey = key.substring(type.length());
				String[] parameters = request.getParameterValues(key);
				if (parameters.length > 1) {
					paramMap.put(typeRemovedKey, parameters);
					request.setAttribute(key, parameters);
				} else {
					paramMap.put(typeRemovedKey, parameters[0]);
					request.setAttribute(key, parameters[0]);
				}
			}
		}

		List<List<HotelSearchResult>> searchResult = new ArrayList<>();
		HotelSearchParam hotelSearchParam = null;
		for (int i = 1; i <= Integer.parseInt((String) paramMap.get("RoomNumber")); i++) {
			hotelSearchParam = new HotelSearchParam();
			addParameterValue(hotelSearchParam, paramMap, i);
			if (hotelSearchParam.getValueType().equals("searchLocation")) {
				try {
					searchResult.add(hotelService.searchHotelListsByLocation(hotelSearchParam));
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (hotelSearchParam.getValueType().equals("searchHotel")) {
				try {
					searchResult.add(hotelService.searchHotelListsByHotel(hotelSearchParam));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		Set<Integer> hotelIdSetTemp = null;
		Set<Integer> hotelIdSet = new HashSet<>();
		for (HotelSearchResult hotelSearchResult : searchResult.get(0)) {
			hotelIdSet.add(hotelSearchResult.getHotelId());
		}
		for (int i = 1; i < searchResult.size(); i++) {
			hotelIdSetTemp = new HashSet<>();
			for (HotelSearchResult hotelSearchResult : searchResult.get(i)) {
				hotelIdSetTemp.add(hotelSearchResult.getHotelId());
			}
			hotelIdSet = Sets.intersection(hotelIdSet, hotelIdSetTemp);
		}

		List<HotelInfo> hotelInfos = new ArrayList<>();
		HotelInfo info = null;
		for (int hotelId : hotelIdSet) {
			info = new HotelInfo();
			info.setHotelId(hotelId);
			for (int i = 0; i < searchResult.size(); i++) {
				for (HotelSearchResult hotelSearchResult : searchResult.get(i)) {
					if (hotelSearchResult.getHotelId() == hotelId) {
						info.setCleanRate(hotelSearchResult.getCleanRate());
						info.setFoodRate(hotelSearchResult.getFoodRate());
						info.setLocationRate(hotelSearchResult.getLocationRate());
						info.setPriceRate(hotelSearchResult.getPriceRate());
						info.setServiceRate(hotelSearchResult.getServiceRate());
						try {
							if (!info.isExistRoom(i + 1, hotelSearchResult.getRoomName())) {
								info.addRooms(i + 1,
										new Room(hotelSearchResult.getRoomName(), hotelSearchResult.getStandardNumber(),
												hotelSearchResult.getChildMaxNumber(), hotelSearchResult.getRoomInfo(),
												hotelSearchResult.getPrice(), hotelSearchResult.getRoomDetail()));
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
			if (info.getRooms().size() > 0) {
				hotelInfos.add(info);
			}
		}
		System.out.println(info);
		mav.addObject("hotelInfos", hotelInfos);

		mav.setView("/WEB-INF/view/search/search.jsp");
		return mav;
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
