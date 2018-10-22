<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Freelancer - Start Bootstrap Theme</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="vendor/freelnMain/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/freelnMain/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="vendor/freelnMain/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="css/freelnMain/freelancer.min.css" rel="stylesheet">
    
    <style>
    	a:hover {text-decoration: none;}
    </style>
    <script>
    $(function(){
    	$('.btn_signUp').on('click',function(e){
   		 
  		  
  		  var href = $(this).attr('href');		
  		
  		  //ajax 호출 : db 조회
  		  $.ajax({
  			  url  	   : href,
  			  type 	   : 'GET',
  			  dataType : 'json',
  			  success  : function(result_val){
  				console.log(result_val);
  				  //alert(gugunList);
  				  if(result_val == 0){
  					  alert("이미 신청한 프로젝트입니다");
  				  } else{
  					alert("신청되었습니다");
  				  }
  			  },
  			  error	   : function(xhr){
  				  console.log(xhr);
  				  alert('에러발생 : ' + xhr.status);
  			  }
  		  });
  		 return false;
  	  }); 


    });

    </script>

  </head>

  <body id="page-top">

    <!-- 메뉴 -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">DDJY</a>
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">My Career</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/ModifyMyInfo">My Info</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="">Chat</a>
            </li> 
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="">Logout</a>
            </li> 
          </ul>
        </div>
      </div>
    </nav>

    <!-- 프로젝트 리스트 -->
    <header class="masthead bg-primary text-white text-center portfolio">
      <div class="container">
        <h1 class="text-center text-uppercase mb-0">Project List</h1>
        <hr class="star-light">
        <div class="row">
        
        <c:forEach var="projectList" items="${projectList}" varStatus="status">
          <div class="col-md-6 col-lg-4">
            <a class="portfolio-item d-block mx-auto" href="#projectList-modal-${projectList.proj_id}">
              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                  <i class="fas fa-search-plus fa-3x"></i>
                </div>
              </div>
             <!-- <img class="img-fluid" src="img/freelnMain/portfolio/cabin.png" alt=""> -->
              	<table style="width:350px; height:252.77px; background-color:white; color:#334D5C;">
              		<tr>
              			<td colspan="2" style="padding-top:20px;">
              				<h4 class="text-uppercase mb-0">${projectList.proj_nm}</h4>
              				<%-- <h4  hidden="true">${projectList.proj_id}</h4> --%>
              			</td>
              		</tr>
              		<tr>
              			<td colspan="2">
              				<h2 class="font-weight-light mb-0">${projectList.need_tech}</h2>
              			</td>
              		</tr>
              		
              		<tr>
              			<td colspan="2" style="padding-bottom:20px;">
              			<p class="lead mb-0">예상 프로젝트 금액  
              			<span style="color:#18bc9c">${projectList.project_amount}</span></p>
              			</td>
              		</tr>
              	</table>
            </a>
          </div>
          </c:forEach>
        </div>
      </div>
    </header>
    
    
    <!-- 프로젝트 상세 보기 Modals -->
    <c:forEach var="projectList" items="${projectList}" varStatus="status">
    <div class="portfolio-modal mfp-hide" id="projectList-modal-${projectList.proj_id}">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h3 class="text-secondary text-uppercase mb-0">${projectList.proj_nm}</h3>
              <hr class="star-dark mb-5">
              <p class="mb-5"><span class="lead mb-0">프로젝트 기간 | </span> 
              	 ${projectList.proj_str_date} ~ ${projectList.proj_end_date}</p>
              <p class="mb-5"><span class="lead mb-0">비용 | </span>  ${projectList.project_amount}</p>
              <p class="mb-5"><span class="lead mb-0">위치(회사 이름) | </span>
                ${projectList.client_addr_1} ${projectList.client_addr_2}(${projectList.client_nm})</p>
              <p class="mb-5"><span class="lead mb-0">투여 인원 | </span>  ${projectList.involve_num} 명</p>
              <p class="mb-5"><span class="lead mb-0">필요 기술 | </span>  ${projectList.need_tech}</p>
              <p class="mb-5"><span class="lead mb-0">상세 내용</span><br/>${projectList.remark}</p>
              <!-- <p class="mb-5"><span class="lead mb-0">월 급여 |</span>  </p> -->
      
           	  <a class="btn btn-primary btn-lg btn_signUp" 
           	  		href="/ProjectSignUp?freeln_id=&project_id=${projectList.proj_id}">
                <i class="fa fa-close"></i>
                Sign up
              </a>
              
            </div>
          </div>
        </div>
      </div>
    </div>
	</c:forEach>



    <!-- 내가 참여했던 프젝 -->
    <section class="portfolio" id="portfolio">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">My Career</h2>
        <hr class="star-dark mb-5">
        
        <div class="row">
        <c:forEach var="freelancerCareer" items="${freelancerCareer}" varStatus="status">
          <div class="col-md-6 col-lg-4">
            <a class="portfolio-item d-block mx-auto" href="#career-modal-${freelancerCareer.career_num}">
              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                  <i class="fas fa-search-plus fa-3x"></i>
                </div>
              </div>
             <!--  <img class="img-fluid" src="img/freelnMain/portfolio/cabin.png" alt=""> -->
             <table style="width:350px; height:252.77px; background-color:#18BC9C; color:white; text-align:center;">
              		<tr>
              			<td colspan="2" style="padding-top:20px;">
              				<h4 class="text-uppercase mb-0">${freelancerCareer.client_nm}</h4>
              				<%-- <h4  hidden="true">${projectList.proj_id}</h4> --%>
              			</td>
              		</tr>
              		<tr>
              			<td colspan="2">
              				<h3 class="font-weight-light mb-0">
              				${freelancerCareer.use_tech_1},${freelancerCareer.use_tech_2}
              				</h3>
              				
              			</td>
              		</tr>
              		
              		<tr>
              			<td colspan="2" style="padding-bottom:20px;">
              			<p class="lead mb-0">금액  
              			<span style="color:#334D5C">${freelancerCareer.work_money}</span></p>
              			</td>
              		</tr>
              	</table>
            </a>
          </div>
          </c:forEach>
        </div>
      </div>
    </section>
    
    <!-- 내 커리어 상세 보기 Modals -->
    <c:forEach var="freelancerCareer" items="${freelancerCareer}" varStatus="status">
    <div class="portfolio-modal mfp-hide" id="career-modal-${freelancerCareer.career_num}">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h3 class="text-secondary text-uppercase mb-0">${freelancerCareer.client_nm}</h3>
              <hr class="star-dark mb-5">
              <p class="mb-5"><span class="lead mb-0">사용 기술 | </span> 
              	 ${freelancerCareer.use_tech_1},${freelancerCareer.use_tech_2}</p>
              <p class="mb-5"><span class="lead mb-0">직책 | </span> ${freelancerCareer.duty}</p>
              <p class="mb-5"><span class="lead mb-0">업무 | </span> ${freelancerCareer.task}</p>
              <p class="mb-5"><span class="lead mb-0">프로젝트 기간 | </span> 
              	 ${freelancerCareer.work_str_date} ~ ${freelancerCareer.work_end_date}</p>
              <p class="mb-5"><span class="lead mb-0">한달 급여 | </span> ${freelancerCareer.work_money}</p>
              <p class="mb-5"><span class="lead mb-0">위치 | </span>
                ${freelancerCareer.client_loca_1} ~ ${freelancerCareer.client_loca_2}</p>
              <p class="mb-5"><span class="lead mb-0">상세 내용</span><br/>${freelancerCareer.contents}</p>
              <!-- <p class="mb-5"><span class="lead mb-0">월 급여 |</span>  </p> -->
      
           	  <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close Project</a>
              
            </div>
          </div>
        </div>
      </div>
    </div>
	</c:forEach>

    <!-- About Section -->
    <!-- <section class="bg-primary text-white mb-0" id="about">
      <div class="container">
        <h2 class="text-center text-uppercase text-white">About</h2>
        <hr class="star-light mb-5">
        <div class="row">
          <div class="col-lg-4 ml-auto">
            <p class="lead">Freelancer is a free bootstrap theme created by Start Bootstrap. The download includes the complete source files including HTML, CSS, and JavaScript as well as optional LESS stylesheets for easy customization.</p>
          </div>
          <div class="col-lg-4 mr-auto">
            <p class="lead">Whether you're a student looking to showcase your work, a professional looking to attract clients, or a graphic artist looking to share your projects, this template is the perfect starting point!</p>
          </div>
        </div>
        <div class="text-center mt-4">
          <a class="btn btn-xl btn-outline-light" href="#">
            <i class="fas fa-download mr-2"></i>
            Download Now!
          </a>
        </div>
      </div>
    </section> -->

    <!-- Contact Section -->
    <!-- <section id="contact">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">Contact Me</h2>
        <hr class="star-dark mb-5">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.
            The form should work on most web servers, but if the form is not working you may need to configure your web server differently.
            <form name="sentMessage" id="contactForm" novalidate="novalidate">
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Name</label>
                  <input class="form-control" id="name" type="text" placeholder="Name" required="required" data-validation-required-message="Please enter your name.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Email Address</label>
                  <input class="form-control" id="email" type="email" placeholder="Email Address" required="required" data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Phone Number</label>
                  <input class="form-control" id="phone" type="tel" placeholder="Phone Number" required="required" data-validation-required-message="Please enter your phone number.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Message</label>
                  <textarea class="form-control" id="message" rows="5" placeholder="Message" required="required" data-validation-required-message="Please enter a message."></textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <br>
              <div id="success"></div>
              <div class="form-group">
                <button type="submit" class="btn btn-primary btn-xl" id="sendMessageButton">Send</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section> -->

    <!-- Footer -->
    <!-- <footer class="footer text-center">
      <div class="container">
        <div class="row">
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Location</h4>
            <p class="lead mb-0">2215 John Daniel Drive
              <br>Clark, MO 65243</p>
          </div>
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Around the Web</h4>
            <ul class="list-inline mb-0">
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fab fa-fw fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fab fa-fw fa-google-plus-g"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fab fa-fw fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fab fa-fw fa-linkedin-in"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fab fa-fw fa-dribbble"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <h4 class="text-uppercase mb-4">About Freelancer</h4>
            <p class="lead mb-0">Freelance is a free to use, open source Bootstrap theme created by
              <a href="http://startbootstrap.com">Start Bootstrap</a>.</p>
          </div>
        </div>
      </div>
    </footer>

    <div class="copyright py-4 text-center text-white">
      <div class="container">
        <small>Copyright &copy; Your Website 2018</small>
      </div>
    </div> -->

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-to-top d-lg-none position-fixed ">
      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
        <i class="fa fa-chevron-up"></i>
      </a>
    </div>
	
    <!-- Portfolio Modal 2 -->
    <!-- <div class="portfolio-modal mfp-hide" id="portfolio-modal-2">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
              <hr class="star-dark mb-5">
              <img class="img-fluid mb-5" src="img/freelnMain/portfolio/cake.png" alt="">
              <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
              <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close Project</a>
            </div>
          </div>
        </div>
      </div>
    </div> -->

    <!-- Portfolio Modal 3 -->
    <!-- <div class="portfolio-modal mfp-hide" id="portfolio-modal-3">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
              <hr class="star-dark mb-5">
              <img class="img-fluid mb-5" src="img/freelnMain/portfolio/circus.png" alt="">
              <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
              <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close Project</a>
            </div>
          </div>
        </div>
      </div>
    </div> -->

    <!-- Portfolio Modal 4 -->
    <!-- <div class="portfolio-modal mfp-hide" id="portfolio-modal-4">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
              <hr class="star-dark mb-5">
              <img class="img-fluid mb-5" src="img/freelnMain/portfolio/game.png" alt="">
              <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
              <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close Project</a>
            </div>
          </div>
        </div>
      </div>
    </div> -->

    <!-- Portfolio Modal 5 -->
    <!-- <div class="portfolio-modal mfp-hide" id="portfolio-modal-5">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
              <hr class="star-dark mb-5">
              <img class="img-fluid mb-5" src="img/freelnMain/portfolio/safe.png" alt="">
              <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
              <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close Project</a>
            </div>
          </div>
        </div>
      </div>
    </div> -->

    <!-- Portfolio Modal 6 -->
    <!-- <div class="portfolio-modal mfp-hide" id="portfolio-modal-6">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
              <hr class="star-dark mb-5">
              <img class="img-fluid mb-5" src="img/freelnMain/portfolio/submarine.png" alt="">
              <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
              <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close Project</a>
            </div>
          </div>
        </div>
      </div>
    </div> -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/freelnMain/jquery/jquery.min.js"></script>
    <script src="vendor/freelnMain/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/freelnMain/jquery-easing/jquery.easing.min.js"></script>
    <script src="vendor/freelnMain/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/freelnMain/jqBootstrapValidation.js"></script>
    <script src="js/freelnMain/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/freelnMain/freelancer.min.js"></script>

  </body>

</html>
