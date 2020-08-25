<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	.modalTable{
		width: 400px;
		float:left;
		margin-left: 15px;
		float:left;
	  }
	.modal {
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
	.modal-content {
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
	.modaltitle {
		margin-left:15px;
		padding-top:30px;
		margin-bottom:10px;
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
	.modalTable button img {
		width:20px;
		height:20px;
		margin:3px;
		float:left;
	}
	#intro {
		padding-top:10px;
	}
	.activity {
		 background:#DD0351;
         height: 20px;
         width: 55px;
         border-radius: 10px;
         border: 0;
         font-size: 8px;
         color: white;
         text-align: center;
	}
	#attachment {
		margin-right:10px;
	}
	.profile {
		background:#C4C4C4;
        height: 40px;
        width: 40px;
        border-radius: 50%;
        border: 0;
        font-size: 8px;
        color: white;
        text-align: center;
        float:left;
        margin-right:10px;
        margin-top:5px;
	}
	#reply {
		margin-top:10px;
		height:30px;
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
		margin-top:-70px;
		margin-left:50px;
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
</style>
</head>
<body>
	<button onclick="" class="searchBtn" id="apply">모달창</button>
    <!-- Trigger/Open The Modal -->

    <!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
      	<div class="projectList" id="project"><div id="storyicon"></div>IT WORKS!</div><div class="projectList">/</div>
      	<div class="projectList" id="story"><div id="taskicon"></div>TEST01-1</div>
      	<div id="cancel"><img src="/agile/resources/icon/common/icon_x.png" class="close"></div>
      	<div><img src="/agile/resources/icon/common/icon_more horizontalicon.png" id="additional"></div>
      	<div><img src="/agile/resources/icon/common/icon_shareicon.png" id="share"></div>
      	<div><label id="count">1번</label><img src="/agile/resources/icon/common/icon_bookmarkicon.png" id="bookmark"></div>
        <p align="left" class ="modaltitle" style="font-size:25px;">회원가입기능</p>
        <table align="center" class="modalTable">
            <tr>
            	<td>
            	<button id="attachment"><img src = "/agile/resources/icon/common/icon_clip.png"><label class="subBtn">첨부</label></button>
            	<button id="subtask"><img src = "/agile/resources/icon/common/icon_copyicon.png"><label class="subBtn">하위 테스크 생성</label></button>
            	</td>
            </tr>
            <tr>
            	<td id="intro">설명</td>
            </tr>
            <tr>
            	<td><div id="summernote">Hello Summernote</div></td>
            </tr>
            <tr>
            	<td>활동</td>
            </tr>
            <tr>
            	<td colspan="4">표시 : 
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
	var modal = document.getElementById("myModal");
	
	//Get the button that opens the modal
	var btn = document.getElementById("apply");
	
	//Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	//When the user clicks on the button, open the modal
	btn.onclick = function() {
	    $(modal).fadeIn(300); 
	    $(modal).css('display','block');
	}
	
	//When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    $(modal).css('display','none');
	}
	
	//When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	};
	
	$(document).ready(function() {
        $('.summernote').summernote();
	});

</script>
</body>
</html>