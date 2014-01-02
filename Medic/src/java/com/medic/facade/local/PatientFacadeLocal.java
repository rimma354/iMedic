package com.medic.facade.local;

import com.medic.entity.Patient;
import java.util.List;
import javax.ejb.Local;

@Local
public interface PatientFacadeLocal {

    void create(Patient patient);

    void edit(Patient patient);

    void remove(Patient patient);

    Patient find(Object id);

    List<Patient> findAll();

    List<Patient> findByLastName(String lastName);
}
