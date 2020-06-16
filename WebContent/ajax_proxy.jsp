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
				return decodeURI(decodeURIComponent(requestParam));
			}		
	
		}
		
        $(function(){
        	let request = new Request(); //home.html에서 parameter 가져옴
        
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
        	if(school.slice(-3,-2)=="중")
        		 grade= String(Number(age)-13);
        	else
        		 grade= String(Number(age)-16);
        	
        	}else
        		grade="";
        	
        	let apikey = "7a9bfb18b65bfce78a1535c601987455";
        	
        	
        	function getObj(){
        		this.getParameter = function(param){
        			let obj = param;
        			
        			return obj;
        		}
        	}        	       	
        	
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
                     	
                     	for(let i = 0; i<quest.length; i++){
	                        $("#sel").append("<div>"+(i+1)+". "+quest[i].question+"</div>");
	                       
	                        let value = [quest[i].answer01,quest[i].answer02,quest[i].answer03,quest[i].answer04,quest[i].answer05,
	                        	quest[i].answer06,quest[i].answer07,quest[i].answer08,quest[i].answer09,quest[i].answer10];
	                    	
	                        for(let j =1; j<11; j++){
	                        	if(value[j-1]!=null )
	                    		$("#sel").append("<input type='radio' name='chk"+i+"' value=" +j+ ">" +value[j-1]+"<br>");
	                        	else
	                        		continue;
	                        }
	                    	
                       
                    		$("#sel").append("<br>");
                    	}
                    }
                });
            });
        	
      
            
          
            
            $('#go').click(function(){
            	
            	
            	if(choice==4 || choice==5 || choice==17 || choice==18){
            		var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                        		arr.push("A"+i+"="+radioVal);
                         }
            		answerString = arr.join(" ");
            		 console.log(answerString);
                 }
                
            	 else if(choice==6){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length-1;i++){
                         var radioVal =$('input[name="chk'+i+'"]:checked').val();
                         		arr.push("B"+i+"="+radioVal);                        		
                         }
            		 arr.push("B28=1");
            		 answerString = arr.join(" ");
            		 console.log(answerString);
                 }
                
            	 else if(choice==8 || choice==9 || choice==10){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                         		arr.push(radioVal);
                         }
            		 answerString = arr.join(" ");
            		 console.log(answerString);
                 }
                
            	 else if(choice==19 || choice==20 || choice==21 || choice==22 ||choice==23){
            		 var arr = new Array();
            		 for(let i=1;i<=quest.length;i++){
                         var radioVal = $('input[name="chk'+i+'"]:checked').val();
                         		arr.push(i+"="+radioVal);
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
            	url : 'http://inspct.career.go.kr/openapi/test/report?apikey=7a9bfb18b65bfce78a1535c601987455&qestrnSeq='+choice,
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
	                	location.href = url;
	                }
            });
            
        	});
        });



    </script>
</head>
<body>
	<div id="sel"></div>
	<button type="click" id="go">제출</button>
</body>
</html>