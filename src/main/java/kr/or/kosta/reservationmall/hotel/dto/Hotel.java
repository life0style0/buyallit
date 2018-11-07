package kr.or.kosta.reservationmall.hotel.dto;

public class Hotel {

	private String id;
	private String name;
	private String address;
	private String phonenum;
	private String rate;
	private String info;
	private String detail;
	private String locationName;

	public Hotel() {
	}

	public Hotel(String id, String name, String address, String phonenum, String rate, String info, String detail,
			String locationName) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.phonenum = phonenum;
		this.rate = rate;
		this.info = info;
		this.detail = detail;
		this.locationName = locationName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	@Override
	public String toString() {
		return "Hotel [id=" + id + ", name=" + name + ", address=" + address + ", phonenum=" + phonenum + ", rate="
				+ rate + ", info=" + info + ", detail=" + detail + ", locationName=" + locationName + "]";
	}
	
}
