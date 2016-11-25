<!DOCTYPE html>
<html>
<head><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Players</title>
</head>
<body>
<table>
<c:forTokens items="${players}" var="player">
<tr>
<c:out value="${player.name}"/>
</tr>
</c:forTokens>
<c:foreach
</table>
</body>
</html>