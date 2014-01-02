package com.medic.entity;

import com.medic.entity.DoctorReception;
import com.medic.entity.HistoryType;
import com.medic.entity.MedicalCard;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(MedicalHistory.class)
public class MedicalHistory_ { 

    public static volatile SingularAttribute<MedicalHistory, HistoryType> idHistoryType;
    public static volatile SingularAttribute<MedicalHistory, String> description;
    public static volatile SingularAttribute<MedicalHistory, Integer> idMedicalHistory;
    public static volatile SingularAttribute<MedicalHistory, MedicalCard> idMedicalCard;
    public static volatile CollectionAttribute<MedicalHistory, DoctorReception> doctorReceptions;

}