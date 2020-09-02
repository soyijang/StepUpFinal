<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectTask/mainTask/taskDetail.css">
</head>
<body>
   <!-- <button onclick="" class="searchBtn" id="apply">모달창</button> -->
    <!-- Trigger/Open The Modal -->
	<!-- <form action="updateTitle.pj" method="post"> -->
    <!-- The Modal -->
    <div id="taskDetailModal"  class="taskmodal">
      <!-- Modal content -->
      <div class="taskmodal-content">
      	 <input type="text" name="taskCode" id="taskCode" value="">
         <div class="projectList" id="project"><div id="storyicon"></div><p id="projectNameReceive"></p></div><div class="projectList">/</div>
         <div class="projectList" id="story"><div id="taskicon"></div>TEST<!-- <p id="sprintCodeReceive" value=""></p> --></div>
         <div id="cancel"><img src="/agile/resources/icon/common/icon_x.png" class="taskclose"></div>
         <div><img src="/agile/resources/icon/common/icon_more horizontalicon.png" id="additional"></div>
         <div><img src="/agile/resources/icon/common/icon_shareicon.png" id="share"></div>
         <div><label id="count">1번</label><img src="/agile/resources/icon/common/icon_bookmarkicon.png" id="bookmark"></div>
        <p align="left" class ="taskmodaltitle"><input type="text" placeholder="제목을 입력하세요" style="font-size:20px;" id="titleName" onkeyup="enterkey();" name="taskTitle" value=""></p>
        <input type="hidden" name="taskCategoryCode" id="taskCategoryCode" value="J">
        <input type="hidden" name="taskCode" id="taskCode" value="">
        <div id="leftContent">
        <table align="center" class="taskmodalTable" class="modal-dialog">
            <tr>
               <td>
               <button id="attachment"><img src = "/agile/resources/icon/common/icon_clip.png"><label class="subBtn">첨부</label></button>
               <button id="subtask"><img src = "/agile/resources/icon/common/icon_copyicon.png"><label class="subBtn">하위 테스크 생성</label></button>
               </td>
            </tr>
            <tr>
               <td id="intro" class="label">설명</td>
            </tr>
            <tr id="description">
               <td class="active"><input type="text" id="descript" name="descipt" placeholder="설명을 입력하세요" value=""></td>
            </tr>
            <tr id="htmlBox" style="display:none;">
               <td><textarea id="summernote" name="summernote" rows="10" cols="150" style="display:none;"></textarea></td>
               </div><input type="hidden" name="summerContent" id="summerContent">
               <input type="hidden" name="taskCategoryCode1" id="taskCategoryCode1" value="H">
            </tr>
            <tr id="htmlBtn" style="display:none;">
               <td><button id="desBtnCan" class="intBtn">Cancel</button>
               <button class="intBtn" onclick="updateDescipt()">Save</button></td>
            </tr>
            <div>
            <tr id="subTaskBox" style="display:none;">
               <td>하위 테스크</td>
            </tr>
            <tr id="subTaskText" style="display:none;">
               <td><input tyep="text" name="subTaskTitle" id="subTaskTitle" placeholder="무엇을해야합니까?" value=""></td>
            </tr>
            <tr id="subTaskBtn" style="display:none;">
               <td><button id="subTaskCan" class="subTaskBtn">취소</button>
               <button id="subTaskMake"class="subTaskBtn" onclick="insertSubTask()">만들기</button>
               </td>
               <input type="hidden" name="subTaskCode" id="subTaskCode" value=""> 
               <input type="hidden" name="taskCategoryCode" id="taskCategoryCode" value="J">           
            </tr>
            <tr>
               <td id="activity" class="label">활동</td>
            </tr>
            <tr>
               <td colspan="4" class="label">표시 : 
               <button class="activity"><label>댓글</label></button>
               <button class="activity"><label>기록</label></button>
               <button class="activity"><label>작업로그</label></button>
               </td>
            </tr>
            <tr>
               <td colspan="4"><div class="profile" id="user"></div><div id="userName" value=""><%-- <label><c:out value="${ sessionScope.loginUser.userName }"/></label> --%></div>
               <input type="text" placeholder="댓글추가...." id="reply" value="">
               <button id="replyBtn" class="replyBtn" style="display:none;" onclick="insertReply()">등록</button>
               <button id="replyBtnCan" class="replyBtn" style="display:none;">취소</button></td>
               <input type="hidden" name="taskCategoryCode2" id="taskCategoryCode2" value="K">
            </tr>
        </table>
        </div>
       
       
       <!-------------------- 오른쪽 ----------------------------->
        <div >
           <table id="detail">
              <tr>
                 <td><label>담당자</label></td>
              </tr>
             <tr>
                <td colspan="2"><div class="detailprofile" id="dProfile"></div>
                 <input type="text" placeholder="할당해제 됨" id="damdang" class="worker"></td>
             </tr>
              <tr>
                 <td><label>보고자</label></td>
              </tr>
              <tr>
                <td colspan="2"><div class="detailprofile" id="bProfile"></div>
                 <input type="text" placeholder="할당해제 됨" id="bogo" class="worker"></td>
             </tr>
             <tr>
                <td class="rTitle">스트린트 </td>
             </tr>
             <tr>
                <td><c:out value="${ sprintList.get(i).sprintName }" /></td>
             </tr>
             <tr>
                <td class="rTitle">레이블</td>
             </tr>
             <tr>
                <td><input type="text" placeholder="없음" class="dinput" onkeyup="enterkey();"></td>
             </tr>
             <tr>
                <td class="rTitle">Story Points</td>
             </tr>
             <tr>
                <td><input type="number" name="amount" min="1" max="100" value="1" step="1" placeholder="없음" class="dinput" onkeyup="enterkey();"></td>
             </tr>
             <tr>
                <td class="rTitle">최초예상</td>
             </tr>
             <tr>
                <td><input type="text" placeholder="0m" class="dinput" onkeyup="enterkey();"></td>
             </tr>
             <tr>
                <td class="rTitle">시간추적</td>
             </tr>
             <tr>
                <td><img src = "/agile/resources/icon/common/icon_clock.png"></td>
                <td></td>
             </tr>
             <tr>
                <td class="rTitle">우선 순위</td>
             </tr>
             <tr>
                <td></td>
             </tr>
             <tr>
                <td><hr></td>
             </tr>
             <tr>
                <td>생성됨 2020년 8월 10일 오후 1:21</td>
             </tr>
             <tr>
                <td>업데이트된 2초전</td>
             </tr>
           </table>
        </div>
    </div>
   </div>
  <!--   </form> -->
    <!----------------- 테스크추가 모달창 ---------------------->
