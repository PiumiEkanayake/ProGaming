package com.ProGaming.dao;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.ProGaming.model.User;


public interface UserDAO {
	
	/** Initialize logger */
	public static final Logger log = Logger.getLogger(UserDAO.class.getName());
	
	/**
	 * Add user for users table
	 * @param user
	 * 
	 * @return boolean
	 */
	public boolean insertUser(User u);
	
	/**
	 * 
	 * Get all list of Users
	 * 
	 * @return ArrayList<USER>
	 */
	public ArrayList<User> getUser();
	
	/**
	 * 
	 * Get a single user
	 * 
	 * @param user Id
	 * @return user object
	 */
	public User getUserById(int id);
	
	/**
	 * 
	 * Update a single user
	 * 
	 * @param user
	 * @return boolean
	 */
	public boolean updateUser(User u);
	
	/**
	 * 
	 * Delete a single User
	 * 
	 * @param user id
	 * @return boolean
	 */
	public boolean deleteUser(int id);
	
	/**
	 * 
	 * Authenticate the user login
	 * 
	 * @param user u 
	 * @return int
	 */
	public int login(User u);
	
	/**
	 * 
	 * Authenticate and update Password
	 * 
	 * @param id, old pass, new pass
	 * @return bbolean
	 */
	public boolean UpdatePass(int id,String oldpass, String newpass);
	
	/**
	 * 
	 * Count the number of Users
	 * 
	 * 
	 * @return int
	 */
	public int countUser();
}
