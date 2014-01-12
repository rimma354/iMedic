package com.medic.facade;

import com.medic.facade.local.MeasureFacadeLocal;
import javax.ejb.Stateless;
import com.medic.entity.Measure;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name = "MeasureBean")
public class MeasureFacade extends AbstractFacade<Measure> implements MeasureFacadeLocal {

    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MeasureFacade() {
        super(Measure.class);
    }
}
