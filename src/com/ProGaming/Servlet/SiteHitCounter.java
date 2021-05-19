package com.ProGaming.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ProGaming.dao.SiteTrafficDAOImpl;

/**
 * Servlet implementation class SiteHitCounter
 */
@WebServlet("/SiteHitCounter")

public class SiteHitCounter extends HttpServlet implements Filter {

	
	private static final long serialVersionUID = 1L;
	private int hitCount;
	SiteTrafficDAOImpl sd = new SiteTrafficDAOImpl();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		getTotalTraffic(req, res);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		getTotalTraffic(req, res);
	}

	/** Thsi is executed when a servlet is created */
	public void init(FilterConfig config) throws ServletException {
		// Reset hit counter.
		hitCount = 0;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws java.io.IOException, ServletException {

		// increase counter by one
		hitCount++;
		// Pass request back down the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see HttpServlet#getTotalTraffic(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * 	This method returns the total traffic
	 */
	protected void getTotalTraffic(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		ArrayList<String> totTraffic = new ArrayList<String>();
		totTraffic = sd.getTraffic();
		req.setAttribute("traffic", totTraffic);
		RequestDispatcher dis = req.getRequestDispatcher("views/Dashboard.jsp");
		dis.forward(req, res);

	}

	/** This method is invoked when the servlet is destroyed */
	public void destroy() {

		sd.hitCounter(hitCount);

	}

}