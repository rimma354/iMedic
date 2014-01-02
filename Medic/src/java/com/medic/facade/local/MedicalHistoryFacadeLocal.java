
package com.medic.facade.local;

import com.medic.entity.MedicalHistory;
import java.util.List;
import javax.ejb.Local;

@Local
public interface MedicalHistoryFacadeLocal {

    void create(MedicalHistory medicalHistory);

    void edit(MedicalHistory medicalHistory);

    void remove(MedicalHistory medicalHistory);

    MedicalHistory find(Object id);

    List<MedicalHistory> findAll();
}
