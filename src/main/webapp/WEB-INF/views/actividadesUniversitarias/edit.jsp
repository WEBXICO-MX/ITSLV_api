<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Actividades Universitarias | Edit</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h1>Edit a Actividad Universitaria</h1>

	<c:url var="addAction" value="/actividadesuniversitarias/create"></c:url>

	<form:form action="${addAction}" commandName="actividadUniversitaria">
		<table>
			<c:if test="${!empty actividadUniversitaria.nombre}">
				<tr>
					<td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" /></td>
				</tr>
			</c:if>
			<tr>
				<td><form:label path="nombre">
						<spring:message text="Nombre" />
					</form:label></td>
				<td><form:input path="nombre" /></td>
			</tr>
			<tr>
				<td><form:label path="texto_previo">
						<spring:message text="Texto previo" />
					</form:label></td>
				<td><form:input path="texto_previo" /></td>
			</tr>
			<tr>
				<td><form:label path="texto_completo">
						<spring:message text="Texto completo" />
					</form:label></td>
				<td><form:input path="texto_completo" /></td>
			</tr>
			<tr>
				<td><form:label path="img">
						<spring:message text="URL Imagen" />
					</form:label></td>
				<td><form:input path="img" /></td>
			</tr>
			<tr>
				<td><form:label path="link">
						<spring:message text="Link" />
					</form:label></td>
				<td><form:input path="link" /></td>
			</tr>
			<tr>
				<td><form:label path="fecha_registro">
						<spring:message text="Fecha de registro" />
					</form:label></td>
				<td><form:input path="fecha_registro"  type="date"/></td>
			</tr>
			<tr>
				<td><form:label path="fecha_realizacion">
						<spring:message text="Fecha de realización" />
					</form:label></td>
				<td><form:input path="fecha_realizacion" type="date"/></td>
			</tr>
			<tr>
				<td><form:label path="fecha_modificacion">
						<spring:message text="Fecha de modificacion" />
					</form:label></td>
				<td><form:input path="fecha_modificacion" type="date"/></td>
			</tr>
			<tr>
				<td><form:label path="activo">
						<spring:message text="Activo" />
					</form:label></td>

				<td><form:checkbox path="activo" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty actividadUniversitaria.nombre}">
						<input type="submit"
							value="<spring:message text="Edit Actividad Universitaria"/>" />
					</c:if> <c:if test="${empty actividadUniversitaria.nombre}">
						<input type="submit"
							value="<spring:message text="Add Actividad Universitaria"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<h5>
		<a href="<c:url value='/actividadesuniversitarias' />">Back</a>
	</h5>
</body>
</html>