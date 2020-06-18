<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>진로심리검사</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="/js/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	
<style>

	#btn{
	margin:15px 0 15px 0;
	text-align:center
	}
	html,
	body {
   		margin:0;
   		padding:0;
   		height:100%;
		}
	.container{
   		min-height:100%;
   		position:relative;
   		padding-bottom:100px;/* footer height */
		}
    .footer {
  		width:100%;
  		height:100px;
   		position:absolute;
   		bottom:0;
   		background:#5eaeff;
  		text-align: center;
  		color: white;
		}	
	.nav-link{
	font-size:25px;
	margin:0 0 8px 0;
	color: white;
	}
	#navbarTogglerDemo01 label{
	font-size: 25px;
	}
</style>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark " style="background-color:#17d348;">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
		<label class="navbar-brand" href="#" ><strong>진로 심리 검사 : WhoAmI</strong></label>
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0"></ul>
		<form class="form-inline my-2 my-lg-0">
			<a class="nav-link" href="http://localhost/KPC_Crawling/Main/home.jsp"><strong>홈</strong> <span class="sr-only">(current)</span></a>
		</form>
	</div>
</nav>


	

<div class="container">
   	<div class="row">
   		<div class="col-md-3"></div>
   		<div class="col-md-6" style="margin:50px 0 0 0; border:2px solid #59c3fa">
 		<!-- form start -->
			<form id= "frm" method="get" action="../proxy/ajax_proxy.jsp" accept-charset="utf-8" onsubmit="emulAcceptCharset(this)">
	  				<div class="form-group col-md-12" style="margin:15px 0 0 0">
	    				<label for="exampleFormControlInput1"><strong>이름</strong></label>
	    				<input type="text" class="form-control" id= "name" name="name" placeholder="홍길동">
	  				</div>
					<div class="form-group col-md-12" style="margin:10px 0 0 0">
	    				<label for="exampleFormControlInput2"><strong>나이</strong></label>
	   					<input type="number" class="form-control" id="age" name="age" min="1" max="100" >
	  				</div>
	  				<div class="col-md-1"></div>
	  				<div class="form-group col-md-10" style="margin:10px 0 0 0">
					    <label for="exampleFormControlInput3"><strong>성별</strong></label><br>
					    <input style="margin:0 5px 0 5px" type="radio" name="gender" value="100323"/>남
						<input style="margin:0 5px 0 100px" type="radio" name="gender" value="100324"/>여
					</div>
				<div class="form-group col-md-12" style="margin:10px 0 0 0">
				    <label for="exampleFormControlInput4"><strong>학교</strong></label>
				    <input type="text" class="form-control" id="school" name="school" placeholder="아형고 (X) 아형고등학교(O)">
		  		</div>
			    <div class="form-group col-md-12" style="margin:10px 0 0 0">
					<label for="exampleFormControlSelect5"><strong>종류 선택</strong></label>
					<select class="form-control" id="choice" name="choice">
						<option value="null">=======선 택=======</option>
					    <optgroup label ="초등학생"  disabled>
					    <option value="19" >진로흥미탐색</option>
					</optgroup>
					<optgroup label= "중학생" disabled>
						<option value="4" >직업흥미검사(K)- 중학생</option>
						<option value="6"  >직업가치관검사</option>
					<!-- <option value="17" >직업흥미검사(H)- 중학생</option> -->
						<option value="20" >직업적성검사 - 중학생</option>
						<option value="22" >진로성숙도검사 - 중학생</option>
					</optgroup>
					<optgroup label= "고등학생" disabled>
						<option value="5" >직업흥미검사(K)- 고등학생</option>
						<option value="6" >직업가치관검사</option>
					<!-- <option value="18" >직업흥미검사(H)- 고등학생</option> -->
						<option value="21" >직업적성검사 - 고등학생</option>
						<option value="23" >진로성숙도검사 - 고등학생</option>
					</optgroup>
					<optgroup label ="성인" disabled>
						<option value="6" >직업가치관검사</option>
						<option value="8" >진로개발준비도검사</option>
						<option value="9" >이공계전공적합도검사</option>
						<option value="10">주요능력효능감검사</option>
					</optgroup>
					</select>
				</div>
				<div class="row">
					<div class="col-sm-3"></div>
					<button class="btn btn-primary col-sm-6" id="btn" type="button">시작</button>
				</div>
			</form>
		</div>
	</div>
</div>
  
  <footer class="bd-footer bg-dark text-muted" >
	<div class="container-fluid p-3 p-md-5" >
		<p> 5조 OpenApi & Crawling 프로젝트 : WhoAmI</p>
    	<p>사용한 api : <a href="http://www.career.go.kr/cnet/front/openapi/openApiTestCenter.do" target="_blank" rel="license noopener">CareerNet 진로심리검사 OpenApi</a> <br> 코드 보기 : <a href="https://www.github.com/rimki/Kpc_Crawling" target="_blank" rel="license noopener">github.com/rimki/Kpc_Crawling</a></p>
	</div>
</footer>

 </body>
<script>
	$(document).ready(function(){//빈 칸 검사 
		$("#btn").click(function(){
			let result = FieldCheck()==true?true:false;
			console.log(result);
			if(result){
				$("#name").val(encodeURIComponent($("#name").val()));
				$("#school").val(encodeURIComponent($("#school").val()));
				
				$("#btn").prop("type","submit");//전부다 채웠으면 통과
			}
		});
	});
	
	function FieldCheck(){ //빈 칸 검사 함수
		let result = true;
		let name =$("#name").val();
		let age =$("#age").val();
		let gender =$('input[name="gender"]').is(':checked');
		let opt = $("#choice").val();
		
		if(!name){
			alert("이름을 입력하세요");
			result = false;
			return;
		}
		
		if(!age){
			alert("나이를 입력하세요");
			result = false;
			return;
		}
		
		if(!gender){
			alert("성별을 선택하세요");
			result = false;
			return;
		}
		
		if(opt=="null"){
			alert("검사종류를 선택하세요");
			result = false;
			return;
		}
		return result;
	};
	
	function emulAcceptCharset(form) {
	    if (form.canHaveHTML) { // detect IE
	        document.charset = form.acceptCharset;
	    }
	    return true;
	}
	
	$("#age").on("change keyup paste",function(){
		
		 let age =$("#age").val();
		 
		 if(age>6 && age<14){
				$('[label="초등학생"]').prop('disabled',false);
			}else if(age>13 && age<17){
				$('[label="중학생"]').prop('disabled',false);
			}else if(age>16 && age <20){
				$('[label="고등학생"]').prop('disabled',false);
			}else if(age>19){
				$('[label="성인"]').prop('disabled',false);
			}
	});
</script>
	
</html>