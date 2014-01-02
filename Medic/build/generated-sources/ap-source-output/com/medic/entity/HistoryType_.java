package com.medic.entity;

import com.medic.entity.MedicalHistory;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(HistoryType.class)
public class HistoryType_ { 

    public static volatile SingularAttribute<HistoryType, Integer> idHistoryType;
    public static volatile SingularAttribute<HistoryType, String> typeTitle;
    public static volatile CollectionAttribute<HistoryType, MedicalHistory> medicalHistories;

}