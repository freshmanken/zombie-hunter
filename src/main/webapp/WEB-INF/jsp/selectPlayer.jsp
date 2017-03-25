
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<title>Select Players</title>
<script type="text/javascript">
	$(function() {
		$("#dialogSelectPlayer").dialog({
			autoOpen : false,
			width : 800
		});
		$('.table').DataTable();
		$('.table').DataTable();
		$('#submit').click(clickOnSubmitbutton);

        function clickOnSubmitbutton(){

        	var radios = document.getElementsByTagName('input');
        	var value;
        	var selected =false;
        	for (var i = 0; i < radios.length; i++) {
        	    if (radios[i].type === 'radio' && radios[i].checked) {
        	    	
        	    	selected=true;
        	        var id=radios[i].id;
        	    }
        	}
        	if(!selected){
    	    	alert("You need to select a Zombie before you proceed!")
    	    	
    	    }

        }
	})
</script>
<style>
<%@ include file ="style.css"%>
</style>
</head>

<body>
	<table class="table table-striped">
		<thead class="thead-inverse">
			<tr>
				<th></th>
				<th>name</th>
				<th>species</th>
				<th>points</th>
				<th>locationx</th>
				<th>locationy</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${players}" var="player">
				<tr>
					<td><c:out value="" /><input id="${player.playerid}"
						type="radio" name="radioButton"></td>
					<td><c:out value="${player.name}" /></td>
					<td><c:out value="${player.species}" /></td>
					<td><c:out value="${player.points}" /></td>
					<td><c:out value="${player.locationx}" /></td>
					<td><c:out value="${player.locationy}" /></td>

				</tr>
			</c:forEach>

		</tbody>
	</table>
	<br />
	<div>
		<input id="submit" type="button" value="Select Humans"
			style="width: 150px; float: right"></input>
	</div>
	<br>
</body>
<%@include file="footer.jsp"%>
</html>