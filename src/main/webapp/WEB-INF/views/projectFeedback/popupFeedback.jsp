<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>

        #feedbackArea {
            border: 1px solid black;
            width: 450px;
            height: 500px;
        }
        h4 {
            padding: 10px;
            margin-left: 10px;
        }
        #feedbackArea p {
            font-size: 13px;
            padding-left: 20px;
        }
        input {
            margin-right: 10px;
            margin-left: 10px;
        }
        #question {
            text-align: center;
        }
        #question input {
            width: 400px;
            height: 40px;
        }
        #insertQuestion {
            text-align: center;
        }
        #insertQuestion input {
            width: 400px;
            height: 100px;
            border: 1px solid skyblue;
        }
        mark {
            background: none;
            color: red;
        }
        #checkboxContent {
            margin-left: 10px;
            margin-top: 10px;
        }
        #sendBtn {
            text-align: right;
            margin-right: 20px;
            margin-top: 40px;
        }
        #sendBtn button {
            border: 1px solid #6d6d6d5d;
            background: rgba(255, 255, 255, 0.24);
            outline: none;
        }
        .sendBtn1 {
            width: 90px;
            height: 30px;
        }
        .sendBtn2 {
            width: 50px;
            height: 30px;
        }
        #sendBtn button:hover {
            background: #6d6d6d5d;
            color: white;
        }

    </style>
</head>
<body>


    <div id="feedbackArea">
        <h4>의견을 공유해 주세요.</h4>
        <p>관심사항..</p>
        <div id="question"><input type="text" placeholder="질문하기"></div>
        <br>
        <p>무엇을 도와드릴까요? <mark>*</mark></p>
            <div id="insertQuestion"><input type="text"></div>

            <div id="checkboxContent"><input type="checkbox">
            <label>이 피드백에 대해 저에게 연락해도 좋습니다.</label></div>
            <div id="checkboxContent"><input type="checkbox">
            <label>제품조사에 참여하고자 합니다.</label></div>

            <div id="sendBtn">
                <button class="sendBtn1">피드백 전송</button>
                <button class="sendBtn2">취소</button>
            </div>

    </div>
    

</body>
</html>