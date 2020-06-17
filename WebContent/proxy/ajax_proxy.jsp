<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진로 검사</title>
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../js/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/ulg/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
    <style>
    
    </style>
   
</head>
<body>
	<div id="sel"></div>
	<button type="click" id="go">제출</button>
</body>



	<script type="text/javascript" src="../js/jquery-3.5.1.js"></script>
	<script>
		
		function Request(){ //Request 함수 구현
			let requestParam = "";
			this.getParameter = function(param){
				let url = unescape(location.href);
				let paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");
				
				for(let i = 0; i < paramArr.length;i++){
					let temp = paramArr[i].split("=");
					
					if(temp[0].toUpperCase()==param.toUpperCase()){
						requestParam = paramArr[i].split("=")[1];
						break;
					}
				}
				return decodeURI(decodeURIComponent(requestParam));
			}		
	
		}
		
        $(function(){
        	let request = new Request(); //home.html에서 parameter 가져옴
        
        	let apikey = "7a9bfb18b65bfce78a1535c601987455";
        	let name = request.getParameter("name");
        	let age = request.getParameter("age");
        	let gender = request.getParameter("gender");
        	let school = request.getParameter("school");
        	let grade;
        	let trgetSe;
        	let choice = request.getParameter("choice");
        	let answerString;
        	let quest;
        	
        	if(choice==19)
        		trgetSe = "100205";
        	else if(choice==4 || choice==6 || choice==17 || choice==20 || choice==22)
        		trgetSe = "100206";
        	else if(choice==5 || choice==6|| choice==18 || choice==21 || choice==23 )
        		trgetSe = "100207";
        	else{
        		trgetSe = "100209";
        	}
        	
        	if(school!=null){
        	if(age>13 && age<17)
        		 grade= String(Number(age)-13);
        	else if(age>16 && age<20)
        		 grade= String(Number(age)-16);
        	else if(age<14)
        		 grade= String(Number(age)-7);
        	}else
        		grade="";
        	
        	
        	function print(t,obj){
        		
        		if(t==18){
        			for(let i = 0; i<obj.length; i++){
        				if(i+1 ==147)
        					continue;
        				
        				if(i+1 == 131 || i+1 == 140 || i+1 == 144 || i+1 == 148 || i+1 == 152){
        					$("#sel").append("<div><strong>"+"<"+quest[i].question+">"+"</strong></div>")
        				}
        				else
        					$("#sel").append("<div>"+(i+1)+". "+quest[i].question+"</div>");
        				
        				 let value = [obj[i].answer01,obj[i].answer02,obj[i].answer03,obj[i].answer04,obj[i].answer05,
                         	obj[i].answer06,obj[i].answer07,obj[i].answer08,obj[i].answer09,obj[i].answer10];
                         
        				 for(let j =1; j<11; j++){
                         	if(value[j-1]!=null ){
                         	//if(i+1 == 145 || i+1 ==146)
                     		//$("#sel").append("<div class="item_select_answer"><div class="common_ipt_wrap type_dropmenu"><a href="javascript:void(0)" class="link_selected">직업을 선택해주세요.<span class="ico_common ico_arrow"></span></a> <span class="hidden">선택옵션</span> <div class="box_select" style="top: 43px; background: rgb(255, 255, 255); max-height: 131px; overflow-y: auto;"><ul class="list_select"><li><a href="javascript:void(0)" class="link_opt">가수</a></li><li><a href="javascript:void(0)" class="link_opt">간호사</a></li><li><a href="javascript:void(0)" class="link_opt">개그맨</a></li><li><a href="javascript:void(0)" class="link_opt">건축가</a></li><li><a href="javascript:void(0)" class="link_opt">경기심판</a></li><li><a href="javascript:void(0)" class="link_opt">경영컨설턴트</a></li><li><a href="javascript:void(0)" class="link_opt">경제학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">경찰관</a></li><li><a href="javascript:void(0)" class="link_opt">경호원</a></li><li><a href="javascript:void(0)" class="link_opt">고위공무원</a></li><li><a href="javascript:void(0)" class="link_opt">공업기계조작원</a></li><li><a href="javascript:void(0)" class="link_opt">공인중개인</a></li><li><a href="javascript:void(0)" class="link_opt">과수작물 재배자</a></li><li><a href="javascript:void(0)" class="link_opt">교육학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">교장</a></li><li><a href="javascript:void(0)" class="link_opt">국악인</a></li><li><a href="javascript:void(0)" class="link_opt">국제긴급구호요원</a></li><li><a href="javascript:void(0)" class="link_opt">국회의원</a></li><li><a href="javascript:void(0)" class="link_opt">군인</a></li><li><a href="javascript:void(0)" class="link_opt">극작가</a></li><li><a href="javascript:void(0)" class="link_opt">기업고위임원</a></li><li><a href="javascript:void(0)" class="link_opt">기자</a></li><li><a href="javascript:void(0)" class="link_opt">다문화가정상담전문가</a></li><li><a href="javascript:void(0)" class="link_opt">대체에너지개발연구원</a></li><li><a href="javascript:void(0)" class="link_opt">동물조련사</a></li><li><a href="javascript:void(0)" class="link_opt">드라마작가</a></li><li><a href="javascript:void(0)" class="link_opt">로봇연구원</a></li><li><a href="javascript:void(0)" class="link_opt">마술사</a></li><li><a href="javascript:void(0)" class="link_opt">만화가</a></li><li><a href="javascript:void(0)" class="link_opt">모델</a></li><li><a href="javascript:void(0)" class="link_opt">물리학자</a></li><li><a href="javascript:void(0)" class="link_opt">방송 작가</a></li><li><a href="javascript:void(0)" class="link_opt">변호사</a></li><li><a href="javascript:void(0)" class="link_opt">비서</a></li><li><a href="javascript:void(0)" class="link_opt">비행기승무원</a></li><li><a href="javascript:void(0)" class="link_opt">비행기조종사</a></li><li><a href="javascript:void(0)" class="link_opt">사서</a></li><li><a href="javascript:void(0)" class="link_opt">사회복지사</a></li><li><a href="javascript:void(0)" class="link_opt">상담가</a></li><li><a href="javascript:void(0)" class="link_opt">생물학자</a></li><li><a href="javascript:void(0)" class="link_opt">서비스강사</a></li><li><a href="javascript:void(0)" class="link_opt">세무사</a></li><li><a href="javascript:void(0)" class="link_opt">소방관</a></li><li><a href="javascript:void(0)" class="link_opt">소설가</a></li><li><a href="javascript:void(0)" class="link_opt">쇼핑호스트</a></li><li><a href="javascript:void(0)" class="link_opt">수학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">스턴트맨</a></li><li><a href="javascript:void(0)" class="link_opt">스포츠강사</a></li><li><a href="javascript:void(0)" class="link_opt">스포츠트레이너</a></li><li><a href="javascript:void(0)" class="link_opt">시니어컨설턴트</a></li><li><a href="javascript:void(0)" class="link_opt">시인</a></li><li><a href="javascript:void(0)" class="link_opt">심리학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">아나운서</a></li><li><a href="javascript:void(0)" class="link_opt">애니메이션작가</a></li><li><a href="javascript:void(0)" class="link_opt">역사학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">연극연출가</a></li><li><a href="javascript:void(0)" class="link_opt">연기자</a></li><li><a href="javascript:void(0)" class="link_opt">연주가</a></li><li><a href="javascript:void(0)" class="link_opt">영화감독</a></li><li><a href="javascript:void(0)" class="link_opt">외교관</a></li><li><a href="javascript:void(0)" class="link_opt">외환딜러</a></li><li><a href="javascript:void(0)" class="link_opt">운동선수</a></li><li><a href="javascript:void(0)" class="link_opt">웹디자이너</a></li><li><a href="javascript:void(0)" class="link_opt">은행출납사무원</a></li><li><a href="javascript:void(0)" class="link_opt">응급구조사</a></li><li><a href="javascript:void(0)" class="link_opt">의사</a></li><li><a href="javascript:void(0)" class="link_opt">의학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">이러닝(E-learning)교수설계사</a></li><li><a href="javascript:void(0)" class="link_opt">인테리어디자이너</a></li><li><a href="javascript:void(0)" class="link_opt">일러스트레이터</a></li><li><a href="javascript:void(0)" class="link_opt">일반공무원</a></li><li><a href="javascript:void(0)" class="link_opt">자동차영업원</a></li><li><a href="javascript:void(0)" class="link_opt">자동차정비원</a></li><li><a href="javascript:void(0)" class="link_opt">작곡가</a></li><li><a href="javascript:void(0)" class="link_opt">재활승마운동사</a></li><li><a href="javascript:void(0)" class="link_opt">제품디자이너</a></li><li><a href="javascript:void(0)" class="link_opt">조경원</a></li><li><a href="javascript:void(0)" class="link_opt">중∙고등학교 교사(문과)</a></li><li><a href="javascript:void(0)" class="link_opt">중∙고등학교 교사(이과)</a></li><li><a href="javascript:void(0)" class="link_opt">지질학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">지휘자</a></li><li><a href="javascript:void(0)" class="link_opt">천문학자</a></li><li><a href="javascript:void(0)" class="link_opt">철도 및 지하철기관사</a></li><li><a href="javascript:void(0)" class="link_opt">철학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">초등교사</a></li><li><a href="javascript:void(0)" class="link_opt">컴퓨터프로그래머</a></li><li><a href="javascript:void(0)" class="link_opt">특용작물 재배자</a></li><li><a href="javascript:void(0)" class="link_opt">판매원</a></li><li><a href="javascript:void(0)" class="link_opt">패션디자이너</a></li><li><a href="javascript:void(0)" class="link_opt">폴리아티스트(음향효과맨)</a></li><li><a href="javascript:void(0)" class="link_opt">프로게이머</a></li><li><a href="javascript:void(0)" class="link_opt">항공기정비원</a></li><li><a href="javascript:void(0)" class="link_opt">호텔지배인</a></li><li><a href="javascript:void(0)" class="link_opt">화가</a></li><li><a href="javascript:void(0)" class="link_opt">화학자</a></li><li><a href="javascript:void(0)" class="link_opt">화훼재배자</a></li><li><a href="javascript:void(0)" class="link_opt">회계사무원</a></li><li><a href="javascript:void(0)" class="link_opt">기타(오른쪽에 직접 입력)</a></li><li><a href="javascript:void(0)" class="link_opt">아직 결정 못함</a></li></ul></div></div> <div class="pnael_answer_inp"><input type="text" id="inpPanelAnswer" disabled="disabled" class="inp_answer"> <label for="inpPanelAnswer" class="lab_answer">기타 선택 시 직업명 입력</label></div></div><br>");
                         	//else if(i+1 == 149 || i+1==150)
                         	//$("#sel").append("<div class="common_ipt_wrap type_dropmenu"><a href="javascript:void(0)" class="link_selected">국어<span class="ico_common ico_arrow"></span></a> <span class="hidden">선택옵션</span> <div class="box_select" style="top: 43px; background: rgb(255, 255, 255); max-height: 131px; overflow-y: auto;"><ul class="list_select"><li><a href="javascript:void(0)" class="link_opt">국어</a></li><li><a href="javascript:void(0)" class="link_opt">사회(사회/역사)</a></li><li><a href="javascript:void(0)" class="link_opt">도덕</a></li><li><a href="javascript:void(0)" class="link_opt">수학</a></li><li><a href="javascript:void(0)" class="link_opt">과학</a></li><li><a href="javascript:void(0)" class="link_opt">기술가정</a></li><li><a href="javascript:void(0)" class="link_opt">체육</a></li><li><a href="javascript:void(0)" class="link_opt">음악</a></li><li><a href="javascript:void(0)" class="link_opt">미술</a></li><li><a href="javascript:void(0)" class="link_opt">영어</a></li><li><a href="javascript:void(0)" class="link_opt">한문</a></li><li><a href="javascript:void(0)" class="link_opt">보건</a></li><li><a href="javascript:void(0)" class="link_opt">진로와 직업</a></li><li><a href="javascript:void(0)" class="link_opt">제2외국어</a></li><li><a href="javascript:void(0)" class="link_opt">기타</a></li></ul></div></div><br>");
                         	//else
                         	$("#sel").append("<input type='radio' name='chk"+(i+1)+"' value=" +j+ ">" +value[j-1]+"<br>");
                         	}
                         	else
                         		continue;
                         }
      		           		$("#sel").append("<br>");
        			}
        		}
        		else if(t==17){
        			for(let i = 0; i<obj.length; i++){
        				if(i+1 ==159)
        					continue;
        				
        				if(i+1 == 142 || i+1 == 152 || i+1 == 156 || i+1 == 160 || i+1 == 164){
        					$("#sel").append("<div><strong>"+"<"+quest[i].question+">"+"</strong></div>")
        				}
        				else
        					$("#sel").append("<div>"+(i+1)+". "+quest[i].question+"</div>");
        				
        				 let value = [obj[i].answer01,obj[i].answer02,obj[i].answer03,obj[i].answer04,obj[i].answer05,
                         	obj[i].answer06,obj[i].answer07,obj[i].answer08,obj[i].answer09,obj[i].answer10];
                         
        				 for(let j =1; j<11; j++){
                         	if(value[j-1]!=null ){
                         	//if(i+1 == 145 || i+1 ==146)
                     		//$("#sel").append("<div class="item_select_answer"><div class="common_ipt_wrap type_dropmenu"><a href="javascript:void(0)" class="link_selected">직업을 선택해주세요.<span class="ico_common ico_arrow"></span></a> <span class="hidden">선택옵션</span> <div class="box_select" style="top: 43px; background: rgb(255, 255, 255); max-height: 131px; overflow-y: auto;"><ul class="list_select"><li><a href="javascript:void(0)" class="link_opt">가수</a></li><li><a href="javascript:void(0)" class="link_opt">간호사</a></li><li><a href="javascript:void(0)" class="link_opt">개그맨</a></li><li><a href="javascript:void(0)" class="link_opt">건축가</a></li><li><a href="javascript:void(0)" class="link_opt">경기심판</a></li><li><a href="javascript:void(0)" class="link_opt">경영컨설턴트</a></li><li><a href="javascript:void(0)" class="link_opt">경제학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">경찰관</a></li><li><a href="javascript:void(0)" class="link_opt">경호원</a></li><li><a href="javascript:void(0)" class="link_opt">고위공무원</a></li><li><a href="javascript:void(0)" class="link_opt">공업기계조작원</a></li><li><a href="javascript:void(0)" class="link_opt">공인중개인</a></li><li><a href="javascript:void(0)" class="link_opt">과수작물 재배자</a></li><li><a href="javascript:void(0)" class="link_opt">교육학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">교장</a></li><li><a href="javascript:void(0)" class="link_opt">국악인</a></li><li><a href="javascript:void(0)" class="link_opt">국제긴급구호요원</a></li><li><a href="javascript:void(0)" class="link_opt">국회의원</a></li><li><a href="javascript:void(0)" class="link_opt">군인</a></li><li><a href="javascript:void(0)" class="link_opt">극작가</a></li><li><a href="javascript:void(0)" class="link_opt">기업고위임원</a></li><li><a href="javascript:void(0)" class="link_opt">기자</a></li><li><a href="javascript:void(0)" class="link_opt">다문화가정상담전문가</a></li><li><a href="javascript:void(0)" class="link_opt">대체에너지개발연구원</a></li><li><a href="javascript:void(0)" class="link_opt">동물조련사</a></li><li><a href="javascript:void(0)" class="link_opt">드라마작가</a></li><li><a href="javascript:void(0)" class="link_opt">로봇연구원</a></li><li><a href="javascript:void(0)" class="link_opt">마술사</a></li><li><a href="javascript:void(0)" class="link_opt">만화가</a></li><li><a href="javascript:void(0)" class="link_opt">모델</a></li><li><a href="javascript:void(0)" class="link_opt">물리학자</a></li><li><a href="javascript:void(0)" class="link_opt">방송 작가</a></li><li><a href="javascript:void(0)" class="link_opt">변호사</a></li><li><a href="javascript:void(0)" class="link_opt">비서</a></li><li><a href="javascript:void(0)" class="link_opt">비행기승무원</a></li><li><a href="javascript:void(0)" class="link_opt">비행기조종사</a></li><li><a href="javascript:void(0)" class="link_opt">사서</a></li><li><a href="javascript:void(0)" class="link_opt">사회복지사</a></li><li><a href="javascript:void(0)" class="link_opt">상담가</a></li><li><a href="javascript:void(0)" class="link_opt">생물학자</a></li><li><a href="javascript:void(0)" class="link_opt">서비스강사</a></li><li><a href="javascript:void(0)" class="link_opt">세무사</a></li><li><a href="javascript:void(0)" class="link_opt">소방관</a></li><li><a href="javascript:void(0)" class="link_opt">소설가</a></li><li><a href="javascript:void(0)" class="link_opt">쇼핑호스트</a></li><li><a href="javascript:void(0)" class="link_opt">수학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">스턴트맨</a></li><li><a href="javascript:void(0)" class="link_opt">스포츠강사</a></li><li><a href="javascript:void(0)" class="link_opt">스포츠트레이너</a></li><li><a href="javascript:void(0)" class="link_opt">시니어컨설턴트</a></li><li><a href="javascript:void(0)" class="link_opt">시인</a></li><li><a href="javascript:void(0)" class="link_opt">심리학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">아나운서</a></li><li><a href="javascript:void(0)" class="link_opt">애니메이션작가</a></li><li><a href="javascript:void(0)" class="link_opt">역사학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">연극연출가</a></li><li><a href="javascript:void(0)" class="link_opt">연기자</a></li><li><a href="javascript:void(0)" class="link_opt">연주가</a></li><li><a href="javascript:void(0)" class="link_opt">영화감독</a></li><li><a href="javascript:void(0)" class="link_opt">외교관</a></li><li><a href="javascript:void(0)" class="link_opt">외환딜러</a></li><li><a href="javascript:void(0)" class="link_opt">운동선수</a></li><li><a href="javascript:void(0)" class="link_opt">웹디자이너</a></li><li><a href="javascript:void(0)" class="link_opt">은행출납사무원</a></li><li><a href="javascript:void(0)" class="link_opt">응급구조사</a></li><li><a href="javascript:void(0)" class="link_opt">의사</a></li><li><a href="javascript:void(0)" class="link_opt">의학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">이러닝(E-learning)교수설계사</a></li><li><a href="javascript:void(0)" class="link_opt">인테리어디자이너</a></li><li><a href="javascript:void(0)" class="link_opt">일러스트레이터</a></li><li><a href="javascript:void(0)" class="link_opt">일반공무원</a></li><li><a href="javascript:void(0)" class="link_opt">자동차영업원</a></li><li><a href="javascript:void(0)" class="link_opt">자동차정비원</a></li><li><a href="javascript:void(0)" class="link_opt">작곡가</a></li><li><a href="javascript:void(0)" class="link_opt">재활승마운동사</a></li><li><a href="javascript:void(0)" class="link_opt">제품디자이너</a></li><li><a href="javascript:void(0)" class="link_opt">조경원</a></li><li><a href="javascript:void(0)" class="link_opt">중∙고등학교 교사(문과)</a></li><li><a href="javascript:void(0)" class="link_opt">중∙고등학교 교사(이과)</a></li><li><a href="javascript:void(0)" class="link_opt">지질학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">지휘자</a></li><li><a href="javascript:void(0)" class="link_opt">천문학자</a></li><li><a href="javascript:void(0)" class="link_opt">철도 및 지하철기관사</a></li><li><a href="javascript:void(0)" class="link_opt">철학연구원</a></li><li><a href="javascript:void(0)" class="link_opt">초등교사</a></li><li><a href="javascript:void(0)" class="link_opt">컴퓨터프로그래머</a></li><li><a href="javascript:void(0)" class="link_opt">특용작물 재배자</a></li><li><a href="javascript:void(0)" class="link_opt">판매원</a></li><li><a href="javascript:void(0)" class="link_opt">패션디자이너</a></li><li><a href="javascript:void(0)" class="link_opt">폴리아티스트(음향효과맨)</a></li><li><a href="javascript:void(0)" class="link_opt">프로게이머</a></li><li><a href="javascript:void(0)" class="link_opt">항공기정비원</a></li><li><a href="javascript:void(0)" class="link_opt">호텔지배인</a></li><li><a href="javascript:void(0)" class="link_opt">화가</a></li><li><a href="javascript:void(0)" class="link_opt">화학자</a></li><li><a href="javascript:void(0)" class="link_opt">화훼재배자</a></li><li><a href="javascript:void(0)" class="link_opt">회계사무원</a></li><li><a href="javascript:void(0)" class="link_opt">기타(오른쪽에 직접 입력)</a></li><li><a href="javascript:void(0)" class="link_opt">아직 결정 못함</a></li></ul></div></div> <div class="pnael_answer_inp"><input type="text" id="inpPanelAnswer" disabled="disabled" class="inp_answer"> <label for="inpPanelAnswer" class="lab_answer">기타 선택 시 직업명 입력</label></div></div><br>");
                         	//else if(i+1 == 149 || i+1==150)
                         	//$("#sel").append("<div class="common_ipt_wrap type_dropmenu"><a href="javascript:void(0)" class="link_selected">국어<span class="ico_common ico_arrow"></span></a> <span class="hidden">선택옵션</span> <div class="box_select" style="top: 43px; background: rgb(255, 255, 255); max-height: 131px; overflow-y: auto;"><ul class="list_select"><li><a href="javascript:void(0)" class="link_opt">국어</a></li><li><a href="javascript:void(0)" class="link_opt">사회(사회/역사)</a></li><li><a href="javascript:void(0)" class="link_opt">도덕</a></li><li><a href="javascript:void(0)" class="link_opt">수학</a></li><li><a href="javascript:void(0)" class="link_opt">과학</a></li><li><a href="javascript:void(0)" class="link_opt">기술가정</a></li><li><a href="javascript:void(0)" class="link_opt">체육</a></li><li><a href="javascript:void(0)" class="link_opt">음악</a></li><li><a href="javascript:void(0)" class="link_opt">미술</a></li><li><a href="javascript:void(0)" class="link_opt">영어</a></li><li><a href="javascript:void(0)" class="link_opt">한문</a></li><li><a href="javascript:void(0)" class="link_opt">보건</a></li><li><a href="javascript:void(0)" class="link_opt">진로와 직업</a></li><li><a href="javascript:void(0)" class="link_opt">제2외국어</a></li><li><a href="javascript:void(0)" class="link_opt">기타</a></li></ul></div></div><br>");
                         	//else
                         	$("#sel").append("<input type='radio' name='chk"+(i+1)+"' value=" +j+ ">" +value[j-1]+"<br>");
                         	}
                         	else
                         		continue;
                         }
      		           		$("#sel").append("<br>");
        			}
        		}
        		else if(t==22 || t==23){
        			for(let i = 0; i<obj.length; i++){
        				$("#sel").append("<div>"+(i+1)+". "+quest[i].question+"</div>");
        				
        				 let value = [obj[i].answer01,obj[i].answer02,obj[i].answer03,obj[i].answer04,obj[i].answer05,
                         	obj[i].answer06,obj[i].answer07,obj[i].answer08,obj[i].answer09,obj[i].answer10];
                         
        				 for(let j =1; j<11; j++){
                         	if(value[j-1]!=null ){
                         	if(i == 37)
                         	$("#sel").append("<input type = 'text' name='job' value='"+$(this).val()+"'><<br>");
                         	else
                         	$("#sel").append("<input type='radio' name='chk"+(i+1)+"' value=" +j+ ">" +value[j-1]+"<br>");
                         	}
                         	else
                         		continue;
                         }
      		           		$("#sel").append("<br>");
        			}
        		}else{
        		
        		for(let i = 0; i<obj.length; i++){
                    $("#sel").append("<div>"+(i+1)+". "+quest[i].question+"</div>");
                   
                    let value = [obj[i].answer01,obj[i].answer02,obj[i].answer03,obj[i].answer04,obj[i].answer05,
                    	obj[i].answer06,obj[i].answer07,obj[i].answer08,obj[i].answer09,obj[i].answer10];
                	
                    for(let j =1; j<11; j++){
                    	if(value[j-1]!=null )
                		$("#sel").append("<input type='radio' name='chk"+(i+1)+"' value=" +j+ ">" +value[j-1]+"<br>");
                    	else
                    		continue;
                    }
 		           		$("#sel").append("<br>");
        			}
        		}
        	};
        	
        	$(document).ready(function(){
           
        	 let url = 'http://inspct.career.go.kr/openapi/test/questions?apikey='+apikey+'&q='+choice;
           	// 검사 종류에 따라 url 변경
        	 let address = encodeURIComponent(url);
                
             $.ajax({
                    url : 'proxy.jsp?url='+address,
                    type :'GET',
                    dataType : 'json',
                    error : function(){
                        alert('error');
                    },
                    success : function(obj){
                    	
						console.log(obj);
                     	quest = obj["RESULT"];
                     	
                     	print(trgetSe,quest);
                    	
                    }
                });
            });
        	
       
        	
            $('#go').click(function(){
            	
        		
            	if(choice==4 || choice==5 || choice==17 || choice==18){
            		var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                         		if(radioVal){
                        		arr.push("A"+i+"="+radioVal);
                         		}
                         		else{
                         			alert(i+"번을 확인해주세요");
                         			return ;
                         			}
                         }
            		 answerString = arr.join(" ");
            		 console.log(answerString);
                 }
                
            	 else if(choice==6){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal =$('input[name="chk'+i+'"]:checked').val();
                         		if(radioVal)
                         		arr.push("B"+i+"="+radioVal);  
                         		else{
                             		alert(i+"번을 확인해주세요");
                             		return ;
                             		}
                         }
            		 
            		 answerString = arr.join(" ");
            		 console.log(answerString);
                 }
                
            	 else if(choice==8 || choice==9 || choice==10){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                         if(radioVal){
                         		if(i==quest.length)		
                         			arr.push(radioVal);
                         		else
                         			arr.push(radioVal+",");
                         }
                         else{
                      		alert(i+"번을 확인해주세요");
                      		return ;
                      		}
                         
                         			
                         }
            		 answerString = arr.join();
            		 console.log(answerString);
                 }
                
            	 else if(choice==19 || choice==20 || choice==21 || choice==22 ||choice==23){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                        	 if(radioVal){
                         		arr.push(i+"="+radioVal);
                        	 }
                        	 else{
                        		if((choice ==22 || choice == 23) && i==38){
                        			 arr.push(i+"="+"개발자");
                        			 continue;
                        		}
                          		alert(i+"번을 확인해주세요");
                          		return ;
                          		}
                         }
            		 answerString = arr.join(" ");
            		 console.log(answerString);
                 }
        		
            	
            	
            	
            	
            	
            	  var postJson ={
                  		"apikey":apikey,
                 		"qestrnSeq":choice,
                 		"trgetSe":trgetSe,
                 		"name": name,
                 		"gender":gender,
                 		"school":school,
                 		"grade": grade,
                 		"email":"",
                 		"startDtm":1550466291034,
                 		"answers": answerString
      	            };
                  
            	  console.log(JSON.stringify(postJson));
            	  
            $.ajax({
            	url : 'http://inspct.career.go.kr/openapi/test/report?apikey='+apikey+'&qestrnSeq='+choice,
            	type : 'POST',
            	dataType : 'json',
            	contentType : 'application/json',
            	data : JSON.stringify(postJson),
	                error: function(){
	                    alert("errorpost");
	                },
	                success:function(obj){
	                	console.log(obj);
	                	let url = obj["RESULT"].url;
	                	console.log(url);
	                	window.open(url);;
	                }
            	});
            
        	});
        });



    </script>
</html>