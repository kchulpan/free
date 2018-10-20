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
    
</head>
   

  <body class="bg-dark">
  <%
  	String freeln_phone = null;
    		if(session.getAttribute("freeln_phone") != null) {
    			freeln_phone = (String)session.getAttribute("freeln_phone");
    			if(freeln_phone != null) {
    				session.setAttribute("messageType", "오류메시지");
    				session.setAttribute("messageContent", "로그인이 되어 있는 상태입니다.");
    				response.sendRedirect("sub_page.jsp");
    			}
    		}
  
  %>
   

    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login
           <div><img src=""></div> 
        </div>
        <div class="card-body">
          <form method="POST" action="/LoginCheck">
            <div class="form-group">
              <div>
              	<input type="radio" name="login" id="freelnLog">
              	<label for="freelnLog">프리랜서</label>&nbsp;&nbsp;
              	<input type="radio" name="login" id="chgLog">
              	<label for="chgLog">담당자</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="freeln_phone" class="form-control" name="freeln_pwd" placeholder="id" required="required" autofocus="autofocus">
                <label for="inputId">아이디를 입력하세요</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
                <label for="inputPassword">비밀번호를 입력하세요</label>
              </div>
            </div>
            <div class="form-group">
              <div class="checkbox">
                <label>
                  <input type="checkbox" value="remember-me">
                  비밀번호 저장하기
                </label>
              </div>
            </div>
            
            	<input class="btn btn-primary btn-block" type="submit" value="로그인">
            	<input class="btn btn-primary btn-block" type="submit" value="관리자페이지">
            	
            
          </form>
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
          <div class="text-center">
            <a class="d-block small mt-3" href="/Register">회원가입</a>
            <a class="d-block small" href="/Forgot-password">비밀번호를 잊어버리셨나요?</a>
          </div>
        </div>
      </div>
    </div>
   		

   


<%--   <div style="text-align:center">
  <caption><h2>로그인</h2></caption>
  </div>
  <form action="/SubPage" method="GET">
  <div class="font">
   <input type="text" class="userid" id="userid" name="userid" placeholder="아이디 입력"  />  
  </div>
  
  <div class="font">
	<input type="password" class="password" name="password" placeholder="비밀번호 입력" />
  </div>


  <button class="login" >로그인</button>
  </form>
  <form action="/Freelancer" method="GET">
  	<button class="login" >프리랜서페이지로 이동</button>
  </form>


  
  </br>
  <div class="register">
   <div class="font2">아이디 저장<input type="checkbox"></input></div>
  <div class="font2"><a href="">아이디찾기</a>/</div>
  <div class="font2"><a href="">비밀번호 찾기</a></div>
  
  </div> --%>
  
 
</body>
</html>