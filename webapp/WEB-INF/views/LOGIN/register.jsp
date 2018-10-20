<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Login</title>


    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/mainpage/sb-admin.css" rel="stylesheet">
 
 	<!-- Jquery min.js 링크-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- datepicker를 위한 링크 시작 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- datepicker를 위한 링크 끝 -->


<script>
$(function(){
	   $('#upload').change(function(){
	    var input = this;
	    var url = $(this).val();
	    var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
	    if (input.files && input.files[0]&& (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) 
	     {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	           $('#img').attr('src', e.target.result);
	        }
	       reader.readAsDataURL(input.files[0]);
	    }
	    else
	    {
	      $('#img').attr('src', 'img/mainpage/avatar.png');
	    }
	  }); 

	});


</script>

<!-- 데이트 피커 시작 -->
<script>
 
	(function($) { $(document).ready(function(){
		$('#work_str_date').datepicker();
		$('#work_str_date' ).datepicker( "option", "dateFormat", "yy-mm-dd");
		$('#work_end_date').datepicker();
		$('#work_end_date' ).datepicker( "option", "dateFormat", "yy-mm-dd");
  		});
	})(jQuery);
</script>
<!-- 데이트 피커 끝 -->

</head>
   

<body class="bg-dark">
	<div class="container">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">Register an Account</div>
			<div class="card-body">
				<form action="/NewFreeLnRegist" method="POST">
				
				<!-- 사진입력 -->
				
<!--<div class="form-group">
    <div class="form-row">
    <div class="col-md-6">
    <div class="form-label-group"> -->
				<article>
					<div>
						<img id="img" alt="사진을 올려주세요"  src="#" width="225" height="300">
					</div>
					<div>
						<input type="file" id="upload" name="img_nm">
					</div>
				</article>
					<br><br>
<!--</div>
    </div>
    </div>                  
    </div> -->
				<!-- 사진입력 끝 -->
       
				<!-- 이름, 전화번호 입력 -->
				<div class="form-group">
					<div class="form-row">
						<div class="col-md-6">
							<div class="form-label-group">
								<input type="text" id="freeln_nm" name="freeln_nm" class="form-control" placeholder="Full name" required="required" autofocus="autofocus">
								<label for="freeln_nm">Full name</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-label-group">
								<input type="text" id="freeln_phone" name="freeln_phone" class="form-control" placeholder='"-"없이 입력하세요' required="required">
								<label for="freeln_phone">핸드폰번호 : "-"없이 입력하세요</label>
							</div>
						</div>
					</div>
				</div>
				<!-- 이름, 전화번호 입력 끝 -->
            
				<!-- 이메일 입력 -->
				<div class="form-group">
					<div class="form-label-group">
						<input type="email" id="freeln_mail" name="freen_mail" class="form-control" placeholder="Email address" required="required">
						<label for="freeln_mail">Email address</label>
					</div>
				</div>
				<!-- 이메일 입력 끝-->
            
				<!-- 비밀번호 입력 -->
				<div class="form-group">
					<div class="form-row">
						<div class="col-md-6">
							<div class="form-label-group">
								<input type="password" id="freeln_pwd" name="freeln_pwd" class="form-control" placeholder="Password" required="required">
								<label for="freeln_pwd">Password</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-label-group">
								<input type="password" id="confirmPwd" class="form-control" placeholder="Confirm password" required="required">
								<label for="confirmPwd">Confirm password</label>
							</div>
						</div>
					</div>
				</div>
				<!-- 비밀번호 입력 끝-->
            
				<!-- 희망근무지역, 희망월급여 -->
				<div class="form-group">
					<div class="form-row">
						<div class="col-md-6">
							<div class="form-label-group">
								<input type="text" id="hope_place" name="hope_place" class="form-control" placeholder="Hope working area" required="required">
								<label for="hope_place">Hope working area</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-label-group">
								<input type="text" id="hope_money" name="hope_money" class="form-control" placeholder="Desired wage" required="required">
								<label for="hope_money">Desired wage</label>
							</div>
						</div>
					</div>
				</div>
				<br><br>
				<!-- 희망근무지역, 희망월급여 끝-->
            
