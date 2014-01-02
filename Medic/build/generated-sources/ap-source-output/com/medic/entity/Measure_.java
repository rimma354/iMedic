package com.medic.entity;

import com.medic.entity.Treatment;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(Measure.class)
public class Measure_ { 

    public static volatile SingularAttribute<Measure, String> measureTitle;
    public static volatile SingularAttribute<Measure, Integer> idMeasure;
    public static volatile CollectionAttribute<Measure, Treatment> treatments;

}