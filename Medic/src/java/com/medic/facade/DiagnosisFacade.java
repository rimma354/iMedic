package com.medic.facade;

import com.medic.facade.local.DiagnosisFacadeLocal;
import com.medic.entity.Diagnosis;
import com.medic.entity.MedicalCard;
import java.util.List;
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

    @Override
    public List<Diagnosis> findByIdCard(MedicalCard medicalCard) {
        return em.createQuery("SELECT d FROM Diagnosis d WHERE d.idExamination.idDoctorReception.idMedicalHistory.idMedicalCard = :medicalCard").setParameter("medicalCard", medicalCard).getResultList();
    }
}
