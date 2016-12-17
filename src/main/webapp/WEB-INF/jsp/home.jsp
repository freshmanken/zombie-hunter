<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Players</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js" ></script>
<script type="text/javascript">
$(function(){
	$('#playerInfo').DataTable();
})
</script>
<%@include file = "header.jsp" %>
</head>

<body>
<h1>Players</h1>
	<table id="playerInfo">
		<thead>
			<tr>
				<th>name</th>
				<th>species</th>
				<th>points</th>
				<th>locationx</th>
				<th>locationy</th>
				<th>createts</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${players}" var="player">
				<tr>
					<td><c:out value="${player.name}" /></td>  <td><c:out value="${player.species}" /></td>  <td><c:out value="${player.points}" /></td>  <td><c:out value="${player.locationx}" /></td>  <td><c:out value="${player.locationy}" /></td>  <td><c:out value="${player.createts}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<%@include file = "footer.jsp" %>
</html>