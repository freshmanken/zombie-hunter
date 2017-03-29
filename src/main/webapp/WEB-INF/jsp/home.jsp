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
	 var species = Array("hu","zo");
	 var specie = species[Math.floor(Math.random()*species.length)];
	 var xaxis = Array(-77.07, -76.98);
	 var yaxis = Array(38.87, 38.91);
	 var locationx = Math.random()*(xaxis[2] - xaxis[1]) + xaxis[1];
	 var locationy = Math.random()*(yaxis[2] - yaxis[1]) + yaxis[1];

	 document.getElementById("myForm").action="/Zombie/players/addPlayer";
		$.post({
			url:"/Zombie/players/addPlayer",
			data:{
				'name':$("#newPlayer #name").text(),
				'species':specie,			/* $("#newPlayer #species").text(), */
				'points':0,					/* $("#newPlayer #points").text() */
				'locationx':locationx,		/* $("#newPlayer #locationx").text(), */
				'locationy':locationy,		/* $("#newPlayer #locationy").text() */
				
				'createts':$("#newPlayer #createts").text()
				}
		}).fail(function() {
			//debugger;
			if(document.getElementById('createts').value==""){
				
				//document.getElementById("myForm").action="/Zombie/players/home";
				//location.reload(true);
				//window.location.href = '/Zombie/players/home';
		    	//location.reload(true);
				window.location.replace('/Zombie/players/home');
				alert( "Could not add the Player. Please contact the administrator." );
				
			}
			
			
		  })
	}) 
	
})
</script>
</head>

<body>
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
						<th>createts</th>
						
						<!-- <th>species</th>
						<th>points</th>
						<th>locationx</th>
						<th>locationy</th> -->
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="name" id="name" /></td>
						<!-- <td><input type="text" name="species" id="species" /></td>
						<td><input type="text" name="points" id="points" /></td>
						<td><input type="text" name="locationx" id="locationx" /></td>
						<td><input type="text" name="locationy" id="locationy" /></td> -->
						<td><input type="text" name="createts" id="createts" /></td>
					</tr>
				</tbody>
			</table>
			<button id="btnAddPlayer" type="submit">submit</button>
		</form>
	</div>
</body>
<%@include file="footer.jsp"%>
</html>