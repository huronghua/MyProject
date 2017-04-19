package com.sk.ppk.model;

import java.util.List;

public class Page {

	private int totalRecord;
	private int totalPage;
	private int pageNum;

	private int firstResult;
	private int maxResults = 6;

	private int maxPage = 6;
	private int startPage;
	private int endPage;

	private String url;
	private List list;
	
	public Page(int pageNum, int totalRecord) {
		this.pageNum = pageNum;
		this.totalRecord = totalRecord;

		// 计算总页数
		if (totalRecord % maxResults == 0) {
			this.totalPage = totalRecord / maxResults;
		} else {
			this.totalPage = totalRecord / maxResults + 1;
		}

		// 计算第一条记录
		this.firstResult = (this.pageNum - 1) * maxResults;

		// 计算开始页和结束页
		if (this.totalPage <= this.maxPage) {
			this.startPage = 1;
			this.endPage = this.totalPage;
		} else {
			this.startPage = this.pageNum - this.maxPage / 2 - 1;
			this.endPage = this.pageNum + this.maxPage / 2;
		}

		// 修正开始页和结束页
		if (this.startPage < 1) {
			this.startPage = 1;
			this.endPage = this.maxPage;
		}
		if (this.endPage > this.totalPage) {
			this.startPage = this.totalPage - this.maxPage + 1;
			this.endPage = this.totalPage;
		}
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getFirstResult() {
		return firstResult;
	}

	public void setFirstResult(int firstResult) {
		this.firstResult = firstResult;
	}

	public int getMaxResults() {
		return maxResults;
	}

	public void setMaxResults(int maxResults) {
		this.maxResults = maxResults;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

}
