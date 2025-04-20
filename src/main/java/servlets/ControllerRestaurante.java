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
        } finally {
            em.close();
        }
        
        response.sendRedirect("ControllerRestaurante");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        EntityManager em = emf.createEntityManager();
        try {
            List<Restaurante> restaurantes = em.createQuery("SELECT r FROM Restaurante r", Restaurante.class)
                                           .getResultList();
            request.setAttribute("restaurantes", restaurantes);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

    @Override
    public void destroy() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}