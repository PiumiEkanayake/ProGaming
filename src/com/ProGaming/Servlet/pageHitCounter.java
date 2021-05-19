package com.ProGaming.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.Date;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 * Servlet implementation class pageHitCounter
 */
@WebServlet("/pageHitCounter")
public class pageHitCounter extends HttpServlet {


	   private int hitCount; 

	   public void init() { 
	      // Reset hit counter.
	      hitCount = 0;
	   } 

	   public void doGet(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {


	      response.setContentType("text/html");
	      hitCount++; 

	   }
	   
	   public void destroy() { 
	      // This is optional step but if you like you
	      // can write hitCount value in your database.
	   } 
	} 