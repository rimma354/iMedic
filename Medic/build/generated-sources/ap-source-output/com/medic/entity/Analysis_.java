package com.medic.entity;

import com.medic.entity.LaboratoryReception;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(Analysis.class)
public class Analysis_ { 

    public static volatile SingularAttribute<Analysis, Integer> idAnalysis;
    public static volatile SingularAttribute<Analysis, String> analysisTitle;
    public static volatile CollectionAttribute<Analysis, LaboratoryReception> laboratoryReceptions;

}