/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.model.ejb;

import co.edu.uniminuto.model.entity.Signos;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author cardila
 */
@Stateless
public class SignosFacade extends AbstractFacade<Signos> {

    @PersistenceContext(unitName = "PU-CentroDeAtencion")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SignosFacade() {
        super(Signos.class);
    }
    
}
