<%@ page import="com.ProGaming.Servlet.SessionCounter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>


  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Utilities/icons/css/all.css">
   <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Utilities/css/admin.css">
   <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
  <script src="${pageContext.request.contextPath}/Utilities/js/admin.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


  <!-- Font -->
  <link href="https://fonts.googleapis.com/css2?family=Nova+Cut&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Kenia&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Nova+Flat&display=swap" rel="stylesheet">

</head>

<body>
	
	<%
		int activeSessions = SessionCounter.getActiveSessionNumber();	//Returns the number of active sessions
	
		//Stores session attributes
		String emailAdmin = (String) session.getAttribute("Email");
		String uname = "";
		int idAdmin = 0;

		if (emailAdmin == null || emailAdmin.isEmpty()) {
			//Redirects to login page if session is not set
			response.sendRedirect(request.getContextPath()+"/views/adminLogin.jsp");

		} else {
			//Sets session attributes to variable if session is set
			idAdmin = (int) session.getAttribute("Id");
			uname = (String) session.getAttribute("uname");
		}

	%>
  <!-- Admin dashboard -->
  <jsp:include page="adminPanel.jsp"></jsp:include>

  
  <!-- Admin Content -->
  <div class="dashboard">
  <div class="main">
    <div class="row">
      <div class="col-xl-2 col-lg-2 col-md-3"></div> <!-- To allocate the space for the admin navigation bar-->
      <!-- content display area -->
      <div class="col-xl-10 col-lg-10 col-md-9 main-screen">
        <!-- Page heading -->
        <!-- <h3 class="sect-header">Dashboard</h3> -->
        <div class="bg">
        <div class="d-flex flex-row  ">
            <div>
              <div class = "user-welcome"> <i class="fas fa-user-circle mr-4"></i>Welcome, <%= uname %> 
                <a href="${pageContext.request.contextPath}/views/logout.jsp?action=admin" data-toggle="tooltip" data-placement="bottom" title="Logout"><i class="fas fa-power-off dashboard-head-icon"></i></a>
                <a href="${pageContext.request.contextPath}/UserController?action=ACCOUNT&id=<%= idAdmin %>" data-toggle="tooltip" data-placement="bottom" title="My Account"><i class="fas fa-house-user dashboard-head-icon"></i></a>  
            </div> 
            </div>
            
          </div>

          <div class="d-flex flex-row  mt-2">
            <div class="p-2 chart-canvas">
                <canvas id="myChart" class = "chart" width ="530" height="420"></canvas>
            </div>
            <div>
          <div class="p-2 dashboard-box cl-3 ml-3">
            <i class="fas fa-gamepad dashboard-icon"></i>  
            <span class="value"><%=activeSessions %></span>
            <h4 class="des">Active Gamers</h4>  
        </div>
        <div class="p-2 dashboard-box cl-5 ml-3">
            <i class="fas fa-users dashboard-icon"></i>  
            <span class="value">${grtotal}</span>
            <h4 class="des">Total Gamers</h4>  
        </div>
    </div>
    <div>
        <div class="p-2 dashboard-box cl-4">
            <i class="fas fa-gamepad dashboard-icon"></i>  
            <span class="value">${gTotal}</span>
            <h4 class="des">Total Games</h4>  
        </div>
   
	    <div class="p-2 dashboard-box cl-7">
	        <i class="fas fa-user-tie dashboard-icon"></i>  
	        <span class="value">${utotal}</span>
	        <h4 class="des">Total Users</h4>  
	    </div>
	</div>
           
           
          </div>

          <div class="d-flex flex-row  mt-2 add-box">

			<a href="${pageContext.request.contextPath}/views/addGame.jsp">
            <div class="p-2 dashboard-box cl-1 ml-4">
                <i class="fas fa-plus-circle dashboard-icon"></i>
                <div class="add-value">Add Game</div>
            </div>
            </a>
            
            <a href="${pageContext.request.contextPath}/views/addUser.jsp">
            <div class="p-2 dashboard-box cl-1 ml-4">
                <i class="fas fa-user-plus dashboard-icon"></i>
                <div class="add-value">Add User</div>
            </div>
            </a>
            
            <a href="${pageContext.request.contextPath}/views/addCategory.jsp">
            <div class="p-2 dashboard-box cl-1 ml-4">
                <i class="fas fa-layer-group dashboard-icon"></i>
                <div class="add-value">Add Category</div>
            </div>
            </a>
            <a href = "${pageContext.request.contextPath}/views/addGamer.jsp">
            <div class="p-2 dashboard-box cl-1 ml-4">
                <i class="fas fa-users dashboard-icon"></i>
                <div class="add-value">Add Gamer</div>
            </div>
            </a>
            </div>

            <div class="d-flex flex-row  mt-2">
                
                <!-- Total Games Chart  -->
                <div class="p-2 chart sub-chart ">
                    <canvas id="myChart-game" class = "chart" width ="500" height="400"></canvas>
                </div>
				<!-- Total Traffic Chart  -->
                <div class="p-2 sub-chart">
                    <canvas id="myChart-traffic" class = "chart" width ="500" height="400"></canvas>
                </div>
            </div>

            <div class="d-flex flex-row  ">

                <div class="new-gme-tbl">
                    <h3 class="sect-header mt-4 mb-3 ml-2">New Games
                    <a class="view-all btn-submit " href="${pageContext.request.contextPath}/GameController">View All</a>
                </h3>
                    <div class="admin-table ml-2 ">
                    <table id="example" class="table table-striped  table-responsive-lg " style="width:100%">
                        <thead class="thead">
                            <tr>
                            	<th>ID</th>
                                <th>Image</th>
                                <th>Name</th> 
                                 
                            </tr>
                        </thead>
                        <tbody>
                        <!-- Sets a variable to limit the number of games to display  -->
                        <c:set var="ng" value= "0" ></c:set>
                        <c:forEach items = "${newgme}" var = "n" >
                        	<c:if test="${ng < 5}"> <!-- Displays only latest 5 games  -->
                            <tr>
                            	<td>${n.gID}</td>
                                <td><img src="${pageContext.request.contextPath}/Utilities/images/Games/${n.gImg}" class="new-gme-img"></td>
                                <td>${n.gName}</td>
                            </tr>
                            <c:set var="ng" value= "${ng + 1}" ></c:set>
                            </c:if>
                       </c:forEach>   
                           
                        </tbody>
                        </table>
                    </div>
                </div>   

            <div class="new-cus">
            <h3 class="sect-header mt-4 mb-3 ml-5">New Gamers<a class="view-all btn-submit " href="${pageContext.request.contextPath}/GamerController">View All</a></h3>
            <div class="admin-table ml-5">

                <table id="example" class="table table-striped table-responsive-lg " style="width:100%">
                    <thead class="thead">
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Username</th>
                            <th>Dob</th>
                            <th>Country</th>
                            
                            
                        </tr>
                    </thead>
                    <tbody>
                     <!-- Sets a variable to limit the number of games to display  -->
                     <c:set var="gl" value= "0" ></c:set>
                      <!-- Displays only the latest 8 gamers  -->
                        <c:forEach items = "${list}" var = "gamer"  >
	                        <c:if test="${gl < 8 }">
		                        <tr>
		                            <td>${gamer.fname}</td>
		                            <td>${gamer.lname}</td>
		                            <td>${gamer.username}</td>
		                            <td>${gamer.dob}</td>
		                            <td>${gamer.country}</td>
		                        </tr>
		                        <c:set var="gl" value= "${gl +1 }" ></c:set>
	                        </c:if>
                        </c:forEach>
                        
                    </tbody>
                   
                </table>
    
    
    
            </div> <!-- End of admin table -->
        </div>   <!-- End of new Customer -->

    </div>  <!-- End of flex Row -->
