<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문응답페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectFeedback/feedbackAnswer/answerMain.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/button.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
		
		<div id="wrapper">
			
		   		<div class="surveyInfo">
					<h2 id="surveyName">${surveyOne.surveyName}</h2>
					<p class="surveyIntro">${surveyOne.surveyJoinList.surveyJoinName} 님 안녕하세요!</p>
					<p class="surveyIntro">본 설문조사는 [ ${surveyOne.sprintHistory.sprintName} ] 과 관련한 설문조사입니다.</p><br>						
					<p class="surveyIntro">${surveyOne.surveyIntro}</p><br>
					<p class="surveyIntro" id="surveyDate">설문기간 : ${surveyOne.surveyStartDate} ~  ${surveyOne.surveyEndDate}</p>
					<div onclick="nextPage()" id="surveyIntroNext">NEXT</div>
					<input type="hidden" name="surveyCode" id="surveyCode" value="${surveyOne.surveyCode}">
	   			</div>
	   		
   			<div id="man"><img src="${ contextPath }/resources/images/files/login_man.png"></div>
   			<div id="woman"><img src="${ contextPath }/resources/images/files/login_woman.png"></div>
   			<div><img src="${ contextPath }/resources/images/logo/logo_trans.png" id="bottomlogo"></div>
   		</div>
   		
   		
   		
   	<div class="wrap-loading display-none">
   		<div><img src="/agile/resources/icon/common/icon_loading.gif"/></div>
	</div>   
	
</body>

