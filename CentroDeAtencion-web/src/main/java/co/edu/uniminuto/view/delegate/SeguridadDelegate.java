/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.view.delegate;


import co.edu.uniminuto.model.ejb.PersonaFacade;
import co.edu.uniminuto.model.entity.Persona;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author cardila
 */
public class SeguridadDelegate {

    @EJB
    PersonaFacade personaFacade;
    
    public boolean validarUsuario(Persona usuarioValidar){
        Persona usuario;
        usuario = personaFacade.find(usuarioValidar);
        return usuario.validarClave(usuarioValidar);
    }

    
      
}
