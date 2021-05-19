package com.ProGaming.Servlet;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ProGaming.dao.CategoryDAO;
import com.ProGaming.dao.CategoryDAOImpl;
import com.ProGaming.model.Category;

/**
 * Servlet implementation class CategoryController
 */
@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(CategoryController.class.getName());

	RequestDispatcher dispatcher = null;
	// Create a ref variable for categoryDAO
	CategoryDAO categoryDAO = null;

	// Create constructor and initialize category DAO
	public CategoryController() {
		categoryDAO = new CategoryDAOImpl();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action == null) {
			action = "LIST";
		}
		switch (action) {
		case "LIST":
			listCategories(request, response);
			break;

		case "EDIT":
			getSingleCategory(request, response);
			break;

		case "DELETE":
			deleteCategory(request, response);
			break;
		case "GET":
			listCategories(request, response);
			break;
		default:
			listCategories(request, response);
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action != null) {
			listCategories(request, response);
		} else {

			String cat_id = request.getParameter("cat_id");
			String name = request.getParameter("catName");
			String icon = request.getParameter("catIcon");

			Category c = new Category();

			c.setName(name);
			c.setCat_icon(icon);
			if (cat_id.isEmpty() || cat_id == null) {
				// save operation
				categoryDAO.save(c);

			} else {

				try {
					// update
					c.setCat_id(Integer.parseInt(cat_id));
					categoryDAO.update(c);
				} catch (NumberFormatException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}

			listCategories(request, response);
		}
	}

	/**
	 * @see HttpServlet#listCategories(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *      
	 *      This method gets all the list of categories
	 */
	public void listCategories(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// call dao method to get the list of category
		List<Category> list = categoryDAO.get();

		// add the categories to request object
		request.setAttribute("list", list);
		
		String location = request.getParameter("location");

		if (location == null) {
			location = "";
		}

		/** Redirects based on the location of the request */
		switch (location) {

		case "Home":
			// get the request dispatcher
			dispatcher = request.getRequestDispatcher("/views/index.jsp");
			// forward the req and resp objects
			dispatcher.forward(request, response);

			break;

		case "Play":
			// get the request dispatcher
			dispatcher = request.getRequestDispatcher("/views/playGame.jsp");
			// forward the req and resp objects
			dispatcher.forward(request, response);

			break;

		case "allGame":
			// get the request dispatcher
			dispatcher = request.getRequestDispatcher("/views/games.jsp");
			// forward the req and resp objects
			dispatcher.forward(request, response);

			break;
		case "searchGame":
			// get the request dispatcher
			dispatcher = request.getRequestDispatcher("/views/searchGame.jsp");
			// forward the req and resp objects
			dispatcher.forward(request, response);

			break;
		case "myAccount":
			// get the request dispatcher
			dispatcher = request.getRequestDispatcher("/views/myAccount.jsp");
			// forward the req and resp objects
			dispatcher.forward(request, response);

			break;
		case "Register":
			// get the request dispatcher
			dispatcher = request.getRequestDispatcher("/views/register.jsp");
			// forward the req and resp objects
			dispatcher.forward(request, response);

			break;

		case "ADD":
			// get the request dispatcher
			dispatcher = request.getRequestDispatcher("/views/addGame.jsp");
			// forward the req and resp objects
			dispatcher.forward(request, response);
			
			break;
		
		default :
			// get the request dispatcher
			dispatcher = request.getRequestDispatcher("/views/allCategory.jsp");
			// forward the req and resp objects
			dispatcher.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#getSingleCategory(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *      
	 *      This method gets a single category based on the id
	 */
	public void getSingleCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cat_id = request.getParameter("id");
		Category category = categoryDAO.get(Integer.parseInt(cat_id));
		request.setAttribute("category", category);

		// get the request dispatcher
		dispatcher = request.getRequestDispatcher("/views/addCategory.jsp");

		// forward the req and resp objects
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#deleteCategory(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *      
	 *      This method deletes a category based on the id
	 *    
	 */
	public void deleteCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String cat_id = request.getParameter("id");
		if (categoryDAO.delete(Integer.parseInt(cat_id))) {
			request.setAttribute("message", "Record has been deleted!");
		}

		listCategories(request, response);
	}


}
