<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectManage/projectTimeLine/projectTimeLine.css">

<body>
	<%@ include file="../../common/menubar.jsp" %>
            <div id="content">
                <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
                <div id="contentTitle">
                    <div id="projectTitle2">프로젝트 / 이름땡땡땡!!</div>
                    <div id="menuTitle">로드맵</div>
                    <div id="shareArea">
	                    <div id="userArea">사용자추가하는 공간</div>
	                    <div id="share">
	                    	<button id="shareBtn">
	                    		<img id="sharedIcon"alt="공유아이콘" src="/agile/resources/icon/common/icon_shareicon.png">공유
	                    	</button>
	                    </div>
                    </div>
                    <div id="line"></div>
                </div>
                <div id="contentBox2">
                	<div id="epic-area">
                		
                		<div id="epic-title">
                			에픽
                		</div>
                		<div id="epic-title-cont">
                			<div id="ep-ti">
               					여기에 에픽 제목
                			</div>
                			<div id="epic-add-btn">
                				<button id="ep-ad-btn">
                					에픽 만들기
                				</button>
                				<input type="text" id="ep-ti-tx" style="display:none;" onkeyup="enterkey();">
                			</div>
                			<!-- <table style="width:100%;">
                				<tr>
                					<td style="border-bottom:1px solid #E8E8E8; text-align:center; height:90px;">제목이 생겨야해</td>
                				</tr>
                			</table> -->
                		</div>
                	</div>
                	<div id="epic-con-area">
                		<div id="epic-con-title">
                		
                		</div>
                		<div id="epic-con-cont">
                		
                		</div>
                	</div>
                </div>
             </div>
</body>
<script>
	//input type text에서 엔터치면 실행되는 함수
	function enterkey() {
		if(window.event.keyCode == 13){
			createEpic();
			noneinput();
		}
	}
	function noneinput(){
		$("#ep-ti-tx").hide();
		$("#ep-ad-btn").hide();
	}
	
	
	//에픽제목 버튼 누르면 input type text활성화, 버튼 비활성화 되는 함수
	$("#ep-ad-btn").on('click',function(e){
		$("#ep-ti-tx").show();
		$("#ep-ad-btn").hide();
	});
	
	//에픽 제목 div 영역 누르면 버튼 활성화, text창 비활성화 되는 함수
	$(document).on("click",function(e){
		if($("#epic-title-cont").is(e.target)){
			
			$("#ep-ti-tx").hide();
			$("#ep-ad-btn").show();
			
		}
	});
	
	function createEpic(){
		var epdiv = $("#ep-ti");
		
		var div = document.createElement('div');

	    div.innerHTML = document.getElementById('ep-ti-tx').value;

	    document.getElementById('epic-title-cont').appendChild(div);

		
	}
	
	
</script>
</html>