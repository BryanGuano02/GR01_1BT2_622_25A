package modelos;

import java.io.Serializable;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Restaurante implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String nombre;
    private String descripcion;
    private String horarioAtencion;

    public Restaurante() {
    }
    
    public Restaurante(String nombre, String descripcion, String horarioAtencion) {
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.horarioAtencion = horarioAtencion;
}

    public Restaurante(int id, String nombre, String descripcion, String horarioAtencion) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.horarioAtencion = horarioAtencion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getHorarioAtencion() {
        return horarioAtencion;
    }

    public void setHorarioAtencion(String horarioAtencion) {
        this.horarioAtencion = horarioAtencion;
    }

}
