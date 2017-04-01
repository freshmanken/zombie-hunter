<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="header.jsp"%>
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
 $("#btnAddPlayer").click(function(){
	 document.getElementById("myForm").action="/Zombie/players/addPlayer";
		$.post({
			/* url:"/Zombie/players/addPlayer", */
			data:{
				'name':$("#newPlayer #name").text()
				/* 'species': $("#newPlayer #species").text(),
				'points': $("#newPlayer #points").text(),
				'locationx': $("#newPlayer #locationx").text(), 
				'locationy': $("#newPlayer #locationy").text(), 
				'createts': $("#newPlayer #createts").text() */
				}
		}).fail(function() {
			//debugger;
			if(document.getElementById('name').value=""){
				//document.getElementById("myForm").action="/Zombie/players/home";
				//location.reload(true);
				//window.location.href = '/Zombie/players/home';
		    	//location.reload(true);
				window.location.replace('/Zombie/players/home');
				alert( "Name already exists, please use another name :)" );
			}
		  })
	}) 
})
</script>
</head>

<body>
<h3 align="middle">welcome to the homepage, ${username}</h3>
	<table class="table table-striped">
		<thead class="thead-inverse">
			<tr>
				<th>name</th>
				<th>species</th>
				<th>points</th>
				<th>locationx</th>
				<th>locationy</th>
				<!-- <th>createts</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${players}" var="player">
				<tr>
					<td><c:out value="${player.name}" /></td>
					<td><c:out value="${player.species}" /></td>
					<td><c:out value="${player.points}" /></td>
					<td><c:out value="${player.locationx}" /></td>
					<td><c:out value="${player.locationy}" /></td>
				<%-- <td><c:out value="${player.createts}" /></td> --%>				
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button id="btnAddPlayerDialog">add player</button>
	<div id="dialogAddPlayer" title="Add a new player">
		<form id="myForm" >
			<table id="newPlayer">
				<thead>
					<tr>
						<th>name</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="name" id="name" /></td>
					</tr>
				</tbody>
			</table>
			<button id="btnAddPlayer" type="submit">submit</button>
		</form>
	</div>
	<button id="btnDeletePlayer">delete player</button>
</body>
<%@include file="footer.jsp"%>
</html>