package com.medic.facade.local;

import com.medic.entity.Drugs;
import java.util.List;
import javax.ejb.Local;


@Local
public interface DrugsFacadeLocal {
 void create(Drugs drugs);

    void edit(Drugs drugs);

    void remove(Drugs drugs);

    Drugs find(Object id);

    List<Drugs> findAll();   
}