</div>
      </div> <!-- End of main screen class -->
    </div> <!-- End of row-->
  </div> <!-- End of main -->
</div> <!-- End of dashboard -->

<script type="text/javascript" src="${pageContext.request.contextPath}/Utilities/js/admin.js"></script>

<script type="text/javascript">
	//Activating Link
	var active = document.getElementById('dash');
	active.classList.add("active");
	
	//Array to store the game count and respective month retrieved from the db
	var arrGame = [];
	var monthGame = [];
	var countGame = [];

	//Array to store the gamer count and respective month retrieved from the db
	var arrGamer = [];
	var monthGamer = [];
	var countGamer = [];
	
	//Array to store the traffic count and respective date retrieved from the db
	var arrTraffic = [];
	var dateTraffic = [];
	var countTraffic = [];
	
</script>

	<!-- Adds the game data from the db into the array  -->
	<c:forEach items = "${totalGames}" var = "g"> 	
	  	<script>arrGame.push('${g}');</script> 	
	</c:forEach> 
	
	<!-- Adds the gamer data from the db into the array  -->
	<c:forEach items = "${totalGamers}" var = "gr"> 	
	  	<script>arrGamer.push('${gr}');</script>
	</c:forEach> 
	
	<!-- Adds the traffic data from the db into the array  -->
	<c:forEach items = "${traffic}" var = "t"> 	
  		<script>arrTraffic.push('${t}');</script>	
	</c:forEach> 
	

<script>

	//Adds the month from the array to the month array and count to the count array
	for(i = 0; i < arrGame.length; i++){
		
		if(i%2 == 0){
			monthGame.push(arrGame[i]);
		}else{
			countGame.push(arrGame[i]);
		}
	}

	//Adds the month from the array to the month array and count to the count array
	for(i = 0; i < arrGamer.length; i++){
		if(i%2 == 0){
			monthGamer.push(arrGamer[i]);
		}else{
			countGamer.push(arrGamer[i]);
		}
	}

	//Adds the date from the array to the date array and count to the count array
	for(i = 0; i < arrTraffic.length; i++){
		if(i%2 == 0){
			dateTraffic.push(arrTraffic[i]);
		}else{
			countTraffic.push(arrTraffic[i]);
		}
	}

	//Calls the display chart method in external js
	window.addEventListener('load', displayChart());

</script>
 
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>

</body>

</html>