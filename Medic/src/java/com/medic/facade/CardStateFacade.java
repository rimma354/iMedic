/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medic.facade;

import com.medic.facade.local.CardStateFacadeLocal;
import com.medic.entity.CardState;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Lora
 */
@Stateless(name="CardStateBean")
public class CardStateFacade  extends AbstractFacade <CardState> implements CardStateFacadeLocal {

   @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CardStateFacade() {
        super(CardState.class);
    }

}
