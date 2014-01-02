package com.medic.facade.local;

import com.medic.entity.Examination;
import java.util.List;
import javax.ejb.Local;

@Local
public interface ExaminationFacadeLocal {

    void create(Examination examination);

    void edit(Examination examination);

    void remove(Examination examination);

    Examination find(Object id);

    List<Examination> findAll();

}
