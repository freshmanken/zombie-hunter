
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
		$('#submitbtn').click(clickOnSubmitbutton);
		$('#play').click(clickOnSubmitbutton);
		
        function clickOnSubmitbutton(){
        	
        	var buttonId=this.id;
        	var buttons = document.getElementsByTagName('input');
        	var value;
        	var selected =false;
        	var count = 0;
        
        	var humanIds =new Array();
        	for (var i = 0; i < buttons.length; i++) {
        	    if (buttons[i].type === 'button' && buttons[i].value=== 'target') {
        	    	var species=buttons[i].getAttribute("data-species");
        	    	selected=true;
        	    	count ++;
        	        if(buttonId==='submitbtn'){
        	        	var zombieId=buttons[i].id;	
        	        	
        	        }else if(buttonId==='play'){
        	        	
        	        	$( document ).ready(function() {
        	        	humanIds.push(buttons[i].id);
        	        	});
        	        }
        	        
        	        if(buttonId==='submitbtn'){
        	        	
        	        	if(count > 1 && getAllUrlParams(window.location.href).step==="1"){
        	        		
        	        		alert("only one zombie can be selected")
        	        		
        	        		if(getAllUrlParams(window.location.href).species==='hu'){
            	        		species='hu'
            	        	}else if(getAllUrlParams(window.location.href).species==='zo'){
            	        		species='zo'
            	        	}
        	        		
            	        	window.location.replace('/Zombie/players/selectPlayer?step=1'+'&species=unknown'+'&username='+'${username}');
            	        }else if(count===1 && getAllUrlParams(window.location.href).step==="1"){
            	        	            	        	
            	        	window.location.replace('/Zombie/players/selectPlayer?passId='+zombieId+'&step=2'+'&species='+species+'&username='+'${username}');	
            	        }
        	        }
        	        
        	       
        	        
        	        if(buttonId==='play'){
        	        	if(getAllUrlParams(window.location.href).passid!=undefined && getAllUrlParams(window.location.href).passid!=""){
             	    	   if(count > 3 && getAllUrlParams(window.location.href).step==="2"){
             	    		 
                	        	alert("only three human can be selected")
                	        	if(getAllUrlParams(window.location.href).species==='hu'){
                	        		species='hu'
                	        	}else if(getAllUrlParams(window.location.href).species==='zo'){
                	        		species='zo'
                	        	}
                	        	
                	        	window.location.replace('/Zombie/players/selectPlayer?species='+species+'&username='+'${username}'+'&step=2');	
                	        }else if(count <= 3 && getAllUrlParams(window.location.href).step==="2"){
                	        	window.location.replace('/Zombie/players/saveEdge?passId='+getAllUrlParams(window.location.href).passid+'&humanIds='+humanIds)
                	        	
                	        }
             	       }
        	        }
        	       
        	       
        	        
        	    }
        	}
        	if(!selected){
    	    	alert("You need to select a Zombie before you proceed!")
    	    	
    	    }

        }
	})
	     
        function change(element){
		if(element.value=="untarget"){
			element.value="target"
		}
		else{
			element.value="untarget"
		}
	}
	
    $( document ).ready(function() {
	
	if(getAllUrlParams(window.location.href).step=='2'){
		document.getElementById('submitbtn').style.display='none'
		document.getElementById('play').style.display='block'
	}
	else if (getAllUrlParams(window.location.href).step=='1'){
		document.getElementById('play').style.display='none'
		document.getElementById('submitbtn').style.display='block'
	}         });
	
</script>
</head>

<body>
<h2> Please select the character you want to play</h2>
<form id="form_id">
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
					<td><c:out value="" /><input onclick="return change(this)" id="${player.playerid}" data-species="${player.species}"
						type="button" value="untarget"></td>
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
		<input id="submitbtn" type="button" value="Select Rival"
			style="width: 150px; float: right"></input>
	</div>
	<div>
		<input id="play" type="button" value="Play."
			style="width: 150px; float: right"></input>
	</div>
	<br>
</form>
	
	
</body>
<%@include file="footer.jsp"%>
</html>