<script type="text/javascript">

	//객관식 체크이벤트 발생 시 각 문항의 숨겨진 input에 넣음.
	$(document).on('click', '.surveyReplyValue', function() { 
		
		var str = "";  // 여러개가 눌렸을 때 전부 출력이 될 수 있게 하나의 객체에 담는다.
		var count = 0; //복수여부체크용
		var namesave = '.' + $(this).attr("name"); //문항내에 있는 보기들 클래스명으로 반복하기 위해 보기에 들어있는 문항번호 저장
		
		$(namesave).each(function(){  // .each()는 forEach를 뜻함
			if($(this).is(":checked")){
				
				//복수불가인데 이미 선택된게 있으면 alert으로 알림
				var check = '.multi' + $(this).attr("name");
				if(count > 0 && ($(check).html() != '*복수가능')){
					alert('복수 응답이 불가능합니다!');
					$(this).prop("checked", false);
				}else{
					str += $(this).val() + ", ";  // 체크된 객체를 str에 저장한다.
					count++;
				}
			}  
		
			$("#surveyReplyContent" + $(this).attr("name")).val(str);
		});
		str="";
		
		console.log($("#surveyReplyContent"+$(this).attr("name")).val());
	}); 
	
	//문항수 카운트
	var count = 0;
	
	//문항페이지 로딩
	function nextPage() {
		
		var surveyCode = $('#surveyCode').val();

		$.ajax({
			type : 'post',
			url: "surveyReplyNext.sv",
			data : {
				surveyCode : surveyCode
			},
			dataType: 'json',
			success : function(data) {
				
				$('.surveyInfo').children().remove();
				var temp = ''; //비교용 변수선언
				
				//한번에 append 할 변수
				var surveyContent ='';
				surveyContent += '<table id="surveyTable">';
				
				//반복문으로 꺼내기
				for(var i=0; i<data.surveyChoiceList.length; i++){
					
					//문항부터 꺼내기. 앞문항과 코드같으면(같은 문항이면) 넘어가고 같지않으면 꺼냄.
					if(temp != data.surveyChoiceList[i].surveyQuesList.surveyQuesCode){
						temp = data.surveyChoiceList[i].surveyQuesList.surveyQuesCode;
						
						
						//문항제목넣기
						surveyContent += '<tr class="quesTitle"><td>' + data.surveyChoiceList[i].surveyQuesList.surveyQuesName + '</td></tr>';
						
						
						//필수응답여부
						surveyContent += '<tr><td class="right">';
						if(data.surveyChoiceList[i].surveyQuesList.surveyQuesMust == 'Y'){
							surveyContent += '<span class="must must'+ count +'">*필수</span>';
						}else{
							surveyContent += '<span class="must must'+ count +'"></span>';
						}
						
						//복수가능여부
						if(data.surveyChoiceList[i].surveyQuesList.surveyQuesMulti == 'Y'){
							surveyContent += '<span class="multi multi'+ count +'">*복수가능</span>';
						}else{
							surveyContent += '<span class="multi multi'+ count +'"></span>';
						}
						
						surveyContent += '</td></tr>';
						
						//문항마다 숨겨진 input을 만들어서 결과값 넘겨줌.
 						surveyContent += '<input type="hidden" id="surveyCode'+ count +'" value="' + surveyCode + '">'
										+ '<input type="hidden" id="surveyQuesCode'+ count +'" value="' 
										+ data.surveyChoiceList[i].surveyQuesList.surveyQuesCode + '">' 
										+ '<input type="hidden" class="surveyReplyContent" id="surveyReplyContent'+ count +'" value="미응답">' 
										+ '<input type="hidden" id="surveyJoinCode'+ count +'" value="' 
										+ ${surveyOne.surveyJoinList.surveyJoinCode} + '">' 
										; 
						count++;
					}
					
					//count 증가되기 전의 문항에 대한 보기들이므로  -1해서 name 및 class명에 넣어줌.
					var before = count - 1;

					//객관식(01)일때는 체크박스 꺼내고 주관식(02)일때는 텍스트상자
					if(data.surveyChoiceList[i].surveyQuesList.surveyQuesType == '01'){
						var choiceContent = '<tr><td><input type="checkbox" class="surveyReplyValue '+ before +'" name="'+ before 
						+ '" id="choice'+ i + '" value="'+data.surveyChoiceList[i].surveyChoiceContent 
						+'" /><label for="choice'+ i + '">'+ data.surveyChoiceList[i].surveyChoiceContent 
						+ '</label></td></tr>'
						surveyContent += choiceContent;	
					}else{
						var choiceContent = '<tr><td><input type="text" value="" class="surveyReplyValue'+ before +' answerText" name="'+ before 
						+'"></td></tr>'
						surveyContent += choiceContent;
					}
				}
				
				surveyContent += '</tbody></table>';
				surveyContent += '<button onclick="insertSurveyReply()" id="surveyIntroNext">제출하기</div>';
				
				$('.surveyInfo').append(surveyContent);
				
			},
			error : function () {
				console.log('설문문항 조회에 실패했습니다! 관리자에게 문의하세요.');
			},
			beforeSend : function(){
		        $('.wrap-loading').removeClass('display-none');
			},
			complete : function(){
			    $('.wrap-loading').addClass('display-none');
			}	
		});
	
	}
	
	//응답완료 후 insert처리 전 필수응답 다 했는지 확인
	function insertSurveyReply() {
		
		//주관식 input에 담겨있는 값들을 가져옴.
		var nameSave2;
		var classnameSave;
		// .each()는 forEach를 뜻한다. item은 반복문에 사용되는 요소들을 꺼내서 쓸 수 있다!
		$('.answerText').each(function(index, item){  
			nameSave2 = $(item).attr("name");
			classnameSave = "." + "surveyReplyValue" + $(item).attr("name");
			$("#surveyReplyContent" + nameSave2).val($(classnameSave).val());
		});
		
		//확인!
		var count3 = 0;
		var indexSave ='';
		$('.surveyReplyContent').each(function(index) {
			var surveyReplyContent = '#surveyReplyContent' + index;
			//값이 미응답일때 필수응답문항이 아닌지확인
			if($(surveyReplyContent).val() == '미응답' || $(surveyReplyContent).val() == ''){
				var mustYn = '.must' + index;
				if($(mustYn).html()=='*필수'){
					console.log(surveyReplyContent);
					indexSave += (index+1) + '번 ';
					count3++;
				}
			}
		});
		
		if(count3==0){
			insertSurveyReply2();
		}else{
			alert('필수응답 문항을 모두 답변 후 제출해주세요! [미응답항목 :' + indexSave + ']');
		}
		
	}	
	
	//응답완료 후 insert처리
	function insertSurveyReply2() {
		
		//totData는 객체로 선언, dataList는 Array로 선언
		var totData = new Object();
		var dataList = new Array();
		
		//문항별로 data라는 객체에 값을 넣고 각 data객체들을 dataList에 push해줌
		for(var i=0; i<count; i++){
			var data = new Object();
			data["surveyQuesCode"] = $('#surveyQuesCode' + i).val();
			data["surveyJoinCode"] = $('#surveyJoinCode' + i).val();
			data["surveyReplyContent"] = $('#surveyReplyContent' + i).val();
			data["surveyCode"] = $('#surveyCode' + i).val();
			dataList.push(data);
		}
		
		//dataList를 voList객체로 다시한번 넣어줌. (totData는 객체로 선언, dataList는 Array로 선언)
		totData["surveyReplyVOLists"] = dataList;
		console.log(totData);
		
		//ajax로 넘겨줌
		$.ajax({
			type : 'post',
			url: "surveyReplyFin.sv",
			contentType:'application/json',
			dataType: 'json',
			data : JSON.stringify(totData),
			success : function(data) {
				alert(data.alertmsg);
				self.opener=self;
				window.close();
			},
			error : function () {
				alert('설문제출에 실패하였습니다!');
			},
			beforeSend : function(){
		        $('.wrap-loading').removeClass('display-none');
			},
			complete : function(){
			    $('.wrap-loading').addClass('display-none');
			}	
		});
	
	}

</script>

</html>