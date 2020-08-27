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
<script src="lang.summernote-ko-KR.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectTask/mainTask/taskDetail.css">
</head>
<body>
   <!-- <button onclick="" class="searchBtn" id="apply">모달창</button> -->
    <!-- Trigger/Open The Modal -->

    <!-- The Modal -->
    <div id="taskDetailModal"  class="taskmodal">
      <!-- Modal content -->
      <div class="taskmodal-content">
         <div class="projectList" id="project"><div id="storyicon"></div><p id="projectNameReceive"></p></div><div class="projectList">/</div>
         <div class="projectList" id="story"><div id="taskicon"></div>TEST<p id="sprintCodeReceive"></p></div>
         <div id="cancel"><img src="/agile/resources/icon/common/icon_x.png" class="taskclose"></div>
         <div><img src="/agile/resources/icon/common/icon_more horizontalicon.png" id="additional"></div>
         <div><img src="/agile/resources/icon/common/icon_shareicon.png" id="share"></div>
         <div><label id="count">1번</label><img src="/agile/resources/icon/common/icon_bookmarkicon.png" id="bookmark"></div>
        <p align="left" class ="taskmodaltitle"><input type="text" placeholder="제목을 입력하세요" style="font-size:20px;" id="titleName" onkeyup="enterkey();"></p>
        <table align="center" class="taskmodalTable">
            <tr>
               <td>
               <button id="attachment"><img src = "/agile/resources/icon/common/icon_clip.png"><label class="subBtn">첨부</label></button>
               <button id="subtask"><img src = "/agile/resources/icon/common/icon_copyicon.png"><label class="subBtn">하위 테스크 생성</label></button>
               </td>
            </tr>
            <tr>
               <td id="intro" class="label">설명</td>
            </tr>
            <tr>
               <td><textarea id="summernote" name="content" rows="10" cols="100"><c:out value="${content}" /></textarea></td>
            </tr>
            <tr>
               <td><button class="intBtn">Cancel</button>
               <button class="intBtn">Save</button></td>
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
               <td><div class="profile" id="user"></div><input type="text" placeholder="댓글추가...." id="reply"></td>
            </tr>
        </table>
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
                <td class="rTitle">스트린트</td>
             </tr>
             <tr>
                <td><input type="text" placeholder="미지정" class="dinput"></td>
             </tr>
             <tr>
                <td class="rTitle">레이블</td>
             </tr>
             <tr>
                <td><input type="text" placeholder="없음" class="dinput"></td>
             </tr>
             <tr>
                <td class="rTitle">Story Points</td>
             </tr>
             <tr>
                <td><input type="text" placeholder="없음" class="dinput"></td>
             </tr>
             <tr>
                <td class="rTitle">최초예상</td>
             </tr>
             <tr>
                <td><input type="text" placeholder="0m" class="dinput"></td>
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
    
    <!-- 테스크추가 모달창 -->
   <form action="createTask.pj" method="post">
      <div id="taskModalYn" class="modal">
         <div class="modal-content">
            <p align="left" class="modaltitle">🎉 새로운 테스크 생성</p>
            <table align="center" class="modalTable">
               <tbody>
                  <tr>
                     <td><b>[<c:out value="${ sprintList.get(0).project.projectName }" />]
                     </b>(스프린트)에 새로운 테스크를 추가하시겠습니까?</td>
                  </tr>
                  <tr>
                     <td>※초기 테스크명은 테스크 코드로 자동지정됩니다.</td>
                  </tr>
               </tbody>
            </table>
            <div class="modalButtonArea" id="newTask">
               <button class="taskMake" id="rectangle6" type="submit">저장</button>
               <div class="taskCancel" id="rectangle7">취소</div>
               <input type="hidden" name="sprintCode" id="sprintCode" value="">
            </div>
        

         </div>
      </div>
   </form>
   
   

<script>
	$('.sprinttbody').click(function () {
	    
	    /* 언니이건 스프린트코드 */
	    var receiveCode = $('#sendSprintCode').val();
	    
	    /* 이건 프로젝트네임 */
	    var receiveProjectName = $('#projectName').html();
	    
	    /* task좌측 상단에 넣는거 */
	    $('#projectNameReceive').html(receiveProjectName);
	    $('#sprintCodeReceive').html(receiveCode+'번 스프린트');
	    $('#sprintCode').val(receiveCode);
	    
	 })

   //Get the modal
   var taskmodal = document.getElementById("taskmyModal");
   //Get the button that opens the modal
/*    var btn = document.getElementById("apply"); */
   
   //Get the <span> element that closes the modal
   var taskspan = document.getElementsByClassName("taskclose")[0];
   var taskspan2 = document.getElementsByClassName("taskCancel")[0];
   
   //When the user clicks on the button, open the modal
/*    btn.onclick = function() {
       $(taskmodal).fadeIn(300); 
       $(taskmodal).css('display','block');
   } 
    */
    
   //When the user clicks on <span> (x), close the modal
   taskspan.onclick = function() {
       $(taskDetailModal).css('display','none');
   }
   
   taskspan2.onclick = function() {
       $(taskModalYn).css('display','none');
   }
   
   //When the user clicks anywhere outside of the modal, close it
   window.onclick = function(event) {
     if (event.target == taskmodal) {
        taskmodal.style.display = "none";
     }
   };
   
	   /*$('.taskMake').click(function () {
	   $(taskmodalYn).css('display','none');
	   $(taskDetailModal).fadeIn(300); 
	   $(taskDetailModal).css('display','block');
	 })*/
	 $(taskmodalYn).on('hidden.bs.modal', function(){
		 $(taskDetailModal).fadeIn(300); 
	     $(taskDetailModal).css('display','block');
	 });
   
   
   $('#summernote').summernote({
      lang: 'ko-KR',
        placeholder: '안녕하세요 스탭업! 입니다',
        tabsize: 3,
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
   
</script>
</body>
</html>