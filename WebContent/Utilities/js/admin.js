

(function() {
      'use strict';
      window.addEventListener('load', function() {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function(form) {
          form.addEventListener('submit', function(event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }
            form.classList.add('was-validated');
          }, false);
        });
      }, false);
    })();   

$(function() {
    $('input[name="dob"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        minYear: 1901,
        locale: {
            format: 'DD/MM/YYYY'
          },
        maxYear: parseInt(moment().format('YYYY'),10)
    }, function(start, end, label) {
        var years = moment().diff(start, 'years');
    });
    });

document.getElementById("main").addEventListener("scroll", myFunction);
   function myFunction() {
	   elmnt =  document.getElementById("main");
	   var y = elmnt.scrollTop;
	   
	   if(y>60){
		   elmnt.style.top = "0px";
		   elmnt.style.transition = "all 0.5s"
		   
	   }else{
		   elmnt.style.top = "86px";
	   }

	 }
   document.getElementById("h-search-icon").addEventListener("click", myFunction1);
   function myFunction1() {

	   elmnt =  document.getElementById("main");
	   elmnt.style.transition = "all 0.4s"
		   
	   if(elmnt.style.top == "140px"){
		   elmnt.style.top = "85px";   

	   }else{
		   elmnt.style.top = "140px";
	   }
	   
	 }
   
   /* My Account */
//   Selecting the exact tab
   
   function getUrlVars() {
	    var vars = {};
	    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
	        vars[key] = value;
	    });
	    return vars;

		}


	var id = getUrlVars()["action"];
	var status = getUrlVars()["status"];

	if(status == "updateacc"){
			window.location.href = "#user-account";
		 	var element =  document.getElementById("update");
			var element_tab =  document.getElementById("update-tab");
			element_tab.classList.add("active");
			element.classList.add("show");
			element.classList.add("active");
	}
	else if(id =="updatePass"){
	  
	 	var element =  document.getElementById("pass");
		var element_tab =  document.getElementById("pass-tab");
		element_tab.classList.add("active");
		element.classList.add("show");
		element.classList.add("active");
		
	}else if(id =="updateEmail"){

		var element =  document.getElementById("email");
		var element_tab =  document.getElementById("email-tab");
		element_tab.classList.add("active");
		element.classList.add("show");
		element.classList.add("active");
	}
	else {
		var element =  document.getElementById("profile");
		var element_tab =  document.getElementById("profile-tab");
		element_tab.classList.add("active");
		element.classList.add("show");
		element.classList.add("active");

	}
	
