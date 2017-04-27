/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.view.managedBean;

import javax.inject.Named;
import javax.enterprise.context.RequestScoped;

/**
 *
 * @author cardila
 */
@Named(value = "loginBean")
@RequestScoped
public class LoginManagedBean {

    private String usuario;
    private String clave;
    
    public LoginManagedBean() {
    }
    
    public String ingresar(){
        System.out.println("¡¡Ingresé!!");
        System.out.println("Usuario: " + usuario);
        System.out.println("Clave: " + clave);
        return "";
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    
    
}
