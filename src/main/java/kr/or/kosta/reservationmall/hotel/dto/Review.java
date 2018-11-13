package kr.or.kosta.reservationmall.hotel.dto;

public class Review {

	private String userId;
	private String content;
	private String date;
	private String serviceRate;
	private String priceRate;
	private String foodRate;
	private String cleanRate;
	private String locationRate;
	private String helpfulCount;

	public Review() {
	}

	public Review(String userId, String content, String date, String serviceRate, String priceRate, String foodRate,
			String cleanRate, String locationRate, String helpfulCount) {
		super();
		this.userId = userId;
		this.content = content;
		this.date = date;
		this.serviceRate = serviceRate;
		this.priceRate = priceRate;
		this.foodRate = foodRate;
		this.cleanRate = cleanRate;
		this.locationRate = locationRate;
		this.helpfulCount = helpfulCount;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getServiceRate() {
		return serviceRate;
	}

	public void setServiceRate(String serviceRate) {
		this.serviceRate = serviceRate;
	}

	public String getPriceRate() {
		return priceRate;
	}

	public void setPriceRate(String priceRate) {
		this.priceRate = priceRate;
	}

	public String getFoodRate() {
		return foodRate;
	}

	public void setFoodRate(String foodRate) {
		this.foodRate = foodRate;
	}

	public String getCleanRate() {
		return cleanRate;
	}

	public void setCleanRate(String cleanRate) {
		this.cleanRate = cleanRate;
	}

	public String getLocationRate() {
		return locationRate;
	}

	public void setLocationRate(String locationRate) {
		this.locationRate = locationRate;
	}

	public String getHelpfulCount() {
		return helpfulCount;
	}

	public void setHelpfulCount(String helpfulCount) {
		this.helpfulCount = helpfulCount;
	}

	@Override
	public String toString() {
		return "Review [userId=" + userId + ", content=" + content + ", date=" + date + ", serviceRate=" + serviceRate
				+ ", priceRate=" + priceRate + ", foodRate=" + foodRate + ", cleanRate=" + cleanRate + ", locationRate="
				+ locationRate + ", helpfulCount=" + helpfulCount + "]";
	}

}
