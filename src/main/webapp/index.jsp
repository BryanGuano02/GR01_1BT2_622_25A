<%-- 
    Document   : index
    Created on : Apr 18, 2025, 12:08:36 PM
    Author     : alejo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registrar Restaurante</h1>
	<form action="ControllerRestaurante" method="POST">
	    <fieldset>
		<legend>Información</legend>
		<label for="nombre">Nombre del restaurante:</label>
		<input type="text" name="nombre" placeholder="Ej: El Buen Sabor">
		<label for="descripcion">Descripción:</label>
		<input type="text" name="descripcion" placeholder="Ej: Restaurante de comida rápida">
		<label for="horario">Horario de atención:</label>
		<input type="text" name="horario" placeholder="Ej: Lunes a Domingo de 10:00 a 22:00">
		<input type="submit" value="Registrar nuevo restaurante">
	</fieldset>
	</form>

	<h2>Lista de Restaurantes</h2>
    </body>
</html>
