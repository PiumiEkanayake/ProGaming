package com.ProGaming.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.ProGaming.util.DBConnectionUtil;

public class SiteTrafficDAOImpl implements SiteTrafficDAO {

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(GamerDAOImpl.class.getName());
	private Connection con = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;

	/**
	 * This method is used to add the traffic count to the database
	 * 
	 * @throws SQLException         
	 * 							- Thrown when database access error occurs or
	 *                              this method is called on a closed connection
	 * @throws NullPointerException
	 * 							 - Service is not available
	 * 
	 *
	 * 
	 */

	public void hitCounter(int count) {

		try {
			con = DBConnectionUtil.OpenConnection();
			pst = con.prepareStatement("Insert into traffic(count) values (?) ");
			pst.setInt(1, count);
			pst.executeUpdate();

		} catch (SQLException | NullPointerException e) {

			log.log(Level.SEVERE, e.getMessage());
		}
	}

	/**
	 * This method is used to list the traffic data from the database by their date
	 * 
	 * @throws SQLException         
	 * 							- Thrown when database access error occurs or
	 *                              this method is called on a closed connection
	 * @throws NullPointerException
	 * 							 - Service is not available
	 * 
	 * @return ArrayList<String>
	 * 							- returns the date and the sum of traffic as an array list
	 * 
	 */
	public ArrayList<String> getTraffic() {

		ArrayList<String> al = new ArrayList<>();
		try {

			con = DBConnectionUtil.OpenConnection();
			pst = con.prepareStatement("select sum(count),CAST(date_ AS DATE) as date from traffic group by CAST(date_ AS DATE)");
			rs = pst.executeQuery();

			while (rs.next()) {
				int temp = rs.getInt(1);
				String date = rs.getString(2);
				String number = Integer.toString(temp);
				al.add(date);
				al.add(number);
			}

			return al;

		} catch (SQLException | NullPointerException e) {

			log.log(Level.SEVERE, e.getMessage());
		}

		return al;
	}

}
