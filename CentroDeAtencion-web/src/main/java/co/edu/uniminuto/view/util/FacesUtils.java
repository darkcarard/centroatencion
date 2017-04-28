/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.view.util;

import co.edu.uniminuto.model.entity.Persona;
import javax.faces.context.FacesContext;

/**
 *
 * @author cardila
 */
public class FacesUtils {
    
    public static void registrarSesion(Persona usuario){
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("USUARIO", usuario);
    }
    
}
