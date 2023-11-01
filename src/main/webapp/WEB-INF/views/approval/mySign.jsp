<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>서명관리</h1>
    <div id="signImage"></div>
    <div>
        <form action="signUpload" method="post" enctype="multipart/form-data">
            <input type="file" name="signImage">

            <input type="submit" value="업로드">
        </form>
    </div>
</body>
</html>