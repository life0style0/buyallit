package kr.or.kosta.reservationmall.individual.service;



import java.util.List;

import kr.or.kosta.reservationmall.individual.dao.ReservationDao;
import kr.or.kosta.reservationmall.individual.dao.ReviewDao;
import kr.or.kosta.reservationmall.individual.dto.ReservationInfo;
import kr.or.kosta.reservationmall.individual.dto.Review;


public class ReviewServiceImpl implements ReviewService {

	private ReviewDao reviewDao;

	public ReviewDao getReviewDao() {
		return reviewDao;
	}

	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}

	//리뷰 작성
	@Override
	public void writeReview(Review review) throws Exception {
		reviewDao.writeReview(review);
	}

	//리뷰 조회
	@Override
	public Review searchReviewById(int review_id) throws Exception {
		return reviewDao.searchReviewById(review_id);
	}

	//리뷰 삭제
	@Override
	public void deleteReview(int review_id) throws Exception {
		reviewDao.deleteReview(review_id);
	}

}





