package com.cookie.basic.store;

public class StoreVO {
	
	
	private int sNum; 
	private String sName; 
	private String sTel; 
	private String roadFullAddr; 
	private String id;
	private String sNotice;
	private int sOn;
	
	private StoreFilesVO storeFilesVO;
	
	
	
	
	
	public StoreFilesVO getStoreFilesVO() {
		return storeFilesVO;
	}
	public void setStoreFilesVO(StoreFilesVO storeFilesVO) {
		this.storeFilesVO = storeFilesVO;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getsNum() {
		return sNum;
	}
	public void setsNum(int sNum) {
		this.sNum = sNum;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsTel() {
		return sTel;
	}
	public void setsTel(String sTel) {
		this.sTel = sTel;
	}
	

	public String getRoadFullAddr() {
		return roadFullAddr;
	}
	public void setRoadFullAddr(String roadFullAddr) {
		this.roadFullAddr = roadFullAddr;
	}
	public int getsOn() {
		return sOn;
	}
	public void setsOn(int sOn) {
		this.sOn = sOn;
	}
	public String getsNotice() {
		return sNotice;
	}
	public void setsNotice(String sNotice) {
		this.sNotice = sNotice;
	} 
	
	
	
	

}
