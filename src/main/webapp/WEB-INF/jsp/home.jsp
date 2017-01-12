<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file = "header.jsp" %>
<title>Players</title>

<script type="text/javascript">

$(function(){
	$("#dialogAddPlayer").dialog({
		autoOpen: false,
		width:800
	});
	$('.table').DataTable();
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

<!-- CSS style setting -->
<style type=text/css>
*{
	font-family:Arial;
}
body{
	margin:0;
	padding:0;
	font-size:15px;
}
nav{
	background-color:black;
	margin:0;
	overflow:hidden;
}
nav ul{
	margin:0;
	padding:0;
	background-color:black;
}
nav ul li{
	display:inline-block;
	list-style-type:none;
}
nav>ul>li>a{
	color:#aaa;
	display:block;
	line-height:2em;
	padding:0.5em 0.5em;
	text-decoration:none;
}
nav li:hover{
	background-color:grey;
}
h1,h2{
	text-align:center;
}



</head>
</style>

<body>
<h1>Welcome to algorithm zombies!</h1>
<h2>Player info</h2>
<table class="table table-striped">
	<thead class="thead-inverse">
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