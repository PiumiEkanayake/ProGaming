<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Utilities/css/admin.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Utilities/icons/css/all.css">
	<link href="${pageContext.request.contextPath}/Utilities/vendor/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/Utilities/vendor/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css" rel="stylesheet">
	
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Nova+Cut&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Kenia&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nova+Flat&display=swap" rel="stylesheet">

  

</head>

<body>

 <% 
 //Stores session variables
 String email = (String)session.getAttribute("email");

 //Default values to links when no session is set
 String a = "Login";
 String b = "Register";
 String aLink = "#loginModel";
 String bLink = request.getContextPath()+"/Register?action=GET&location=Register";
 String dataToggle = "modal"; //makes the login link as a modal inorder to  open the login link when session is not set
 String ml = "ml";  //Adds this class to login link when session is not set in order to add a margin
 
		 //Values to be assigned when session is set 
        if(email != null)
        {
        	 	int id = (int)session.getAttribute("id");
        		a = "My Account"; //Displays My Account when session is set
        		b = "Logout"; //Displays Logout when session is set
        		aLink = request.getContextPath()+"/myAccount?action=ACCOUNT&id="+id;   
        		bLink = "views/logout.jsp";
        		dataToggle = "";
        		ml = ""; //Removes the class when session is set
        }
        	
  %>
    <!-- Beginning of the header -->
  <div class="header-bg">
  <div class="header">
    <nav class="navbar navbar-expand-xl navbar-dark">
      <a class="navbar-brand headerTitle" href="${pageContext.request.contextPath}/Home?action=home">ProGaming</a> 
      <!-- Toggler button -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <!-- Header links -->
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link h-link" href="${pageContext.request.contextPath}/Home?action=home">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link h-link" href="${pageContext.request.contextPath}/GameController?action=allGame&cat=All Games">Games</a>
          </li>
          <li class="nav-item">

            <div class="header-cat-dropdown">

              <a class="nav-link h-link dropdown-toggle" href="#" id="servicesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categories</a>
              <!-- Category Mega drop down -->
              <div class="dropdown-menu dropdown-menu-right " aria-labelledby="servicesDropdown">

                <div class="d-md-flex align-items-start justify-content-start">
					<!-- Sets a variable to limit the number of games displayed  -->		
			<c:set var="headerCat" value= "0" ></c:set>
			
            <c:forEach items = "${list}" var = "l">
				
					
					
				
					<c:if test="${headerCat % 8 == 0 }"> <!-- Breaks the row after 2 games are displayed  -->
						<div>
  					</c:if>
  						
  						<a class="dropdown-item" href="${pageContext.request.contextPath}/GameController?action=allGame&cat=${l.name}&#gme-head""> <div class = "cat-icon">${l.cat_icon}</div>${l.name}</a>
             		<!-- Increments the variable -->
            		<c:set var="headerCat" value="${headerCat+1}" ></c:set>
            		
            		<c:if test="${headerCat % 8 == 0 }">  <!-- Breaks the row after 2 games are displayed  -->
            			</div> <!-- End of item column  -->
            		</c:if>

				
				
            </c:forEach>
                 

                </div>
              </div>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link h-link" href="#">About Us</a>
          </li>

          <li class="nav-item  rightWrap <%= ml %>" >
            <a class="nav-link right-header" id = "loginLink" href="<%= aLink %>" data-toggle="<%= dataToggle %>" data-target=""><%= a %></a>
          </li>

          <!-- Modal -->
            <div class="modal fade" id="loginModel" tabindex="-1" role="dialog" aria-labelledby="loginModelrTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="loginModelTitle">ProGaming</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                    <div class="modal-body">
                    	<div class = "login-msg">${status}</div>
                        <form action = "${pageContext.request.contextPath}/GamerController?action=Login" method = "post" class="needs-validation" novalidate>
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" name = "email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required >

                              <div class="invalid-feedback">
                                Please enter a valid email address
                              </div>
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password</label>
                              <input type="password" name = "pass" class="form-control" id="exampleInputPassword1" required >
                              <div class="invalid-feedback">
                                Please enter a valid Password
                              </div>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customCheck1" >
                                <label class="custom-control-label remember" for="customCheck1">Always Remember me</label>
                            </div>
                            <button type="submit"  class="btn btn-submit" >Login</button>
                            
                          </form>
                    </div>
              
                </div>
                </div>
            </div>
            <!-- End of modal -->
          <li class="nav-item">
            <a class="nav-link right-header" href="<%= bLink %>"><%= b %></a>
          </li>

        </ul>
      </div>
    </nav>
    <!-- Search btn -->
    <a class="nav-link right-header search-icon" id="h-search-icon" data-toggle="collapse" href="#collapseSearch" role="button" aria-expanded="false" aria-controls="collapseExample"><i class="fas fa-search"></i></a>

    <div class="collapse" id="collapseSearch">

      <div class="search-nav">

        <form action = "${pageContext.request.contextPath}/GameController?action=search#gme-head" method = "post" class="header-search">
          <div class="form-row">

            <div class="form-group form-inline col-1 col-xl-4 col-lg-1 col-md-1 col-sm-1"></div>

            <div class="form-group form-inline col-8 col-xl-7 col-lg-9 col-md-9 col-sm-9">
              <input class="form-control search-box" type="search" name="search" placeholder="Search" aria-label="Search">
            </div>

            <div class="form-group form-inline col-3 col-xl-1 col-lg-2 col-md-2 col-sm-2">
              <button type="submit" class="btn btn-light " >Search</button>
            </div>

          </div>

        </form>
      </div>
    </div>
  </div>
  </div>
  <!-- End of the header -->
         <script type ="text/javascript" src="${pageContext.request.contextPath}/Utilities/js/admin.js"></script>
</body>

</html>