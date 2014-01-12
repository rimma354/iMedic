
package com.medic.facade;

import com.medic.entity.Drugs;
import com.medic.facade.local.DrugsFacadeLocal;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless (name="DrugsBean")
public class DrugsFacade  extends AbstractFacade<Drugs> implements DrugsFacadeLocal {
 @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DrugsFacade() {
        super(Drugs.class);
    }
}
