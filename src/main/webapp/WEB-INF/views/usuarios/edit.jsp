<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Usuario(s) | Edit</title>
<meta charset="UTF-8">
<spring:url value="/resources/itslv/case.css" var="itslvCSS" />
<link href="${itslvCSS}" rel="stylesheet" />
</head>
<body>
	<h1>Edit a Usuario(s)</h1>

	<c:url var="addAction" value="/usuarios/create"></c:url>

	<form:form action="${addAction}" commandName="usuario">
		<table>
			<c:if test="${!empty usuario.nombre_completo}">
				<tr>
					<td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" /></td>
				</tr>
			</c:if>
			<tr>
				<td><form:label path="nombre_completo">
						<spring:message text="Nombre completo" />
					</form:label></td>
				<td><form:input path="nombre_completo" size="50" maxlength="100"/></td>
			</tr>
			<tr>
				<td><form:label path="login">
						<spring:message text="Login" />
					</form:label></td>
				<td><form:input path="login" maxlength="15"/></td>
			</tr>
			<tr>
				<td><form:label path="password">
						<spring:message text="Password" />
					</form:label></td>
				<td><form:password path="password" maxlength="15"/></td>
			</tr>
			<tr>
				<td colspan="2">
				   <form:hidden path="fecha_registro" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
				  <form:hidden path="fecha_modificacion" size="20" value="${date}" readonly="true" />
				</td>
			</tr>
			<tr>
				<td><form:label path="activo">
						<spring:message text="Activo" />
					</form:label></td>

				<td><form:checkbox path="activo" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty usuario.nombre_completo}">
						<input type="submit" value="<spring:message text="Edit Usuario"/>" />
					</c:if> <c:if test="${empty usuario.nombre_completo}">
						<input type="submit" value="<spring:message text="Add Usuario"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<h5>
		<a href="<c:url value='/usuarios' />">Back</a>
	</h5>
</body>
</html>