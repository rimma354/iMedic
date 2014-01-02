
package com.medic.facade;

import com.medic.facade.local.PatientFacadeLocal;
import com.medic.entity.Patient;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name="PatientBean")
public class PatientFacade extends AbstractFacade<Patient> implements PatientFacadeLocal {
    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PatientFacade() {
        super(Patient.class);
    }

    @Override
    public List<Patient> findByLastName(String lastName) {
        return em.createNamedQuery("Patient.findByLastName").setParameter("lastName", lastName).getResultList();
    }
    
}
