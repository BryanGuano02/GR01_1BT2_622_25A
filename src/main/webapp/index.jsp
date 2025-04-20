<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="CoAntent-Type" content="text/html; charset=UTF-8">
        <title>Gestor de Restaurantes</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="container">
            <div class="header">
                <div class="logo">
                    <i class="fas fa-utensils"></i>
                    <span>FoodManager</span>
                </div>
            </div>
            
            <div class="card">
                <h1><i class="fas fa-plus-circle"></i> Registrar Nuevo Restaurante</h1>
                
                <c:if test="${not empty param.error}">
                    <div class="alert alert-error">
                        <i class="fas fa-exclamation-circle"></i> Error: Todos los campos son requeridos!
                    </div>
                </c:if>
                
                <form action="ControllerRestaurante" method="POST">
                    <div class="form-group">
                        <label for="nombre"><i class="fas fa-store"></i> Nombre del restaurante</label>
                        <input type="text" name="nombre" placeholder="Ej: El Buen Sabor" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="descripcion"><i class="fas fa-align-left"></i> Descripción</label>
                        <input type="text" name="descripcion" placeholder="Ej: Restaurante de comida rápida" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="horario"><i class="fas fa-clock"></i> Horario de atención</label>
                        <input type="text" name="horario" placeholder="Ej: Lunes a Domingo de 10:00 a 22:00" required>
                    </div>
                    
                    <button type="submit" class="btn">
                        <i class="fas fa-save"></i> Registrar Restaurante
                    </button>
                </form>
            </div>

            <div class="card">
                <h2><i class="fas fa-list"></i> Lista de Restaurantes</h2>
                <c:choose>
                    <c:when test="${empty restaurantes}">
                        <div class="empty-state">
                            <i class="fas fa-store-slash"></i>
                            <h3>No hay restaurantes registrados</h3>
                            <p>Comienza agregando tu primer restaurante usando el formulario superior</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Horario</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${restaurantes}" var="r">
            <tr>
                <td>${r.id}</td>
                <td><strong>${r.nombre}</strong></td>
                <td>${r.descripcion}</td>
                <td>${r.horarioAtencion}</td>
                <td class="actions">
                    <a href="ControllerRestaurante?action=edit&id=${r.id}" class="btn-action btn-edit">
                        <i class="fas fa-edit"></i>
                    </a>
                    <a href="ControllerRestaurante?action=delete&id=${r.id}" class="btn-action btn-delete">
                        <i class="fas fa-trash-alt"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>
</html>