<!--    <form action="createTask.pj" method="post"> -->
      <div id="taskModalYn" class="modal">
         <div class="modal-content">
            <p align="left" class="modaltitle">🎉 새로운 테스크 생성</p>
            <table align="center" class="modalTable">
               <tbody>
                  <tr>
                     <td><b>[<c:out value="${ sprintList.get(i).sprintName }" />]
                     </b>(스프린트)에 새로운 테스크를 추가하시겠습니까?</td>
                  </tr>
                  <tr>
                     <td>※초기 테스크명은 테스크 코드로 자동지정됩니다.</td>
                  </tr>
               </tbody>
            </table>
            <div class="modalButtonArea" id="newTask">
               <button onclick="createTask()" class="taskMake" id="rectangle7" type="submit">저장</button>
               <div class="taskCancel" id="rectangle7" data-dismiss="modal" aria-label="Close">취소</div>
               <input type="hidden" name="sprintCode" id="sprintCode" value="">
               <input type="hidden" name="taskCode" id="taskCode" value="">
            </div>    

         </div>
      </div>
<!--    </form> -->
   
    <div class="wrap-loading display-none">
         <div><img src="/agile/resources/icon/common/icon_loading.gif"/></div>
   </div> 
   

<script>
	$('.sprinttbody').click(function () {
	    
	    /* 언니이건 스프린트코드 */
	    var receiveCode = $('#sendSprintCode').val();
	    
	    /* 이건 프로젝트네임 */
	    var receiveProjectName = $('#projectName').html();
	    
	    /* task좌측 상단에 넣는거 */
	    $('#projectNameReceive').html(receiveProjectName);
	    /* $('#sprintCodeReceive').html(receiveCode+'번 스프린트'); */
	    $('#sprintCode').val(receiveCode);
	    				
		/* $('#taskCode').val(data.TaskHistory.taskCode); */
		console.log('#taskCode');
	    
	 })

   //Get the modal
   
   //Get the button that opens the modal
/*    var btn = document.getElementById("apply"); */
   
   //Get the <span> element that closes the modal
   
   //When the user clicks on the button, open the modal
/*    btn.onclick = function() {
       $(taskmodal).fadeIn(300); 
       $(taskmodal).css('display','block');
   } 
    */
    
   //When the user clicks on <span> (x), close the modal
   
