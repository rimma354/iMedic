package com.medic.facade;

import com.medic.facade.local.DoctorReceptionFacadeLocal;
import com.medic.entity.DoctorReception;
import com.medic.entity.MedicalHistory;
import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless (name="DoctorReceptionBean")
public class DoctorReceptionFacade extends AbstractFacade<DoctorReception> implements DoctorReceptionFacadeLocal {
    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DoctorReceptionFacade() {
        super(DoctorReception.class);
    }
 
}
