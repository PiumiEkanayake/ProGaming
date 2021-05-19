package com.ProGaming.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.ProGaming.model.Gamer;
import com.ProGaming.util.DBConnectionUtil;

public class GamerDAOImpl implements GamerDAO {

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(GamerDAOImpl.class.getName());

	private Connection con = null;
	private Statement st = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;

	/**
	 * This method is used to add the gamers to the database
	 * 
	 * @throws SQLException         
	 * 							- Thrown when database access error occurs or
	 *                              this method is called on a closed connection
	 * @throws NullPointerException
	 * 							 - Service is not available
	 * 
	 * @return boolean -Status of the update
	 * 
	 */
	public boolean addGamer(Gamer g) {

		boolean flag = false;
		try {

			con = DBConnectionUtil.OpenConnection();
			pst = con.prepareStatement("Insert into Gamer(fname,lname,Username,Password,email,dob,Country) values (?,?,?,?,?,?,?)");

			pst.setString(1, g.getFname());
			pst.setString(2, g.getLname());
			pst.setString(3, g.getUsername());
			pst.setString(4, g.getPass());
			pst.setString(5, g.getEmail());
			pst.setString(6, g.getDob());
			pst.setString(7, g.getCountry());
			pst.executeUpdate();

			flag = true;

		} catch (SQLException | NullPointerException ex) {
			log.log(Level.SEVERE, ex.getMessage());
		}
		return flag;
	}