/*    taskspan2.onclick = function() {
       $(taskModalYn).css('display','none');
   } */
   
/*    taskspan2.onclick = function() {
       $(taskModalYn).css('display','none');
   } */
   
/*    $(function () {
	   $(taskModalYn).modal('toggle');
	}); */
   
   //When the user clicks anywhere outside of the modal, close it
   window.onclick = function(event) {
     if (event.target == taskModalYn) {
    	 taskModalYn.style.display = "none";
     } else if (event.target == taskDetailModal) {
    	 taskDetailModal.style.display = "none";
     }
   };
   
   //테스크 내에 설명 html부분
   /* $('#summernote').val("${summernote.BOARD_CONTENT}");  */
   /* $('#summernote').summernote('editor.insertText', "${summernote.BOARD_CONTENT}") */
   $('#summernote').summernote({
      	lang: 'ko-KR',
        placeholder: '안녕하세요 스탭업! 입니다',
        tabsize: 4,
        width: 400,
        height: 140,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline']],
          ['color', ['color']],
          ['para', ['paragraph']],
          ['insert', ['link', 'picture']],
          ['view', [ 'codeview']]
        ]
      });
   
   //html 입력부분 클릭시 나타남
   $('#descript').click(function() {
		$('#htmlBox').fadeIn(300); 
		$('#htmlBox').css('display','block');
		$('#htmlBtn').css('display','block');
		$('#descript').css('display','none');
	});
   
   //Cancel 버튼 클릭시 html 사라짐
   $('#desBtnCan').click(function(){
	   $('#descript').fadeIn(300); 
	   $('#descript').css('display','block');
	   $('#htmlBox').css('display','none');
	   $('#htmlBtn').css('display','none');
   });
   
   //댓글 버튼 나오기
   $('#reply').click(function(){
	   $('.replyBtn').toggle();
   });
   
 	//sub-Task 추가 부분 나오기
   $('#subtask').click(function(){
	   $('#subTaskBox').toggle();
	   $('#subTaskText').toggle();
	   $('#subTaskBtn').toggle();
	   
   });
 	
 	//모달 scroll생성
