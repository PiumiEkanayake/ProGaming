package com.ProGaming.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.ProGaming.model.Category;
import com.ProGaming.util.DBConnectionUtil;

public class CategoryDAOImpl implements CategoryDAO {
	
	/** Initialize logger */
	public static final Logger log = Logger.getLogger(CategoryDAOImpl.class.getName());
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	PreparedStatement PreparedStatement = null;

	/**
	 * Get all the Categories
	 * 
	 * @return Category List
	 * 
	 */
	public List<Category> get(){
		//Create reference variables
		
		List<Category> list = null;
		Category category = null;
		
		try {
			list = new ArrayList<Category>();
			//Create a sql query
			String sql = "SELECT * FROM category";
			
			//Get the database connection
			connection = DBConnectionUtil.OpenConnection();
			
			//Create a statement
			statement = connection.createStatement();
			
			//Execute the sql query
			resultSet = statement.executeQuery(sql);
			
			//Process the resultset
			while(resultSet.next()) {
				category = new Category();
				category.setCat_id(resultSet.getInt("cat_id"));
				category.setName(resultSet.getString("name"));
				category.setCat_icon(resultSet.getString("cat_icon"));
				//Add the category to list
				list.add(category);
		
			}
	
		} catch (SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		//return the list
		return list;
		
	}



	/**
	 * Adds a new Category
	 * 
	 * @param Category object
	 *            
	 * 
	 * @return return boolean
	 * 					The status of the update
	 * 
	 */
	public boolean save(Category c) {
		boolean flag = false;
		
		try {
			String sql = "INSERT INTO category(name,cat_icon)VALUES(? , ?)";
			connection = DBConnectionUtil.OpenConnection();
			PreparedStatement = connection.prepareStatement(sql);
			PreparedStatement.setString(1, c.getName());
			PreparedStatement.setString(2, c.getCat_icon());
			PreparedStatement.executeUpdate();
			flag = true;
			
		} catch (SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		return flag;
	}



	/**
	 * Get a single  Category
	 * 
	 * @param cat_id
	 *            ID of the category to display
	 * 
	 */
	public Category get(int cat_id) {
		Category category =  null;
		
		try {
			category = new Category();
			String sql = "SELECT * FROM category WHERE cat_id="+cat_id;
			connection = DBConnectionUtil.OpenConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()) {
				category.setCat_id(resultSet.getInt("cat_id")); 
				category.setName(resultSet.getString("name")); 
				category.setCat_icon(resultSet.getString("cat_icon"));
			}
			
		} catch (SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		 return category;
				
		
	}



	/**
	 * Update the Catefory
	 * 
	 *  @param Category object
	 * 
	 *	@return return boolean
	 * 					The status of the update
	 * 
	 */
	public boolean update(Category c) {
		boolean flag = false;
		
		try {
			String sql = "UPDATE category SET name='"+c.getName()+"',cat_icon = '"+c.getCat_icon()+"' where cat_id="+c.getCat_id();
			connection = DBConnectionUtil.OpenConnection();
			PreparedStatement = connection.prepareStatement(sql);
			PreparedStatement.executeUpdate();
			flag = true;
			
		} catch (SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		
		return flag;
	}


	/**
	 * Delete a  Category
	 * 
	 * @param cat_id
	 *            ID of the category to delete
	 * 
	 * @return boolean
	 * 				status of the deletion
	 */
	
	public boolean delete(int cat_id) {
		boolean flag = false;
		
		try {
			String sql = "DELETE FROM category WHERE cat_id="+cat_id;
			connection = DBConnectionUtil.OpenConnection();
			PreparedStatement = connection.prepareStatement(sql);
			PreparedStatement.executeUpdate();
			flag = true;
			
		} catch (SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		
		return flag;
		
	}
		

}
