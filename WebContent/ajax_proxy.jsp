<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진로 검사</title>

<script type="text/javascript" src="jquery-3.5.1.js"></script>
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
				return requestParam;
			}		
	
		}
		
        $(function(){
        	let request = new Request(); //home.html에서 parameter 가져옴
        	//request.setCharacterEncoding("utf-8");
        	let name = request.getParameter("name");
        	let age = request.getParameter("age");
        	let gender = request.getParameter("gender");
        	let school = request.getParameter("school");
        	let choice = request.getParameter("choice");
        	
        	
        	$(document).ready(function(){
           
        	 let url = 'http://inspct.career.go.kr/openapi/test/questions?apikey=7a9bfb18b65bfce78a1535c601987455&q='+choice;
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
                     	let quest = obj["RESULT"]
 						//console.log(ar);
                     	for(let i = 0; i<quest.length; i++){
	                        $("#sel").append("<div>"+(i+1)+". "+quest[i].question+"</div>");
	                        
	                        for(let j =1; j<11; j++){
	                        let value = [quest[i].answer01,quest[i].answer02,quest[i].answer03,quest[i].answer04,quest[i].answer05,
	                        	quest[i].answer06,quest[i].answer07,quest[i].answer08,quest[i].answer09,quest[i].answer10];
	                        $("#sel").append("<input type='radio' name='chk"+i+"' value=" +j+ ">" +value[j-1]+"<br>");
	                        if(value[j] === null) break;
	                        }
                    		$("#sel").append("<br>");
                    	}
                    }
                });
            });
            $('#radioButton').click(function () {
                // getter
                var radioVal = $('input[name="chk1"]:checked').val();
                alert(radioVal);
              });
        });



    </script>
</head>
<body>
	<div id="sel"></div>
</body>
</html>