//	Password validation
function validateAccount(){
	$('#rnpass,#npass').on('change',function(e){

		var npass = document.getElementById('npass').value;
		var cpass = document.getElementById('cpass').value;
		var rnpass = document.getElementById('rnpass').value;
		var n = document.getElementById('npass');
		var rn = document.getElementById('rnpass');
		var c = document.getElementById('cpass');
		c.classList.remove("is-invalid");
		n.classList.remove("is-invalid");
		rn.classList.remove("is-invalid");	
		
		var paswd=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;
		if(n.value.match(paswd)){
			
			n.classList.add("is-valid");
			document.getElementById('passcr').innerHTML = "Passwords do not match";
			document.getElementById('passcr').style.fontSize = "13px";
			document.getElementById('passcr').style.lineHeight = "2.5";
			var userpass = document.getElementById('passcr2');
			if(userpass != null){
				document.getElementById('passcr2').style.fontSize = "13px"
			}
			if(rnpass !== ""){
				if(npass != rnpass){
					n.classList.add("is-invalid");
					rn.classList.add("is-invalid");

			        
				}else if(npass == rnpass){
					n.classList.remove("is-invalid");
					rn.classList.remove("is-invalid");
					n.classList.add("is-valid");
					rn.classList.add("is-valid");
				}
			}else{
				n.classList.remove("is-invalid");
				rn.classList.remove("is-invalid");
				rn.classList.remove("is-valid");

			}
			
		}else{
			n.classList.add("is-invalid");
			document.getElementById('passcr').innerHTML = "The Password you entered doesn't meet the required criteria <br> <ul><li>It should contain 8-15 characters<li>It should contain atleast 1 number<li>It should contain atleast 1 special digit";
			document.getElementById('passcr').style.fontSize = "14px";
			document.getElementById('passcr').style.lineHeight = "1.6";

		}
		
	});
//	Checks for null values and pattern onclicking the update btn
	$('#updatepass').on('click',function(e){
		
		var npass = document.getElementById('npass').value;
		var cpass = document.getElementById('cpass').value;
		var rnpass = document.getElementById('rnpass').value;
		var c = document.getElementById('cpass');
		var n = document.getElementById('npass');
		var rn = document.getElementById('rnpass');

		if(npass === "" || rnpass === "" || cpass === ""){
			alert("Please fill the fields before submitting")
			event.preventDefault();
		    event.stopPropagation();
		}
		var paswd=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;
		if(n.value.match(paswd)){
			if (rnpass!== npass){
			event.preventDefault();
		    event.stopPropagation();
			}
		}else{
			event.preventDefault();
		    event.stopPropagation();
		}
		
	});
	
//	Email validation for new email and confirm email
	$('#nemail,#ccemail').on('change',function(e){

		var nemail = document.getElementById('nemail').value;
		var ccemail = document.getElementById('ccemail').value;
		var cemail = document.getElementById('cemail').value;
		var ne = document.getElementById('nemail');
		var re = document.getElementById('ccemail');
		var ce = document.getElementById('cemail');
		var pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

		
		 if(ne.value.match(pattern)){	
			if(ccemail !== ""){
				if(nemail != ccemail){
					ne.classList.add("is-invalid");
					re.classList.add("is-invalid");
					document.getElementById('e-invalid').innerHTML = "Emails do not match";
					document.getElementById('e-invalid').style.fontSize = "18px";
					document.getElementById('e-invalid').style.lineHeight = "2.5";
	      
				}else if(nemail == ccemail){
					ne.classList.remove("is-invalid");
					re.classList.remove("is-invalid");
					ne.classList.add("is-valid");
					re.classList.add("is-valid")
					
				}
			}else{
				ne.classList.remove("is-invalid");
				re.classList.remove("is-invalid");
				re.classList.remove("is-valid");

			}
		 }else{
			ne.classList.add("is-invalid");
			re.classList.remove("is-valid");
			document.getElementById('e-invalid').innerHTML = "Please enter a valid email address";
			document.getElementById('e-invalid').style.fontSize = "18px";
			document.getElementById('e-invalid').style.lineHeight = "2.5";
		 }
		 
		 
		
	});
//	Email validation for current email
	$('#cemail').on('change',function(e){
		
		var nemail = document.getElementById('nemail').value;
		var ccemail = document.getElementById('ccemail').value;
		var cemail = document.getElementById('cemail').value;
		var ne = document.getElementById('nemail');
		var re = document.getElementById('ccemail');
		var ce = document.getElementById('cemail');
		var pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

		if(ce.value.match(pattern)){

			 ce.classList.remove("is-invalid");
		 }else{
			 ce.classList.add("is-invalid");
		 }
	});
//	Checks for null values and validity on clicking the update btn
	$('#updateemail').on('click',function(e){
		
		var nemail = document.getElementById('nemail').value;
		var ccemail = document.getElementById('ccemail').value;
		var cemail = document.getElementById('cemail').value;
		var ne = document.getElementById('nemail');
		var cc = document.getElementById('ccemail');
		var ce = document.getElementById('cemail');

		if(nemail === "" || cemail === "" || ccemail === ""){
			alert("Please fill the fields before submitting")
			event.preventDefault();
		    event.stopPropagation();
		}
		var pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		if(ne.value.match(pattern) && ce.value.match(pattern) && cc.value.match(pattern)){
			if (nemail !== ccemail){
			event.preventDefault();
		    event.stopPropagation();
			}
		}else{
			event.preventDefault();
		    event.stopPropagation();
		}
		
	});
};	
//	Register
	function validate(){


	  $('#repass,#newpass').on('change',function(e){

  		var npass = document.getElementById('newpass').value;
  		var rnpass = document.getElementById('repass').value;
  		var n = document.getElementById('newpass');
  		var rn = document.getElementById('repass');
  		n.classList.remove("is-invalid");
  		rn.classList.remove("is-invalid");	
  		
  		var paswd=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;
  		if(n.value.match(paswd)){
  			
  			n.classList.add("is-valid");
  			document.getElementById('passfeed').innerHTML = "Passwords do not match";
  			document.getElementById('passfeed').style.fontSize = "13px";
  			document.getElementById('passfeed').style.lineHeight = "1";
  			
  			if(rnpass !== ""){
  				if(npass != rnpass){
  					n.classList.add("is-invalid");
  					rn.classList.add("is-invalid");
					
  			        
  				}else if(npass == rnpass){
  					n.classList.remove("is-invalid");
  					rn.classList.remove("is-invalid");
  					n.classList.add("is-valid");
  					rn.classList.add("is-valid");
  				}
  			}else{
  				n.classList.remove("is-invalid");
  				rn.classList.remove("is-invalid");
  				rn.classList.remove("is-valid");

  			}
  			
  		}else{
  			n.classList.add("is-invalid");
  			document.getElementById('passfeed').innerHTML = "The Password you entered doesn't meet the required criteria <br> <ul><li>It should contain 8-15 characters<li>It should contain atleast 1 number<li>It should contain atleast 1 special digit";
  			document.getElementById('passfeed').style.fontSize = "14px";
  			document.getElementById('passfeed').style.lineHeight = "1.6";

  		}
	
  	});
      
  	$('#Submit').on('click',function(e){
  		
  		var npass = document.getElementById('newpass').value;
  		var rnpass = document.getElementById('repass').value;
  		var n = document.getElementById('newpass');
  		var rn = document.getElementById('repass');

  		if(npass === "" || rnpass === ""){
  			alert("Please fill the fields before submitting")
  			event.preventDefault();
  		    event.stopPropagation();
  		}
  		var paswd=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;
  		if(n.value.match(paswd)){
  			if (rnpass!== npass){
  			event.preventDefault();
  		    event.stopPropagation();
  			}
  		}else{
  			event.preventDefault();
  		    event.stopPropagation();
  		}
  		
  	});
	};
	
