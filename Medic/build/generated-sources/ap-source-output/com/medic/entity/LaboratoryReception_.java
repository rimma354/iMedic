package com.medic.entity;

import com.medic.entity.Analysis;
import com.medic.entity.Examination;
import com.medic.entity.Laboratory;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(LaboratoryReception.class)
public class LaboratoryReception_ { 

    public static volatile SingularAttribute<LaboratoryReception, Analysis> idAnalysis;
    public static volatile SingularAttribute<LaboratoryReception, Examination> idExamination;
    public static volatile SingularAttribute<LaboratoryReception, Integer> idLaboratoryReception;
    public static volatile SingularAttribute<LaboratoryReception, String> analysisResult;
    public static volatile SingularAttribute<LaboratoryReception, Laboratory> idLaboratory;
    public static volatile SingularAttribute<LaboratoryReception, Date> analysisDate;

}