/*  	$(document).ready(function () { $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .8) + 
 		           'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>'); });
 */	
	 
    //TASK_LIST 생성 후 TASK 모달로 연결
   	var taskCode;
	 function createTask() {
			var sprintCode = $('#sendSprintCode').val();
			
			console.log(sprintCode);
			
			$.ajax({
				url:"createTask.pj",
				type:"post",
				data:{'sprintCode': sprintCode},
				async: false,
				success:function(data) {
					console.log("성공!");
					console.log(data);
					$('#taskCode').val(data);
					$('#taskModalYn').css('display','none');
					$('#taskDetailModal').fadeIn(); 
					$('#taskDetailModal').css('display','block');
				},
				error:function(){
					console.log("에러!");
				},
				beforeSend : function(){
                    $('.wrap-loading').removeClass('display-none');
                },
                complete : function(){
                    $('.wrap-loading').addClass('display-none');
                 }
			});
			return taskCode;
		}
    
	//input type text에서 엔터치면 실행되는 함수
	//1. 제목변경
	function enterkey() {
		if(window.event.keyCode == 13){
				updateTitle();
		}
	}
    
    //TASK_HISTORY에 정보 입력
    //1. 제목 변경
     function updateTitle(){
    	
    	var taskCode = $('#taskCode').val();
    	var taskHistValue = $('#titleName').val();
    	var taskCategoryCode = $('#taskCategoryCode').val();
    	console.log(taskCode);
    	console.log(taskHistValue);
    	console.log(taskCategoryCode);
    	
    	/* var title = [];
    	title.push($('#taskCode').val());
    	title.push($('#titleName').val());
    	title.push($('#taskCategoryCode').val());
    	
    	var allData = { "taskCode": taskCode, "titleName": taskHistValue, "taskCategoryCode": taskCategoryCode };
    	console.log(allData);*/ 
    	$.ajax({
    		type:"post",
    		url:"updateTitle.pj",
    		data: {"taskCode" : taskCode,
    			   "taskHistValue" : taskHistValue,
    			   "taskCategoryCode" : taskCategoryCode
    		},
    		success: function(data){
    			$('#titleName').val(data);
    		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }
    
    //2. 설명 변경
    function updateDescipt(){

    	var taskCode = $('#taskCode').val();
    	//summernote 내용 가져오기
           var summernote = $('#summernote').summernote('code').replace(/<\/?[^>]+(>|$)/g, ""); 
    	/* var summernote = $('#summernote').summernote('code', '${summernote.BOARD_CONTENT}'); */
        /* var summernote = $($("#summernote").summernote("code")).text();*/
       /*  var summernote = $('#summernote').summernote('code'); */
       /*  var summernote = $('#summernote').summernote('editor.insertText', "${summernote.BOARD_CONTENT}"); */
    	var taskCategoryCode = $('#taskCategoryCode1').val();
    	var descript = $('#descript').val();
    	console.log(taskCode);
    	console.log(summernote);
    	console.log(descript);
    	
    	/* var allData = { "taskCode": taskCode, "summernote": summernote, "taskCategoryCode": taskCategoryCode };
    	console.log(allData); */
    	$.ajax({
    		type:"post",
    		url:"updateDescipt.pj",
    		data: {
    			"taskCode": taskCode, 
    			"summernote": summernote, 
    			"taskCategoryCode": taskCategoryCode
    		},
    		success: function(data){
    			console.log("성공!");
    			console.log(taskCode);
    			console.log(summernote);
    			$('#descript').val(summernote);/* 
    			$('#descript').val(data.taskCode); */
    			$('#descript').fadeIn(300); 
    			$('#descript').css('display','block');
    			$('#htmlBox').css('display','none');
    			$('#htmlBtn').css('display','none');
    		/* 	$('#summernote').summernote('code', document.getElementById('#summerContent').value); */    				
    		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }
    
    //3.하위 테스크 추가
     function insertSubTask(){
    	var taskCode = $('#taskCode').val();
    	var subTaskTitle = $('#subTaskTitle').val();
    	var taskCategoryCode = $('#taskCategoryCode').val();
    	var sprintCode = $('#sendSprintCode').val();
    	console.log(taskCode);
    	console.log(subTaskTitle);
    	console.log(taskCategoryCode);
    	
    	/* var allData = { "taskCode": taskCode, "subTask": subTaskTitle, "taskCategoryCode": taskCategoryCode, "sprintCode" : sprintCode };
    	console.log(allData); */
    	
    	$.ajax({
    		type:"post",
    		url:"insertSubTask.pj",
    		data: {
    			"taskCode": taskCode, 
    			"subTaskTitle": subTaskTitle, 
    			"taskCategoryCode": taskCategoryCode,
    			"sprintCode" : sprintCode
    		},
    		success: function(data){
    			console.log(data)
    			$('#subTaskCode').val(data);/* 
    			$('#subTaskTitle').val(subTaskTitle.val()); */
    			console.log('#subTaskCode');
    			console.log('#subTaskTitle');
    			
    		},
    		error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
    	});
    	
    	return false;
    }
    
   //4.댓글 추가 
     function insertReply() {
  		var userName;
  		var content = $("#reply").val();
  		var taskCode = $('#taskCode').val();
  		var taskCategoryCode = $('#taskCategoryCode').val();
  		
  		console.log(userName);
  		console.log(content);
  		console.log(taskCode);
  		console.log(taskCategoryCode);
     	
     	
     	/* var allData = {"content": content, "taskCode": taskCode, "taskCategoryCode": taskCategoryCode };
     	console.log(allData); */
     	$.ajax({
     		type:"post",
     		url:"insertReply.pj",
     	/* 	data: JSON.stringify, */
     		data: {
     			"content": content,
     			"taskCode": taskCode,
     			"taskCategoryCode": taskCategoryCode
     		},
     		success: function(data){
     			console.log("성공!")
     			console.log(data);
 				var $replySelectTable = $("#replySelectTable tbody");
 				$replySelectTable.html('');
 				
 				for(var key in data) {
 					var $tr = $("<tr>");
 					var $writerTd = $("<td>").text(data[key].userName).css("width", "100px");
 					var $contentTd = $("<td>").text(data[key].content).css("width", "400px");
 					var $dateTd = $("<td>").text(data[key].bDate).css("width", "200px");
 					
 					$tr.append($writerTd);
 					$tr.append($contentTd);
 					$tr.append($dateTd);
 					
 					$replySelectTable.append($tr);
 				}
     		},
     		error:function(){
     			console.log("에러!");
     		},
     		beforeSend : function(){
                 $('.wrap-loading').removeClass('display-none');
             },
             complete : function(){
                 $('.wrap-loading').addClass('display-none');
              }
     	});
     	
     	return false;
   }
   
   //5. 
</script>
</body>
</html>