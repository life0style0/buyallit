package kr.or.kosta.reservationmall.user.domain;

public class User {
	
	private String id;
	private String passwd;
	private String name;
	private String age;
	private String address;
	private String phonenum;
	private String email;
	private String rate;
	private String regdate;
	
	public User() {
		super();
	}
	
	public User(String id, String passwd, String name, String age, String address, String phonenum, String email,
			String rate, String regdate) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.age = age;
		this.address = address;
		this.phonenum = phonenum;
		this.email = email;
		this.rate = rate;
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", passwd=" + passwd + ", name=" + name + ", age=" + age + ", address=" + address
				+ ", phonenum=" + phonenum + ", email=" + email + ", rate=" + rate + ", regdate=" + regdate + "]";
	}
	
}
