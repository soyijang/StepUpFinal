<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
        h4 {
            padding: 10px;
        }
        #addPerson {
            border: 1px solid black;
            width: 450px;
            height: 500px;
        }
        #addPerson p {
            padding-left: 10px;   
            padding-right: 10px;
            margin: 0;
        }
        #emailInsert {
            text-align: center;
            margin-top: 8%;
        }
        #emailInsert input {
            width: 400px;
            height: 30px;
            text-align: left;

        }
        #addInvite {
            color: skyblue;
            margin-left: 20px;
            margin-top: 20px;
        }
        #sendBtn {
            text-align: right;
            margin-right: 20px;
            margin-top: 20px;
        }
        #sendBtn button {
            width: 60px;
            height: 30px;
            border: 1px solid #6d6d6d5d;
            background: rgba(255, 255, 255, 0.24);
            outline: none;
        }
        #sendBtn button:hover {
            background: #6d6d6d5d;
            color: white;
        }
    </style>
</head>
<body>



    <div id="addPerson">
        <h4>사람추가</h4>
        <p>gmail.com의 누군가가 누락되었습니까?</p>
        <p>해당 사용자의 이메일을 아래에 추가하십시요.</p>
        <p>- 권한이 허용되면 추가하겠습니다. 그렇지 않으면 담당자가
            해당 관리자에게 요청을 보내겠습니다.</p>
        
        <div id="emailInsert"><input type="text" placeholder="이메일 주소 추가"></div>
        <div id="emailInsert"><input type="text" placeholder="이메일 주소 추가"></div>
        <div id="emailInsert"><input type="text" placeholder="이메일 주소 추가"></div>

        <div id="addInvite">
            + 초대추가
        </div>

        <div id="sendBtn">
            <button>보내기</button>
            <button>취소</button>
        </div>
    </div>
    

</body>
</html>