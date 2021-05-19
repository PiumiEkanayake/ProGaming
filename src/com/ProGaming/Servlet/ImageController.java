package com.ProGaming.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter; 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part; 

import java.sql.*;
import java.util.ArrayList;

 @WebServlet("/ImageController")
 @MultipartConfig(fileSizeThreshold=1024*1024*2,maxFileSize=1024*1024*5)

 public class ImageController extends HttpServlet {
//	 Specifies the directories to save the images
	 private static final String SAVE_DIR_ProGaming="ProGaming";
	 private static final String SAVE_DIR_Images ="Images";
	 private static final String SAVE_DIR_Games ="Games";
 /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        response.setContentType("text/html");
       
        PrintWriter out= response.getWriter();
        
        // Paths to save the image
        String savePath = "D:\\ProGaming\\Images\\Games";
        

      //Creates Games directory if not found
        File GamesDir=new File(savePath);
        if(!GamesDir.exists()){
        	GamesDir.mkdirs();
        }
        
        Part img = request.getPart("image");

	String imgName=extractfilename(img);
	
	img.write(savePath + File.separator + imgName);
	String filePath= savePath + File.separator + imgName ;
	
	try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","1234");
            PreparedStatement ps= con.prepareStatement("insert into fileUpload values (?)");

            ps.setString(1,filePath);

            int i=ps.executeUpdate();
            if(i>0)
            {
            	out.print("<h1>file uploaded successfully</h1>");
            }
            con.close();
		}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	//	Method to find the file name
    private String extractfilename(Part file) {
	String cd = file.getHeader("content-disposition");
	String[] items = cd.split(";");
	for (String string : items) {
	if (string.trim().startsWith("filename")) {
		return string.substring(string.indexOf("=") + 2, string.length()-1);
		}
	}
	
	return "";
	
    }
     
 }


		
