package com.medic.facade;

import com.medic.facade.local.AnalysisFacadeLocal;
import com.medic.entity.Analysis;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless (name="AnalysisBean")
public class AnalysisFacade extends AbstractFacade<Analysis>implements AnalysisFacadeLocal {
 @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AnalysisFacade() {
        super(Analysis.class);
    }
}
