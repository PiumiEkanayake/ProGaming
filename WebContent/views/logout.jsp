<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
	String action = request.getParameter("action");
	if(action != null && action.equals("admin")){
		
		response.sendRedirect("adminLogin.jsp");
	}else{
		response.sendRedirect(request.getContextPath()+"/Home?action=home");
	}
	

%>
</body>
</html>