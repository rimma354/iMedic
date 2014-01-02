package com.medic.entity;

import com.medic.entity.Examination;
import com.medic.entity.Illnesses;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(Diagnosis.class)
public class Diagnosis_ { 

    public static volatile SingularAttribute<Diagnosis, Illnesses> idIllness;
    public static volatile SingularAttribute<Diagnosis, Integer> idDiagnosis;
    public static volatile SingularAttribute<Diagnosis, Examination> idExamination;

}