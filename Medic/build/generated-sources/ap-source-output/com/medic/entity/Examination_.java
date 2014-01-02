package com.medic.entity;

import com.medic.entity.Diagnosis;
import com.medic.entity.DoctorReception;
import com.medic.entity.LaboratoryReception;
import com.medic.entity.Treatment;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(Examination.class)
public class Examination_ { 

    public static volatile CollectionAttribute<Examination, Diagnosis> diagnoses;
    public static volatile SingularAttribute<Examination, Integer> idExamination;
    public static volatile SingularAttribute<Examination, DoctorReception> idDoctorReception;
    public static volatile CollectionAttribute<Examination, LaboratoryReception> laboratoryReceptions;
    public static volatile SingularAttribute<Examination, String> complaints;
    public static volatile CollectionAttribute<Examination, Treatment> treatments;

}