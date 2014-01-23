package com.medic.facade.local;

import javax.ejb.Local;
import com.medic.entity.Sex;
import java.util.List;

@Local
public interface SexFacadeLocal {

    void create(Sex measure);

    void edit(Sex measure);

    void remove(Sex measure);

    Sex find(Object id);

    List<Sex> findAll();
}
