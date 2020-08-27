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
<style>
	.taskmodalTable{
		width: 400px;
		float:left;
		margin-left: 15px;
		float:left;
		margin-top:-5px;
	  }
	.taskmodal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 2; /* Sit on top */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	  }
	  
	  /* Modal Content/Box */
	.taskmodal-content {
	    background-color: #fefefe;
	    margin:10% auto; /* 15% from the top and centered */
	    padding: 10px;
	    border: 1px solid #c4c4c4;
	    width: 40%; /* Could be more or less, depending on screen size */
	    z-index:1;
	    border-radius: 10px;
	    box-shadow: 0 0 4px #cccccc;
	    height: 50%;
	    padding-top:20px;
	  }
	.taskmodaltitle {
		margin-left:15px;
		padding-top:20px;
		width:400px;
		margin-right:0px;
	}
	.projectList {
		font-size:13px;
		float:left;
	}
	#project {
		padding-left:15px;
	}
	.close {
		width:20px;
		height:20px;
		float:right;
		padding-right:15px;
	}
	#attachment {
		background:#C4C4C4;
        height: 30px;
        width: 80px;
        border-radius: 10px;
        border: 0;
        font-size: 13px;
        color: black;
        text-align: center;
        float:left;
	}
	#subtask {
		background:#C4C4C4;
        height: 30px;
        width: 140px;
        border-radius: 10px;
        border: 0;
        font-size: 13px;
        color: black;
        text-align: center;
        float:left;
	}
	.taskmodalTable button img {
		width:20px;
		height:20px;
		margin:3px;
		float:left;
	}
	#intro {
		padding-top:10px;
	}
	.activity {
		 border: 1px solid #DD0351;
         color:#DD0351;
         height: 20px;
         width: 55px;
         border-radius: 10px;
         font-size: 8px;
         text-align: center;
         background:white;
	}
	#attachment {
		margin-right:10px;
	}
	.profile {
		background:#C4C4C4;
        height: 30px;
        width: 30px;
        border-radius: 50%;
        border: 0;
        font-size: 8px;
        color: white;
        text-align: center;
        float:left;
        margin-right:10px;
        margin-top:9px;
	}
	#reply {
		margin-top:10px;
		height:20px;
		width:300px;
	}
	#bookmark {
		width:20px;
		height:20px;
		float:right;
		padding-right:5px;
	}
	#share {
		width:20px;
		height:20px;
		float:right;
		padding-right:15px;
	}
	#additional {
		width:20px;
		height:20px;
		float:right;
		padding-right:15px;
	}
	#count {
		padding-right:15px;
		float:right;
		font-size:14px;
	}
	#detail {
		float:left;
		width:300px;
		margin-top:-430px;
		margin-left:460px;
		font-size:11px;
	}
	.worker{
		margin-top:15px;
		border: 0;
        outline: 0;
        font-size:11px;
	}
	.detailprofile {
		background:#C4C4C4;
        height: 30px;
        width: 30px;
        border-radius: 50%;
        border: 0;
        font-size: 8px;
        color: white;
        text-align: center;
        float:left;
        margin-right:10px;
        margin-top:5px;
	}
	.dinput {
		border: 0;
        outline: 0;
        font-size:11px;
	}
	.rTitle {
		padding-top:5px;
	}
	.subBtn {
		float:left;
		margin-top:3px;
	}
	#taskicon {
            width: 15px;
            height: 15px;
            background-color: #4CAEE8;
            background-image: url('/agile/resources/icon/common/icon_empty.png');
            background-size: 10px 10px;
            background-repeat: no-repeat;
            background-position: center;
            border-radius: 3px;
            margin-top:3px;
            float:left;
            margin-right:3px;
            margin-left:3px;
        }
    #storyicon {
            width: 15px;
            height: 15px;
            background-color: #64BA3E;
            background-image: url('/agile/resources/icon/common/icon_bookmark.png');
            background-size: 10px 10px;
            background-repeat: no-repeat;
            background-position: center;
            border-radius: 3px;
            margin-top:3px;
            float:left;
            margin-right:3px;
            margin-left:3px;
        }
    #summernote {
    	display:none;
    }
    .label {
    	font-size:13px;
    }
    #activity {
    	padding-top:15px;
    }
    .intBtn {
    	background:white;
        height: 25px;
        width: 60px;
        border-radius: 10px;
        border: 1px solid #DD0351;
        font-size: 13px;
        color:#DD0351;
        text-align: center;
        float:right;
        margin-left:10px;
    }
    #titleName {
    	border:none;
    	outline:none;
    }
</style>
</head>
<body>
	<!-- <button onclick="" class="searchBtn" id="apply">모달창</button> -->
    <!-- Trigger/Open The Modal -->

    <!-- The Modal -->
    <div id="taskmyModal" class="taskmodal">
      <!-- Modal content -->
      <div class="taskmodal-content">
      	<div class="projectList" id="project"><div id="storyicon"></div>IT WORKS!</div><div class="projectList">/</div>
      	<div class="projectList" id="story"><div id="taskicon"></div>TEST01-1</div>
      	<div id="cancel"><img src="/agile/resources/icon/common/icon_x.png" class="close"></div>
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

<script>
	//Get the modal
	var taskmodal = document.getElementById("taskmyModal");
	
	//Get the button that opens the modal
	var btn = document.getElementById("apply");
	
	//Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	//When the user clicks on the button, open the modal
	btn.onclick = function() {
	    $(taskmodal).fadeIn(300); 
	    $(taskmodal).css('display','block');
	} 
	
	//When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    $(taskmodal).css('display','none');
	}
	
	//When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
		  taskmodal.style.display = "none";
	  }
	};
	
	//input type text에서 엔터치면 실행되는 함수
	function enterkey() {
		if(window.event.keyCode == 13){
			createTask();
		}
	}
	function createTask(){
		var taskTitle = $("titleName").val();
		
		console.log(taskTitle);
		
		$.ajax({
			url:"updateTitle.pj",
			type:"post",
			data:{taskTitle: taskTitle},
			success:function(data) {
				console.log(data.TaskCategory.taskTitle);
			},
			error:function() {
				console.log("에러!");
			}
		});
		
		return false;
	}
	
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
	
	$(".modal-content").load("/taskDetail");
</script>
</body>
</html>