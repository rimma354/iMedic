
package com.medic.facade;

import com.medic.facade.local.WorkTimeFacadeLocal;
import com.medic.entity.WorkTime;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name="WorkTimeBean")
public class WorkTimeFacade extends AbstractFacade<WorkTime> implements WorkTimeFacadeLocal {
@PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
     public WorkTimeFacade() {
        super(WorkTime.class);
    }


}
