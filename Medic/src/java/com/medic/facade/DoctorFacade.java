
package com.medic.facade;

import com.medic.facade.local.DoctorFacadeLocal;
import com.medic.entity.Doctor;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless (name="DoctorBean")
public class DoctorFacade extends AbstractFacade<Doctor> implements DoctorFacadeLocal {
    @PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DoctorFacade() {
        super(Doctor.class);
    }

    @Override
    public List<Doctor> findByLastName(String lastName) {
        return em.createNamedQuery("Doctor.findByLastName").setParameter("lastName", lastName).getResultList();
    }
}
