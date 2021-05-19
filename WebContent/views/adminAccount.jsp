
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

	
	%>
  <!-- Admin dashboard -->
  <jsp:include page="adminPanel.jsp"></jsp:include>
 <!-- Admin Content -->
  <div class = "user-account-pg">
  <div class="main">
    <div class="row">
      <div class="col-xl-2 col-lg-2 col-md-3"></div> <!-- To allocate the space for the admin navigation bar-->
      <!-- content display area -->
      <div class="col-xl-10 col-lg-10 col-md-9 main-screen">
        <!-- Page heading -->
        <h3 class="sect-header">My Account</h3>
        <!-- Page navigation -->
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/UserController?action=Dashboard">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">My Account</li>
          </ol>
        </nav>
        <!-- End of Page navigation -->
        <!-- Horizontal rule -->
        <hr class="admin-sect-div mb-4">

        <!-- Form -->
        <div class="admin-form user-account">
            <div class="row">
                <div class="col-md-12 user-head">
                    <i class="fas fa-user-tie user-head-icon"></i> <span class= "user-heading">Personal Information</span> 
                </div>
            </div>
                <div class="row">
                	<!-- User icon  -->
                    <div class="col-md-5 user-img">
                            <img src="${pageContext.request.contextPath}/Utilities/images/user-red.png">
                        </div>
                   
                    <div class="col-md-7">
                        
                       <div class = "result" id = "result"> ${notification} </div>
                       
                        <div class="user-details">
                          
                        <div class="row ">
                            
                            <div class="col-md-4 t-left">
                                Name 
                            </div>
                            <div class="col-md-8">
                                ${user.name}
                            </div>
                        </div>
                    
                        <div class="row">
                            <div class="col-md-4 t-left">
                                Email 
                            </div>
                            <div class="col-md-8 ">
                                 ${user.email}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 t-left">
                                Username 
                            </div>
                            <div class="col-md-8">
                                 ${user.username}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 t-left">
                                Phone No 
                            </div>
                            <div class="col-md-8">
                                 ${user.phone}
                            </div>
                        </div>
                   
                        <div class="row ">
                            
                            <div class="col-md-8 t-left">
      
                            </div>
                                <div class="col-md-4 user-edit">
                                <a  href="#update"class="user-edit-btn" ><i class="fas fa-user-edit"></i>Update </a>
                            </div>
                        </div>
                        </div>
                    </div>  
                    
                        
                </div>

            
        </div> <!-- End of Personal Info -->

        <h3 class="sect-header mt-4" id="update">Update Account</h3>
        <!-- Update Account -->
        <div class="admin-form mt-4">
        	
            <form class ="needs-validation"  action ="${pageContext.request.contextPath}/UserController?action=ACCOUNT" method = "post" novalidate>
  	
              <div class="form-row">
                <div class="form-group col-md-6 form-align">
                    <label for="fname">First Name</label>
                    <input type="text" class="form-control" id="fname" value = "${user.name}" name="name" placeholder="Enter first name" required>
                  </div>
                 <div class="form-group col-md-6 form-align">
                  <label for="uname">Username</label>
                  <input type="text" class="form-control" value = "${user.username}" id="uname" name="uid" placeholder="Enter Username" required>
                </div> 
              </div>

              <div class="form-row">
                
                <div class="form-group col-md-6 form-align">
                    <label for="emailAdd">Email Address</label>
                    <input type="email" class="form-control" id="emailAdd" value = "${user.email}" name="email" placeholder="Enter email" required>
                  </div>
                 <div class="form-group col-md-6 form-align">
                  <label for="phone">Phone No</label>
                  <input type="text" class="form-control" id="phone" value = "${user.phone}" name="phone" placeholder="Enter Password" required>
                </div>
              </div>
  
  
              <div class="form-group row">
                <div class="col-sm-12 btn-submit-col">
                <input type = "text" name = "id" value = "${user.id}" hidden>
                  <button type="submit" class="btn btn-submit">Update</button>
                </div>
              </div>
  
            </form>
          </div> <!-- End of update Account -->

          <h3 class="sect-header mt-4">Update Password</h3>
          <!-- Update Password -->
          <div class="admin-form mt-4 mb-4">
              <form class="needs-validation " action ="${pageContext.request.contextPath}/UserController?action=UpdatePass" method = "post">
                
                <div class="form-row">
                    <div class="form-group col-md-6 form-align">
                      <label for="pass">Old Password</label>
                      <input type="password" class="form-control" id="cpass" name="psw" required>
                      <div class="invalid-feedback">
                                   Please enter a valid Password
                      </div>
                    </div>

                  </div>
                <div class="form-row">
                    <div class="form-group col-md-6 form-align">
                      <label for="pass">New Password</label>
                      <input type="password" class="form-control" id="npass" name="pass" required>
                      <div class="invalid-feedback" id="passcr">
                                        Passwords do not match
                      </div>
                    </div>
                    <div class="form-group col-md-6 form-align">
                      <label for="re-pass">Confirm Password</label>
                      <input type="password" class="form-control" id="rnpass" name="repass" required>
                      <div class="invalid-feedback" >
                                        Passwords do not match
                      </div>
                    </div>
                  </div>
    
                <div class="form-group row">
                  <div class="col-sm-12 btn-submit-col">
                  <input type = "text" name = "id" value = "${user.id}" hidden>
                    <button type="submit" id = "updatepass" class="btn btn-submit">Update</button>
                  </div>
                </div>
    
              </form>
            </div> <!-- End of update Password -->

      </div> <!-- End of main screen class -->
    </div> <!-- End of row-->
  </div> <!-- End of main -->
</div><!-- End of user-account page -->
 
 <script type ="text/javascript" src="${pageContext.request.contextPath}/Utilities/js/admin.js"></script>  

<script>
	var al = "${alert}";
	console.log(al);
	if(al !== null && al !== ''){
		alert("Incorrect Password, Please try again");
	} 
</script> 
  <script>
     $(window).on ('load', function(){    
    	    
   	  setTimeout(function(){
   		  document.getElementById('result').style.display = "none";
   	   }, 10000); /* Sets a timer of 10s to erase the success message  */
   	   
   });
     window.addEventListener('load', validateAccount());
</script>

</body>

</html>