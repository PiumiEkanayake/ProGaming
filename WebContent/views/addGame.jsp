
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
			response.sendRedirect(request.getContextPath() + "/views/adminLogin.jsp");

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
			<div class="col-xl-2 col-lg-2 col-md-3"></div>
			<!-- To allocate the space for the admin navigation bar-->
			<!-- content display area -->
			<div class="col-xl-10 col-lg-10 col-md-9 main-screen">
				<!-- Page heading -->
				<h3 class="sect-header">Add Game</h3>
				<!-- Page navigation -->
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/UserController?action=Dashboard">Home</a></li>
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/GameController">Games</a></li>
						<li class="breadcrumb-item active" aria-current="page">Add Game</li>
					</ol>
				</nav>
				<!-- End of Page navigation -->
				<!-- Horizontal rule -->
				<hr class="admin-sect-div mb-4">

				<!-- Form -->
				<div class="admin-form addgame">
					<form action="${pageContext.request.contextPath}/GameController" method="post" class="needs-validation" novalidate enctype="multipart/form-data">

						<div class="form-row">
							<div class="form-group col-md-12 form-align">
								<label for="gamename">Game Name</label> 
								<input type="text" name="gname" placeholder="Enter Game Name" class="form-control" id="gamename" value="${game.gName}" required>
								<div class="invalid-feedback">Please enter a Game Name</div>
							</div>

						</div>

						<div class="form-row">
							<div class="form-group col-md-6 form-align">
								<label for="gamedes">Game Description</label>
								<textarea class="form-control" name="gamedes" placeholder="Enter Game Description" id="gamedes" rows="5" required>${game.gDes}</textarea>
								<div class="invalid-feedback">
									Please enter a Game Description
								</div>
							</div>
							<div class="form-group col-md-6 form-align">
								<label for="gameinst">Game Instruction</label>
								<textarea class="form-control" name="gameinst" placeholder="Enter Game Instruction" id="gameinst" rows="5" required>${game.gInst}</textarea>
								<div class="invalid-feedback">
									Please enter a Game Instruction
								</div>
							</div>
						</div>



						<div class="form-row">
						
						<!-- Select Game Image  -->
							<div class="form-group col-md-6 form-align">
								<label for="SelectgameImage">Game Image</label>
								<div class="custom-file">
									<input type="file" name="gme-img" class="custom-file-input" id="img-file" onchange="displayImage(this)" required>
									<label class="custom-file-label" for="img-file" id="test">Choose Image</label>
									<div class="invalid-feedback">Please select an image</div>
								</div>
								<div class="img-display">
									<img id="gme-select-img" src="#">
								</div>
							</div>
							
							<div class="form-group col-md-6 form-align gmecat">
								<label for="gamecat">Game Category</label> 
								<select multiple class="form-control" name="gcat" id="gamecat" required>
									<!-- DIsplays the categories from the db  -->
									<c:forEach items="${list}" var="category">
										<option value="${category.cat_id}">${category.name}</option>
									</c:forEach>

								</select>
								<div class="invalid-feedback">
									Please select a game Category
								</div>
							</div>

						</div>

						<div class="form-row">
							<div class="form-group col-md-12 form-align">
								<label for="gamelink">Game Link</label>
								<textarea class="form-control" name="gamelink"
									placeholder="Paste Game Link" id="gamelink" rows="5" required>${game.gLink}</textarea>
								<div class="invalid-feedback">
									Please paste Game Link
								</div>
							</div>
						</div>

						<input type="text" value="${game.gID}" name="gID" hidden>
						<div class="form-group row">
							<div class="col-sm-12 btn-submit-col">
								<button type="submit" class="btn btn-submit">Submit</button>
							</div>
						</div>

					</form>
				</div>
				<!-- End of admin-form -->
			</div>
			<!-- End of main screen class -->
		</div>
		<!-- End of row-->
	</div>
	<!-- End of main -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/Utilities/js/admin.js"></script>
<script>

	/*Activating links  */
	var active = document.getElementById('gme');
	active.classList.add("active");
	var subcat = document.getElementById('admin-game');
	subcat.classList.add("show");
	var sublink = document.getElementById('add-game');
	sublink.classList.add("active");
	
	/* To make the categories auto select when click edit  */
	var arr = [];
</script>
	
	<!-- Adds the categories into an array   --> 
	<c:forEach items="${g}" var="cat">	
		<script> arr.push(${cat}); </script>	
	</c:forEach>
	
<script type="text/javascript">

	//Converts the values in the array to string and makes them selected
	var values=arr.toString();
	$.each(values.split(","), function(i,e){
	    $("#gamecat option[value='" + e + "']").prop("selected", true);
	});

	/* This function displays an image when a image is selected  */
	function displayImage(input) {
		
		var s = document.getElementById('img-file');
		var fileSize = s.files[0].size/1024/1024; // Gets the size of the image
		// Displays the image only when it is less than 5mb
		if(fileSize < 5){
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
			var img = document.getElementById('gme-select-img');
	        reader.onload = function (e) {
				
	            $('#gme-select-img')
	                .attr('src', e.target.result);
	           		img.style.display = 'block';
	        };

	        reader.readAsDataURL(input.files[0]);
	    }
		}
	}
</script>
<script>
		var c = ${game.gID};
		/* Displays the image name and image from the database when edit is clicked  */
		if(c!=null){
			document.getElementById("test").innerHTML = '${game.gImg}'; /* Displays the image name in the database for the input type =file label  */
			var img = document.getElementById('gme-select-img'); /* Gets the image element in the form  */
			img.style.display = 'block'; 
			img.src = 'Utilities/images/Games/${game.gImg}'; /*Display the image in the db in the form  */
			document.getElementById("img-file").required = false; /* Makes input type = file required property false  */
		}  

		
</script>
<script>window.addEventListener('load', addImage());</script>

</body>

</html>