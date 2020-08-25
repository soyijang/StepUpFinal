<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
        
        #teamInsertPopup {
            width: 800px;
            height: 400px;
            border: 1px solid black;
        }
        #teamInsertTitle {
            width: 350px;
            height: 350px;
            /* border: 1px solid black;  */
            display: inline-block;
        }
        #teamInsertContent {
            width: 400px;
            height: 350px;
            /* border: 1px solid black;  */
            display: inline-block;
        }
        h3 {
            padding: 10px;
            margin: 10px;
            margin-top: 10px;
            margin-bottom: 3px;
        }
        p {
            font-size: 12px;
            padding: 3px;
        }
        pre { 
            font-size: 11px;
        }
        mark {
            background: white;
            color: red;
        }
        button {
            background:white;
            height: 20px;
            width: 50px;
            border-radius: 10px;
            border: 1px solid #C4C4C4;
            font-size: 8px;
            color: #C4C4C4;
            text-align: center;
        }
        input {
            height: 30px;
        }
        #btn {
            text-align: right;
            padding: 10px;
        }

    </style>
</head>
<body>


    <div id-="teamInsertPopup">
        <div id="teamInsertTitle">
            <h3>새로운 팀 시작</h3>
            <img src="popup_teamInsert.png">
        </div>
        <div id="teamInsertContent">
            <div class="content">
                <p>팀에 추가하여 모든 인원이 한 자리에서 작업하도록 하세요.&nbsp;&nbsp; 
                @mentions, 협업으로 계속 연결을 유지하고 팀 프로필 페이지에서
                모든 것을 효율적으로 관리합니다.</p>
            </div>
            <div class="teamInsert">
                <h4>팀 이름?<mark>*</mark></h4>
                <input type="search" id="teamName">
                <h4>팀에 사용자 초대</h4>
                <input type="search" id="teamUserName" placeholder="이름을 입력하거나 @멘션">
                <input type="search" id="teamAuthority" placeholder="권한 설정 ">
                <pre>한 번에 10명까지 초대할 수 있습니다.</pre>
                <div id="btn">
                    <button>시작</button> 
                    <button>취소</button> 
                </div>
            </div> 
            

        </div>


    </div>



    

</body>
</html>