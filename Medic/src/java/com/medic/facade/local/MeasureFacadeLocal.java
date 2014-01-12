package com.medic.facade.local;

import javax.ejb.Local;
import com.medic.entity.Measure;
import java.util.List;

@Local
public interface MeasureFacadeLocal {

    void create(Measure measure);

    void edit(Measure measure);

    void remove(Measure measure);

    Measure find(Object id);

    List<Measure> findAll();
}
