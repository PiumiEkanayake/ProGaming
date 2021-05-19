package com.ProGaming.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ProGaming.dao.UserDAO;
import com.ProGaming.dao.UserDAOImpl;
import com.ProGaming.model.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(UserController.class.getName());
	
	/** Initialize variables */
	UserDAO UserDAO = null;
	RequestDispatcher dispatcher = null;

	public UserController() {
		super();
		UserDAO = new UserDAOImpl();
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
		
		/** Redirects based on the request */
		switch (action) {

		case "LIST":
			displayUsers(request, response);
			break;

		case "EDIT":
			getSingleUser(request, response);
			break;
		case "ACCOUNT":
			getSingleUser(request, response);
			break;

		case "DELETE":
			deleteUser(request, response);
			break;
		case "Dashboard":
			dashUser(request, response);
			break;

		default:
			displayUsers(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		User u = new User();
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String username = req.getParameter("uid");
		String password = req.getParameter("psw");
		String id = req.getParameter("id");
		String action = req.getParameter("action");
		String newpass = req.getParameter("pass");

		u.setEmail(email);
		u.setPassword(password);
		u.setName(name);
		u.setPhone(phone);
		u.setUsername(username);

		if (action == null) {
			action = "LIST";
		}
		if (action.equals("login")) {

			int status = UserDAO.login(u);

			/** Executes when login is succcess */
			if (status > 0) {
				User u1 = UserDAO.getUserById(status);
				HttpSession sessionAdmin = req.getSession();
				sessionAdmin.setAttribute("Email", u.getEmail());
				sessionAdmin.setAttribute("Id", status);
				sessionAdmin.setAttribute("uname", u1.getUsername());
				dashUser(req, res);

			} else {
				req.setAttribute("msg", "Invalid Credentials, Please try again");
				dispatcher = req.getRequestDispatcher("views/adminLogin.jsp");
				dispatcher.forward(req, res);
			}

		} else if (action.equals("UpdatePass")) {

			boolean result;
			result = UserDAO.UpdatePass(Integer.parseInt(id), password, newpass);

			if (result == true) {
				req.setAttribute("notification", "Password Updated Successfully");
			} else {
				req.setAttribute("alert", "Incorrect Password, Please try again");
			}
		} else {

			if (id == null || id.isEmpty()) {
				UserDAO.insertUser(u);
			} else {
				u.setId(Integer.parseInt(id));
				UserDAO.updateUser(u);
				req.setAttribute("notification", "Update Successful");
			}

		}

		if (action.equals("ACCOUNT") || action.equals("UpdatePass")) {
			getSingleUser(req, res);
		} else if (action.equals("LIST")) {
			displayUsers(req, res);
		}

	}

	/**
	 * @see HttpServlet#displayUsers(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * 	This method displays all the users 
	 */
	protected void displayUsers(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ArrayList<User> ul = new ArrayList<User>();

		ul = UserDAO.getUser();

		req.setAttribute("list", ul);

		dispatcher = req.getRequestDispatcher("views/allUsers.jsp");
		dispatcher.forward(req, res);
	}

	/**
	 * @see HttpServlet#getSingleUser(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * 		This method displays a user based on the id
	 */
	protected void getSingleUser(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			String temp = req.getParameter("id");
			int id = Integer.parseInt(temp);
			String action = req.getParameter("action");
			User u = UserDAO.getUserById(id);
			req.setAttribute("user", u);
	
			if (action != null && action.equals("ACCOUNT") || action.equals("UpdatePass")) {
				req.setAttribute("id", id);
				dispatcher = req.getRequestDispatcher("views/adminAccount.jsp");
				dispatcher.forward(req, res);
			} else {
	
				dispatcher = req.getRequestDispatcher("views/addUser.jsp");
				dispatcher.forward(req, res);
			}
		}catch(NumberFormatException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#deleteUser(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * 	This method deletes a user based on the id
	 */
	protected void deleteUser(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			String temp = req.getParameter("id");
			int id = Integer.parseInt(temp);
			if (UserDAO.deleteUser(id)) {
				req.setAttribute("msg", "User Deleted Successfully");
			}
			displayUsers(req, res);
		}catch(NumberFormatException e){
			log.log(Level.SEVERE, e.getMessage());
		}

	}

	/**
	 * @see HttpServlet#dashUser(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * Displays user details required for the dashboard
	 */
	protected void dashUser(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int total = UserDAO.countUser();
		req.setAttribute("utotal", total);
		dispatcher = req.getRequestDispatcher("GamerController?action=Dashboard");
		dispatcher.forward(req, res);

	}

}
