package com.ProGaming.model;

/**
 * This is the Gamer model class
 * 
 * @author Rishard Akram
 * @version 1.0
 */
public class Gamer {
	

	private Integer Id;
	private String fname;
	private String lname;
	private String username;
	private String pass;
	private String email;
	private String dob;
	private String country;
	
	/**
	 * 
	 * @return Id
	 */
	public Integer getId() {
		return Id;
	}
	
	/**
	 * 
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		Id = id;
	}
	
	/**
	 * 
	 * @return fname
	 */
	public String getFname() {
		return fname;
	}
	
	/**
	 * 
	 * @param fname the fname to set
	 */
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	/**
	 * 
	 * @return lname
	 */
	public String getLname() {
		return lname;
	}
	
	/**
	 * 
	 * @param lname the lname to set
	 */
	public void setLname(String lname) {
		this.lname = lname;
	}
	
	/**
	 * 
	 * @return username
	 */
	public String getUsername() {
		return username;
	}
	
	/**
	 * 
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	
	/**
	 * 
	 * @return password
	 */
	public String getPass() {
		return pass;
	}
	
	/**
	 * 
	 * @param pass the pass to set
	 */
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	/**
	 * 
	 * @return email
	 */
	public String getEmail() {
		return email;
	}
	
	/**
	 * 
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	
	/**
	 * 
	 * @return dob
	 */
	public String getDob() {
		return dob;
	}
	
	/**
	 * 
	 * @param dob the dob to set
	 */
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	/**
	 * 
	 * @return country
	 */
	public String getCountry() {
		return country;
	}
	
	/**
	 * 
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}
	
	@Override
	public String toString() {
		return "Customer [Id=" + Id + ", fname=" + fname + ", lname=" + lname + ", username=" + username + ", pass="
				+ pass + ", email=" + email + ", dob=" + dob + ", country=" + country + "]";
	}
}
