<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Utilities/css/admin.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Utilities/icons/css/all.css">
  
  <!-- Font -->
  <link href="https://fonts.googleapis.com/css2?family=Nova+Cut&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Kenia&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Nova+Flat&display=swap" rel="stylesheet">
</head>

<body>
<% 
 	String emailAdmin = (String)session.getAttribute("Email");
	String uname = "";
	int idAdmin = 0;

	if(emailAdmin == null || emailAdmin.isEmpty())
	 { 
		 response.sendRedirect("adminLogin.jsp");
		 
	 }else {
		 idAdmin = (int)session.getAttribute("Id");
		uname = (String)session.getAttribute("uname");
	 }
        	
%>
  <!-- Admin dashboard -->
  <div class=adminpanel>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 navbar-dark d-md-block sidebar navbar-expand-md ">
          <div class="sidebar-sticky">

            <ul class="nav flex-column">

              <li class="nav-item dash-center">

                <div class="admin-title">ProGaming
                  <!-- Toggler button -->
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                </div>

              </li>
              <!-- Collapsible navigation -->
              <div class="collapse navbar-collapse" id="navbarNav">

                <!-- User image -->
                <li class="nav-item dash-center">
                  <img class="user-icon" src="${pageContext.request.contextPath}/Utilities/images/user.png">
                </li>

                <!-- User name -->
                <li class="nav-item dash-center">
                  <h5 class="dash-userName">Hello, <%=uname %></h5>
                </li>

                <!-- Account and logout icons -->
                <li class="nav-item dash-center">
                  <a class="" href="${pageContext.request.contextPath}/UserController?action=ACCOUNT&id=<%= idAdmin %>">
                    <i class="far fa-user-circle dash-icon"></i>
                  </a>
                  <a class="" href="${pageContext.request.contextPath}/views/logout.jsp?action=admin">
                    <i class="fas fa-power-off dash-icon ml-2"></i>
                  </a>
                </li>

                <!-- Navigation links -->

                <div class="accordion" id="adminAccordion">

                  <!-- Dashboard link -->
                  <li class="nav-item mt-3">
                    <a class="nav-link admin-option" href="${pageContext.request.contextPath}/UserController?action=Dashboard" id="dash" >
                      <i class="fas fa-home"></i> Dashboard <span class="sr-only">(current)</span>
                    </a>
                  </li>

                  <!-- Games link -->
                  <li class="nav-item ">
                    <a class="nav-link admin-active admin-option" id="gme"  data-toggle="collapse" data-target="#admin-game"  role="button" aria-expanded="true" aria-controls="admin-game">
                      <i class="fas fa-gamepad"></i> Games
                    </a>
                    <!-- Sub links -->
                    <div class="collapse sub-cat" id="admin-game" aria-labelledby="headingOne" data-parent="#adminAccordion">
                      <div class="card card-body">
                        <a class="nav-link admin-active ml-4" id = "all-game" href="${pageContext.request.contextPath}/GameController">All Games</a>
                        <a class="nav-link admin-active ml-4" id = "add-game" href="${pageContext.request.contextPath}/GameController?action=ADD">Add Game</a>
                      </div>
                    </div>
                  </li>

                  <!-- Users link  -->

                  <li class="nav-item">

                      <a class="nav-link admin-active1 admin-option" id="user"  data-toggle="collapse"
                        data-target="#admin-user" role="button" aria-expanded="false" aria-controls="admin-user">

                        <i class="far fa-user-circle"></i> Users
                      </a>

                      <!-- Sub links -->
                      <div class="collapse sub-cat" id="admin-user" aria-labelledby="headingTwo" data-parent="#adminAccordion">
                        <div class="card card-body">
                          <a class="nav-link admin-active ml-4 " id = "all-user" href="${pageContext.request.contextPath}/UserController">All Users</a>
                          <a class="nav-link admin-active ml-4 " id = "add-user" href="${pageContext.request.contextPath}/views/addUser.jsp">Add User</a>
                        </div>
                      </div>
                  </li>

                  <!-- Categories link -->

                  <li class="nav-item ">

                      <a class="nav-link admin-active2 admin-option" id="cat" data-toggle="collapse"
                        data-target="#admin-cat" role="button" aria-expanded="false" aria-controls="admin-cat">

                        <i class="fas fa-layer-group"></i> Categories

                      </a>
                      <!-- Sub links -->
                      <div class="collapse sub-cat" id="admin-cat" aria-labelledby="headingThree" data-parent="#adminAccordion">
                        <div class="card card-body">
                          <a class="nav-link admin-active ml-4" id = "all-cat" href="${pageContext.request.contextPath}/CategoryController">All Categories</a>
                          <a class="nav-link admin-active ml-4" id = "add-cat" href="${pageContext.request.contextPath}/views/addCategory.jsp">Add Category</a>
                        </div>
                      </div>
                  </li>

                  <!-- Gamers link -->

                  <li class="nav-item">

                      <a class="nav-link admin-active2 admin-option" id="cus"  data-toggle="collapse"
                        data-target="#admin-cus" role="button" aria-expanded="false" aria-controls="admin-cus">

                        <i class="fas fa-users"></i> Gamers
                      </a>
                      <!-- Sub links -->
                      <div class="collapse sub-cat" id="admin-cus" aria-labelledby="headingThree"  data-parent="#adminAccordion">
                        <div class="card card-body">
                          <a class="nav-link admin-active ml-4" id = "all-cus" href="${pageContext.request.contextPath}/GamerController">All Gamers</a>
                          <a class="nav-link admin-active ml-4" id = "add-cus" href="${pageContext.request.contextPath}/views/addGamer.jsp">Add Gamer</a>
                        </div>
                      </div>
                  </li>

              
                </div> <!--End of accordion class -->
               </div> <!--End of Collapsible navigation class -->
            </ul>
          </div> <!--End of sidebar sticky class -->
        </nav>
      </div>  <!--End of row -->
    </div>  <!--End of container fluid -->
  </div>  <!--End of admin panel -->
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script>

	//First, we listen to the click event.
	$(".admin-option").on('click',function () {
	/* When it fires, we select all of the menu options,
	 and iterate over them, removing '.active' from it
	 if the element has the class.*/
	$(".admin-option").each(function () {
	  $(this).removeClass("active");
	});
	// Finally, we add '.active' to the element that was clicked.
	$(this).addClass("active");
	});

</script>
 
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>

</html>