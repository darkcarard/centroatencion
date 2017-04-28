/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.model.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
@Table(name = "persona")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Persona.findAll", query = "SELECT p FROM Persona p")
    , @NamedQuery(name = "Persona.findByIdentificacion", query = "SELECT p FROM Persona p WHERE p.identificacion = :identificacion")
    , @NamedQuery(name = "Persona.findByClave", query = "SELECT p FROM Persona p WHERE p.clave = :clave")
    , @NamedQuery(name = "Persona.findByNombre", query = "SELECT p FROM Persona p WHERE p.nombre = :nombre")
    , @NamedQuery(name = "Persona.findByCorreoElectronico", query = "SELECT p FROM Persona p WHERE p.correoElectronico = :correoElectronico")
    , @NamedQuery(name = "Persona.findByTelefonoFijo", query = "SELECT p FROM Persona p WHERE p.telefonoFijo = :telefonoFijo")
    , @NamedQuery(name = "Persona.findByTelefonoCelular", query = "SELECT p FROM Persona p WHERE p.telefonoCelular = :telefonoCelular")
    , @NamedQuery(name = "Persona.findByDireccion", query = "SELECT p FROM Persona p WHERE p.direccion = :direccion")})
public class Persona implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "identificacion")
    private String identificacion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "clave")
    private String clave;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "nombre")
    private String nombre;
    @Size(max = 200)
    @Column(name = "correo_electronico")
    private String correoElectronico;
    @Size(max = 25)
    @Column(name = "telefono_fijo")
    private String telefonoFijo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "telefono_celular")
    private String telefonoCelular;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "direccion")
    private String direccion;
    @ManyToMany(mappedBy = "personaList")
    private List<Medicamento> medicamentoList;
    @ManyToMany(mappedBy = "personaList")
    private List<Enfermedad> enfermedadList;
    @ManyToMany(mappedBy = "personaList")
    private List<CentroMedico> centroMedicoList;
    @JoinColumn(name = "rol", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Rol rol;
    @JoinColumn(name = "tipo_identificacion", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TipoIdentificacion tipoIdentificacion;
    @JoinColumn(name = "tipo_persona", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TipoPersona tipoPersona;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "medico")
    private List<Diagnostico> diagnosticoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "paciente")
    private List<Diagnostico> diagnosticoList1;

    public Persona() {
    }

    public Persona(String identificacion) {
        this.identificacion = identificacion;
    }

    public Persona(String identificacion, String clave, String nombre, String telefonoCelular, String direccion) {
        this.identificacion = identificacion;
        this.clave = clave;
        this.nombre = nombre;
        this.telefonoCelular = telefonoCelular;
        this.direccion = direccion;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getTelefonoFijo() {
        return telefonoFijo;
    }

    public void setTelefonoFijo(String telefonoFijo) {
        this.telefonoFijo = telefonoFijo;
    }

    public String getTelefonoCelular() {
        return telefonoCelular;
    }

    public void setTelefonoCelular(String telefonoCelular) {
        this.telefonoCelular = telefonoCelular;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @XmlTransient
    public List<Medicamento> getMedicamentoList() {
        return medicamentoList;
    }

    public void setMedicamentoList(List<Medicamento> medicamentoList) {
        this.medicamentoList = medicamentoList;
    }

    @XmlTransient
    public List<Enfermedad> getEnfermedadList() {
        return enfermedadList;
    }

    public void setEnfermedadList(List<Enfermedad> enfermedadList) {
        this.enfermedadList = enfermedadList;
    }

    @XmlTransient
    public List<CentroMedico> getCentroMedicoList() {
        return centroMedicoList;
    }

    public void setCentroMedicoList(List<CentroMedico> centroMedicoList) {
        this.centroMedicoList = centroMedicoList;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }

    public TipoIdentificacion getTipoIdentificacion() {
        return tipoIdentificacion;
    }

    public void setTipoIdentificacion(TipoIdentificacion tipoIdentificacion) {
        this.tipoIdentificacion = tipoIdentificacion;
    }

    public TipoPersona getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(TipoPersona tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    @XmlTransient
    public List<Diagnostico> getDiagnosticoList() {
        return diagnosticoList;
    }

    public void setDiagnosticoList(List<Diagnostico> diagnosticoList) {
        this.diagnosticoList = diagnosticoList;
    }

    @XmlTransient
    public List<Diagnostico> getDiagnosticoList1() {
        return diagnosticoList1;
    }

    public void setDiagnosticoList1(List<Diagnostico> diagnosticoList1) {
        this.diagnosticoList1 = diagnosticoList1;
    }

    public boolean validarClave(Persona personaValidar){
        return (personaValidar.getClave().equals(this.clave));
    }
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (identificacion != null ? identificacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Persona)) {
            return false;
        }
        Persona other = (Persona) object;
        if ((this.identificacion == null && other.identificacion != null) || (this.identificacion != null && !this.identificacion.equals(other.identificacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.uniminuto.model.entity.Persona[ identificacion=" + identificacion + " ]";
    }
    
}
