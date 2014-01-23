package com.medic.facade.local;

import com.medic.entity.CardState;
import java.util.List;
import javax.ejb.Local;

@Local
public interface CardStateFacadeLocal {

    void create(CardState cardState);

    void edit(CardState cardState);

    void remove(CardState cardState);

    CardState find(Object id);

    List<CardState> findAll();
}
