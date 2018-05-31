<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- intégration des tags Spring Security -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>...</head>
    <body class="container">        
        ...
        <form method="post">
            <input name="username">
            <input name="password">
            <input type="submit" value="Se connecter">

            <!-- génération du Token CSRF -->
            <sec:csrfInput/>
        </form>
        ...
    </body>
</html>