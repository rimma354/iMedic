package com.medic.facade;

import com.medic.facade.local.MedicalHistoryFacadeLocal;
import com.medic.entity.MedicalHistory;
import com.medic.entity.Patient;
import java.util.List;
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
      public List<MedicalHistory> findByIdPat(Integer id) {
        return em.createQuery("Select mh from MedicalHistory mh where mh.idMedicalCard.idPatient.idPatient = :id").setParameter("id", id).getResultList();
    }
}
