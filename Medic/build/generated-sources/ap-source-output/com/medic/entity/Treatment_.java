package com.medic.entity;

import com.medic.entity.Drugs;
import com.medic.entity.Examination;
import com.medic.entity.Measure;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(Treatment.class)
public class Treatment_ { 

    public static volatile SingularAttribute<Treatment, Integer> duration;
    public static volatile SingularAttribute<Treatment, Integer> idTreatment;
    public static volatile SingularAttribute<Treatment, Drugs> idDrug;
    public static volatile SingularAttribute<Treatment, Measure> idMeasure;
    public static volatile SingularAttribute<Treatment, Examination> idExamination;
    public static volatile SingularAttribute<Treatment, Double> dosage;
    public static volatile SingularAttribute<Treatment, Integer> quantity;

}