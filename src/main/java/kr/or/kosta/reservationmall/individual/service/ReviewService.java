package kr.or.kosta.reservationmall.individual.service;

import java.util.List;

import kr.or.kosta.reservationmall.individual.dto.ReservationInfo;
import kr.or.kosta.reservationmall.individual.dto.Review;

/**
 * 마이페이지 리뷰 기능 처리 
 * @author 송주현
 */
public interface ReviewService {
	
	//리뷰 작성
	public void writeReview(Review review) throws Exception;
	
	//리뷰 조회
	public Review searchReviewById(int review_id) throws Exception;
	
	//리뷰 삭제
	public void deleteReview(int review_id) throws Exception;
	
}
