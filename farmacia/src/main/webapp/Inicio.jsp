<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.empleado}">
	<jsp:forward page="/Login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- Librería Bootstrap v5.3.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<title>Inicio | FarmaPlus</title>
<link rel="icon" type="image/x-icon" href="img/logo-icon.ico">
</head>
<body>
	<div class="container">
		<%@ include file="componentes/menu.jsp" %>
	</div>
</body>
</html>