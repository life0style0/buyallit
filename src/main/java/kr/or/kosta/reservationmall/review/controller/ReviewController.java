package kr.or.kosta.reservationmall.review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.kosta.reservationmall.common.controller.Controller;
import kr.or.kosta.reservationmall.common.controller.ModelAndView;
import kr.or.kosta.reservationmall.common.factory.XMLObjectFactory;
import kr.or.kosta.reservationmall.individual.service.ReviewService;
import kr.or.kosta.reservationmall.individual.service.ReviewServiceImpl;

/**
 * hello.mall 요청에 대한 처리 클래스
 * 
 * @author HeoJaehyeok
 *
 */
public class ReviewController implements Controller {
	private ReviewService reviewService;
	Logger logger = Logger.getLogger(Controller.class);

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
		reviewService = (ReviewService) factory.getBean(ReviewServiceImpl.class);
		String type = request.getParameter("type");
		String reviewId = request.getParameter("reviewId");
		String userId = request.getParameter("userId");
		String result = "false";
		try {
			if (type != null && type.equals("like")) {
				if (reviewService.isReviewLiked(reviewId, userId).size() >= 1) {
					reviewService.deleteLikeReview(reviewId, userId);
				} else {
					reviewService.likeReview(reviewId, userId);
				}
				result = "true";
			} else if (type != null && type.equals("hate")) {
				if (reviewService.isReviewHated(reviewId, userId).size() >= 1) {
					reviewService.deleteHateReview(reviewId, userId);
				} else {
					reviewService.hateReview(reviewId, userId);
				}
				result = "true";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
