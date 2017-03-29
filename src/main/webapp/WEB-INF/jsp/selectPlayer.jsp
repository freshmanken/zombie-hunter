
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
		$('#play').click(clickOnSubmitbutton);
		
        function clickOnSubmitbutton(){
        	//debugger;
        	var buttonId=this.id;
        	var buttons = document.getElementsByTagName('input');
        	var value;
        	var selected =false;
        	var count = 0;
        
        	var humanIds =new Array();
        	for (var i = 0; i < buttons.length; i++) {
        	    if (buttons[i].type === 'button' && buttons[i].value=== 'target') {
        	    	selected=true;
        	    	count ++;
        	        if(buttonId==='submit'){
        	        	var zombieId=buttons[i].id;	
        	        	var species=buttons[i].getAttribute("data-species");
        	        }else if(buttonId==='play'){
        	        	
        	        	$( document ).ready(function() {
        	        	humanIds.push(buttons[i].id);
        	        	});
        	        }
        	        
        	        if(buttonId==='submit'){
        	        	
        	        	if(count > 1 && getAllUrlParams(window.location.href).step==="1"){
        	        		//debugger;
        	        		alert("only one zombie can be selected")
            	        	window.location.replace('/Zombie/players/selectPlayer?step===1');
            	        }else if(count===1 && getAllUrlParams(window.location.href).step==="1"){
            	        	//debugger;
            	        	window.location.replace('/Zombie/players/selectPlayer?passId='+zombieId+'&step=2'+'&species='+species+'&username='+'${username}');	
            	        }
        	        }
        	        
        	       
        	        
        	        if(buttonId==='play'){
        	        	if(getAllUrlParams(window.location.href).passid!=undefined && getAllUrlParams(window.location.href).passid!=""){
             	    	   if(count > 3 && getAllUrlParams(window.location.href).step==="2"){
             	    		  //debugger;
                	        	alert("only three human can be selected")
                	        	window.location.replace('/Zombie/players/selectPlayer?species=hu');	
                	        }else if(count <= 3 && getAllUrlParams(window.location.href).step==="2"){
                	        	//debugger;
                	        	window.location.replace('/Zombie/players/map?passId='+getAllUrlParams(window.location.href).passid+'&humanIds='+humanIds)
                	        	
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
	function getAllUrlParams(url) {
			
		  // get query string from url (optional) or window
		  var queryString = url ? url.split('?')[1] : window.location.search.slice(1);

		  // we'll store the parameters here
		  var obj = {};

		  // if query string exists
		  if (queryString) {

		    // stuff after # is not part of query string, so get rid of it
		    queryString = queryString.split('#')[0];

		    // split our query string into its component parts
		    var arr = queryString.split('&');

		    for (var i=0; i<arr.length; i++) {
		      // separate the keys and the values
		      var a = arr[i].split('=');

		      // in case params look like: list[]=thing1&list[]=thing2
		      var paramNum = undefined;
		      var paramName = a[0].replace(/\[\d*\]/, function(v) {
		        paramNum = v.slice(1,-1);
		        return '';
		      });

		      // set parameter value (use 'true' if empty)
		      var paramValue = typeof(a[1])==='undefined' ? true : a[1];

		      // (optional) keep case consistent
		      paramName = paramName.toLowerCase();
		      paramValue = paramValue.toLowerCase();

		      // if parameter name already exists
		      if (obj[paramName]) {
		        // convert value to array (if still string)
		        if (typeof obj[paramName] === 'string') {
		          obj[paramName] = [obj[paramName]];
		        }
		        // if no array index number specified...
		        if (typeof paramNum === 'undefined') {
		          // put the value on the end of the array
		          obj[paramName].push(paramValue);
		        }
		        // if array index number specified...
		        else {
		          // put the value at that index number
		          obj[paramName][paramNum] = paramValue;
		        }
		      }
		      // if param name doesn't exist yet, set it
		      else {
		        obj[paramName] = paramValue;
		      }
		    }
		  }

		  return obj;
		}
    $( document ).ready(function() {
	
	if(getAllUrlParams(window.location.href).species=='hu'){
		document.getElementById('submit').style.display='none'
		document.getElementById('play').style.display='block'
	}
	else if (getAllUrlParams(window.location.href).species=='zo'){
		document.getElementById('play').style.display='none'
		document.getElementById('submit').style.display='block'
	}         });
	
</script>
</head>

<body>

<form action="/Zombie/players/saveEdge">
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
		<input id="submit" type="button" value="Select Humans"
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