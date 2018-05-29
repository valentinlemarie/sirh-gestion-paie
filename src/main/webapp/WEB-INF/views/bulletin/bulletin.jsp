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

	<h1>Bulletin de Salaire</h1>
	<div class="text-right">
     	 <a href=creer class=" btn btn-info">Retour</a>
    </div>
	<h2>Periode</h2>
	<p> ${bulletinFiche.periode}</p>
	
	<h2>Entreprise</h2>
	<p> ${ bulletinFiche.remunerationEmploye.entreprise} <br> Siret :${ bulletinFiche.remunerationEmploye.entreprise.siret}</p>
	
	<h2>Matricule</h2>
	<p> ${ bulletinFiche.remunerationEmploye.matricule}</p>
	
	<h2>Salaire</h2>
	<table class="table">
		<tr>
			<th>Rubriques</th>
			<th>Base</th>
			<th>Taux Salarial</th>
			<th>Montant Salarial</th>
			<th>Taux Patronal</th>
			<th>Cot patronales/th>
		</tr>
		<tr>
			<td> Salaire de Base </td>
			<td>${bulletinFiche.remunerationEmploye.grade.nbHeuresBase}</td>
			<td>${bulletinFiche.remunerationEmploye.grade.tauxBase}</td>
			<td>${paye}</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td> Prime Except.</td>
			<td></td>
			<td></td>
			<td>${bulletinFiche.primeExceptionnelle}</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td> Total Retenue</td>
			<td></td>
			<td></td>
			<td>${base}</td>
			<td></td>
			<td></td>
		</tr>
	
	
	</table>
	<h2>Cotisations</h2>
	<table class="table">
		<tr>
			<th>Rubriques</th>
			<th>Base</th>
			<th>Taux Salarial</th>
			<th>Montant Salarial</th>
			<th>Taux Patronal</th>
			<th>Cot patronales/th>
		</tr>
		<c:forEach items="${cotisationNonImpo}" var="col" >
		<tr>
			<td> <c:out value="${col}"></c:out> </td>
			<td> <c:out value="${base}" ></c:out> </td>
			<td> <c:out value="${col.tauxSalarial}"></c:out></td>
			<td> <c:out value="${col.tauxSalarial.multiply(base)}"></c:out></td>
			<td> <c:out value="${col.tauxPatronal}"></c:out> </td>
			<td><c:out value="${col.tauxPatronal.multiply(base)}"></c:out></td>
		</tr>			
		</c:forEach>
		<tr>
			<td>Total Retenue</td>
			<td></td>
			<td></td>
			<td>${calcul.totalRetenueSalarial }</td>
			<td></td>
			<td>${calcul.totalCotisationsPatronales }</td>
		</tr>
		
		
	</table>
	<h2>Net Impossable :${calcul.netImposable } </h2>
		<table class="table">
		<tr>
			<th>Rubriques</th>
			<th>Base</th>
			<th>Taux Salarial</th>
			<th>Montant Salarial</th>
			<th>Taux Patronal</th>
			<th>Cot patronales/th>
		</tr>
		<c:forEach items="${cotisationImpo}" var="col" >
		<tr>
			<td> <c:out value="${col}"></c:out> </td>
			<td> <c:out value="${base}" ></c:out> </td>
			<td> <c:out value="${col.tauxSalarial}"></c:out></td>
			<td> <c:out value="${col.tauxSalarial.multiply(base)}"></c:out></td>
			<td>  </td>
			<td></td>
		</tr>			
		</c:forEach>
		
		</table>
	<h2>Net a Payer :${calcul.netAPayer }</h2>
	
	
</body>
</html>