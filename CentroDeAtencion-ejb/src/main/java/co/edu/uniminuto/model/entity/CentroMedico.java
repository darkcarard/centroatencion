/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.model.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author cardila
 */
@Entity
@Table(name = "centro_medico")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CentroMedico.findAll", query = "SELECT c FROM CentroMedico c")
    , @NamedQuery(name = "CentroMedico.findById", query = "SELECT c FROM CentroMedico c WHERE c.id = :id")
    , @NamedQuery(name = "CentroMedico.findByNombre", query = "SELECT c FROM CentroMedico c WHERE c.nombre = :nombre")
    , @NamedQuery(name = "CentroMedico.findByDescripcion", query = "SELECT c FROM CentroMedico c WHERE c.descripcion = :descripcion")
    , @NamedQuery(name = "CentroMedico.findByDirecci\u00f3n", query = "SELECT c FROM CentroMedico c WHERE c.direcci\u00f3n = :direcci\u00f3n")})
public class CentroMedico implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombre")
    private String nombre;
    @Size(max = 500)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 120)
    @Column(name = "direcci\u00f3n")
    private String dirección;
    @JoinTable(name = "centro_medico_persona", joinColumns = {
        @JoinColumn(name = "centro_medico", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "persona", referencedColumnName = "identificacion")})
    @ManyToMany
    private List<Persona> personaList;

    public CentroMedico() {
    }

    public CentroMedico(Integer id) {
        this.id = id;
    }

    public CentroMedico(Integer id, String nombre, String dirección) {
        this.id = id;
        this.nombre = nombre;
        this.dirección = dirección;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public String getDirección() {
        return dirección;
    }

    public void setDirección(String dirección) {
        this.dirección = dirección;
    }

    @XmlTransient
    public List<Persona> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<Persona> personaList) {
        this.personaList = personaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CentroMedico)) {
            return false;
        }
        CentroMedico other = (CentroMedico) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.uniminuto.model.entity.CentroMedico[ id=" + id + " ]";
    }
    
}
