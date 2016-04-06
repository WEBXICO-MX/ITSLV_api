<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Materias | Create</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h1>Add a Materia</h1>

	<c:url var="addAction" value="/materias/create"></c:url>

	<form:form action="${addAction}" commandName="materia">
		<table>
			<c:if test="${!empty materia.nombre}">
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
				<td><form:input path="nombre" size="35" maxlength="50" /></td>
			</tr>
			<tr>
				<td><form:label path="grado">
						<spring:message text="Grado" />
					</form:label></td>
				<td><form:input path="grado" size="5" maxlength="2" /></td>
			</tr>
			<tr>
				<td><form:label path="carrera_id">
						<spring:message text="Carrera" />
					</form:label></td>
				<td><form:select path="carrera_id.id">
						<option value="-1">----- SELECCIONE UNA OPCIÓN -----</option>
						<c:forEach items="${listCarrera}" var="carrera">
							<option value="${carrera.id}">${carrera.nombre}</option>
						</c:forEach>
					</form:select></td>
			</tr>
			<tr>
				<td><form:label path="fecha_registro">
						<spring:message text="Fecha de registro" />
					</form:label></td>
				<td><form:hidden path="fecha_registro" value="${date}"/></td>
			</tr>
			<!-- <tr>
				<td><form:label path="fecha_modificacion">
						<spring:message text="Fecha de modificacion" />
					</form:label></td>
				<td><form:input path="fecha_modificacion" type="date" /></td>
			</tr>-->
			<tr>
				<td><form:label path="activo">
						<spring:message text="Activo" />
					</form:label></td>

				<td><form:checkbox path="activo" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty materia.nombre}">
						<input type="submit" value="<spring:message text="Edit"/>" />
					</c:if> <c:if test="${empty materia.nombre}">
						<input type="submit" value="<spring:message text="Add"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<h5>
		<a href="<c:url value='/materias' />">Back</a>
	</h5>
</body>
</html>