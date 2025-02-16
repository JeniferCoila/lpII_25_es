

# Requerimiento de Desarrollo - ERP-SOFWPERU S.A.C  

## Tecnologías a Utilizar  
- **Web Technologies**  
- **Maven**  
- **JPA (Java Persistence API)**  
- **JPQL (Java Persistence Query Language)**  
- **MySQL**  
- **Git & GitHub**  

## Funcionalidades Asignadas  

### 1. Usuario  
- Implementar el método de **validación de login**.  
- Arquitectura **N-Capas**:  
  - **Model**  
  - **Interfaces**  
  - **DAO (Data Access Object)**  
  - **Controlador (Servlets)**  
  - **Vistas (JSP)**  
  - **Tests**  

### 2. Producto  
- Implementar:  
  - **Registro de producto**  
  - **Listado de productos**  
- Arquitectura **N-Capas**:  
  - **Model**  
  - **Interfaces**  
  - **DAO (Data Access Object)**  
  - **Controlador (Servlets)**  
  - **Vistas (JSP)**  
  - **Tests**  

## Requisitos de Vistas  
- **Deben ser archivos JSP** (`.jsp`).  

## Base de Datos (MySQL)  
Nombre de la base de datos: **BDTUAPELLIDOSUSTI**  

### Tabla: `TBL_USUARIOSUSTI`  
| Campo            | Tipo           | Restricción     |  
|-----------------|---------------|----------------|  
| IDUSUARIOSUSTI  | INT           | AUTO_INCREMENT, PK |  
| USUARIOSUSTI    | VARCHAR(255)  | NOT NULL       |  
| PASSWORDSUSTI   | VARCHAR(255)  | NOT NULL       |  

### Tabla: `TBL_PRODUCTOSUSTI`  
| Campo                 | Tipo          | Restricción |  
|----------------------|--------------|------------|  
| IDPRODUCTOSUSTI     | INT          | AUTO_INCREMENT, PK |  
| NOMBRESUSTI         | VARCHAR(255) | NOT NULL   |  
| PRECIOVENTASUSTI    | DOUBLE       | NOT NULL   |  
| PRECIOCOMPSUSTI     | DOUBLE       | NOT NULL   |  
| ESTADOSUSTI         | VARCHAR(255) | NOT NULL   |  
| DESCRIPSUSTI        | VARCHAR(255) | NOT NULL   |  

## Control de Versiones (Git)  
Se deben realizar **tres commits obligatorios**:  
1. **Inicio** → Creación del proyecto, estructura básica.  
2. **Segundo** → Implementación de funcionalidades parciales.  
3. **Final** → Código completo y probado.  

Cada commit debe incluir información sobre el usuario y el proceso realizado.  
