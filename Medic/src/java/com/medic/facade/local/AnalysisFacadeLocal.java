package com.medic.facade.local;

import com.medic.entity.Analysis;
import java.util.List;
import javax.ejb.Local;

@Local
public interface AnalysisFacadeLocal {

    void create(Analysis analysis);

    void edit(Analysis analysis);

    void remove(Analysis analysis);

    Analysis find(Object id);

    List<Analysis> findAll();
}
