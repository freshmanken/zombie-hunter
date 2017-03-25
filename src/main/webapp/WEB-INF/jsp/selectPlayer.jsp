
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
        	var count = 0;
        	for (var i = 0; i < radios.length; i++) {
        	    if (radios[i].type === 'button' && radios[i].value=== 'target') {
        	    	selected=true;
        	    	count ++;
        	        var id=radios[i].id;
        	        if(count > 1 && getAllUrlParams(window.location.href).species=="zo"){
        	        	alert("only one zombie can be selected")
        	        	window.location.replace('/Zombie/players/selectPlayer?species=zo');
        	        }else if(count==1 && getAllUrlParams(window.location.href).species=="zo"){
        	        	
        	        	window.location.replace('/Zombie/players/selectPlayer?species=hu');	
        	        }
        	        
        	       if(count > 3 && getAllUrlParams(window.location.href).species=="hu"){
        	        	alert("only three human can be selected")
        	        	window.location.replace('/Zombie/players/selectPlayer?species=hu');	
        	        }else if(count == 3 && getAllUrlParams(window.location.href).species=="hu"){
        	        	window.location.replace('/Zombie/players/map')
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
		document.getElementById('submit').value='Play.'
	}
	else if (getAllUrlParams(window.location.href).species=='hu'){
		document.getElementById('submit').value='Select Humans.'
	}         });
	
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
					<td><c:out value="" /><input onclick="return change(this)" id="${player.playerid}"
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
	<br>
</body>
<%@include file="footer.jsp"%>
</html>