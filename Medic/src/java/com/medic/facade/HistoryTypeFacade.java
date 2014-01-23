package com.medic.facade;

import com.medic.facade.local.HistoryTypeFacadeLocal;
import com.medic.entity.HistoryType;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless(name="HistoryTypeBean")
public class HistoryTypeFacade extends AbstractFacade<HistoryType> implements HistoryTypeFacadeLocal {

    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public HistoryTypeFacade() {
        super(HistoryType.class);
    }

}
