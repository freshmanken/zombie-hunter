<!DOCTYPE html>
<html>
<head><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<title>Players</title>
</head>
<body>
<h1>Players</h1>
	<table>
		<c:forEach items="${players}" var="player">
			<tr><td><c:out value="${player.name}" /></td></tr>
		</c:forEach>
	</table>
</body>
</html>