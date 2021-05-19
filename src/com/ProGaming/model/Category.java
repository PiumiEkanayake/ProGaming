package com.ProGaming.model;

/**
 * This is the Category model class
 * 
 * @author Jayani Wickramathilaka
 * @version 1.0
 */
public class Category {
	
		/**
		 * define the fields
		 */
		private Integer cat_id;
		private  String name;
		private String cat_icon;
		
	
		/**
		 * Generate the setters and Getters
		 */
		
		/**
		 * @return the category id
		 */
		public Integer getCat_id() {
			return cat_id;
		}
		
		/**
		 * @param cat_id the cat_id to set
		 */
		public void setCat_id(Integer cat_id) {
			this.cat_id = cat_id;
		}
		
		/**
		 * @return name
		 */
		public String getName() {
			return name;
		}
		
		/**
		 * 
		 * @param name the category name to set
		 */
		public void setName(String name) {
			this.name = name;
		}
		
		/**
		 * 
		 * @return cat_icon
		 */
		public String getCat_icon() {
			return cat_icon;
		}
		
		/**
		 * 
		 * @param cat_icon the cat_icon to set
		 */
		public void setCat_icon(String cat_icon) {
			this.cat_icon = cat_icon;
		}
		
		@Override
		public String toString() {
			return "Category [cat_id=" + cat_id + ", name=" + name + ", cat_icon=" + cat_icon + "]";
		}
		
		
}
