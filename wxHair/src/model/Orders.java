package model;

public class Orders {
	private int id;
	private int user_id;
	private int shop_id;
	private String service;
	private String stylist;
	private String price;
	private String needTime;
	private String time;
	private String shopName;
	private String shopAddress;
	private String userName;
	private String stat;
	private int waitNum;
	
	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public Orders(){
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getShop_id() {
		return shop_id;
	}

	public void setShop_id(int shop_id) {
		this.shop_id = shop_id;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getStylist() {
		return stylist;
	}

	public void setStylist(String stylist) {
		this.stylist = stylist;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getNeedTime() {
		return needTime;
	}

	public void setNeedTime(String needTime) {
		this.needTime = needTime;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public int getWaitNum() {
		return waitNum;
	}

	public void setWaitNum(int waitNum) {
		this.waitNum = waitNum;
	}
	
	
	
}
