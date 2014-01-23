
package com.medic.facade.local;

import com.medic.entity.WorkTime;
import java.util.List;
import javax.ejb.Local;


@Local
public interface WorkTimeFacadeLocal {
    
    void create(WorkTime medicalHistory);

    void edit(WorkTime medicalHistory);

    void remove(WorkTime medicalHistory);

    WorkTime find(Object id);

    List<WorkTime> findAll();
    
}
