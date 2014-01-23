package com.medic.facade.local;

import com.medic.entity.HistoryType;
import java.util.List;
import javax.ejb.Local;


@Local
public interface HistoryTypeFacadeLocal {
    
    void create(HistoryType patient);

    void edit(HistoryType patient);

    void remove(HistoryType patient);

    HistoryType find(Object id);

    List<HistoryType> findAll();
    
}
