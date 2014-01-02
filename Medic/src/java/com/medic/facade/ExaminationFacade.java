package com.medic.facade;

import com.medic.facade.local.ExaminationFacadeLocal;
import com.medic.entity.Examination;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless (name="ExaminationBean")
public class ExaminationFacade extends AbstractFacade<Examination>implements ExaminationFacadeLocal {
    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ExaminationFacade() {
        super(Examination.class);
    }
}
