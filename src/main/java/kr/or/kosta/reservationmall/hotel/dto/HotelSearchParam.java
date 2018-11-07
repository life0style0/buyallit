package kr.or.kosta.reservationmall.hotel.dto;

public class HotelSearchParam {
	private String location;
	private String startDay;
	private String endDay;
	private String standardPersonNumber;
	private String childMaxNumber;
	private String minMoney;
	private String maxMoney;
	private String rateType;
	private String rate;
	
	public HotelSearchParam() {
	}

	public HotelSearchParam(String location, String startDay, String endDay, String standardPersonNumber,
			String childMaxNumber, String minMoney, String maxMoney, String rateType, String rate) {
		super();
		this.location = location;
		this.startDay = startDay;
		this.endDay = endDay;
		this.standardPersonNumber = standardPersonNumber;
		this.childMaxNumber = childMaxNumber;
		this.minMoney = minMoney;
		this.maxMoney = maxMoney;
		this.rateType = rateType;
		this.rate = rate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	public String getStandardPersonNumber() {
		return standardPersonNumber;
	}

	public void setStandardPersonNumber(String standardPersonNumber) {
		this.standardPersonNumber = standardPersonNumber;
	}

	public String getChildMaxNumber() {
		return childMaxNumber;
	}

	public void setChildMaxNumber(String childMaxNumber) {
		this.childMaxNumber = childMaxNumber;
	}

	public String getMinMoney() {
		return minMoney;
	}

	public void setMinMoney(String minMoney) {
		this.minMoney = minMoney;
	}

	public String getMaxMoney() {
		return maxMoney;
	}

	public void setMaxMoney(String maxMoney) {
		this.maxMoney = maxMoney;
	}

	public String getRateType() {
		return rateType;
	}

	public void setRateType(String rateType) {
		this.rateType = rateType;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	@Override
	public String toString() {
		return "HotelSearchParam [location=" + location + ", startDay=" + startDay + ", endDay=" + endDay
				+ ", standardPersonNumber=" + standardPersonNumber + ", childMaxNumber=" + childMaxNumber
				+ ", minMoney=" + minMoney + ", maxMoney=" + maxMoney + ", rateType=" + rateType + ", rate=" + rate
				+ "]";
	}
	
}
