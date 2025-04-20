package servlets;

import java.io.IOException;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelos.Restaurante;

@WebServlet(name = "ControllerRestaurante", urlPatterns = {"/ControllerRestaurante"})
public class ControllerRestaurante extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        // Inicializa el EntityManagerFactory con Jakarta Persistence
        emf = Persistence.createEntityManagerFactory("Tarea1PU");
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    String horario = request.getParameter("horario");
    
    if(nombre == null || nombre.trim().isEmpty() || 
       descripcion == null || descripcion.trim().isEmpty() ||
       horario == null || horario.trim().isEmpty()) {
        response.sendRedirect("index.jsp?error=1");
        return;
    }
    
    Restaurante nuevoRestaurante = new Restaurante(nombre, descripcion, horario);
    
    EntityManager em = emf.createEntityManager();
    try {
        em.getTransaction().begin();
        em.persist(nuevoRestaurante);
        em.getTransaction().commit();
        System.out.println("Restaurante guardado con ID: " + nuevoRestaurante.getId());
    } catch (Exception e) {
        System.err.println("Error al guardar restaurante: " + e.getMessage());
        if (em.getTransaction().isActive()) {
            em.getTransaction().rollback();
        }
        response.sendRedirect("index.jsp?error=1");
        return;
    } finally {
        em.close();
    }
    
    // En lugar de redireccionar, obtenemos la lista actualizada y mostramos la vista
    doGet(request, response);
}
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    String action = request.getParameter("action");
    EntityManager em = emf.createEntityManager();
    
    try {
        if(action != null) {
            switch(action) {
                case "delete":
                    handleDelete(request, em);
                    break;
                case "edit":
                    handleEdit(request, em);
                    break;
            }
        }
        
        // Siempre obtenemos la lista actualizada
        List<Restaurante> restaurantes = em.createQuery("SELECT r FROM Restaurante r", Restaurante.class)
                                       .getResultList();
        request.setAttribute("restaurantes", restaurantes);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } finally {
        em.close();
    }
}

private void handleDelete(HttpServletRequest request, EntityManager em) {
    try {
        String idStr = request.getParameter("id");
        if(idStr != null && !idStr.isEmpty()) {
            Long id = Long.parseLong(idStr);
            em.getTransaction().begin();
            Restaurante restaurante = em.find(Restaurante.class, id);
            if(restaurante != null) {
                em.remove(restaurante);
            }
            em.getTransaction().commit();
        }
    } catch (Exception e) {
        System.err.println("Error al eliminar restaurante: " + e.getMessage());
        if (em.getTransaction().isActive()) {
            em.getTransaction().rollback();
        }
    }
}

private void handleEdit(HttpServletRequest request, EntityManager em) {
    // Aquí puedes implementar la lógica para editar
    // Por ahora solo redirigimos a la vista principal
}

    @Override
    public void destroy() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}