package kr.or.kosta.reservationmall.hotel.dto;

public class HotelSearchResult {
	private int hotelId;
	private String priceRate;
	private String foodRate;
	private String serviceRate;
	private String cleanRate;
	private String locationRate;
	private String roomName;

	public HotelSearchResult() {
	}

	public HotelSearchResult(int hotelId, String priceRate, String foodRate, String serviceRate, String cleanRate,
			String locationRate, String roomName) {
		super();
		this.hotelId = hotelId;
		this.priceRate = priceRate;
		this.foodRate = foodRate;
		this.serviceRate = serviceRate;
		this.cleanRate = cleanRate;
		this.locationRate = locationRate;
		this.roomName = roomName;
	}

	public int getHotelId() {
		return hotelId;
	}

	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
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

	public String getServiceRate() {
		return serviceRate;
	}

	public void setServiceRate(String serviceRate) {
		this.serviceRate = serviceRate;
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

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "HotelSearchResult [hotelId=" + hotelId + ", priceRate=" + priceRate + ", foodRate=" + foodRate
				+ ", serviceRate=" + serviceRate + ", cleanRate=" + cleanRate + ", locationRate=" + locationRate
				+ ", roomName=" + roomName + "]";
	}

	@Override
	public boolean equals(Object obj) {
		HotelSearchResult result = (HotelSearchResult) obj;
		return (result.getHotelId() + result.getRoomName()).equals(hotelId + roomName);
	}

}
