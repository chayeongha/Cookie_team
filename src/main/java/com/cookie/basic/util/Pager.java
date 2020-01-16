package com.cookie.basic.util;

public class Pager {
	
	private Integer curPage;
	private Integer perPage;
	private Integer startRow;
	
	private Integer totalBlock;
	private Integer curBlock;
	private Integer startNum;
	private Integer lastNum;
	
	public void makeStartRow() {
		this.startRow = (this.getCurPage()-1)*this.getPerPage();
	}
	
	public void makePage(int totalCount) {
		int totalPage = totalCount/this.perPage;
		if(totalCount%this.perPage != 0) {
			totalPage++;
		}
		
		int perBlock = 5;
		this.totalBlock = totalPage/perBlock;
		if(totalPage%perBlock != 0) {
			totalBlock++;
		}
		
		this.curBlock = this.curPage/perBlock;
		if(this.curPage%perBlock != 0) {
			this.curBlock++;
		}
		
		this.startNum = (this.curBlock-1)*perBlock+1;
		this.lastNum = this.curBlock*perBlock;
		
		if(this.curBlock == this.totalBlock) {
			this.lastNum = totalPage;
		}
	}
	
	public Pager() {
		this.curPage=1;
		this.perPage=10;
	}

	public Integer getCurPage() {
		return curPage;
	}

	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}

	public Integer getPerPage() {
		return perPage;
	}

	public void setPerPage(Integer perPage) {
		this.perPage = perPage;
	}

	public Integer getStartRow() {
		return startRow;
	}

	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}

	public Integer getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(Integer totalBlock) {
		this.totalBlock = totalBlock;
	}

	public Integer getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(Integer curBlock) {
		this.curBlock = curBlock;
	}

	public Integer getStartNum() {
		return startNum;
	}

	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}

	public Integer getLastNum() {
		return lastNum;
	}

	public void setLastNum(Integer lastNum) {
		this.lastNum = lastNum;
	}

}
