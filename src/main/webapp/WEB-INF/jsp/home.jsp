<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Players</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script
  src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
  integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js" ></script>
<script type="text/javascript">
$(function(){
	$("#dialogAddPlayer").dialog({
		autoOpen: false,
		width:800
	});
	$('#playerInfo').DataTable();
	$("#btnAddPlayerDialog").click(function(){
		$("#dialogAddPlayer").dialog("open");
	})
	/* $("#btnAddPlayer").click(function(){
		$.post({
			url:"/Zombie/player/addPlayer",
			data:{
				'name':$("#newPlayer #name").text(),
				'species':$("#newPlayer #species").text(),
				'points':$("#newPlayer #points").text(),
				'locationx':$("#newPlayer #locationx").text(),
				'locationy':$("#newPlayer #locationy").text(),
				'createts':$("#newPlayer #createts").text()
			}
		})
	}) */
	
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
<button id="btnAddPlayerDialog">add player</button>
<div id="dialogAddPlayer" title="Add a new player">
	<form action="/Zombie/player/addPlayer">
		<table id="newPlayer">
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
				<tr>
					<td><input type="text" name="name" id="name"/></td>  <td><input type="text" name="species" id="species"/></td>  <td><input type="text" name="points" id="points" /></td>  <td><input type="text" name="locationx" id="locationx" /></td>  <td><input type="text" name="locationy" id="locationy" /></td>  <td><input type="text" name="createts" id="createts" /></td>
				</tr>
			</tbody>
		</table>
		<button id="btnAddPlayer" type="submit">submit</button>
	</form>
</div>
</body>
<%@include file = "footer.jsp" %>
</html>