<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DDJY University</title>
<link rel="stylesheet" type="text/css" href="/css/codecss/commoncode.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<!-- css -->
	<link rel="stylesheet" href="/css/include/subpage.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- js -->
	<script src="js/include/subpage.js"></script>
	
	<!-- 메뉴버튼눌렀을때 HOVER 유지 -->
	<script>
	$(document).ready(function(){
		$('#commoncode').addClass('top_menu_active');
		$('#commoncode').find('i').addClass('menu_icon_active');
	});
	</script>
	<!-- 메뉴버튼눌렀을때 HOVER 유지 끝-->
	
<!-- 테이블 내용에서 고객사로 검색 -->
	<script>
	function myFunction() {
	  var input, filter, table, tr, i;
	  var freeln_nm,career_year, freeln_phone,in_enable_date,freen_mail,hope_place,major_tech;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  tbody = $('tbody');
	  tr = $('tr',tbody);
	  freeln_nm = $('.freeln_nm');
	  career_year = $('.career_year');
	  freeln_phone = $('.freeln_phone');
	  in_enable_date = $('.in_enable_date');
	  freen_mail = $('.freen_mail');
	  hope_place = $('.hope_place');
	  major_tech = $('.major_tech');

	  for (i = 0; i < tr.length; i++) {
		
	      if (freeln_nm.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	    	  tr.eq(i).attr('style','display:');
	      } else if(career_year.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	    	  tr.eq(i).attr('style','display:');
	      } else if(freeln_phone.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	    	  tr.eq(i).attr('style','display:');
	      } else if(in_enable_date.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	    	  tr.eq(i).attr('style','display:');
	      } else if(freen_mail.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	    	  tr.eq(i).attr('style','display:');
	      } else if(hope_place.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	    	  tr.eq(i).attr('style','display:');
	      } else if(major_tech.eq(i).html().toUpperCase().indexOf(filter) > -1) {
	    	  tr.eq(i).attr('style','display:');
	      } else {
	    	  tr.eq(i).attr('style','display:none');
	      }
	  }
	}
	</script>
<!-- 테이블 내용에서 고객사로 검색 끝-->

<!-- 테이블 내용에서 컬럼클릭시 정렬 -->
	<script>
	function sortTable(n) {
	  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	  table = document.getElementById("dataTable");
	  switching = true;
	  dir = "asc"; 
	  while (switching) {
	    switching = false;
	    rows = table.rows;
	    for (i = 1; i < (rows.length - 1); i++) {
	
	      shouldSwitch = false;
	      x = rows[i].getElementsByTagName("TD")[n];
	      y = rows[i + 1].getElementsByTagName("TD")[n];
	      if (dir == "asc") {
	        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
	          shouldSwitch= true;
	          break;
	        }
	      } else if (dir == "desc") {
	        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
	          shouldSwitch = true;
	          break;
	        }
	      }
	    }
	    if (shouldSwitch) {
	      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	      switching = true;
	      switchcount ++;      
	    } else {
	      if (switchcount == 0 && dir == "asc") {
	        dir = "desc";
	        switching = true;
	      }
	    }
	  }
	}
	</script>
<!-- 테이블 내용에서 컬럼클릭시 정렬 끝-->
</head>
<!-------------------------------- body ---------------------------------------->
<body>
<div id="wrapper">
<!-- header -->
  <header>
  	<%@ include file="../include/header.jspf" %>
  </header>
  
  <div id="main_templet">
  <div id="slide_btn"></div>
  
<!-- side_menu -->
  <nav class="nav">
  	<%@ include file="../include/nav.jspf" %>
  </nav>

<!-- main -->
  <article>
   	<div class="tabs">
    </div>
    	
    <div class="sections">
    <!-- 내용넣기! -->
    <div class="reg1">
	  	<table>
	 	 <h3>계약관리</h3>
		  <tr>
	  		<td><div>프로젝트신청관리:</div></td>
				<td><input  type="text" disabled/></td>
		  <td class="btn1"><input type="button"  value="조회"></td>
		</tr>
	  </table>
		<table class="tb">
			<tr>
			  <td ><div class="code">코드명(코드)</div></td>	
			 </tr>
			 <tr>
			 	<td><div class="root"></div></td>
			 </tr>
		</table>
	</div>
	<div class="reg2">
	  <table>
		  <tr>
		  <td class="btn1"><input type="button" onclick="openForm()" value="등록"></td>
		  <td class="btn1"><input type="button" onclick="openForm()" value="수정"></td>
		  <td class="btn1"><input type="button" onclick="openForm()" value="삭제"></td>
		  <td class="btn1"><input type="button" value="상세페이지"></td>
		</tr>
	  </table>
		<table class="tb">
			<tr>
			  <td class="code"><div>그룹코드</div></td>	
			  <td class="code"><div>그룹명</div></td>	
			  <td class="code"><div>코드</div></td>	
			  <td class="code"><div>코드명</div></td>	
			  <td class="code"><div>순번</div></td>	
			  <td class="code"><div>상위코드</div></td>	
			 </tr>
			 <tr>
			 	<td colspan="6"><div class="root"></div></td>
			 </tr>
		</table>
	</div>
	<!-- <button class="open-button" onclick="openForm()">Open Form</button> -->
	
	<div class="form-popup" id="myForm">
	  <form action="/action_page.php" class="form-container">
	    <h1>공통코드 관리 등록</h1>
	 	<label for="used"><b>사용유무:</b></label>
	    <input type="checkbox"  name="used" checked/>
		<br>
		<br>
	    <label for="groupcode"><b>그룹코드:</b></label>
	    <input type="text" class="input" name="groupcode" required>
	
	    <label for="groupname"><b>그룹명:</b></label>
	    <input type="text" class="input" name="groupname" required>
	    
	    <label for="code"><b>코드:</b></label>
	    <input type="text" class="input" name="code" required>
	    
	    <label for="codename"><b>코드명:</b></label>
	    <input type="text" class="input"  name="codename" required>
	    
	    <label for="pricode"><b>상위코드:</b></label>
	    <input type="text" class="input" name="pricode" required>
	    
	    <label for="excode1"><b>예외코드1:</b></label>
	    <input type="text" class="input" name="excode1" required>
	    
	    <label for="excode2"><b>예외코드2:</b></label>
	    <input type="text" class="input" name="excode2" required>
	    
	    <label for="excode3"><b>예외코드3:</b></label>
	    <input type="text" class="input" name="excode3" required>
	
		<label for="seq"><b>순번:</b></label>
	    <input type="text" class="input" name="seq" required>
	    
	
	    
	    <button type="submit" class="btn">확인</button>
	    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
	  </form>
	</div>
	
	<script>
	function openForm() {
	    document.getElementById("myForm").style.display = "block";
	}
	
	function closeForm() {
	    document.getElementById("myForm").style.display = "none";
	}
	</script>
	    </div>
	      
	  </article>
	  
	  </div>
	  
	</div>
	<script>
		/*  $(function(){
			$('nav').on('click','a',function(e){
				//alert('plus clicked');
				 e.preventDefault(); + e.stopPropagation();
			});
		}); */ 
	</script>
</body>

</html>