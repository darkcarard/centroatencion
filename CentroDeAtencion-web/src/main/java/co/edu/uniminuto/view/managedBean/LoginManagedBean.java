/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.view.managedBean;

import co.edu.uniminuto.model.entity.Persona;
import co.edu.uniminuto.view.delegate.SeguridadDelegate;
import co.edu.uniminuto.view.util.FacesUtils;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

/**
 *
 * @author cardila
 */
@ManagedBean(name = "loginBean")
@ViewScoped
public class LoginManagedBean {

    private Persona usuario;
    private SeguridadDelegate seguridad;
    
    public LoginManagedBean() {
    }
    
    @PostConstruct
    public void init() {
        usuario = new Persona();
        System.out.println("POST-CONSTRUCT");
    }
    
    public String ingresar(){
        
       if (seguridad.validarUsuario(usuario)){
           FacesUtils.registrarSesion(usuario);
           return "loginOk";
       }
       return "loginFailed";
    }

    public Persona getUsuario() {
        return usuario;
    }

    public void setUsuario(Persona usuario) {
        this.usuario = usuario;
    }

}
