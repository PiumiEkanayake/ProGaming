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



   <!-- Font -->
  <link href="https://fonts.googleapis.com/css2?family=Nova+Cut&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Kenia&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Nova+Flat&display=swap" rel="stylesheet">

  

</head>

<body>
	<%
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
  <div class="main">
    <div class="row">
      <div class="col-xl-2 col-lg-2 col-md-3"></div> <!-- To allocate the space for the admin navigation bar-->
      <!-- content display area -->
      <div class="col-xl-10 col-lg-10 col-md-9 main-screen">
        <!-- Page heading -->
        <h3 class="sect-header">All Games</h3>
        <!-- Page navigation -->
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/UserController?action=Dashboard">Home</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/GameController">Games</a></li>
            <li class="breadcrumb-item active" aria-current="page">All Games</li>
          </ol>
        </nav>
        <!-- End of Page navigation -->
        <!-- Horizontal rule -->
        <hr class="admin-sect-div mb-4">

		<h5 class="notification">${msg}</h5>
        <div class="admin-table all-gme align-center">
	
            <table id="example" class="table table-striped table-bordered table-responsive-lg" style="width:100%">
                <thead class="thead">
                    <tr>
					      <th >Game ID</th>
					      <th >Game Image</th>
					      <th >Game Name</th>
					      <th >Action</th>
					      
					</tr>
                </thead>
                <tbody>
               	 <c:forEach items = "${glist}" var = "g">
                    <tr>
                       <td>${g.gID} </td>
				      <td><img class = "all-gme-img"  src = "${pageContext.request.contextPath}/Utilities/images/Games/${g.gImg}"></td>
				      <td>${g.gName}</td>
				      <td><a href = "${pageContext.request.contextPath}/GameController?action=edit&id=${g.gID}">Edit</a>  |  <button class="del" onClick ="deleteUser(${g.gID});"> Delete</button></td>
  
   					 </tr>              
                 </c:forEach>
                </tbody>    
            </table>



        </div> <!-- End of admin table -->
      </div> <!-- End of main screen class -->
    </div> <!-- End of row-->
  </div> <!-- End of main -->

<script type="text/javascript">

	/*Activating links  */
	var active = document.getElementById('gme');
	active.classList.add("active");
	var subcat = document.getElementById('admin-game');
	subcat.classList.add("show");
	var sublink = document.getElementById('all-game');
	sublink.classList.add("active");

	/*This function displays a confirmation box when delete is clicked  */
		function deleteUser(id){
			if(confirm("Are you sure you want to delete ?"))
				{
					window.location.href = "<%=request.getContextPath()%>/GameController?action=delete&id="+id;
				}
		}

</script>

 
 	<script type="text/javascript" src="${pageContext.request.contextPath}/Utilities/js/admin.js"></script>
    <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script> 
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>
  
<script type="text/javascript" >

	  /*Displays the Data table  */
	      $(document).ready(function() {
	          $('#example').DataTable();
	      } );
	  
 	/*Checks whether id and action parameters are set  */
	var id = getUrlVars()["id"];
	var action = getUrlVars()["action"];
	/*This code is used to reload the page after 5s after a new game is added or edited inorder to load the newly added game image to the server and display in the client side*/
	
	if(id == null && action == "success"){
		/* This function is used to reload the page after it has been loaded  */
		 $(window).on ('load', function(){    
			    
			  setTimeout(function(){
			    //Check if the current URL contains '#'
			    if(document.URL.indexOf("#")==-1){
			    // Set the URL to whatever it was plus "#".
			    url = document.URL+"#";
			    location = "#";

			    //Reload the page
			    location.reload(true);
			    }
			   }, 5000); /* Sets a timer of 5s to reload after the page has been completely loaded  */
			   
		}); 	 
	} 
</script>
<script>
	var temp = ${flag}; /* Game controller forwards a variable once a new game is created or edited  */
 	if(temp == 1){ /* This checks whether a new game has been added or have been edited  */
		if (action == null && id == null ){
			window.location.href = "<%=request.getContextPath()%>/GameController?action=success"; /* This redirects the link back to the server only once and displays the table to prevent adding multiple records to the db on reloading the page */
		} 	
 	 }
</script>

</body>

</html>