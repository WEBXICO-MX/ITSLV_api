<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Spring MVC 4 & Hibernate 5 | ITSLV</title>
</head>
<body>
<h1>
	Spring MVC 4 & Hibernate 5 | ITSLV
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="<c:url value='/actividadesuniversitarias' />">Actividades Universitarias</a><br/>
<a href="<c:url value='/usuarios' />">Usuarios</a><br/>
<a href="<c:url value='/servicios' />">Servicios</a><br/>
<a href="<c:url value='/areas' />">Áreas</a><br/>
<a href="<c:url value='/contactos' />">Contactos</a><br/>
<a href="<c:url value='/divisiones' />">Divisiones</a><br/>
<a href="<c:url value='/carreras' />">Carreras</a><br/>
<a href="<c:url value='/materias' />">Materias</a><br/>
<a href="<c:url value='/directorios' />">Directorio</a><br/>
</body>
</html>
