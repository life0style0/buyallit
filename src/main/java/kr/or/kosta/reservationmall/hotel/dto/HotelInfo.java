package kr.or.kosta.reservationmall.hotel.dto;

import java.util.HashMap;
import java.util.Map;

public class HotelInfo {
	private int hotelId;
	private String priceRate;
	private String foodRate;
	private String serviceRate;
	private String cleanRate;
	private String locationRate;
	private Map<Integer, String> roomNames;

	public HotelInfo() {
		roomNames = new HashMap<>();
	}

	public HotelInfo(int hotelId, String priceRate, String foodRate, String serviceRate, String cleanRate,
			String locationRate, Map<Integer, String> roomNames) {
		super();
		this.hotelId = hotelId;
		this.priceRate = priceRate;
		this.foodRate = foodRate;
		this.serviceRate = serviceRate;
		this.cleanRate = cleanRate;
		this.locationRate = locationRate;
		this.roomNames = roomNames;
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

	public Map<Integer, String> getRoomNames() {
		return roomNames;
	}

	public void setRoomNames(Map<Integer, String> roomNames) {
		this.roomNames = roomNames;
	}

	public void addRoomNames(int roomNumber, String roomName) {
		roomNames.put(roomNumber, roomName);
	}

	@Override
	public String toString() {
		return "HotelInfo [hotelId=" + hotelId + ", priceRate=" + priceRate + ", foodRate=" + foodRate
				+ ", serviceRate=" + serviceRate + ", cleanRate=" + cleanRate + ", locationRate=" + locationRate
				+ ", roomNames=" + roomNames + "]";
	}

}
