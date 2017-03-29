
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

</script>
<style>
<%@ include file ="style.css"%>
</style>
</head>
<body>
	<nav>
		<ul id="menu">
			<li><a href="javascript:redirectToHome();">HOME</a></li>
			<li><a href="<c:url value="/players/map" />">map</a></li>
			<li><a href="<c:url value="/players/selectPlayer?username=${username}&step=1&species=unknown"/>">Play</a></li>
			<li style="float:right"><a href="<c:url value="/logout" />">log out</a></li>
			<li id="username" style="float:right"><sec:authentication property="principal.username" var="username"/>Hi, ${username}</li>
			
		</ul>
	</nav>
</body>
</html>