	/**
	 * This method is used to retrieve the gamers from the database
	 * 
	 * @throws SQLException         
	 * 							- Thrown when database access error occurs or
	 *                              this method is called on a closed connection
	 * @throws NullPointerException
	 * 							 - Service is not available
	 * 
	 * @return ArrayList<Gamer>
	 * 							- returns an array list of Gamers
	 * 
	 */
	public ArrayList<Gamer> getGamer() {

		ArrayList<Gamer> al = new ArrayList<Gamer>();

		try {

			con = DBConnectionUtil.OpenConnection();
			st = con.createStatement();
			rs = st.executeQuery("Select * from Gamer");

			while (rs.next()) {
				Gamer g = new Gamer();
				g.setId(rs.getInt("id"));
				g.setFname(rs.getString("fname"));
				g.setLname(rs.getString("lname"));
				g.setUsername(rs.getString("Username"));
				g.setPass(rs.getString("Password"));
				g.setEmail(rs.getString("email"));
				g.setDob(rs.getString("dob"));
				g.setCountry(rs.getString("Country"));

				al.add(g);

			}

		} catch (SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		return al;
	}
	
	/**
	 * This method displays a gamer based on the provided id
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection            
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *             
	 *  @return Gamer object
	 *  			-returns a gamer                  
	 *          
	 */

	public Gamer getGamerById(int id) {
		Gamer g = null;
		try {
			g = new Gamer();
			con = DBConnectionUtil.OpenConnection();
			pst = con.prepareStatement("Select * from Gamer where id = " + id);
			rs = pst.executeQuery();

			if (rs.next()) {
				g.setId(rs.getInt("id"));
				g.setFname(rs.getString("fname"));
				g.setLname(rs.getString("lname"));
				g.setUsername(rs.getString("Username"));
				g.setPass(rs.getString("Password"));
				g.setEmail(rs.getString("email"));
				g.setDob(rs.getString("dob"));
				g.setCountry(rs.getString("Country"));
			}
		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		return g;
	}
	
	/**
	 * This method updates the details of the gamer
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection           
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *  @param gamer object           
	 *  @return boolean
	 *  			returns the status of the update                
	 *          
	 */

	public boolean updateGamer(Gamer g) {

		boolean flag = false;
		try {

			con = DBConnectionUtil.OpenConnection();
			/** If email is not set it doesn't update the email */
			if (g.getEmail() == null) {
				
				pst = con.prepareStatement("Update Gamer set fname = ?,lname = ?,Username = ? ,dob = ?,Country = ? where id = "+ g.getId());

				pst.setString(1, g.getFname());
				pst.setString(2, g.getLname());
				pst.setString(3, g.getUsername());
				pst.setString(4, g.getDob());
				pst.setString(5, g.getCountry());
				
			} else {
				
				pst = con.prepareStatement("Update Gamer set fname = ?,lname = ?,Username = ? ,email = ?,dob = ?,Country = ? where id = "+ g.getId());
				pst.setString(1, g.getFname());
				pst.setString(2, g.getLname());
				pst.setString(3, g.getUsername());
				pst.setString(4, g.getEmail());
				pst.setString(5, g.getDob());
				pst.setString(6, g.getCountry());
			}

			pst.executeUpdate();

			flag = true;

		} catch (SQLException | NullPointerException ex) {
			
			log.log(Level.SEVERE, ex.getMessage());
			
		}
		return flag;
	}

	/**
	 * This method deletes a gamer based on the provided id
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection            
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *  @param gamer id          
	 *  @return boolean
	 *  			returns the status of the delete               
	 *          
	 */
	public boolean deleteGamer(int id) {

		boolean flag = false;
		try {

			con = DBConnectionUtil.OpenConnection();
			pst = con.prepareStatement("Delete from Gamer where id = " + id);
			pst.executeUpdate();
			flag = true;

		} catch (SQLException  | NullPointerException ex) {
			ex.printStackTrace();
		}
		return flag;
	}

	/**
	 * This method authenticates a gamer during the login
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection            
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *  @param gamer object          
	 *  @return int
	 *  			returns the id of the gamer if authentication is success else returns 0               
	 *          
	 */
	public int authenticate(Gamer g) {

		try {
			con = DBConnectionUtil.OpenConnection();
			pst = con.prepareStatement("Select * from Gamer where email = ? and Password = ?");
			pst.setString(1, g.getEmail());
			pst.setString(2, g.getPass());
			rs = pst.executeQuery();

			if (rs.next()) {
				int a = rs.getInt("id");
				return a;
			} else {
				return 0;
			}
		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		return 0;

	}

	/**
	 * This method checks whether old password is correct 
	 * and updates the password based on the provided id , and new password
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection            
	 *  @throws NullPointerException
	 *             - Service is not available   
	 *              
	 *  @param gamer id, old password, new Password 
	 *           
	 *  @return String
	 *  			returns the status of the password update    
	 *  			true - update Successful
	 *  			false  - Password incorrect
	 *  			error - Update failed         
	 *          
	 */
	public String updatePass(int id, String oldPass, String newPass) {

		try {

			con = DBConnectionUtil.OpenConnection();
			pst = con.prepareStatement("Select Password from gamer where id = ? and Password = ?");
			pst.setInt(1, id);
			pst.setString(2, oldPass);
			rs = pst.executeQuery();

			/** Updates the password only when the old password is correct */
			if (rs.next()) {
				pst = con.prepareStatement("Update gamer set Password = ? where id = " + id);
				pst.setString(1, newPass);
				pst.executeUpdate();
				return "true";
			} else {
				return "false";
			}
		} catch (SQLException | NullPointerException ex) {
			log.log(Level.SEVERE, ex.getMessage());
		}
		return "error";
	}

	/**
	 * This method checks whether old email is correct 
	 * and updates the email based on the provided id , and new email
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection            
	 *  @throws NullPointerException
	 *             - Service is not available   
	 *              
	 *  @param gamer id, old email, new email 
	 *           
	 *  @return String
	 *  			returns the status of the email update    
	 *  			true - update Successful
	 *  			false  - Password incorrect
	 *  			error - Update failed         
	 *          
	 */
	public String updateEmail(int id, String oldEmail, String newEmail) {

		try {

			con = DBConnectionUtil.OpenConnection();
			pst = con.prepareStatement("Select email from gamer where id = ? and email= ?");
			pst.setInt(1, id);
			pst.setString(2, oldEmail);
			rs = pst.executeQuery();

			/** Updates the email only when the old email is correct */
			if (rs.next()) {
				pst = con.prepareStatement("Update gamer set email = ? where id = " + id);
				pst.setString(1, newEmail);
				pst.executeUpdate();
				return "true";
			} else {
				return "false";
			}
		} catch (SQLException | NullPointerException ex) {
			log.log(Level.SEVERE, ex.getMessage());
		}
		return "error";

	}
	
	/**
	 * This method displays the total number of gamers in the database
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection            
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *         
	 *  @return int
	 *  			returns the number of gamers             
	 *          
	 */
	public int countGamers() {

		try {
			con = DBConnectionUtil.OpenConnection();
			st = con.createStatement();
			rs = st.executeQuery("Select count(id) from Gamer");
			int total = 0;
			
			if (rs.next()) {
				total = rs.getInt(1);
			}
			
			return total;
			
		} catch (SQLException | NullPointerException  e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		return 0;
	}

	/**
	 * This method displays the number of gamers joined each month
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection  
	 *           
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *             
	 *  @return ArrayList<String>
	 *  			-Arraylist of total no.of gamers and their respective month will return                  
	 *          
	 */ 
	public ArrayList<String> getGamersbyMonth() {

		ArrayList<String> g = new ArrayList<>();
		try {
			con = DBConnectionUtil.OpenConnection();
			st = con.createStatement();
			rs = st.executeQuery("Select monthname(JoinedDate), count(id) from Gamer group by monthname(JoinedDate)");

			while (rs.next()) {
				String month = rs.getString(1);
				int temp = rs.getInt(2);
				String count = Integer.toString(temp);
				g.add(month);
				g.add(count);
			}

			return g;
			
		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		
		return g;
	}
}
