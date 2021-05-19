package com.ProGaming.model;

/**
 * This is the Game model class
 * 
 * @author Piumi Ekanayake
 * @version 1.0
 */
public class Game {

	private int gID;
	private String gName;
	private int gCat[];
	private String gDes;
	private String gInst;
	private String gImg;
	private String gLink;
	
	/**
	 * 
	 * @return game ID
	 */
	public int getgID() {
		return gID;
	}
	
	/**
	 * 
	 * @param gID the gameId to set
	 */
	public void setgID(int gID) {
		this.gID = gID;
	}
	
	/**
	 * 
	 * @return gName
	 */
	public String getgName() {
		return gName;
	}
	
	/**
	 * 
	 * @param gName the gName to set
	 */
	public void setgName(String gName) {
		this.gName = gName;
	}

	/**
	 * 
	 * @return gCat array
	 */
	public int[] getgCat() {
		return gCat;
	}
	
	/**
	 * 
	 * @param gCat the gCat to set
	 */
	public void setgCat(int[] gCat) {
		this.gCat = gCat;
	}
	
	/**
	 * 
	 * @return gDes
	 */
	public String getgDes() {
		return gDes;
	}
	
	/**
	 * 
	 * @param gDes the gdes to set
	 */
	public void setgDes(String gDes) {
		this.gDes = gDes;
	}
	
	/**
	 * 
	 * @return gInst
	 */
	public String getgInst() {
		return gInst;
	}
	
	/**
	 * 
	 * @param gInst the gInst to set
	 */
	public void setgInst(String gInst) {
		this.gInst = gInst;
	}
	
	/**
	 * 
	 * @return gImg
	 */
	public String getgImg() {
		return gImg;
	}
	
	/**
	 * 
	 * @param gImg the gImg to set
	 */
	public void setgImg(String gImg) {
		this.gImg = gImg;
	}
	
	/**
	 * 
	 * @return gLink
	 */
	public String getgLink() {
		return gLink;
	}
	
	/**
	 * 
	 * @param gLink the glink to return
	 */
	public void setgLink(String gLink) {
		this.gLink = gLink;
	}
	@Override
	public String toString() {
		return "Game [gID=" + gID + ", gName=" + gName + ", gCat=" + gCat + ", gDes=" + gDes + ", gImg=" + gImg
				+ ", gLink=" + gLink + "]";
	}
	
}