function addImage(){
	
	/* validates the size of the image  */
	$('#img-file').bind('change', function() {
		
		var fileSize = this.files[0].size/1024/1024;
		
		if(fileSize > 5){
			alert('The maximum allowed file size is 5MB');
			document.getElementById('img-file').value = "";
		}
	});
	
	/* Display image name when image is selected  */
	$('#img-file').on('change',function(e){
		
	 		if (e.target.files.length) {
	            $(this).next('.custom-file-label').html(e.target.files[0].name);
	            	
	        }else{
	        	 var fileName = "Choose Image";
	        	 var img = document.getElementById('gme-select-img');
	        	 $(this).next('.custom-file-label').html(fileName); /*If no image is choosen it displays choose image  */
	        	 $('#gme-select-img').attr('src','');
	        	 img.style.display = 'none';
	        }
	});
		
}

//Chart

function displayChart(){
	
	//Total Gamers chart
    var ctx = document.getElementById('myChart').getContext('2d');
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: monthGamer,
            datasets: [{
                label: '# of Gamers',
                data: countGamer,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)'
                ],
                borderColor: [
                    'rgba(172, 20, 25, 0.9)',             
                ],
                borderWidth: 3,     
            }]
        },
        
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        fontStyle :'bold'    
                    }
                }],
                xAxes: [{
                    ticks: {
                        
                        fontStyle :'bold',
                        fontFamily:"Nova Square",
                        fontSize:13

                        
                    }
                }]
            },legend :{
                display :false
            },title :{
                display :true,
                text : 'Total No. of Gamers',
                padding:20,
                fontFamily:"Nova Square",
                fontSize : 24,
                fontStyle : 'bold',
                fontColor: 'rgba(15, 75, 86, 0.925)'
            },gridLines :{
                lineWidth:5
            },line :{
                borderWidth : 4
            }, animation: {
                duration:3000,
                easing:'linear'
            },     
        }
    });
    
  //Total Traffic chart
    var ctx_traffic = document.getElementById('myChart-traffic').getContext('2d');
    var myLineChart_traffic = new Chart(ctx_traffic, {
        type: 'line',
        data: {
            labels: dateTraffic,
            datasets: [{
                label: '# of Visitors',
                data: countTraffic,
                backgroundColor: [
                'rgba(238, 232, 169, 0.5'

                ],
                borderColor: [
                    'rgba(172, 20, 25, 0.7)',  
                ],
                borderWidth: 3,    
            }]
        },
        
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        fontStyle :'bold'   
                    }
                }],
                xAxes: [{
                    ticks: {
                        
                        fontStyle :'bold',
                        fontFamily:"Nova Square",
                        fontSize:13     
                    }
                }]
            },legend :{
                display :false
            },title :{
                display :true,
                text : 'Total Traffic',
                padding:20,
                fontFamily:"Nova Square",
                fontSize : 24,
                fontStyle : 'bold',
                fontColor: 'rgba(172, 20, 25, 0.8)'
            },gridLines :{
                lineWidth:5
            },line :{
                borderWidth : 4
            },animation: {
                duration:3000,
                easing:'easeInSine'
        }
        }
    });
    
  //Total Games barchart
    var ctx_games = document.getElementById('myChart-game').getContext('2d');
    var myLineChart_games = new Chart(ctx_games, {
        type: 'bar',
        data: {
            labels: monthGame,
            datasets: [{
                label: '# of Games',
                data: countGame,
                backgroundColor: [

                    'rgba(255, 99, 132, 0.3)',
                    'rgba(54, 162, 235, 0.3)',
                    'rgba(255, 206, 86, 0.3)',
                    'rgba(75, 192, 192, 0.3)',
                    'rgba(153, 102, 255, 0.3)',
                    'rgba(255, 159, 64, 0.3)',
                    'rgba(0, 144, 145, 0.3)',
                    'rgba(74, 203, 177, 0.31)',
                    
                    'rgba(45, 175, 147, 0.3)',
                    'rgba(106, 203, 137, 0.3)',
                    'rgba(173, 228, 123, 0.3)',
                    'rgba(249, 248, 113, 0.3)',

                ],
                borderColor: [
                	'rgba(255, 99, 132, 0.8)',
                    'rgba(54, 162, 235, 0.8)',
                    'rgba(255, 206, 86, 0.8)',
                    'rgba(75, 192, 192, 0.8)',
                    'rgba(153, 102, 255, 0.8)',
                    'rgba(255, 159, 64, 0.8)',
                    'rgba(0, 144, 145, 0.8)',
                    'rgba(74, 203, 177, 0.8)',
                    
                    'rgba(45, 175, 147, 0.3)',
                    'rgba(106, 203, 137, 0.3)',
                    'rgba(173, 228, 123, 0.3)',
                    'rgba(249, 248, 113, 0.3)',

                ],
                borderWidth: 2,
                
            }]
        },
        
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        fontStyle :'bold'        
                    }
                }],
                xAxes: [{
                    ticks: {
                        
                        fontStyle :'bold',
                        fontFamily:"Nova Square",
                        fontSize:13
    
                    }
                }]
            },legend :{
                display :false
            },title :{
                display :true,
                text : 'Total No. of Games',
                padding:20,
                fontFamily:"Nova Square",
                fontSize : 24,
                fontStyle : 'bold',
                fontColor: 'rgba(172, 20, 25, 0.8)'
            },gridLines :{
                lineWidth:5
            },line :{
                borderWidth : 4
            },animation: {
                duration:5000,
                easing:'easeInBounce',
               
        }
        }
    });

	
}