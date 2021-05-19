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

		//Checks whether url has an id it is used to check for edit operations to hide the update password field
		String gid = request.getParameter("id");

		String hidden = "";
		String submit = "Submit";
		if (gid != null) {
			hidden = "hidden";
			submit = "";
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
        <h3 class="sect-header">Add User</h3>
        <!-- Page navigation -->
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/UserController?action=Dashboard">Home</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/UserController">User</a></li>
            <li class="breadcrumb-item active" aria-current="page">Add User</li>
          </ol>
        </nav>
        <!-- End of Page navigation -->
        <!-- Horizontal rule -->
        <hr class="admin-sect-div mb-4">

        <!-- Form -->
        <div class="admin-form" >
          <form action ="${pageContext.request.contextPath}/UserController" method = "post" class="needs-validation" novalidate>

            <div class="form-row">
              <div class="form-group col-md-6 form-align">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" value = "${user.name}" required>
              </div>
              <div class="form-group col-md-6 form-align">
              	<label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address" value = "${user.email}" required >
                <div class="invalid-feedback">
                  	Please enter a valid email address
                </div>  
               </div>
            </div>

            <div class="form-row">
              <div class="form-group col-md-6 form-align">
                <label for="phone">Contact</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter contact number" value = "${user.phone}" required>
             
              </div>
              <div class="form-group col-md-6 form-align">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="uid" placeholder="Enter Username" value = "${user.username}" required>
             
                </div>
            </div>

           
            <div class="form-row " <%= hidden %>>
              <div class="form-group col-md-6 form-align">
                <label for="pass">Password</label>
                <input type="password" class="form-control" id="newpass" name="psw" placeholder="Enter password" >
              	<div class="invalid-feedback" id = "passfeed">
                                Please enter a valid password
                </div>
              </div>
              <div class="form-group col-md-6 form-align">
                <label for="re-pass">Re-enter Password</label>
                <input type="password" class="form-control" id="repass" name="repsw" placeholder="Re-Enter password" >
              	<div class="invalid-feedback" >
                               Passwords do not match
                </div>
              </div>
            </div>
			<input type = "text" name = "id" value = "${user.id}" hidden>
            <div class="form-group row">
              <div class="col-sm-12 btn-submit-col">
                <button type="submit" id = "<%= submit %>" class="btn btn-submit">Submit</button>
              </div>
            </div>

          </form>
        </div> <!-- End of admin-form -->
      </div> <!-- End of main screen class -->
    </div> <!-- End of row-->
  </div> <!-- End of main -->
  
<script type ="text/javascript" src="${pageContext.request.contextPath}/Utilities/js/admin.js"></script>
<script>
/*Activating links  */
var active = document.getElementById('user');
active.classList.add("active");
var subcat = document.getElementById('admin-user');
subcat.classList.add("show");
var sublink = document.getElementById('add-user');
sublink.classList.add("active");

window.addEventListener('load', validate());

</script>
</body>

</html>