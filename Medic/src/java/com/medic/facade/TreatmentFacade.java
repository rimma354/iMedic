package com.medic.facade;

import com.medic.entity.Treatment;
import com.medic.facade.local.TreatmentFacadeLocal;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless (name="TreatmentBean")
public class TreatmentFacade extends AbstractFacade<Treatment>implements TreatmentFacadeLocal {

    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TreatmentFacade() {
        super(Treatment.class);
    }
}
