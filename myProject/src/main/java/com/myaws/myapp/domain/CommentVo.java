package com.myaws.myapp.domain;

public class CommentVo {
	
	private int cidx;
	private String csubject;
	private String ccontents;
	private String cwriter;
	private String cwriteday;
	private String delyn;
	private String cip;
	private int midx;
	private int bidx;

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public String getCsubject() {
		return csubject;
	}

	public void setCsubject(String csubject) {
		this.csubject = csubject;
	}

	public String getCcontents() {
		return ccontents;
	}

	public void setCcontents(String ccontents) {
		this.ccontents = ccontents;
	}

	public String getCwriter() {
		return cwriter;
	}

	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}


	public String getCwriteday() {
		return cwriteday;
	}

	public void setCwriteday(String cwriteday) {
		this.cwriteday = cwriteday;
	}

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public String getCip() {
		return cip;
	}

	public void setCip(String cip) {
		this.cip = cip;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

}
