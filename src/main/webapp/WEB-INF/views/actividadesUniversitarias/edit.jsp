<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Actividades Universitarias | Edit</title>
<meta charset="UTF-8">
<spring:url value="/resources/css/itslv.css" var="itslvCSS" />
<spring:url value="/resources/bower_components/jquery-ui/themes/blitzer/jquery-ui.min.css" var="jqueryUICSS" />
<spring:url value="/resources/bower_components/jquery/dist/jquery.min.js" var="jquery" />
<spring:url value="/resources/bower_components/jquery-ui/jquery-ui.min.js" var="jqueryUI" />
<spring:url value="/resources/bower_components/jquery-ui/ui/i18n/datepicker-es.js" var="i18n" />
<link href="${jqueryUICSS}" rel="stylesheet" />
<script src="${jquery}"></script>
<script src="${jqueryUI}"></script>
<script src="${i18n}"></script>
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
				<td><form:input path="nombre" size="100" maxlength="100" /></td>
			</tr>
			<tr>
				<td><form:label path="texto_previo">
						<spring:message text="Texto previo" />
					</form:label></td>
				<td><form:textarea path="texto_previo" cols="100" rows="7" /></td>
			</tr>
			<tr>
				<td><form:label path="texto_completo">
						<spring:message text="Texto completo" />
					</form:label></td>
				<td><form:textarea path="texto_completo" cols="100" rows="25" /></td>
			</tr>
			<tr>
				<td><form:label path="img">
						<spring:message text="URL Imagen" />
					</form:label></td>
				<td><form:input path="img" size="25" maxlength="50" /></td>
			</tr>
			<tr>
				<td><form:label path="fecha_realizacion">
						<spring:message text="Fecha de realización" />
					</form:label></td>
				<td><form:input path="fecha_realizacion" cssClass="date-picker" size="10" readonly="true" /></td>
			</tr>
			<tr>
				<td><form:label path="fecha_registro">
						<spring:message text="Fecha de registro" />
					</form:label></td>
				<td><form:hidden path="fecha_registro"
						value="${fecha_registro}" /></td>
			</tr>
			<tr>
				<td><form:label path="fecha_modificacion">
						<spring:message text="Fecha de modificacion" />
					</form:label></td>
				<td><form:hidden path="fecha_modificacion" value="${date}" /></td>
			</tr>
			<tr>
				<td><form:label path="activo">
						<spring:message text="Activo" />
					</form:label></td>

				<td><form:checkbox path="activo" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if
						test="${!empty actividadUniversitaria.nombre}">
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
		<script>
		$(document).ready(function() {

			$(".date-picker").datepicker({
				yearRange : "-0:+10",
				changeMonth : true,
				changeYear : true,
				dateFormat : 'yy-mm-dd'
			});
			
			//$(".date-picker").datepicker('setDate', new Date());

		});
	</script>
</body>
</html>