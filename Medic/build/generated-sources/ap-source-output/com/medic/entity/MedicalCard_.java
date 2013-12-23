package com.medic.entity;

import com.medic.entity.CardState;
import com.medic.entity.Patient;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2013-12-23T16:50:57")
@StaticMetamodel(MedicalCard.class)
public class MedicalCard_ { 

    public static volatile SingularAttribute<MedicalCard, CardState> idState;
    public static volatile SingularAttribute<MedicalCard, Integer> idMedicalCard;
    public static volatile SingularAttribute<MedicalCard, Patient> idPatient;

}