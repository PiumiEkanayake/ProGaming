package com.ProGaming.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnectionUtil extends CommonUtil {

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(DBConnectionUtil.class.getName());
	// Database Properties
	private static final String URL = properties.getProperty(CommonConstants.URL);
	private static final String DRIVER = properties.getProperty(CommonConstants.DRIVER_NAME);
	private static final String USERNAME = properties.getProperty(CommonConstants.USERNAME);
	private static final String PASSWORD = properties.getProperty(CommonConstants.PASSWORD);
	private static Connection con = null;

	// This works according to singelton pattern
	private DBConnectionUtil() {

	}

	// Get the database connection
	public static Connection OpenConnection() {

		if (con != null) {
			return con;
		} else {
			try {
				Class.forName(DRIVER);
				con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

			} catch (SQLException e) {

				log.log(Level.SEVERE, e.getMessage());

			} catch (ClassNotFoundException e) {

				log.log(Level.SEVERE, e.getMessage());
			}

			return con;
		}
	}
}
