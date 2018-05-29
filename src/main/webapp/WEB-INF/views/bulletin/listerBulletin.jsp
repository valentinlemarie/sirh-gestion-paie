<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bulletin</title>
<script src="<c:url value='bootstrap/js/bootstrap.js'  />" ></script>
<link href="<c:url value='/bootstrap/css/bootstrap.css' />"   rel="stylesheet" media="screen">
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
				<li class="nav-item active"><a class="nav-link" href="<c:url value='/mvc/bulletin/lister'/>">Bulletins</a>
				</li>

			</ul>
		</div>
	</nav>

	<h1>Ajouter un Bulletin</h1>
	<div class="text-right">
     	 <a href=creer class=" btn btn-info">Ajouter un nouveau Bulletin</a>
    </div>
	<h1>List des employés</h1>

	<table class="table">
		<tr>
			<th>Date/heure création</th>
			<th>Période </th>
			<th>Matricule</th>
			<th>Salaire Brut</th>
			<th>Net Impossable</th>
			<th>Net a Payer</th>
			<th>Actions</th>
		</tr>
		<c:forEach items="${calcul}" var="col" >
			<td> <c:out value="${col.key.dateCreation}"></c:out> </td>
			<td> <c:out value="${col.key.periode}" ></c:out> </td>
			<td> <c:out value="${col.key.remunerationEmploye.matricule}"></c:out></td>
			<td> <c:out value="${col.value.salaireBrut}"></c:out></td>
			<td> <c:out value="${col.value.netImposable}"></c:out> </td>
			<td><c:out value="${col.value.netAPayer}"></c:out></td>
			<td> <a href="<c:url value='/mvc/bulletin/lister/${col.key.id }'></c:url>" >visualiser</a> </td>
		</c:forEach>
	
	</table>

	
</body>
</html>