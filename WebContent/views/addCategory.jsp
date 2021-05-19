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
        <h3 class="sect-header">Add Category</h3>
        <!-- Page navigation -->
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/UserController?action=Dashboard">Home</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/CategoryController">Category</a></li>
            <li class="breadcrumb-item active" aria-current="page">Add Category</li>
          </ol>
        </nav>
        <!-- End of Page navigation -->
        <!-- Horizontal rule -->
        <hr class="admin-sect-div mb-4">

        <!-- Form -->
        <div class="admin-form" >
          <form action ="${pageContext.request.contextPath}/CategoryController" method = "post" class="needs-validation" novalidate>

            <div class="form-row">
              <div class="form-group col-md-6 form-align">
                <label for="cat-name">Category Name</label>
                <input type="text" class="form-control" id="cat-name" name="catName"  placeholder="Enter Category Name" value="${category.name}" required>
              	<div class="invalid-feedback">
                    Please enter a Category Name
               	</div>
              </div>
              <div class="form-group col-md-6 form-align">
                <label for="cat-icon">Category Icon </label>
                <input type="text" class="form-control" id="cat-icon" name="catIcon" placeholder="Paste Icon Link Here" required value = '${category.cat_icon}' >
                <div class ="cat-icon-display" id = "cat-icon-display"></div>
             	<div class="invalid-feedback">
                    Please paste Category Icon Link
               	</div>
              </div>
            </div>

          
			<input type="hidden" value="${category.cat_id}" name="cat_id"/>
            <div class="form-group row">
              <div class="col-sm-12 btn-submit-col">
                <button type="submit" class="btn btn-submit">Submit</button>
              </div>
            </div>

          </form>
        </div> <!-- End of admin-form -->
      </div> <!-- End of main screen class -->
    </div> <!-- End of row-->
  </div> <!-- End of main -->


<script type="text/javascript">

	/*Activating links  */
	var active = document.getElementById('cat');
	active.classList.add("active");
	var subcat = document.getElementById('admin-cat');
	subcat.classList.add("show");
	var sublink = document.getElementById('add-cat');
	sublink.classList.add("active");
	
	
	/* Displays category icon on select of an icon  */
	$('#cat-icon').on('change',function(e){
	
		var icon_code = document.getElementById('cat-icon').value;
		document.getElementById('cat-icon-display').innerHTML = icon_code;
	
	});

</script>
 
<script type="text/javascript">
	
	/*Displays the category icon for edit function  */
	var c = ${category.cat_id};
	
	if(c!=null){
		document.getElementById('cat-icon-display').innerHTML = '${category.cat_icon}';
	}

</script>


</body>

</html>