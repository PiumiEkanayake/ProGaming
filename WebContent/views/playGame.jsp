<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>${game.gName}</title>

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
  
  <!-- Start of game page -->
  <div class="game-content" id = "main">


    <div class="game-title-sect">
      <div class="gimg">
      <img src="${pageContext.request.contextPath}/Utilities/images/Games/${game.gImg}" class="game-title-img">
    </div>
    <div class="gtxt">
      <h2 class="game-title">${game.gName}</h2>
    </div>
		 <!-- Page navigation -->
		 <nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Home?action=home">Home</a></li>
		    <li class="breadcrumb-item" ><a href="${pageContext.request.contextPath}/GameController?action=allGame&cat=All Game">Games</a></li>
		    <li class="breadcrumb-item active" aria-current="page">${game.gName}</li>
		  </ol>
		</nav>
		<!-- End of Page navigation -->


    </div>
    <div class="gme-window">${game.gLink}</div>
    <!-- Game description pane -->
    <div class="gme-des">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" id="des-tab" data-toggle="tab" href="#des" role="tab" aria-controls="des" aria-selected="true">Description</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="inst-tab" data-toggle="tab" href="#inst" role="tab" aria-controls="inst" aria-selected="false">Instructions</a>
      </li>
      
    </ul>
    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade show active" id="des" role="tabpanel" aria-labelledby="des-tab">
       			${game.gDes}
      </div>
      <div class="tab-pane fade" id="inst" role="tabpanel" aria-labelledby="inst-tab">
       			${game.gInst}
      </div>
    </div>
    </div> <!--End of Game description pane -->

    <!-- Recommended Games -->

    <div class="Recommended-Games">
      <div class = "side-game-head">
        <h5>Recommended Games</h5>
      </div>
      <div class="side-games">    
      <!-- Sets a variable to limit the number of games displayed  -->		
			<c:set var="tr" value= "0" ></c:set>
			
            <c:forEach items = "${trending}" var = "trend">
				
				<c:if test="${tr < 9}"> <!-- Displays only 9 games  -->
				
					<c:if test="${tr % 3 == 0 }"> <!-- Breaks the row after 3 games are displayed  -->
						<div class="row">
  					</c:if>
  						<!-- Displays the game  -->
		              <div class="col-md-4 ">
		                	<div class="game-col game-cat-pd">
		                		<a href = "${pageContext.request.contextPath}/GameController?action=play&id=${trend.gID}">
			                  	<img src="${pageContext.request.contextPath}/Utilities/images/Games/${trend.gImg}" class="gme-cat-img">
			                  	<div class="gme-cat-title">${trend.gName}</div>
			                  	</a>
                			</div>
              			</div>
             		<!-- Increments the variable -->
            		<c:set var="tr" value= "${tr+1}" ></c:set>
            		
            		<c:if test="${tr % 3 == 0 }">  <!-- Breaks the row after 3 games are displayed  -->
            			</div> <!-- End of row column  -->
            		</c:if>

				</c:if>	
				
            </c:forEach>	
     	</div>
      </div>   <!-- End of Recommended Games -->

         <!-- New Games -->

    <div class="new-games">

      <div class = "side-game-head">
        <h5>New Games</h5>
      </div>
      <div class="side-games">
       <!-- Sets a variable to limit the number of games displayed  -->		
			<c:set var="ng" value= "0" ></c:set>
			
            <c:forEach items = "${newgme}" var = "newgme">
				
				<c:if test="${ng < 9}"> <!-- Displays only 9 games  -->
				
					<c:if test="${ng % 3 == 0 }"> <!-- Breaks the row after 3 games are displayed  -->
						<div class="row">
  					</c:if>
  						<!-- Displays the game  -->
		              <div class="col-md-4 ">
		              		<a href = "${pageContext.request.contextPath}/GameController?action=play&id=${newgme.gID}">
		                	<div class="game-col game-cat-pd">	
			                  	<img src="${pageContext.request.contextPath}/Utilities/images/Games/${newgme.gImg}" class="gme-cat-img">
			                  	<div class="gme-cat-title">${newgme.gName}</div>      	
                			</div>
                			</a>
              		</div>
             		<!-- Increments the variable -->
            		<c:set var="ng" value= "${ng+1}" ></c:set>
            		
            		<c:if test="${ng % 3 == 0 }">  <!-- Breaks the row after 3 games are displayed  -->
            			</div> <!-- End of row column  -->
            		</c:if>
				</c:if>				
            </c:forEach>	
  		</div>
      </div>   <!-- End of New Games -->
	<jsp:include page="Footer.jsp"></jsp:include>

  </div><!-- End of game page -->
 
  
<script src="//static.miniclipcdn.com/js/game-embed.js"></script>
  
 
<script type ="text/javascript" src="${pageContext.request.contextPath}/Utilities/js/admin.js"></script>

</body>

</html>