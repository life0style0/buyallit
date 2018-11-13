package kr.or.kosta.reservationmall.individual.dao;

import java.util.List;
import java.util.Map;

import kr.or.kosta.reservationmall.individual.dto.Review;




/**
 * Dao 패턴 적용을 위한 인터페이스 선언
 * @author 송주현
 *
 */
public interface ReviewDao {
	
	//리뷰 작성
	public void writeReview(int reservation_id, Review review) throws Exception;
	
	//리뷰 조회
	public Review searchReviewById(int review_id) throws Exception;

	//예약번호로 리뷰 조회
	public Review searchReviewByResId(int reservation_id) throws Exception;
	
	//리뷰 삭제
	public void deleteReview(int review_id) throws Exception;
	
	public List<kr.or.kosta.reservationmall.hotel.dto.Review> getReviewsByHotelId(String hotelId) throws Exception;
	
	public List<String> isReviewLiked(String reviewIds, String userId) throws Exception;
	
	public List<String> isReviewHated(String reviewIds, String userId) throws Exception;
	
	public void likeReview(String reviewId, String userId) throws Exception;
	
	public void hateReview(String reviewId, String userId) throws Exception;

	public void deleteLikeReview(String reviewId, String userId) throws Exception;
	
	public void deleteHateReview(String reviewId, String userId) throws Exception;
	
	public String getReviewCountById(String reviewId) throws Exception;
}
