<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<style>
<%@include file="style.css"%>
</style>
<title>DC Map</title>
</head>
<body>
	<iframe width="425" height="350" frameborder="0" scrolling="no"
		marginheight="0" marginwidth="0"
		src="http://www.openstreetmap.org/export/embed.html?bbox=-77.07372665405273%2C38.87700226930782%2C-76.98532104492189%2C38.91708222394378&amp;layer=mapnik"
		style="border: 1px solid black"></iframe>
	<br />
	<small> <a
		href="http://www.openstreetmap.org/#map=14/38.8970/-77.0295">View
			Larger Map</a>
	</small>
</body>
<%@include file="footer.jsp"%>
</html>