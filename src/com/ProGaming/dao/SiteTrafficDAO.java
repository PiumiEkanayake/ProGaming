package com.ProGaming.dao;

import java.util.ArrayList;
import java.util.logging.Logger;

public interface SiteTrafficDAO {

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(GameDAOImpl.class.getName());
	
	/**
	 * Add traffic data to traffic table
	 * @param int
	 * 			- the traffic of the database
	 */
	public void hitCounter(int count);
	
	/**
	 * 
	 * Get all list of date and the respective traffic
	 * 
	 * @return ArrayList<String>
	 * 					the traffic and the date
	 */
	public ArrayList<String> getTraffic();
}
