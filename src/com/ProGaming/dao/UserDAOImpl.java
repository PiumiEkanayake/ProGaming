package com.ProGaming.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.ProGaming.model.User;
import com.ProGaming.util.DBConnectionUtil;

public class UserDAOImpl implements UserDAO {

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(UserDAOImpl.class.getName());

	boolean isSuccess;
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;

	/**
	 * Adds a user to the database
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection         
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *             
	 *  @return boolean
	 *  			-Status of the update                   
	 *          
	 */     
	public boolean insertUser(User u) {

		boolean isSuccess = false;

		try {
			con = DBConnectionUtil.OpenConnection();

			String sql = "Insert into user(name,uname,pass,email,phone) values (?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getUsername());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getEmail());
			pstmt.setString(5, u.getPhone());

			int result = pstmt.executeUpdate();

			if (result > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		return isSuccess;
	}

	/**
	 * This method is used to retrieve the users from the database
	 * 
	 * @throws SQLException         
	 * 							- Thrown when database access error occurs or
	 *                              this method is called on a closed connection
	 * @throws NullPointerException
	 * 							 - Service is not available
	 * 
	 * @return ArrayList<Userr>
	 * 							- returns an array list of users
	 * 
	 */
	public ArrayList<User> getUser() {

		ArrayList<User> u = new ArrayList<>();

		try {
			con = DBConnectionUtil.OpenConnection();
			stmt = con.createStatement();
			String sql = "select * from user ";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				User us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setUsername(rs.getString(3));
				us.setPassword(rs.getString(4));
				us.setEmail(rs.getString(5));
				us.setPhone(rs.getString(6));

				u.add(us);
			}

		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		return u;
	}

	/**
	 * This method displays a user based on the provided id
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection            
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *             
	 *  @return user object
	 *  			-returns a user                 
	 *          
	 */
	public User getUserById(int id) {

		User us = new User();

		try {
			con = DBConnectionUtil.OpenConnection();
			stmt = con.createStatement();
			String sql = "select * from user where id = " + id;
			rs = stmt.executeQuery(sql);

			if (rs.next()) {

				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setUsername(rs.getString(3));
				us.setPassword(rs.getString(4));
				us.setEmail(rs.getString(5));
				us.setPhone(rs.getString(6));
			}

		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		return us;
	}

	/**
	 * This method updates the details of the user
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
	public boolean updateUser(User u) {

		boolean isSuccess = false;

		try {
			con = DBConnectionUtil.OpenConnection();

			String sql = "Update user set name = ?, uname = ?,email = ?,phone = ? where id = " + u.getId();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getUsername());
			pstmt.setString(3, u.getEmail());
			pstmt.setString(4, u.getPhone());

			int result = pstmt.executeUpdate();

			if (result > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		return isSuccess;

	}

	/**
	 * This method deletes a user based on the provided id
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
	public boolean deleteUser(int id) {

		try {
			con = DBConnectionUtil.OpenConnection();

			String sql = "delete from user where id = " + id;
			pstmt = con.prepareStatement(sql);
			int rs = pstmt.executeUpdate();

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		return isSuccess;
	}

	/**
	 * This method authenticates a user during the login
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection            
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *  @param user object          
	 *  @return int
	 *  			returns the id of the user if authentication is success else returns 0               
	 *          
	 */
	public int login(User u) {

		try {
			con = DBConnectionUtil.OpenConnection();
			pstmt = con.prepareStatement("Select * from user where email = ? and pass = ?");
			pstmt.setString(1, u.getEmail());
			pstmt.setString(2, u.getPassword());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int id = rs.getInt("id");
				return id;
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
	 *  @param user id, old password, new Password 
	 *           
	 *  @return String
	 *  			returns the status of the password update    
	 *  			true - update Successful
	 *  			false  - Password incorrect
	 *  			error - Update failed         
	 *          
	 */
	public boolean UpdatePass(int id, String oldpass, String newpass) {

		try {

			con = DBConnectionUtil.OpenConnection();
			pstmt = con.prepareStatement("Select pass from user where id = ? and pass = ?");

			pstmt.setInt(1, id);
			pstmt.setString(2, oldpass);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				pstmt = con.prepareStatement("Update user set pass = ? where id = " + id);
				pstmt.setString(1, newpass);
				pstmt.executeUpdate();
				return true;
			} else {
				return false;
			}
		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		return false;
	}

	/**
	 * This method displays the total number of users in the database
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection            
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *         
	 *  @return int
	 *  			returns the number of users             
	 *          
	 */
	public int countUser() {

		try {
			con = DBConnectionUtil.OpenConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("Select count(id) from user");
			int total = 0;
			
			if (rs.next()) {
				total = rs.getInt(1);
			}

			return total;
			
		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		return 0;
	}
}
