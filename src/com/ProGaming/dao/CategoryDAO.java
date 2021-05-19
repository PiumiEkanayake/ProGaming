package com.ProGaming.dao;

import java.util.List;
import java.util.logging.Logger;

import com.ProGaming.model.Category;

public interface CategoryDAO {

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(CategoryDAO.class.getName());
	
	/**
	 * Get all list of Categories
	 * 
	 * @return List<Category>
	 */
	public List<Category> get();
	/**
	 * Add Category for Category table
	 * @param Category
	 */
	public boolean save(Category c);
	
	/**
	 * 
	 * Get a single Category
	 * 
	 * @param cat_d
	 * @return Category
	 */
	public Category get(int cat_id);
	
	/**
	 * 
	 * Update a single Category
	 * 
	 * @param Category
	 * @return boolean
	 */
	public boolean update(Category c);
	
	/**
	 * 
	 * Delete a single Category
	 * 
	 * @param cat id
	 * @return boolean
	 */
	public boolean delete(int cat_id);

}
