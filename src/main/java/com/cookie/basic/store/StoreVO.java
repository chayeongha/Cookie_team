package com.cookie.basic.store;

import java.util.List;

import com.cookie.basic.menu.MenuFilesVO;
import com.cookie.basic.menu.MenuVO;

public class StoreVO {
   
   
   private int ssNum; 
   private String sName; 
   private String sTel; 
   private String roadFullAddr; 
   private String memId;
   private String sNotice;
   private int sOn;
   private int memNum;
   
   private StoreFilesVO storeFilesVO;
   private List<MenuVO> menuVO;
   private List<MenuFilesVO> menuFilesVO;

   
   
   
   
      


public List<MenuVO> getMenuVO() {
	return menuVO;
}
public void setMenuVO(List<MenuVO> menuVO) {
	this.menuVO = menuVO;
}
public List<MenuFilesVO> getMenuFilesVO() {
	return menuFilesVO;
}
public void setMenuFilesVO(List<MenuFilesVO> menuFilesVO) {
	this.menuFilesVO = menuFilesVO;
}
public String getMemId() {
      return memId;
   }
   public void setMemId(String memId) {
      this.memId = memId;
   }
   public int getMemNum() {
      return memNum;
   }
   public void setMemNum(int memNum) {
      this.memNum = memNum;
   }
   public StoreFilesVO getStoreFilesVO() {
      return storeFilesVO;
   }
   public void setStoreFilesVO(StoreFilesVO storeFilesVO) {
      this.storeFilesVO = storeFilesVO;
   }
   
   
   public int getSsNum() {
      return ssNum;
   }
   public void setSsNum(int ssNum) {
      this.ssNum = ssNum;
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