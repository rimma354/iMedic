package com.medic.entity;

import com.medic.entity.AdditionalInfo;
import com.medic.entity.CardState;
import com.medic.entity.MedicalHistory;
import com.medic.entity.Patient;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(MedicalCard.class)
public class MedicalCard_ { 

    public static volatile SingularAttribute<MedicalCard, CardState> idState;
    public static volatile CollectionAttribute<MedicalCard, AdditionalInfo> additionalInfos;
    public static volatile SingularAttribute<MedicalCard, Integer> idMedicalCard;
    public static volatile SingularAttribute<MedicalCard, Patient> idPatient;
    public static volatile CollectionAttribute<MedicalCard, MedicalHistory> medicalHistories;

}