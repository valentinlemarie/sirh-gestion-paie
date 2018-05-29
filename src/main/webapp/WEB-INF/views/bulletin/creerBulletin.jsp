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
				<li class="nav-item  "><a class="nav-link" href="<c:url value='../employes/lister'/>">Employés
						
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="<c:url value='../bulletin/lister'/>">Bulletins</a>
				</li>

			</ul>
		</div>
	</nav>

	<h1>Ajouter un Bulletin</h1>



	<div class="container">
		<form:form modelAttribute="bulletin"  class="needs-validation" method="post">


			<div class="form-group row">
				<label for="validationTooltip01" class="col-sm-2 col-form-label">Période</label>
				<div class="col-sm-4">
					<form:select path="periode.id" class="form-control" items="${periodeList}" itemValue="id"></form:select>
				</div>
			</div>
			<div class="form-group row">
				<label for="validationTooltip02" class="col-sm-2 col-form-label">Matricule</label>
				<div class="col-sm-4">
					<form:select path="remunerationEmploye.id" class="form-control" items="${remuneration}" itemLabel="matricule" itemValue="id"></form:select>
				</div>
			</div>


			<div class="form-group row">
				<label for="validationTooltip03" class="col-sm-2 col-form-label">Prime Exeptionnelle</label>
				<div class="col-sm-4">
					<form:input class="form-control" path="primeExceptionnelle"  ></form:input>
				</div>
			</div>
			
			<input class="btn btn-primary" value="Ajouter " type="submit"> </input>
		</form:form>
</body>
</html>