package com.medic.facade.local;

import com.medic.entity.Illnesses;
import java.util.List;
import javax.ejb.Local;

@Local
public interface IllnessesFacadeLocal {

    void create(Illnesses illness);

    void edit(Illnesses illness);

    void remove(Illnesses illness);

    Illnesses find(Object id);

    List<Illnesses> findAll();
}
