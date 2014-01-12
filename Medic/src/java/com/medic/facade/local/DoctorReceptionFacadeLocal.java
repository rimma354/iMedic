package com.medic.facade.local;

import com.medic.entity.DoctorReception;
import com.medic.entity.MedicalHistory;
import java.util.Date;
import java.util.List;
import javax.ejb.Local;

@Local
public interface DoctorReceptionFacadeLocal {

    void create(DoctorReception doctorReception);

    void edit(DoctorReception doctorReception);

    void remove(DoctorReception doctorReception);

    DoctorReception find(Object id);

    List<DoctorReception> findAll();

}