<!------------------------  select 기술정보 입력1 -------------------->
<div class="card-header">Technical information</div>
<br>
<div class="form-group">
<div class="form-row"> 	
<div class="form-label-group">개발언어</div>
<div class="col-md-12">
<div class="form-label-group" >
<div class="form-control"> 
<div>	
<span>
<label>.NET
<select name="major_tech">
<option value="">선택</option>
<option value="공통CODE">초급</option>
<option value="공통CODE">중급</option>
<option value="공통CODE">고급</option>
</select>
</label>
</span>
&nbsp;&nbsp;
<span>
<label>C
<select name="major_tech">
<option value="">선택</option>
<option value="공통CODE">초급</option>
<option value="공통CODE">중급</option>
<option value="공통CODE">고급</option>
</select>
</label>
</span>
&nbsp;&nbsp;
<span>
<label>C#
<select name="major_tech">
<option value="">선택</option>
<option value="공통CODE">초급</option>
<option value="공통CODE">중급</option>
<option value="공통CODE">고급</option>
</select>
</label>
</span>
&nbsp;&nbsp;
<span>
<label>C++
<select name="major_tech">
<option value="">선택</option>
<option value="공통CODE">초급</option>
<option value="공통CODE">중급</option>
<option value="공통CODE">고급</option>
</select>
   	 </label>
   	</span>
   	&nbsp;&nbsp;
   	<span>
   	 <label>JAVA
   	  <select name="major_tech">
   	    	<option value="">선택</option>
    	    <option value="공통CODE">초급</option>
    	    <option value="공통CODE">중급</option>
    	    <option value="공통CODE">고급</option>
</select>
</label>
</span>
&nbsp;&nbsp;
<!-- <span>
<label>JS
<select name="major_tech">
<option value="">선택</option>
<option value="공통CODE">초급</option>
<option value="공통CODE">중급</option>
<option value="공통CODE">고급</option>
</select>
</label>
</span> -->
&nbsp;&nbsp;
<!-- <span>
<label>JSP
<select name="major_tech">
<option value="">선택</option>
<option value="공통CODE">초급</option>
<option value="공통CODE">중급</option>
<option value="공통CODE">고급</option>
</select>
</label>
</span> -->
</div>       	  
</div>  
</div>
</div>
</div>
</div>
  
<br><br>
<!------------------------  select 기술정보 입력1 끝-------------------->               
<!------------------------ select 기술정보 입력 2번줄 -------------------->              
              
<div class="form-group">
	<div class="form-row"> 	
		<div class="form-label-group"></div>
		<div class="col-md-12">
			<div class="form-label-group" >
				<div class="form-control"> 
					<div>	
						<span>
							<label>JS
								<select name="major_tech">
									<option value="">선택</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>
									<option value="공통CODE">고급</option>
								</select>
							</label>
						</span>
						&nbsp;&nbsp;
						<span>
							<label>JSP
								<select name="major_tech">
									<option value="">선택</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>
									<option value="공통CODE">고급</option>
								</select>
							</label>
						</span>
						&nbsp;&nbsp;
						<span>
							<label>SPRING
								<select name="major_tech">
									<option value="">선택</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>
									<option value="공통CODE">고급</option>
								</select>
							</label>
						</span>
						&nbsp;&nbsp;
						<span>
							<label>PHP
								<select name="major_tech">
									<option value="">선택</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>
									<option value="공통CODE">고급</option>
								</select>
							</label>
						</span>
						&nbsp;&nbsp;
						<span>
							<label>PYTHON
								<select name="major_tech">
									<option value="">선택</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>
									<option value="공통CODE">고급</option>
								</select>
							</label>
						</span>	
					</div>       	  
				</div>  
			</div>
		</div>
	</div>
</div>
<br><br>  

<!------------------------ select 기술정보 입력 3번줄 -------------------->                
              
<div class="form-group">
	<div class="form-row"> 	
		<div class="form-label-group"></div>
		<div class="col-md-12">
			<div class="form-label-group" >
				<div class="form-control"> 
					<div>	
						<span>
							<label>ORACLE
								<select name="major_tech">
									<option value="">선택</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>
									<option value="공통CODE">고급</option>
								</select>
							</label>
						</span>
						&nbsp;&nbsp;
						<span>
							<label>MYSQL
								<select name="major_tech">
					 				<option value="">선택</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>
									<option value="공통CODE">고급</option>
								</select>
							</label>
						</span>
						&nbsp;&nbsp;
						<span>
							<label>MSSQL
								<select name="major_tech">
									<option value="">선택</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>
									<option value="공통CODE">고급</option>
								</select>
							</label>
						</span>
						&nbsp;&nbsp;
						<span>
							<label>ANDROID
								<select name="major_tech">
									<option value="">선택</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>
									<option value="공통CODE">고급</option>
								</select>
							</label>
						</span>
						&nbsp;&nbsp;
						<span>
							<label>IOS
								<select name="major_tech">
									<option value="">선택</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>
									<option value="공통CODE">고급</option>
								</select>
							</label>
						</span>				
					</div>       	  
				</div>  
			</div>
		</div>
	<br><br><br>
	          
