<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="CoAntent-Type" content="text/html; charset=UTF-8">
        <title>Gestor de Restaurantes</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #3498db;
                --accent-color: #e74c3c;
                --light-color: #ecf0f1;
                --dark-color: #2c3e50;
                --success-color: #27ae60;
            }
            
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            
            body {
                background-color: #f5f7fa;
                color: var(--dark-color);
                line-height: 1.6;
                padding: 20px;
            }
            
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }
            
            h1, h2 {
                color: var(--primary-color);
                margin-bottom: 20px;
                position: relative;
                padding-bottom: 10px;
            }
            
            h1::after, h2::after {
                content: '';
                position: absolute;
                left: 0;
                bottom: 0;
                width: 50px;
                height: 3px;
                background: var(--secondary-color);
            }
            
            .card {
                background: white;
                border-radius: 8px;
                padding: 25px;
                margin-bottom: 30px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.05);
                border-left: 4px solid var(--secondary-color);
            }
            
            .form-group {
                margin-bottom: 20px;
            }
            
            label {
                display: block;
                margin-bottom: 8px;
                font-weight: 600;
                color: var(--dark-color);
            }
            
            input[type="text"] {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                transition: border 0.3s;
            }
            
            input[type="text"]:focus {
                border-color: var(--secondary-color);
                outline: none;
                box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            }
            
            .btn {
                background-color: var(--secondary-color);
                color: white;
                border: none;
                padding: 12px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                font-weight: 600;
                transition: all 0.3s;
                display: inline-flex;
                align-items: center;
                gap: 8px;
            }
            
            .btn:hover {
                background-color: #2980b9;
                transform: translateY(-2px);
            }
            
            .btn i {
                font-size: 14px;
            }
            
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            }
            
            th, td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            
            th {
                background-color: var(--primary-color);
                color: white;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 14px;
            }
            
            tr:nth-child(even) {
                background-color: #f8f9fa;
            }
            
            tr:hover {
                background-color: #f1f1f1;
            }
            
            .empty-state {
                text-align: center;
                padding: 40px;
                color: #7f8c8d;
            }
            
            .empty-state i {
                font-size: 50px;
                margin-bottom: 20px;
                color: #bdc3c7;
            }
            
            .alert {
                padding: 15px;
                margin-bottom: 20px;
                border-radius: 4px;
                font-weight: 500;
            }
            
            .alert-error {
                background-color: #fdecea;
                color: var(--accent-color);
                border-left: 4px solid var(--accent-color);
            }
            
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
            }
            
            .logo {
                font-size: 24px;
                font-weight: 700;
                color: var(--primary-color);
                display: flex;
                align-items: center;
                gap: 10px;
            }
            
            .logo i {
                color: var(--accent-color);
            }
        </style>
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
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${restaurantes}" var="r">
                                    <tr>
                                        <td>${r.id}</td>
                                        <td><strong>${r.nombre}</strong></td>
                                        <td>${r.descripcion}</td>
                                        <td>${r.horarioAtencion}</td>
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