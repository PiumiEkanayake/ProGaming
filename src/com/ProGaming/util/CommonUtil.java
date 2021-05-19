package com.ProGaming.util;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.ProGaming.dao.GamerDAO;

public class CommonUtil {

	/* Initialize logger */
	public static final Logger log = Logger.getLogger(GamerDAO.class.getName());

	public static final Properties properties = new Properties();

	static {
		try {

			// Read the property only once when load the class
			properties.load(DBConnectionUtil.class.getResourceAsStream(CommonConstants.PROPERTY_FILE));

		} catch (IOException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}

}
