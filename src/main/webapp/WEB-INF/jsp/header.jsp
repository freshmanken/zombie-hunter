
<html>
<head lang="en">

<!-- Spring Security tag -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- bootstrap CSS & js-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/css/bootstrap.min.css">


<!-- meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- jQuery -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
	integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
	
<meta charset="UTF-8">
<title>Player Information</title>
<script type="text/javascript">

function redirectToHome (){
	window.location.href = "/Zombie/players/home";
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
		if(getAllUrlParams(window.location.href).species!=undefined && getAllUrlParams(window.location.href).species!='unknown' ){
		if(getAllUrlParams(window.location.href).species=='zo'){
		document.getElementById('menu').innerHTML='<li><a href="<c:url value="/players/map" />">map</a></li><li><a href="<c:url value="/players/selectPlayer?username=${username}&step=1&species=unknown"/>">Play</a></li><li style="float:right"><a href="<c:url value="/logout" />">log out</a></li><li style="float:right"><img id="zombieicon" src="<c:url value="/resources/images/252165.svg"/>"/></li><li id="username" style="float:right"><sec:authentication property="principal.username" var="username"/><a href="javascript:redirectToHome();">Hi, ${username}</a></li>';
		}else if(getAllUrlParams(window.location.href).species=='hu'){
		document.getElementById('menu').innerHTML='<li><a href="<c:url value="/players/map" />">map</a></li><li><a href="<c:url value="/players/selectPlayer?username=${username}&step=1&species=unknown"/>">Play</a></li><li style="float:right"><a href="<c:url value="/logout" />">log out</a></li><li style="float:right"><img id="zombieicon" src="<c:url value="/resources/images/hairstyle.svg"/>"/></li><li id="username" style="float:right"><sec:authentication property="principal.username" var="username"/><a href="javascript:redirectToHome();">Hi, ${username}</a></li>';
		}
		
		}
});
</script>
<style>
<%@ include file ="style.css"%>
</style>
</head>
<body>
	<nav>
		<ul id="menu">
			<li><a href="<c:url value="/players/map" />">map</a></li>
			<li><a href="<c:url value="/players/selectPlayer?username=${username}&step=1&species=unknown"/>">Play</a></li>
			<li style="float:right"><a href="<c:url value="/logout" />">log out</a></li>
			<li id="username" style="float:right">
				<sec:authentication property="principal.username" var="username"/><a href="javascript:redirectToHome();">Hi, ${username}</a>
			</li>
			
		</ul>
	</nav>
</body>
</html>