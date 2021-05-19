<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="ISO-8859-1">
	<title>All Games</title>
	
	<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"	crossorigin="anonymous">
	<link rel="stylesheet"	href="${pageContext.request.contextPath}/Utilities/css/admin.css">
	<link rel="stylesheet"	href="${pageContext.request.contextPath}/Utilities/icons/css/all.css">
	<link	href="${pageContext.request.contextPath}/Utilities/vendor/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css"	rel="stylesheet">
	<link	href="${pageContext.request.contextPath}/Utilities/vendor/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css"	rel="stylesheet">
	
	<!-- Font -->
	<link	href="https://fonts.googleapis.com/css2?family=Nova+Cut&display=swap"	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Kenia&display=swap"	rel="stylesheet">
	<link	href="https://fonts.googleapis.com/css2?family=Nova+Flat&display=swap"	rel="stylesheet">

</head>

<body>

	<!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>

	<!-- Start of all games -->
	<div class="all-games" id="main">

		<div class="all-gme-hero-img">

			<!-- Page navigation -->
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath}/Home?action=home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Games</li>
				</ol>
			</nav>
			<!-- End of Page navigation -->
		</div>
		<div class="game-title-sect" id="gme-head">
			<div class="gtxt">
				<h2 class="game-title">ALL GAMES</h2>
			</div>
		</div>

		<div class="all-gme-main">

			<div class="row">
				<div class="col-2 all-gme-side-bg">
					<div class="nav flex-column nav-pills" id="v-pills-tab"
						role="tablist" aria-orientation="vertical">

						<!-- Displays the names of the categories in the side naviagtion bar  -->
						<c:forEach items="${list}" var="cat">

							<a class="nav-link " id="${cat.name}" href="${pageContext.request.contextPath}/GameController?action=allGame&cat=${cat.name}&#gme-head" role="tab" aria-controls="v-pills-home" aria-selected="true">${cat.name }</a>

						</c:forEach>
					</div>
				</div>
				<div class="col-10">

					<div class="all-gme-cat">
						
						<h3 class = "not-found">${notFound}</h3>
						
						 
						<!-- Sets a variable to limit the number of games displayed  -->
						<c:set var="all" value="0"></c:set>

						<c:forEach items="${catgme}" var="allgme">

				 				
							<c:if test="${all % 6 == 0 }">
								<!-- Breaks the row after 6 games are displayed  -->
								<div class="row">
							</c:if>
							<!-- Displays the game  -->
							<div class="col-lg-2 col-sm-4 ">
								<div class="game-col">
									<img src="${pageContext.request.contextPath}/Utilities/images/Games/${allgme.gImg}" class="gme-img">
									<div class="gme-title">${allgme.gName}</div>
									<a href="${pageContext.request.contextPath}/GameController?action=play&id=${allgme.gID}" class="btn  play-btn">Play</a>
								</div>
							</div>
							<!-- Increments the variable -->
							<c:set var="all" value="${all+1}"></c:set>

							<c:if test="${all % 6 == 0 }">
								<!-- Breaks the row after 6 games are displayed  -->
								</div>
								<!-- End of row column  -->
							</c:if>
					</c:forEach>
					
					<c:if test="${all % 6 != 0 }">
						<!-- Closes the div if the div tag is not closed at the end of the for Each loop -->
						</div>
						<!-- End of row column  -->
					</c:if>
			</div>
		</div>
	</div>
	</div>
	<!-- End of all games -->
	<jsp:include page="Footer.jsp"></jsp:include>
	</div>
	<!-- End of game page -->

	<script>


</script>
	<script type="text/javascript">

  
    function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;

	}
	//Gets the category from the url
	var cat = getUrlVars()["cat"];

	//Replaces %20 with a space
	if(cat != null){
		
		var tab = cat.replace("%20", " ");
		var element_tab =  document.getElementById(tab);
		element_tab.classList.add("active");
	}	
	
	/*Checks whether id and action parameters are set  */
	var id = getUrlVars()["id"];
	var action = getUrlVars()["action"];
	//Opens All Gmes section when Games link is clicked initially
  	if (action == null){
		window.location.href = "<%=request.getContextPath()%>/GameController?action=allGame";
		}
	</script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/Utilities/js/admin.js"></script>
</body>

</html>