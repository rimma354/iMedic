package com.medic.facade;

import com.medic.facade.local.MedicalHistoryFacadeLocal;
import com.medic.entity.MedicalHistory;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name = "MedicalHistoryBean")
public class MedicalHistoryFacade extends AbstractFacade<MedicalHistory> implements MedicalHistoryFacadeLocal {

    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MedicalHistoryFacade() {
        super(MedicalHistory.class);
    }
}
