package kr.or.kosta.reservationmall.individual.dao;

import java.util.List;

import kr.or.kosta.reservationmall.individual.dto.ReservationInfo;
import kr.or.kosta.reservationmall.individual.dto.Review;
import kr.or.kosta.reservationmall.login.dto.User;




/**
 * Dao 패턴 적용을 위한 인터페이스 선언
 * @author 송주현
 *
 */
public interface ReviewDao {
	
	//리뷰 작성
	public void writeReview(Review review) throws Exception;
	
	//리뷰 조회
	public Review searchReviewById(int review_id) throws Exception;
	
	//리뷰 삭제
	public void deleteReview(int review_id) throws Exception;
	
	public List<kr.or.kosta.reservationmall.hotel.dto.Review> getReviewsByHotelId(String hotelId) throws Exception;
}
