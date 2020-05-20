<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
    <section id="writeForm">
        <h2>게시판글등록</h2>
        <form action="Review_WritePro.re" method="post">
            <table>
                <tr>
                    <td>제 목</td>
                    <td><input type="text" name="subject" /></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea name="content" cols="40" rows="15" style="resize: none;"></textarea></td>
                </tr>
            </table>
                <input type="submit" value="등록">
                <input type="reset" value="다시쓰기" />
        </form>
    </section>

</body>
</html>