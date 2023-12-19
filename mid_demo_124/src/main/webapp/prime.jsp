<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: perpasit
  Date: 16/12/2566
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Prime</title>
</head>
<body>
    <h1>Midterm Exam Web App by Pasit 65130500124</h1>
<c:forEach items="${applicationScope.users}" var="user"> <%--loop เพื่อแสดงผลของarray "users" และแทนแต่ละตัวด้วย"user"--%>
    <tr>
        <h2>Welcome ${user.name} ${user.email}</h2>
    </tr>
</c:forEach>
    <hr>
    <h1>Primer Checker ::</h1>
    <hr>
<form action="is_prime" method="post">
    <input type="hidden" name="action" value="number-check"/>
    <label>Enter number to check: </label>
    <input type="text" name="number">
    <br>
    <button type="submit">
        Submit
    </button>
</form>
<hr>
<c:forEach items="${applicationScope.primes}" var="prime">
    <tr>
        <h2>${prime.number} ${prime.message}</h2>
    </tr>
</c:forEach>
</body>
</html>
