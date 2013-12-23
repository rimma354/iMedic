/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.medic.facade;

import com.medic.entity.Patient;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Rimma
 */
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
