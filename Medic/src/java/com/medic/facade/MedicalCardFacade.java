package com.medic.facade;

import com.medic.facade.local.MedicalCardFacadeLocal;
import com.medic.entity.MedicalCard;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless (name="MedicalCardBean")
public class MedicalCardFacade extends AbstractFacade <MedicalCard> implements MedicalCardFacadeLocal {
 @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MedicalCardFacade() {
        super(MedicalCard.class);
    }

}