<!------------------------ select 디자인 언어 -------------------->               
	        
	<div class="form-label-group">디자인언어</div>
		<div class="col-md-12">
			<div class="form-label-group" >
				<div class="form-control">        	  
					<span>
						<label>HTML5
							<select name="major_tech">
					 			<option value="">선택</option>
								<option value="공통CODE">초급</option>
								<option value="공통CODE">중급</option>
								<option value="공통CODE">고급</option>
							</select>
						</label>
					</span>
					&nbsp;&nbsp;
					<span>
						<label>CSS
							<select name="major_tech">
								<option value="">선택</option>
				 				<option value="공통CODE">초급</option>
								<option value="공통CODE">중급</option>
								<option value="공통CODE">고급</option>
							</select>
						</label>
					</span>
				</div>
			</div>
		</div>
	<br><br><br>
	
	<!---------   기타언어 입력 ----------->
	<div class="form-label-group">기타 기술정보</div>
		<div class="col-md-12">
			<div class="form-label-group" >       	
				<input type="text" id="add_tech" name="add_tech" class="form-control" placeholder="항목에 없는 기술정보를 입력하세요" required="required">
				<label for="add_tech">항목에 없는 기술정보를 입력하세요</label>
			</div>
		</div>	
	<!---------   기타언어 입력 끝----------->
	
	</div>
</div>
<br><br><br>
            
<!---------------------------- 기술정보 입력 끝----------------------->
            
            
<!---------------------- 경력정보 입력 ------------------------->
<div class="card-header">Experience information</div>
<br>

<div class="form-group">
	<div class="form-row">
		<div class="col-md-6">
			<div class="form-label-group">
				<input type="text" id="client_nm" name="client_nm" class="form-control" placeholder="Client Name" required="required" autofocus="autofocus">
				<label for="client_nm">Client Name</label>
			</div>
		</div>
		 <div class="col-md-6">
			<div class="form-label-group">
			   <!-- <label for="client_local_1">
			       <select type="text" id="client_local_1" name="client_local_1" class="form-control" placeholder="Client Location" required="required">
			          <option>지역1</option>
			          <option>지역2</option>      
			       </select>
			   </label>		 -->   		
				<!-- <input type="text" id="client_local_1" name="client_local_1" class="form-control" placeholder="Client Location" required="required"> 
				<label for="client_local_1">Client Location1</label> -->
			
			 <span>
							<label for="client_local_1">
								<select type="text" id="client_local_1" name="client_local_1" class="form-control" placeholder="Client Location" required="required">
									<option value="">지역선택1</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>	
								</select>
							</label>
						</span>
						
						<span>  
							<label for="client_local_1">
								<select type="text" id="client_local_1" name="client_local_1" class="form-control" placeholder="Client Location" required="required">
									<option value="">지역선택2</option>
									<option value="공통CODE">초급</option>
									<option value="공통CODE">중급</option>	
								</select>
							</label>
						</span>
			
			
			
			
			
			
			
			</div>
		</div>

		<br><br><br> 
		
		<div class="col-md-6">
			<div class="form-label-group">
				<input type="text" id="duty" name="duty" class="form-control" placeholder="duty" required="required">
				<label for="duty">Duty</label>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="form-label-group">
				<input type="text" id="task" name="task" class="form-control" placeholder="task" required="required">
				<label for="task">Task</label>
			</div>
		</div>
		<br><br><br>
		
		<div class="col-md-6">
			<div class="form-label-group"> 
				<input type="text" id="work_str_date" name="work_str_date" class="form-control" placeholder="datepicker" required="required"/>              
				<label for="work_str_date">Work Start Date</label>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="form-label-group"> 
				<input type="text" id="work_end_date" name="work_end_date" class="form-control" placeholder="work_end_date" required="required"/>
				<label for="work_end_date">Work end date</label>
			</div>
		</div>
		<br><br><br>
		
		<div class="col-md-12">
			<div class="form-label-group"> 
				<textarea id="contents" name="contents" class="form-control" placeholder="상세 개발 내용 기입" required="required"></textarea>
				<label for="contents"></label>
			</div>
		</div>
		<br><br><br>
		
		<div class="col-md-6">
			<div class="form-label-group"> 
				<input type="text" id="use_tech_1" name="use_tech_1" class="form-control" placeholder="use_tech_1" required="required"/>
				<label for="use_tech_1">Main Technical Language</label>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="form-label-group"> 
				<input type="text" id="use_tech_2" name="use_tech_2" class="form-control" placeholder="use_tech_2" required="required"/>
				<label for="use_tech_2">Sub Technical Language</label>
			</div>
		</div>               
		<br><br><br>
		  
		<div class="col-md-12">
			<div class="form-label-group"> 
				<input type="text" id="work_money" name="work_money" class="form-control" placeholder="work_money" required="required"/>
				<label for="work_money">Work money</label>
			</div>
		</div>
	</div>
</div>
<!---------------------- 경력정보 입력 끝------------------------->
          
				<!-- <a class="btn btn-primary btn-block" href="login.html">Register</a> -->
				<button class="btn btn-primary btn-block" >Register</button>
			</form>
			<div class="text-center">
				<a class="d-block small mt-3" href="/">Login Page</a>
				<a class="d-block small" href="/Forgot-password">Forgot Password?</a>
			</div>
		</div>
	</div>
</div>
       
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script> 

</body>
</html>