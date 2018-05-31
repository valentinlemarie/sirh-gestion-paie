<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accueil</title>
<script src="bootstrap/js/bootstrap.js"></script>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item  "><a class="nav-link" href="<c:url value='/mvc/employes/lister'/>">Employés
						
				</a></li>
				<li class="nav-item "><a class="nav-link" href="<c:url value='/mvc/bulletin/lister'/>">Bulletins</a>
				</li>

			</ul>
		</div>
	</nav>

	<h1>SIRH - Gestion de la paie</h1>
</body>
</html>