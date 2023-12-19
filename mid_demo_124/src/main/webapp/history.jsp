<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
  <title>Prime Checker History</title>
</head>
<body>
<h1>Prime Checker History</h1>

<h2>All Results:</h2>
<table border="1">
  <thead>
  <tr>
    <th>Number</th>
    <th>Result</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${primesHistory}" var="prime">
    <tr>
      <td>${prime.number}</td>
      <td>${prime.message}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<h2>Summary:</h2>
<p>Total Checks: <c:out value="${primesHistory.size()}"/></p>
<%--เซ็ตค่าเริ่มต้น--%>
<c:set var="primeCount" value="${0}"/>
<c:set var="nonPrimeCount" value="${0}"/>
<%--loop--%>
<c:forEach items="${primesHistory}" var="prime">
<%--เงื่อนไขที่ใช้ในการloop--%>
  <c:if test="${prime.prime}">
    <c:set var="primeCount" value="${primeCount + 1}"/>
  </c:if>
  <c:if test="${!prime.prime}">
    <c:set var="nonPrimeCount" value="${nonPrimeCount + 1}"/>
  </c:if>
</c:forEach>
<%--แสดงค่าที่ถูกตั้งค่าเริ่มต้นเอาไว้--%>
<p>Prime Numbers: <c:out value="${primeCount}"/></p>
<p>Non-Prime Numbers: <c:out value="${nonPrimeCount}"/></p>

</body>
</html>
