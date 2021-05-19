<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Account</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Utilities/css/admin.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Utilities/icons/css/all.css">
	<link href="${pageContext.request.contextPath}/Utilities/vendor/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/Utilities/vendor/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/Utilities/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
	
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css2?family=Nova+Cut&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Kenia&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nova+Flat&display=swap" rel="stylesheet">
	

	</head>

<body>

	<%
		//Stores session attribute
		String email = (String) session.getAttribute("email");

		//If session is not created redirects to the home page
		if (email == null) {
			response.sendRedirect(request.getContextPath() + "/Home?action=home");
		}
	%>

	<!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>

	<div class="myAccount" id="main">


		<div class="all-gme-hero-img">

			<!-- Page navigation -->
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Home?action=home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">My Account</li>

				</ol>
			</nav>
			<!-- End of Page navigation -->
		</div>

		<!-- Start of User Account-->

		<div class="user-account user-account-bg" id="user-account">
			<div class="game-title-sect" id="gme-head">
				<div class="gtxt">
					<h2 class="game-title">My Account</h2>
				</div>
			</div>

			<!-- Account pane -->
			<div class="row account">
				<div class="col-md-9 padd">
					<div class="account-pane">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link " id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true">Profile</a></li>
							<li class="nav-item"><a class="nav-link" id="email-tab" data-toggle="tab" href="#email" role="tab" aria-controls="email" aria-selected="false">Email</a></li>
							<li class="nav-item"><a class="nav-link" id="pass-tab"	data-toggle="tab" href="#pass" role="tab" aria-controls="pass"	aria-selected="false">Password</a></li>
							<li class="nav-item"><a class="nav-link" id="update-tab"	data-toggle="tab" href="#update" role="tab" aria-controls="update" aria-selected="false">Update</a></li>

						</ul>
						<div class="tab-content" id="myTabContent">
							<!-- Profile tab -->
							<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

								<div class="row">
									<div class="col-md-12 user-head">
										<i class="fas fa-user-tie user-head-icon"></i> <span class="user-heading">Profile Information</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-5 user-img">
										<img src="${pageContext.request.contextPath}/Utilities/images/user1.png">
									</div>

									<div class="col-md-7">
										<!-- Prints the ,essage sent by the servlet -->
										<div class="result" id="result">${resultAccount}</div>

										<div class="user-details">
							
											<div class="row ">
												<div class="col-md-4 t-left">First Name</div>
												<div class="col-md-8">${gamer.fname}</div>
											</div>
											<div class="row">
												<div class="col-md-4 t-left">Last Name</div>
												<div class="col-md-8">${gamer.lname}</div>
											</div>
											<div class="row">
												<div class="col-md-4 t-left">Username</div>
												<div class="col-md-8">${gamer.username}</div>
											</div>
											<div class="row">
												<div class="col-md-4 t-left">Email</div>
												<div class="col-md-8 ">${gamer.email}</div>
											</div>
											<div class="row">
												<div class="col-md-4 t-left">DOB</div>
												<div class="col-md-8">${gamer.dob}</div>
											</div>
											<div class="row">
												<div class="col-md-4 t-left">Country</div>
												<div class="col-md-8">${gamer.country}</div>
											</div>
											<div class="row ">
												<div class="col-md-8 t-left"></div>
												<div class="col-md-4 user-edit">
													<a href="GamerController?action=ACCOUNT&id=${gamer.id }&status=updateacc"	class="user-edit-btn"><i class="fas fa-user-edit"></i>Edit</a>
												</div>
											</div>
										</div>
									</div>

								</div>


							</div>
							<!-- End of Profile tab -->

							<!-- Email tab -->
							<div class="tab-pane fade " id="email" role="tabpanel" aria-labelledby="email-tab">


								<div class="row">
									<div class="col-md-12 user-head">
										<i class="fas fa-envelope user-head-icon"></i> <span class="user-heading">Update Email</span>
									</div>
								</div>
								<div class="row">
								
									<div class="col-md-4 user-img">
										<img src="${pageContext.request.contextPath}/Utilities/images/user1.png">
									</div>

									<div class="col-md-8 update-email pl-5">
										<div class="result" id="result">${resultEmail}</div>

										<div class="user-details user-email">
											<form class="needs-validation " action="GamerController?action=updateEmail&#email-tab" method="post">
												<div class="row ">

													<div class="col-md-5 t-left">Current Email</div>
													<div class="col-md-7">
														<div class="form-group">
															<input type="email" class="form-control" id="cemail" name="cemail" aria-describedby="currentEmail" required>
															<div class="invalid-feedback">Please enter a valid email address</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-5 t-left">New Email</div>
													<div class="col-md-7">
														<div class="form-group">
															<input type="email" class="form-control" id="nemail" name="nemail" aria-describedby="newEmail">
															<div class="invalid-feedback " id="e-invalid">
																Please enter a valid email address
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-5 t-left">Confirm Email</div>
													<div class="col-md-7">
														<div class="form-group">
															<input type="email" class="form-control" id="ccemail" name="ccemail" aria-describedby="confirmEmail">

															<div class="invalid-feedback">Emails do not match</div>
														</div>
													</div>
												</div>

												<div class="row ">

													<div class="col-md-8 t-left"></div>

													<div class="col-md-4 user-edit">
														<input type="text" name="id" value="${gamer.id}" hidden>
														<button type="submit" id="updateemail" class="btn btn-submit">Update</button>
													</div>

												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- End of email tab -->

							<!-- Start of password tab -->
							<div class="tab-pane fade" id="pass" role="tabpanel"aria-labelledby="pass-tab">

								<div class="row">
									<div class="col-md-12 user-head">
										<i class="fas fa-key user-head-icon"></i> <span	class="user-heading">Update Password</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4 user-img">

										<img src="${pageContext.request.contextPath}/Utilities/images/user1.png">
									</div>

									<div class="col-md-8 update-password pl-5">
										<!-- Displays the message sent by the servlet  -->
										<div class="result" id="result">${result}</div>
										<div class="user-details user-pass">
											<form class="needs-validation " action="GamerController?action=updatePass&#pass-tab" method="post">
												
												<div class="row ">
													<div class="col-md-5 t-left">Current Password</div>
													<div class="col-md-7">
														<div class="form-group">
															<input type="password" class="form-control" id="cpass" name="cpass" aria-describedby="currentPassword" required>
															<div class="invalid-feedback">Please enter a valid password</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-5 t-left">New Password</div>
													<div class="col-md-7">
														<div class="form-group">
															<input type="password" class="form-control" id="npass" name="npass" aria-describedby="emailHelp">

															<div class="invalid-feedback" id="passcr" >
																Passwords do not match</div>
															</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-5 t-left">Confirm Password</div>
													<div class="col-md-7">
														<div class="form-group">
															<input type="password" class="form-control" id="rnpass" aria-describedby="confirmPassword">

															<div class="invalid-feedback"  id="passcr2">Passwords do not match</div>
														</div>
													</div>
												</div>
												<input type="text" name="id" value="${gamer.id}" hidden>
												<div class="row ">

													<div class="col-md-8 t-left"></div>

													<div class="col-md-4 user-edit">
														<button type="submit" id="updatepass" class="btn btn-submit">Update</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- End of Password tab -->

							<!-- Start of Update tab -->
							<div class="tab-pane fade" id="update" role="tabpanel"	aria-labelledby="update-tab">

								<div class="row">
									<div class="col-md-12 user-head">
										<i class="fas fa-user-cog user-head-icon"></i> <span class="user-heading">Update Account</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-5 user-img">

										<img src="${pageContext.request.contextPath}/Utilities/images/user1.png">
									</div>

									<div class="col-md-7 update">
										<div class="user-details">
											<form class="needs-validation " novalidate action="GamerController?action=updateAccount&#profile-tab" method="post">
												<div class="row ">

													<div class="col-md-4 t-left">First Name</div>
													<div class="col-md-8">
														<div class="form-group">
															<input type="text" class="form-control" id="fname" name="fname" value="${gamer.fname}" required>
															<div class="valid-feedback">It looks great</div>
														</div>
													</div>
												</div>
												<div class="row ">

													<div class="col-md-4 t-left">Last Name</div>
													<div class="col-md-8">
														<div class="form-group">
															<input type="text" class="form-control" id="lname" name="lname" value="${gamer.lname}" aria-describedby="emailHelp" required>
															<div class="valid-feedback">It looks great</div>
														</div>
													</div>
												</div>

												<div class="row ">

													<div class="col-md-4 t-left">UserName</div>
													<div class="col-md-8">
														<div class="form-group">
															<input type="text" class="form-control" id="username" name="uname" value="${gamer.username}" aria-describedby="emailHelp" required>
															<div class="valid-feedback">It looks great</div>
														</div>
													</div>
												</div>
												<div class="row ">

													<div class="col-md-4 t-left">DOB</div>
													<div class="col-md-8">
														<div class="form-group">
															<input type="text" class="form-control " value="${gamer.dob }" id="dob" name="dob" required>
															<i class="far fa-calendar-alt cal-icon"></i>
															<div class="invalid-feedback">Please select a valid date</div>
														</div>
													</div>
												</div>
												<div class="row ">

													<div class="col-md-4 t-left">Country</div>
													<div class="col-md-8">
														<div class="form-group">
															<select class="form-control" id="country" name="country" required value="${gamer.country}">
																<option>Select your Country</option>
																<option value="Afganistan">Afghanistan</option>
																<option value="Albania">Albania</option>
																<option value="Algeria">Algeria</option>
																<option value="American Samoa">American Samoa</option>
																<option value="Andorra">Andorra</option>
																<option value="Angola">Angola</option>
																<option value="Anguilla">Anguilla</option>
																<option value="Antigua & Barbuda">Antigua & Barbuda</option>
																<option value="Argentina">Argentina</option>
																<option value="Armenia">Armenia</option>
																<option value="Aruba">Aruba</option>
																<option value="Australia">Australia</option>
																<option value="Austria">Austria</option>
																<option value="Azerbaijan">Azerbaijan</option>
																<option value="Bahamas">Bahamas</option>
																<option value="Bahrain">Bahrain</option>
																<option value="Bangladesh">Bangladesh</option>
																<option value="Barbados">Barbados</option>
																<option value="Belarus">Belarus</option>
																<option value="Belgium">Belgium</option>
																<option value="Belize">Belize</option>
																<option value="Benin">Benin</option>
																<option value="Bermuda">Bermuda</option>
																<option value="Bhutan">Bhutan</option>
																<option value="Bolivia">Bolivia</option>
																<option value="Bonaire">Bonaire</option>
																<option value="Bosnia & Herzegovina">Bosnia & Herzegovina</option>
																<option value="Botswana">Botswana</option>
																<option value="Brazil">Brazil</option>
																<option value="British Indian Ocean Ter">British Indian Ocean Ter</option>
																<option value="Brunei">Brunei</option>
																<option value="Bulgaria">Bulgaria</option>
																<option value="Burkina Faso">Burkina Faso</option>
																<option value="Burundi">Burundi</option>
																<option value="Cambodia">Cambodia</option>
																<option value="Cameroon">Cameroon</option>
																<option value="Canada">Canada</option>
																<option value="Canary Islands">Canary Islands</option>
																<option value="Cape Verde">Cape Verde</option>
																<option value="Cayman Islands">Cayman Islands</option>
																<option value="Central African Republic">Central African Republic</option>
																<option value="Chad">Chad</option>
																<option value="Channel Islands">Channel Islands</option>
																<option value="Chile">Chile</option>
																<option value="China">China</option>
																<option value="Christmas Island">Christmas Island</option>
																<option value="Cocos Island">Cocos Island</option>
																<option value="Colombia">Colombia</option>
																<option value="Comoros">Comoros</option>
																<option value="Congo">Congo</option>
																<option value="Cook Islands">Cook Islands</option>
																<option value="Costa Rica">Costa Rica</option>
																<option value="Cote DIvoire">Cote DIvoire</option>
																<option value="Croatia">Croatia</option>
																<option value="Cuba">Cuba</option>
																<option value="Curaco">Curacao</option>
																<option value="Cyprus">Cyprus</option>
																<option value="Czech Republic">Czech Republic</option>
																<option value="Denmark">Denmark</option>
																<option value="Djibouti">Djibouti</option>
																<option value="Dominica">Dominica</option>
																<option value="Dominican Republic">Dominican Republic</option>
																<option value="East Timor">East Timor</option>
																<option value="Ecuador">Ecuador</option>
																<option value="Egypt">Egypt</option>
																<option value="El Salvador">El Salvador</option>
																<option value="Equatorial Guinea">Equatorial Guinea</option>
																<option value="Eritrea">Eritrea</option>
																<option value="Estonia">Estonia</option>
																<option value="Ethiopia">Ethiopia</option>
																<option value="Falkland Islands">Falkland Islands</option>
																<option value="Faroe Islands">Faroe Islands</option>
																<option value="Fiji">Fiji</option>
																<option value="Finland">Finland</option>
																<option value="France">France</option>
																<option value="French Guiana">French Guiana</option>
																<option value="French Polynesia">French Polynesia</option>
																<option value="French Southern Ter">French Southern Ter</option>
																<option value="Gabon">Gabon</option>
																<option value="Gambia">Gambia</option>
																<option value="Georgia">Georgia</option>
																<option value="Germany">Germany</option>
																<option value="Ghana">Ghana</option>
																<option value="Gibraltar">Gibraltar</option>
																<option value="Great Britain">Great Britain</option>
																<option value="Greece">Greece</option>
																<option value="Greenland">Greenland</option>
																<option value="Grenada">Grenada</option>
																<option value="Guadeloupe">Guadeloupe</option>
																<option value="Guam">Guam</option>
																<option value="Guatemala">Guatemala</option>
																<option value="Guinea">Guinea</option>
																<option value="Guyana">Guyana</option>
																<option value="Haiti">Haiti</option>
																<option value="Hawaii">Hawaii</option>
																<option value="Honduras">Honduras</option>
																<option value="Hong Kong">Hong Kong</option>
																<option value="Hungary">Hungary</option>
																<option value="Iceland">Iceland</option>
																<option value="Indonesia">Indonesia</option>
																<option value="India">India</option>
																<option value="Iran">Iran</option>
																<option value="Iraq">Iraq</option>
																<option value="Ireland">Ireland</option>
																<option value="Isle of Man">Isle of Man</option>
																<option value="Israel">Israel</option>
																<option value="Italy">Italy</option>
																<option value="Jamaica">Jamaica</option>
																<option value="Japan">Japan</option>
																<option value="Jordan">Jordan</option>
																<option value="Kazakhstan">Kazakhstan</option>
																<option value="Kenya">Kenya</option>
																<option value="Kiribati">Kiribati</option>
																<option value="Korea North">Korea North</option>
																<option value="Korea Sout">Korea South</option>
																<option value="Kuwait">Kuwait</option>
																<option value="Kyrgyzstan">Kyrgyzstan</option>
																<option value="Laos">Laos</option>
																<option value="Latvia">Latvia</option>
																<option value="Lebanon">Lebanon</option>
																<option value="Lesotho">Lesotho</option>
																<option value="Liberia">Liberia</option>
																<option value="Libya">Libya</option>
																<option value="Liechtenstein">Liechtenstein</option>
																<option value="Lithuania">Lithuania</option>
																<option value="Luxembourg">Luxembourg</option>
																<option value="Macau">Macau</option>
																<option value="Macedonia">Macedonia</option>
																<option value="Madagascar">Madagascar</option>
																<option value="Malaysia">Malaysia</option>
																<option value="Malawi">Malawi</option>
																<option value="Maldives">Maldives</option>
																<option value="Mali">Mali</option>
																<option value="Malta">Malta</option>
																<option value="Marshall Islands">Marshall Islands</option>
																<option value="Martinique">Martinique</option>
																<option value="Mauritania">Mauritania</option>
																<option value="Mauritius">Mauritius</option>
																<option value="Mayotte">Mayotte</option>
																<option value="Mexico">Mexico</option>
																<option value="Midway Islands">Midway Islands</option>
																<option value="Moldova">Moldova</option>
																<option value="Monaco">Monaco</option>
																<option value="Mongolia">Mongolia</option>
																<option value="Montserrat">Montserrat</option>
																<option value="Morocco">Morocco</option>
																<option value="Mozambique">Mozambique</option>
																<option value="Myanmar">Myanmar</option>
																<option value="Nambia">Nambia</option>
																<option value="Nauru">Nauru</option>
																<option value="Nepal">Nepal</option>
																<option value="Netherland Antilles">Netherland Antilles</option>
																<option value="Netherlands">Netherlands(Holland, Europe)</option>
																<option value="Nevis">Nevis</option>
																<option value="New Caledonia">New Caledonia</option>
																<option value="New Zealand">New Zealand</option>
																<option value="Nicaragua">Nicaragua</option>
																<option value="Niger">Niger</option>
																<option value="Nigeria">Nigeria</option>
																<option value="Niue">Niue</option>
																<option value="Norfolk Island">Norfolk Island</option>
																<option value="Norway">Norway</option>
																<option value="Oman">Oman</option>
																<option value="Pakistan">Pakistan</option>
																<option value="Palau Island">Palau Island</option>
																<option value="Palestine">Palestine</option>
																<option value="Panama">Panama</option>
																<option value="Papua New Guinea">Papua New Guinea</option>
																<option value="Paraguay">Paraguay</option>
																<option value="Peru">Peru</option>
																<option value="Phillipines">Philippines</option>
																<option value="Pitcairn Island">Pitcairn Island</option>
																<option value="Poland">Poland</option>
																<option value="Portugal">Portugal</option>
																<option value="Puerto Rico">Puerto Rico</option>
																<option value="Qatar">Qatar</option>
																<option value="Republic of Montenegro">Republic of Montenegro</option>
																<option value="Republic of Serbia">Republic of Serbia</option>
																<option value="Reunion">Reunion</option>
																<option value="Romania">Romania</option>
																<option value="Russia">Russia</option>
																<option value="Rwanda">Rwanda</option>
																<option value="St Barthelemy">St Barthelemy</option>
																<option value="St Eustatius">St Eustatius</option>
																<option value="St Helena">St Helena</option>
																<option value="St Kitts-Nevis">St Kitts-Nevis</option>
																<option value="St Lucia">St Lucia</option>
																<option value="St Maarten">St Maarten</option>
																<option value="St Pierre & Miquelon">St Pierre & Miquelon</option>
																<option value="St Vincent & Grenadines">St Vincent & Grenadines</option>
																<option value="Saipan">Saipan</option>
																<option value="Samoa">Samoa</option>
																<option value="Samoa American">Samoa American</option>
																<option value="San Marino">San Marino</option>
																<option value="Sao Tome & Principe">Sao Tome & Principe</option>
																<option value="Saudi Arabia">Saudi Arabia</option>
																<option value="Senegal">Senegal</option>
																<option value="Seychelles">Seychelles</option>
																<option value="Sierra Leone">Sierra Leone</option>
																<option value="Singapore">Singapore</option>
																<option value="Slovakia">Slovakia</option>
																<option value="Slovenia">Slovenia</option>
																<option value="Solomon Islands">Solomon Islands</option>
																<option value="Somalia">Somalia</option>
																<option value="South Africa">South Africa</option>
																<option value="Spain">Spain</option>
																<option value="Sri Lanka">Sri Lanka</option>
																<option value="Sudan">Sudan</option>
																<option value="Suriname">Suriname</option>
																<option value="Swaziland">Swaziland</option>
																<option value="Sweden">Sweden</option>
																<option value="Switzerland">Switzerland</option>
																<option value="Syria">Syria</option>
																<option value="Tahiti">Tahiti</option>
																<option value="Taiwan">Taiwan</option>
																<option value="Tajikistan">Tajikistan</option>
																<option value="Tanzania">Tanzania</option>
																<option value="Thailand">Thailand</option>
																<option value="Togo">Togo</option>
																<option value="Tokelau">Tokelau</option>
																<option value="Tonga">Tonga</option>
																<option value="Trinidad & Tobago">Trinidad & Tobago</option>
																<option value="Tunisia">Tunisia</option>
																<option value="Turkey">Turkey</option>
																<option value="Turkmenistan">Turkmenistan</option>
																<option value="Turks & Caicos Is">Turks & Caicos Is</option>
																<option value="Tuvalu">Tuvalu</option>
																<option value="Uganda">Uganda</option>
																<option value="United Kingdom">United Kingdom</option>
																<option value="Ukraine">Ukraine</option>
																<option value="United Arab Erimates">United Arab Emirates</option>
																<option value="United States of America">United States of America</option>
																<option value="Uraguay">Uruguay</option>
																<option value="Uzbekistan">Uzbekistan</option>
																<option value="Vanuatu">Vanuatu</option>
																<option value="Vatican City State">Vatican City State</option>
																<option value="Venezuela">Venezuela</option>
																<option value="Vietnam">Vietnam</option>
																<option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option>
																<option value="Virgin Islands (USA)">Virgin Islands (USA)</option>
																<option value="Wake Island">Wake Island</option>
																<option value="Wallis & Futana Is">Wallis & Futana Is</option>
																<option value="Yemen">Yemen</option>
																<option value="Zaire">Zaire</option>
																<option value="Zambia">Zambia</option>
																<option value="Zimbabwe">Zimbabwe</option>
															</select>

														</div>
													</div>
												</div>
												<div class="row ">

													<div class="col-md-8 t-left"></div>

													<div class="col-md-4 user-edit">
														<input type="text" name="id" value="${gamer.id}" hidden>
														<button type="submit" class="btn btn-submit">Update</button>
													</div>

												</div>
											</form>
										</div>
									</div>


								</div>

							</div>
							<!-- End of Update tab -->
						</div>
					</div>
					<!--End of Account pane -->
				</div>
				<div class="col-md-3 padd">
					<div class="side-img"></div>
				</div>
			</div>
			<!--End of User pane -->
			<!-- Recommended Games -->





		</div>
		<!-- End of user Account -->

		<div class="user-account user-account-bg">

			<div class="row">

				<div class="col-md-4">

					<div class="Recommended-Games">

						<div class="side-game-head">
							<h5>Recommended Games</h5>
						</div>
						<div class="side-games">

							<div id="recommended-gme-carousel" class="carousel slide account-carousel" data-ride="carousel">
								<div class="carousel-inner">
									<!--Carousel item  -->

									<!-- Sets a variable to limit the number of games displayed  -->
									<c:set var="tr" value="0"></c:set>

									<c:forEach items="${trending}" var="trend">

										<c:if test="${tr < 18}">
											<!-- Displays only 18 games  -->

											<c:if test="${tr== 0 }">
												<div class="carousel-item active">
											</c:if>
											<c:if test="${tr== 9 }">
												<div class="carousel-item ">
											</c:if>

											<c:if test="${tr % 3 == 0 }">
												<!-- Breaks the row after 3 games are displayed  -->
												<div class="row">
											</c:if>
											<!-- Displays the game  -->

											<div class="col-md-4 ">
												<a	href="${pageContext.request.contextPath}/GameController?action=play&id=${trend.gID}">
													<div class="game-col game-cat-pd">
														<img src="${pageContext.request.contextPath}/Utilities/images/Games/${trend.gImg}" class="gme-cat-img">
														<div class="gme-cat-title">${trend.gName}</div>
													</div>
												</a>
											</div>

											<!-- Increments the variable -->
											<c:set var="tr" value="${tr+1}"></c:set>

											<c:if test="${tr % 3 == 0 }">
												<!-- Breaks the row after 3 games are displayed  -->
												</div>
												<!-- End of row column  -->
											</c:if>
											
											<c:if test="${tr % 9 == 0 }">
												<!-- Breaks the carousel after 9 games are displayed  -->
												</div>
												<!--End of carousel item-->
											</c:if>

									</c:if>

							</c:forEach>
							
							<c:if test="${tr % 9 != 0 }">
								<!-- Closes the div if the div tag is not closed at the end of the for Each loop -->
								</div>
								<!-- End of row column  -->
							</c:if>

						</div>
						<!--End of carousel inner-->
					</div>
					<!-- End of Carousel -->
				</div>
				<!-- End of Side Games -->
			</div>
			<!-- End of Recommended Games -->
		</div>
		<!-- End of col -->



		<div class="col-md-4">

			<div class="Recommended-Games">

				<div class="side-game-head">
					<h5>New Games</h5>
				</div>
				<div class="side-games">

					<div id="recommended-gme-carousel" class="carousel slide account-carousel" data-ride="carousel">
						<div class="carousel-inner">
							<!--Carousel item  -->

							<!-- Sets a variable to limit the number of games displayed  -->
							<c:set var="ng" value="0"></c:set>

							<c:forEach items="${newgme}" var="newgame">

								<c:if test="${ng < 18}">
									<!-- Displays only 18 games  -->

									<c:if test="${ng== 0 }">
										<div class="carousel-item active">
									</c:if>
									<c:if test="${ng== 9 }">
										<div class="carousel-item ">
									</c:if>

									<c:if test="${ng % 3 == 0 }">
										<!-- Breaks the row after 3 games are displayed  -->
										<div class="row">
									</c:if>
									<!-- Displays the game  -->

									<div class="col-md-4 ">
										<a href="${pageContext.request.contextPath}/GameController?action=play&id=${newgame.gID}">
											<div class="game-col game-cat-pd">
												<img src="${pageContext.request.contextPath}/Utilities/images/Games/${newgame.gImg}" class="gme-cat-img">
												<div class="gme-cat-title">${newgame.gName}</div>
											</div>
										</a>
									</div>

									<!-- Increments the variable -->
									<c:set var="ng" value="${ng+1}"></c:set>
									<c:if test="${ng % 3 == 0 }">
										<!-- Breaks the row after 3 games are displayed  -->
										</div>
										<!-- End of row column  -->
									</c:if>
									<c:if test="${ng % 9 == 0 }">
										<!-- Breaks the carousel after 9 games are displayed  -->
										</div>
										<!--End of carousel item-->
									</c:if>

							</c:if>

						</c:forEach>
						
						<c:if test="${ng % 9 != 0 }">
								<!-- Closes the div if the div tag is not closed at the end of the for Each loop -->
								</div>
								<!-- End of row column  -->
						</c:if>

				</div>
				<!--End of carousel inner-->
			</div>
			<!-- End of Carousel -->
		</div>
		<!-- End of Side Games -->
	</div>
	<!-- End of Recommended Games -->
	</div>
	<!-- End ofcol -->
	
	<div class="col-md-4">

		<div class="Recommended-Games">

			<div class="side-game-head">
				<h5>Featured Games</h5>
			</div>
			<div class="side-games">

				<div id="recommended-gme-carousel" class="carousel slide account-carousel" data-ride="carousel">
					<div class="carousel-inner">
						<!--Carousel item  -->

						<!-- Sets a variable to limit the number of games displayed  -->
						<c:set var="fg" value="0"></c:set>

						<c:forEach items="${featured}" var="featured">

							<c:if test="${fg < 18}">
								<!-- Displays only 18 games  -->

								<c:if test="${fg== 0 }">
									<div class="carousel-item active">
								</c:if>
								<c:if test="${fg== 9 }">
									<div class="carousel-item ">
								</c:if>

								<c:if test="${fg % 3 == 0 }">
									<!-- Breaks the row after 3 games are displayed  -->
									<div class="row">
								</c:if>
								<!-- Displays the game  -->

								<div class="col-md-4 ">
									<a href="${pageContext.request.contextPath}/GameController?action=play&id=${featured.gID}">
										<div class="game-col game-cat-pd">
											<img src="${pageContext.request.contextPath}/Utilities/images/Games/${featured.gImg}" class="gme-cat-img">
											<div class="gme-cat-title">${featured.gName}</div>
										</div>
									</a>
								</div>

								<!-- Increments the variable -->
								<c:set var="fg" value="${fg+1}"></c:set>

								<c:if test="${fg % 3 == 0 }">
									<!-- Breaks the row after 3 games are displayed  -->
									</div>
									<!-- End of row column  -->
								</c:if>
								<c:if test="${fg % 9 == 0 }">
									<!-- Breaks the carousel after 3 games are displayed  -->
									</div>
									<!--End of carousel item-->
								</c:if>

							</c:if>

						</c:forEach>
						
						<c:if test="${fg % 9 != 0 }">
								<!-- Closes the div if the div tag is not closed at the end of the for Each loop -->
								</div>
								<!-- End of row column  -->
						</c:if>
			</div>
			<!--End of carousel inner-->
		</div>
		<!-- End of Carousel -->
	</div>
	<!-- End of Side Games -->
	</div>
	<!-- End of Recommended Games -->

	</div>
	<!-- End ofcol -->

	</div>
	<!-- End of row -->



	</div>
	<!-- Footer -->
	<jsp:include page="Footer.jsp"></jsp:include>
	</div>
	<!-- End of my Account -->


	<!-- Sets the selected value for the country from the value in the db -->
	<script type="text/javascript">
		document.getElementById("country").value = '${gamer.country}';
	</script>
	<script>
	
		$(window).on('load', function() {
			setTimeout(function() {
				document.getElementById('result').style.display = "none";
			}, 10000); /* Sets a timer of 10s to erase the success message  */

		});
	</script>
	<script>
		window.addEventListener('load', validateAccount());
	</script>
	<script src="${pageContext.request.contextPath}/Utilities/vendor/datepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/Utilities/vendor/datepicker/daterangepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/Utilities/js/admin.js"></script>
</body>

</html>