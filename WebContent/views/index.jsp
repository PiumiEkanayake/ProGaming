<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Home</title>

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

	<!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>


	<!-- Start of home page -->
	<div class="home" id="main">


		<!-- Start of hero section -->
		<div class="hero">
			<!-- Hero iamge -->
			<div class="jumbotron hero-img">

				<div class="hero-text">
					<h1 class="hero-text-1">All Latest Games</h1>
					<h1 class="hero-text-2">Fun and Adventure</h1>
					<a class="btn hero-btn" href="#home-content" role="button">Play Now</a>
				</div>

			</div>
		</div>
		<!-- End of hero section -->

		<!-- Start of home content -->
		<div class="home-content" id="home-content">

			<div class="featured-gme">
				<div class="sect-head">
					<h1 class="sect-title">Featured Games</h1>
					<a class="sect-link" href="${pageContext.request.contextPath}/GameController?action=allGame&cat=Featured Games&#gme-head">View all Featured Games</a>
				</div>

				<div class="owl-carousel owl-two">

					<!-- Sets a variable to limit the number of games to display  -->
					<c:set var="fg" value="0"></c:set>
					
					<c:forEach items="${featured}" var="featured">
						<c:if test="${fg < 8}">
							<!-- Displays only 8 games  -->
							<!-- Displays the game  -->
							<div>
								<a href="${pageContext.request.contextPath}/GameController?action=play&id=${featured.gID}">
									<img src="${pageContext.request.contextPath}/Utilities/images/Games/${featured.gImg}">
								</a>
							</div>
							<c:set var="fg" value="${fg+1}"></c:set> <!-- Increments the variable -->
						</c:if>
					</c:forEach>
				</div>
			</div>

			<div class="new-gme">
				<div class="sect-head">
					<h1 class="sect-title">New Games</h1>
					<a class="sect-link" href="${pageContext.request.contextPath}/GameController?action=allGame&cat=All Games&#gme-head">View all New Games</a>
				</div>
				
				<div class="owl-carousel owl-one">

					<!-- Sets a variable to limit the number of games displayed  -->
					<c:set var="ng" value="0"></c:set>

					<c:forEach items="${newgme}" var="n">

						<c:if test="${ng < 20}">
							<!-- Displays only 20 games  -->

							<c:if test="${ng % 2 == 0 }">
								<!-- Breaks the row after 2 games are displayed  -->
								<div class="item">
							</c:if>
							<!-- Displays the game  -->
							<div class="game-col">
								<img src="${pageContext.request.contextPath}/Utilities/images/Games/${n.gImg}" class="gme-img">
								<div class="gme-title">${n.gName}</div>
								<a href="${pageContext.request.contextPath}/GameController?action=play&id=${n.gID}" class="btn  play-btn">Play</a>
							</div>
							<!-- Increments the variable -->
							<c:set var="ng" value="${ng+1}"></c:set>

							<!-- Breaks the row after 2 games are displayed  -->
							<c:if test="${ng % 2 == 0 }">
								</div><!-- End of item column  -->
							</c:if>

						</c:if>
				</c:forEach>

			</div>
		</div>
	</div>

	<!-- Trending Games -->
	<div class="trending-gme mt-4">
		<div class="sect-head">
			<h1 class="sect-title">Trending Games</h1>
			<a class="sect-link"  href="${pageContext.request.contextPath}/GameController?action=allGame&cat=Trending&#gme-head">View all Trending Games</a>
		</div>

		<!-- Sets a variable to limit the number of games displayed  -->
		<c:set var="trend" value="0"></c:set>

		<c:forEach items="${trending}" var="g">

			<c:if test="${trend < 12}">
				<!-- Displays only 12 games  -->

				<c:if test="${trend % 6 == 0 }">
					<!-- Breaks the row after 6 games are displayed  -->
					<div class="row">
				</c:if>
				<!-- Displays the game  -->
				<div class="col-lg-2 col-sm-4 ">
					<div class="game-col">
						<img src="${pageContext.request.contextPath}/Utilities/images/Games/${g.gImg}" class="gme-img">
						<div class="gme-title">${g.gName}</div>
						<a href="${pageContext.request.contextPath}/GameController?action=play&id=${g.gID}" class="btn  play-btn">Play</a>
					</div>
				</div>
				<!-- Increments the variable -->
				<c:set var="trend" value="${trend+1}"></c:set>

				<c:if test="${trend % 6 == 0 }">
					<!-- Breaks the row after 6 games are displayed  -->
					</div>
					<!-- End of row column  -->
				</c:if>
			</c:if>
	</c:forEach>
	</div>
	<!-- End of Trending Games -->


	<div class="row home-cat">

		<div class="col-xl-4 home-subcat">
			<!-- Start of sub category 1 -->
			<div class="mt-4">
				<div class="sect-head">
					<h1 class="sect-title-cat">Action</h1>
				</div>
			</div>

			<!-- Sets a variable to limit the number of games displayed  -->
			<c:set var="act" value="0"></c:set>

			<c:forEach items="${action}" var="action">

				<c:if test="${act < 6}">
					<!-- Displays only 6 games  -->

					<c:if test="${act % 3 == 0 }">
						<!-- Breaks the row after 3 games are displayed  -->
						<div class="row">
					</c:if>
					<!-- Displays the game  -->
					<div class="col-md-4 ">
						<a href="${pageContext.request.contextPath}/GameController?action=play&id=${action.gID}">
							<div class="game-col game-cat-pd">
								<img src="${pageContext.request.contextPath}/Utilities/images/Games/${action.gImg}" class="gme-cat-img">
								<div class="gme-cat-title">${action.gName}</div>
							</div>
						</a>
					</div>
					<!-- Increments the variable -->
					<c:set var="act" value="${act+1}"></c:set>

					<c:if test="${act % 3 == 0 }">
						<!-- Breaks the row after 3 games are displayed  -->
		</div>
		<!-- End of row column  -->
		</c:if>

		</c:if>

		</c:forEach>

		<a  href="${pageContext.request.contextPath}/GameController?action=allGame&cat=Action&#gme-head" class="home-cat-link">View all action games</a>
	</div>
	<!-- End of sub category 1 -->

	<div class="col-xl-4 home-subcat">
		<!-- Start of sub category 2-->
		<div class="mt-4">
			<div class="sect-head">
				<h1 class="sect-title-cat">Racing</h1>
			</div>
		</div>

		<!-- Sets a variable to limit the number of games displayed  -->
		<c:set var="race" value="0"></c:set>

		<c:forEach items="${racing}" var="racing">

			<c:if test="${race < 6}">
				<!-- Displays only 6 games  -->

				<c:if test="${race % 3 == 0 }">
					<!-- Breaks the row after 3 games are displayed  -->
					<div class="row">
				</c:if>
				<!-- Displays the game  -->
				<div class="col-md-4 ">
					<a href="${pageContext.request.contextPath}/GameController?action=play&id=${racing.gID}">
						<div class="game-col game-cat-pd">
							<img src="${pageContext.request.contextPath}/Utilities/images/Games/${racing.gImg}" class="gme-cat-img">
							<div class="gme-cat-title">${racing.gName}</div>
						</div>
					</a>
				</div>
				<!-- Increments the variable -->
				<c:set var="race" value="${race+1}"></c:set>

				<c:if test="${race % 3 == 0 }">
					<!-- Breaks the row after 3 games are displayed  -->
					</div>
					<!-- End of row column  -->
				</c:if>

			</c:if>

		</c:forEach>

	<a h href="${pageContext.request.contextPath}/GameController?action=allGame&cat=Racing&#gme-head" class="home-cat-link">View all Racing games</a>

	</div>
	<!-- End of sub category 2 -->

	<div class="col-xl-4 home-subcat multi">
		<!-- Start of sub category 3-->
		<div class="mt-4">
			<div class="sect-head ">
				<h1 class="sect-title-cat ">Multiplayer</h1>
			</div>
		</div>

		<!-- Sets a variable to limit the number of games displayed  -->
		<c:set var="multi" value="0"></c:set>

		<c:forEach items="${multiplayer}" var="multiplayer">

			<c:if test="${multi < 6}">
				<!-- Displays only 6 games  -->

				<c:if test="${multi % 3 == 0 }">
					<!-- Breaks the row after 3 games are displayed  -->
					<div class="row">
				</c:if>
				<!-- Displays the game  -->
				<div class="col-md-4 ">
					<a href="${pageContext.request.contextPath}/GameController?action=play&id=${multiplayer.gID}">
						<div class="game-col game-cat-pd">
							<img src="${pageContext.request.contextPath}/Utilities/images/Games/${multiplayer.gImg}" class="gme-cat-img">
							<div class="gme-cat-title">${multiplayer.gName}</div>
						</div>
					</a>
				</div>
				<!-- Increments the variable -->
				<c:set var="multi" value="${multi+1}"></c:set>

				<c:if test="${multi % 3 == 0 }">
					<!-- Breaks the row after 3 games are displayed  -->
					</div>
					<!-- End of row column  -->
				</c:if>

			</c:if>

		</c:forEach>
		
	<a  href="${pageContext.request.contextPath}/GameController?action=allGame&cat=Multiplayer&#gme-head" class="home-cat-link">View all Multiplayer games</a>

	</div>
	<!-- End of sub category 3 -->



	<div class="col-xl-4 home-subcat">
		<!-- Start of sub category 2.1 -->
		<div class="mt-4">
			<div class="sect-head">
				<h1 class="sect-title-cat">Shooting</h1>
			</div>
		</div>

		<!-- Sets a variable to limit the number of games displayed  -->
		<c:set var="act" value="0"></c:set>

		<c:forEach items="${shooting}" var="shooting">

			<c:if test="${act < 6}">
				<!-- Displays only 6 games  -->

				<c:if test="${act % 3 == 0 }">
					<!-- Breaks the row after 3 games are displayed  -->
					<div class="row">
				</c:if>
				<!-- Displays the game  -->
				<div class="col-md-4 ">
					<a  href="${pageContext.request.contextPath}/GameController?action=play&id=${shooting.gID}">
						<div class="game-col game-cat-pd">
							<img src="${pageContext.request.contextPath}/Utilities/images/Games/${shooting.gImg}" class="gme-cat-img">
							<div class="gme-cat-title">${shooting.gName}</div>
						</div>
					</a>
				</div>
				<!-- Increments the variable -->
				<c:set var="act" value="${act+1}"></c:set>

				<c:if test="${act % 3 == 0 }">
					<!-- Breaks the row after 3 games are displayed  -->
					</div>
					<!-- End of row column  -->
				</c:if>

			</c:if>

		</c:forEach>

	<a  href="${pageContext.request.contextPath}/GameController?action=allGame&cat=Shooting&#gme-head" class="home-cat-link">View all Shooting games</a>

	</div>
	<!-- End of sub category 1 -->

	<div class="col-xl-4 home-subcat">
		<!-- Start of sub category 2.2-->
		<div class="mt-4">
			<div class="sect-head">
				<h1 class="sect-title-cat">Sports</h1>
			</div>
		</div>

		<!-- Sets a variable to limit the number of games displayed  -->
		<c:set var="race" value="0"></c:set>

		<c:forEach items="${sports}" var="sports">

			<c:if test="${race < 6}">
				<!-- Displays only 6 games  -->

				<c:if test="${race % 3 == 0 }">
					<!-- Breaks the row after 3 games are displayed  -->
					<div class="row">
				</c:if>
				<!-- Displays the game  -->
				<div class="col-md-4 ">
					<a href="${pageContext.request.contextPath}/GameController?action=play&id=${sports.gID}">
						<div class="game-col game-cat-pd">
							<img src="${pageContext.request.contextPath}/Utilities/images/Games/${sports.gImg}" class="gme-cat-img">
							<div class="gme-cat-title">${sports.gName}</div>
						</div>
					</a>
				</div>
				<!-- Increments the variable -->
				<c:set var="race" value="${race+1}"></c:set>

				<c:if test="${race % 3 == 0 }">
					<!-- Breaks the row after 3 games are displayed  -->
					</div>
					<!-- End of row column  -->
				</c:if>

			</c:if>

		</c:forEach>

	<a  href="${pageContext.request.contextPath}/GameController?action=allGame&cat=Sports&#gme-head" class="home-cat-link">View all Sports games</a>

	</div>
	<!-- End of sub category 2 -->

	<div class="col-xl-4 home-subcat multi">
		<!-- Start of sub category 2.3-->
		<div class="mt-4">
			<div class="sect-head ">
				<h1 class="sect-title-cat ">Stunt</h1>
			</div>
		</div>

		<!-- Sets a variable to limit the number of games displayed  -->
		<c:set var="multi" value="0"></c:set>

		<c:forEach items="${stunt}" var="stunt">

			<c:if test="${multi < 6}">
				<!-- Displays only 6 games  -->

				<c:if test="${multi % 3 == 0 }">
					<!-- Breaks the row after 3 games are displayed  -->
					<div class="row">
				</c:if>
				<!-- Displays the game  -->
				<div class="col-md-4 ">
					<a href="${pageContext.request.contextPath}/GameController?action=play&id=${stunt.gID}">
						<div class="game-col game-cat-pd">
							<img src="${pageContext.request.contextPath}/Utilities/images/Games/${stunt.gImg}" class="gme-cat-img">
							<div class="gme-cat-title">${stunt.gName}</div>
						</div>
					</a>
				</div>
				<!-- Increments the variable -->
				<c:set var="multi" value="${multi+1}"></c:set>

				<c:if test="${multi % 3 == 0 }">
					<!-- Breaks the row after 3 games are displayed  -->
					</div>
					<!-- End of row column  -->
				</c:if>

			</c:if>

		</c:forEach>
	<a  href="${pageContext.request.contextPath}/GameController?action=allGame&cat=Stunt&#gme-head" class="home-cat-link">View all Stunt games</a>

	</div>
	<!-- End of sub category 3 -->

	</div>

	<!-- </div> -->
	<!-- End of home content -->

	<jsp:include page="Footer.jsp"></jsp:include>

	</div>
	<!-- End of home page -->


	<script type="text/javascript" src="${pageContext.request.contextPath}/Utilities/vendor/OwlCarousel2-2.3.4/docs/assets/vendors/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/Utilities/vendor/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>

	<script type="text/javascript">

  
	  function getUrlVars() {
			var vars = {};
			var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
			    vars[key] = value;
			});
			return vars;	
		} 

  
	/*Checks whether id and action parameters are set  */
	var id = getUrlVars()["id"];
	var action = getUrlVars()["action"];
  	if (action == null ){
  
		window.location.href = "<%=request.getContextPath()%>/Home?action=home"; //This redirects to the server in order display the games
	}
  	
		if ( action == "Login"){
  		
	  		if('${status}' == "Invalid Credentials, Please Try again!")
	  		{
	  			var log = document.getElementById('loginLink');
	  			log.click(); // Opens the login modal and displays the error message
	  			
	  		}else{
	  			window.location.href = "<%=request.getContextPath()%>/Home?action=home"; //This redirects to the server in order display the games
			}
		}

		//Featured Games
		var owl = $('.owl-two');
		owl.owlCarousel({

			loop : true,
			margin : 10,
			autoplay : true,
			autoplayTimeout : 3000,
			autoplayHoverPause : true,
			responsive : {
				0 : {
					items : 1
				},
				600 : {
					items : 4
				},
				1000 : {
					items : 5
				}
			}

		});

		//New Games
		var owl1 = $('.owl-one');
		owl1.owlCarousel({

			loop : true,
			margin : 10,
			autoplay : true,
			autoplayTimeout : 3000,
			autoplayHoverPause : true,
			responsive : {
				0 : {
					items : 3
				},
				600 : {
					items : 5
				},
				1000 : {
					items : 6
				}
			}

		});
	</script>
	
	<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/Utilities/js/admin.js"></script>
</body>

</html>