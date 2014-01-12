package com.medic.facade;

import com.medic.facade.local.DiagnosisFacadeLocal;
import com.medic.entity.Diagnosis;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless (name="DiagnosisBean")
public class DiagnosisFacade extends AbstractFacade<Diagnosis>implements DiagnosisFacadeLocal {
    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DiagnosisFacade() {
        super(Diagnosis.class);
    }
}
