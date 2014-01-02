package com.medic.facade.local;

import com.medic.entity.Doctor;
import java.util.List;
import javax.ejb.Local;

@Local
public interface DoctorFacadeLocal {

    void create(Doctor doctor);

    void edit(Doctor Doctor);

    void remove(Doctor Doctor);

    Doctor find(Object id);

    List<Doctor> findAll();

    List<Doctor> findByLastName(String lastName);

}
