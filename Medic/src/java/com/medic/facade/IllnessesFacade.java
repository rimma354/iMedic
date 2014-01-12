package com.medic.facade;

import com.medic.entity.Illnesses;
import com.medic.facade.local.IllnessesFacadeLocal;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name = "IllnessesBean")
public class IllnessesFacade extends AbstractFacade<Illnesses> implements IllnessesFacadeLocal {

    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public IllnessesFacade() {
        super(Illnesses.class);
    }

}
