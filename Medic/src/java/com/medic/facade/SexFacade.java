package com.medic.facade;

import com.medic.facade.local.SexFacadeLocal;
import javax.ejb.Stateless;
import com.medic.entity.Sex;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name = "SexBean")
public class SexFacade extends AbstractFacade <Sex> implements SexFacadeLocal {

    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SexFacade() {
        super(Sex.class);
    }
}
