package com.medic.facade.local;

import com.medic.entity.LaboratoryReception;
import java.util.List;
import javax.ejb.Local;

@Local
public interface LaboratoryReceptionFacadeLocal {

    void create(LaboratoryReception laboratoryReception);

    void edit(LaboratoryReception laboratoryReception);

    void remove(LaboratoryReception laboratoryReception);

    LaboratoryReception find(Object id);

    List<LaboratoryReception> findAll();
}
