package com.medic.facade.local;

import com.medic.entity.Diagnosis;
import java.util.List;
import javax.ejb.Local;

@Local
public interface DiagnosisFacadeLocal {

    void create(Diagnosis diagnosis);

    void edit(Diagnosis diagnosis);

    void remove(Diagnosis diagnosis);

    Diagnosis find(Object id);

    List<Diagnosis> findAll();
}
