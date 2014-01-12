

package com.medic.facade.local;

import com.medic.entity.Treatment;
import java.util.List;
import javax.ejb.Local;

@Local
public interface TreatmentFacadeLocal {
    void create(Treatment treatment);

    void edit(Treatment treatment);

    void remove(Treatment treatment);

    Treatment find(Object id);

    List<Treatment> findAll();  
}
