package com.ProGaming.dao;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.ProGaming.model.Gamer;



public interface GamerDAO {

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(GamerDAO.class.getName());
	
	/**
	 * Add Gamer for gamers table
	 * @param gamer
	 */
	boolean addGamer(Gamer g);
	
	/**
	 * 
	 * Get all list of Gamers
	 * 
	 * @return ArrayList<GAMER>
	 */
	public ArrayList<Gamer> getGamer();
	
	/**
	 * 
	 * Get a single Gamer
	 * 
	 * @param gamerId
	 * @return gamer
	 */
	public Gamer getGamerById(int id);
	
	/**
	 * 
	 * Update a single Gamer
	 * 
	 * @param gamer
	 * @return boolean
	 */
	public boolean updateGamer(Gamer c);
	
	/**
	 * 
	 * Delete a single Gamer
	 * 
	 * @param gamer id
	 * @return boolean
	 */
	public boolean deleteGamer(int id);
	
	/**
	 * 
	 * Authenticate the gamer login
	 * 
	 * @param gamer g
	 * @return int
	 */
	public int authenticate(Gamer g);
	
	/**
	 * 
	 * Authenticate and update password
	 * 
	 * @param id , old Password , new Password
	 * @return String
	 */
	public String updatePass(int id,String oldPass, String newPass);
	
	/**
	 * 
	 * Authenticate and update email
	 * 
	 * @param id, old Email, new Email
	 * @return String
	 */
	public String updateEmail(int id,String oldEmail, String newEmail);
	
	/**
	 * 
	 * Count the number of gamers
	 * 
	 * 
	 * @return int
	 */
	public int countGamers();
	
	/**
	 * 
	 * Displays the count of gamers joined each month
	 * 
	 * 
	 * @return Array List
	 */
	
	public ArrayList <String> getGamersbyMonth();
}
