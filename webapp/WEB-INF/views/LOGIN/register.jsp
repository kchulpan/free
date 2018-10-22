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

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script> 
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
<script type="text/javascript">
	function registerCheckFunction() {
		var userID = $('#inputId').val();
		$.ajax({
			type:'POST',
			url:'./Register',
			data:{inputId:inputId},
			success:function(result){
				if(result ==1 ){
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
					$('#checkType').attr('class','modal-content panel-success');
				} else {
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					$('#checkType').attr('class','modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		});
	}
	function passwordCheckFunction(){
		var userPassword1 = $('#freeln_pwd').val();
		var userPassword2 = $('#confirmPwd').val();
		if(freeln_pwd != confirmPwd){
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		} else {
			$('#passwordCheckMessage').html('');
		}
	}
</script>  	
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

<!-- 아이디 중복 체크 시작-->
<script>
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var idck = 0;
$(function() {
    //idck 버튼을 클릭했을 때 
    $("#idDoubleCheck").click(function() {
        
        //userid 를 param.
        var userid =  $("#freeln_phone").val(); 
        
        $.ajax({
            async: true,
            type : 'POST',
            data : userid,
            url : "IdDoubleCheck",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    
                    alert("핸드폰번호가 존재합니다. 다른 핸드폰번호를 입력해주세요.");
                    $("#freeln_phone").focus();
                    
                
                } else {
                    alert("사용가능한 핸드폰번호입니다.");
                    $("#freeln_mail").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});

</script>

<!-- 아이디 중복 체크 끝-->


</head>
   

<body class="bg-dark">
<%
	String freeln_phone = null;
	if(session.getAttribute("freeln_phone") != null){
		freeln_phone = (String) session.getAttribute("freeln_phone");
	if(freeln_phone != null){
		session.setAttribute("messageType", "오류메시지");
		session.setAttribute("messageContent", "로그인이 되어 있는 상태입니다.");
		response.sendRedirect("index.jsp");
		return;
	 	}
	}
	%>
	<div class="container">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">Register an Account</div>
			<div class="card-body">
				<!-- <form method="POST" action="/SubPage"> -->
				<form action="/NewFreeLnRegist" method="POST">
				
				<!-- 사진입력 -->
				
				<article>
					<div>
						<img id="img" alt="사진을 올려주세요"  src="#" width="225" height="300">
					</div>
					<div>
						<input type="file" id="upload" name="img_nm">
					</div>
				</article>
					<br><br>

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
							<input id="idDoubleCheck" type="button" value="중복확인">
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

 
 <div class="card-header">Technical information 개발 언어 선택</div>
 <br>
 
 
 <div class="col-md-12">
 <div class="col-md-3" style="float:left;">
 <label for="technic_1">
	<select id="technic_1" name="major_tech" class="form-control">
			<option value="">.NET</option>
		    <option value=".NET초급">초급</option>
	        <option value=".NET중급">중급</option>
	        <option value=".NET고급">고급</option>	
	</select>
		</label>
		</div>
		
		
	<div class="col-md-3" style="float:left;">
	 <label for="technic_2">
	<select id="technic_2" name="major_tech" class="form-control">
			<option value="">C</option>
		    <option value="C초급">초급</option>
	        <option value="C중급">중급</option>
	        <option value="C고급">고급</option>	
	</select>
		</label>
		</div>
		 	
		<div class="col-md-3" style="float:left;">
		<label for="technic_3">
	<select id="technic_3" name="major_tech" class="form-control" >
			<option value="">C#</option>
		    <option value="C#초급">초급</option>
	        <option value="C#중급">중급</option>
	        <option value="C#고급">고급</option>	
	</select>
		</label>
		</div>
		
		<div class="col-md-3" style="float:left;">
		<label for="technic_4">
	<select id="technic_4" name="major_tech" class="form-control" >
			<option value="">C++</option>
		    <option value="C++초급">초급</option>
	        <option value="C++중급">중급</option>
	        <option value="C++고급">고급</option>	
	</select>
		</label>
		</div>	
		
		<br><br>
		
		<div class="col-md-3" style="float:left;">
		<label for="technic_5">
	<select id="technic_5" name="major_tech" class="form-control" >
			<option value="">JAVA</option>
		    <option value="JAVA초급">초급</option>
	        <option value="JAVA중급">중급</option>
	        <option value="JAVA고급">고급</option>	
	</select>
		</label>
		</div>	
		
		<div class="col-md-3" style="float:left;">
		<label for="technic_6">
	<select id="technic_6" name="major_tech" class="form-control" >
			<option value="">JS</option>
		    <option value="JS초급">초급</option>
	        <option value="JS중급">중급</option>
	        <option value="JS고급">고급</option>	
	</select>
		</label>
		</div>	
		
		
		<div class="col-md-3" style="float:left;">
		<label for="technic_7">
	<select id="technic_7" name="major_tech" class="form-control" >
			<option value="">JSP</option>
		    <option value="JSP초급">초급</option>
	        <option value="JSP중급">중급</option>
	        <option value="JSP고급">고급</option>	
	</select>
		</label>
		</div>
		
		<div class="col-md-3" style="float:left;">
		<label for="technic_8">
	<select id="technic_8" name="major_tech" class="form-control" >
			<option value="">SPRING</option>
		    <option value="SPRING초급">초급</option>
	        <option value="SPRING중급">중급</option>
	        <option value="SPRING고급">고급</option>	
	</select>
		</label>
		</div>
		<br><br>
		
		
		<div class="col-md-3" style="float:left;">
		<label for="technic_9">
	<select id="technic_9" name="major_tech" class="form-control" >
			<option value="">PHP</option>
		    <option value="PHP초급">초급</option>
	        <option value="PHP중급">중급</option>
	        <option value="PHP고급">고급</option>	
	</select>
		</label>
		</div>
		
		<div class="col-md-3" style="float:left;">
		<label for="technic_10">
	<select id="technic_10" name="major_tech" class="form-control">
			<option value="">ORACLE</option>
		    <option value="ORACLE초급">초급</option>
	        <option value="ORACLE중급">중급</option>
	        <option value="ORACLE고급">고급</option>	
	</select>
		</label>
		</div>
		
		<div class="col-md-3" style="float:left;">
		<label for="technic_11">
	<select id="technic_11" name="major_tech" class="form-control" >
			<option value="">PHP</option>
		    <option value="MYSQL초급">초급</option>
	        <option value="MYSQL중급">중급</option>
	        <option value="MYSQL고급">고급</option>	
	</select>
		</label>
		</div>
		
		<div class="col-md-3" style="float:left;">
		<label for="technic_12">
	<select id="technic_12" name="major_tech" class="form-control">
			<option value="">MSSQL</option>
		    <option value="MSSQL">초급</option>
	        <option value="MSSQL중급">중급</option>
	        <option value="MSSQL고급">고급</option>	
	</select>
		</label>
		</div>
		
		<br><br>
		
		<div class="col-md-3" style="float:left;">
		<label for="technic_13">
	<select id="technic_13" name="major_tech" class="form-control">
			<option value="">ANDROID</option>
		    <option value="ANDROID초급">초급</option>
	        <option value="ANDROID중급">중급</option>
	        <option value="ANDROID고급">고급</option>	
	</select>
		</label>
		</div>				




</div>

<br><br><br>

<div class="card-header">Technical information 디자인 개발 언어 선택</div>
<br>

<div class="col-md-12">
	<div class="col-md-3" style="float:left;">
		<label for="technic_14">
			<select style="display:inline-block; overflow:hidden;" id="technic_14" name="major_tech" class="form-control" >
					<option  value="">HTML5</option>
				    <option value=".NET초급">초급</option>
			        <option value=".NET중급">중급</option>
			        <option value=".NET고급">고급</option>	
			</select>
		</label>
	</div>	
	<div class="col-md-3" style="float:left;">
		<label for="technic_15">
	<select  style="display:inline-block; overflow:hidden;" id="technic_15" name="major_tech" class="form-control" >
			<option value="">PHOTOSHOP</option>
		    <option value="PHOTOSHOP초급">초급</option>
	        <option value="PHOTOSHOP중급">중급</option>
	        <option value="PHOTOSHOP고급">고급</option>	
	</select>
		</label>
	</div>
		
	<div class="col-md-3"  style="float:left;">	
		<label for="technic_16" >
	<select id="technic_16" name="major_tech" class="form-control">
			<option value="">ILLUST</option>
		    <option value="ILLUST초급">초급</option>
	        <option value="ILLUST중급">중급</option>
	        <option value="ILLUST고급">고급</option>	
	</select>
		</label>
     </div>
     <div class="col-md-3"  style="float:left;">	
		<label for="technic_17" >
	<select id="technic_17" name="major_tech" class="form-control">
			<option value="">CSS</option>
		    <option value="ILLUST초급">초급</option>
	        <option value="ILLUST중급">중급</option>
	        <option value="ILLUST고급">고급</option>	
	</select>
		</label>
     </div>
     
     
     
<div>

  
<br><br><br>

	
	<!---------   기타언어 입력 ----------->
	<div class="card-header" style="clear:both;">Technical information 기타 기술정보</div>
	<br>
		
		<div class="col-md-12">
			<div class="form-label-group"> 
				<input type="text" id="technic_18" name="major_tech" class="form-control"/>
				<label for="technic_18">항목에 없는 기술정보를 입력하세요</label>
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
		 <div class="col-md-3">
			<div class="form-label-group">
				<input type="text" id="cli_loca_1" name="client_local_1" class="form-control" placeholder="광역시,도" autofocus="autofocus">
				<label for="cli_loca_1">광역시,도</label>
			</div>
		</div>
		 <div class="col-md-3">
			<div class="form-label-group">
				<input type="text" id="cli_loca_2" name="client_local_2" class="form-control" placeholder="시군구"  autofocus="autofocus">
				<label for="cli_loca_2">시군구</label>
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
				<input type="text" id="use_tech_1" name="use_tech_1" class="form-control" placeholder="Main Technical Language"/>
				<label for="use_tech_1">Main Technical Language</label>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="form-label-group"> 
				<input type="text" id="use_tech_2" name="use_tech_2" class="form-control" placeholder="Sub Technical Language"/>
				<label for="use_tech_2">Sub Technical Language</label>
			</div>
		</div>               
		<br><br><br>
		  
		<div class="col-md-12">
			<div class="form-label-group"> 
				<input type="text" id="work_money" name="work_money" class="form-control" placeholder="Work money"/>
				<label for="work_money">Work money</label>
			</div>
		</div>
	</div>
</div>
<!---------------------- 경력정보 입력 끝------------------------->

          		<!-- <input class="btn btn-primary btn-block" type="submit" value="회원가입"> -->
				

          
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
<%
	String messageContent = null;
	if(session.getAttribute("messageContent") != null) {
		messageContent = (String) session.getAttribute("messageContent");
	}	
	String messageType = null;
	if(session.getAttribute("messageType") != null) {
		messageType = (String) session.getAttribute("messageType");
	}	
	if (messageContent != null){
	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content" <%if(messageType.equals("오류메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times</span>
							<span class="sr-only">close</span>
							
						</button>
						<h4 class="modal-title">
							<%= messageType %>
						</h4>
					</div>
					<div class="modal-body">
						<%= messageContent%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
		
	<%
	session.removeAttribute("messageContent");
	session.removeAttribute("messageType");
	}
	%>	
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-info" id="checkType">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times</span>
							<span class="sr-only">close</span>
							
						</button>
						<h4 class="modal-title">
							확인메시지
						</h4>
					</div>
					<div class="modal-body" id="checkMessage">
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
       


</body>
</html>