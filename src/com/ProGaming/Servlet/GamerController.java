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
import com.ProGaming.dao.GamerDAO;
import com.ProGaming.dao.GamerDAOImpl;
import com.ProGaming.model.Gamer;

/**
 * Servlet implementation class gamerController
 */
@WebServlet("/GamerController")
public class GamerController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(GamerController.class.getName());

	/** Initialize variables */
	GamerDAO gamerdao = null;
	RequestDispatcher dispatcher = null;

	public GamerController() {
		super();
		gamerdao = new GamerDAOImpl();
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

		/** Redirects based on the response */
		switch (action) {

		case "LIST":
			listGamers(request, response);
			break;

		case "EDIT":
		case "ACCOUNT":
		case "updateAccount":
			getSingleGamer(request, response);
			break;

		case "Dashboard":
			listGamers(request, response);
			break;

		case "DELETE":
			deleteGamer(request, response);
			break;

		default:
			listGamers(request, response);
			break;

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String id = req.getParameter("id");
		String action = req.getParameter("action");
		String oldPass = req.getParameter("cpass");
		String newPass = req.getParameter("npass");
		String oldEmail = req.getParameter("cemail");
		String newEmail = req.getParameter("nemail");

		Gamer g = new Gamer();
		g.setEmail(req.getParameter("email"));
		g.setPass(req.getParameter("pass"));
		g.setFname(req.getParameter("fname"));
		g.setLname(req.getParameter("lname"));
		g.setDob(req.getParameter("dob"));
		g.setUsername(req.getParameter("uname"));
		g.setCountry(req.getParameter("country"));

		boolean flag = false;

		if (action == null) {
			action = "LIST";
		}

		if (action.equals("Dashboard")) {

			listGamers(req, res);

		} else if (action.equals("Login")) {

			int result = gamerdao.authenticate(g);

			if (result > 0) {
				req.setAttribute("status", "Login Success");
				HttpSession sessionGamer = req.getSession();
				sessionGamer.setAttribute("email", g.getEmail());
				sessionGamer.setAttribute("id", result);

			} else {
				req.setAttribute("status", "Invalid Credentials, Please Try again!");
			}
			dispatcher = req.getRequestDispatcher("GameController?action=home");
			dispatcher.forward(req, res);

		} else if (action.equals("updatePass")) {

			String r = gamerdao.updatePass(Integer.parseInt(id), oldPass, newPass);

			if (r.equals("true")) {
				req.setAttribute("result", "Password Updated Successfully");

			} else {
				req.setAttribute("result", "Incorrect Password, Please try again");
			}

		} else if (action.equals("updateEmail")) {

			String updateEmail = gamerdao.updateEmail(Integer.parseInt(id), oldEmail, newEmail);

			if (updateEmail.equals("true")) {
				req.setAttribute("resultEmail", "Email Updated Successfully");

			} else {
				req.setAttribute("resultEmail", "Incorrect Email, Please try again");
			}

		} else if (id == null || id.isEmpty()) {

			gamerdao.addGamer(g); /** Calls the add gamer if id is null */

		} else {

			try {
				g.setId(Integer.parseInt(id));
				flag = gamerdao.updateGamer(g);
				/** Calls the updateGamer if id is present */
				if (flag == true) {
					req.setAttribute("resultAccount", "Account Updated Successfully");

				} else {
					req.setAttribute("resultAccount", "Account Updated Failed");
				}
			} catch (NumberFormatException e) {
				log.log(Level.SEVERE, e.getMessage());
			}
		}

		/** Redirects based on the response */
		switch (action) {

		case "LIST":
			listGamers(req, res);
			break;
		case "home":
			dispatcher = req.getRequestDispatcher("GameController?action=home");
			dispatcher.forward(req, res);
			break;
		case "updateAccount":
		case "updateEmail":
		case "updatePass":
			req.setAttribute("status", "update");
			req.setAttribute("id", id);
			getSingleGamer(req, res);

		}
	}

	/**
	 * @see HttpServlet#listGamers(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 *      This method lists all the Gamer
	 */

	private void listGamers(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ArrayList<Gamer> cusList = new ArrayList<Gamer>();
		String action = req.getParameter("action");

		cusList = gamerdao.getGamer();
		req.setAttribute("list", cusList);

		if (action != null && action.equals("Dashboard")) {
			dashGamer(req, res);

		} else {
			dispatcher = req.getRequestDispatcher("views/allGamers.jsp");
			dispatcher.forward(req, res);
		}

	}

	/**
	 * @see HttpServlet#getSingleGamer(HttpServletRequest request,
	 *      HttpServletResponse response)
	 * 
	 *      This method gets a single gamer based on the id
	 */
	protected void getSingleGamer(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		Gamer g = new Gamer();
		String action = req.getParameter("action");
		int id = 0;
		
		try {
			id = Integer.parseInt(req.getParameter("id"));
		} catch (NumberFormatException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		g = gamerdao.getGamerById(id);
		req.setAttribute("gamer", g);
		req.setAttribute("id", id);

		if (action.equals("EDIT")) {

			dispatcher = req.getRequestDispatcher("views/addGamer.jsp");
			dispatcher.forward(req, res);

		} else {

			dispatcher = req.getRequestDispatcher("GameController?action=myAccount");
			dispatcher.forward(req, res);
		}

	}

	/**
	 * @see HttpServlet#deleteGamer(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *      
	 *      This method deletes a gamer based on the id
	 */
	protected void deleteGamer(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		boolean result = gamerdao.deleteGamer(id);

		if (result == true) {
			req.setAttribute("msg", "Gamer Deleted Successfully");
		}
		listGamers(req, res);
	}

	/**
	 * @see HttpServlet#dashGamer(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *      
	 *      Displays gamer details in the dashboard
	 */
	protected void dashGamer(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ArrayList<String> gr = new ArrayList<>();
		
		int total = gamerdao.countGamers();
		req.setAttribute("grtotal", total);
		
		gr = gamerdao.getGamersbyMonth();
		req.setAttribute("totalGamers", gr);
		
		dispatcher = req.getRequestDispatcher("GameController?action=Dashboard");
		dispatcher.forward(req, res);
	}

}
