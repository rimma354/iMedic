package com.medic.facade;

import com.medic.facade.local.LaboratoryReceptionFacadeLocal;
import com.medic.entity.LaboratoryReception;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless (name="LaboratoryReceptionBean")
public class LaboratoryReceptionFacade extends AbstractFacade<LaboratoryReception>implements LaboratoryReceptionFacadeLocal {

    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LaboratoryReceptionFacade() {
        super(LaboratoryReception.class);
    }
}
