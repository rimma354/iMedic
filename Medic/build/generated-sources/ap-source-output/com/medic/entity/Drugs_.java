package com.medic.entity;

import com.medic.entity.Treatment;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(Drugs.class)
public class Drugs_ { 

    public static volatile SingularAttribute<Drugs, String> drugTitle;
    public static volatile SingularAttribute<Drugs, Integer> idDrug;
    public static volatile CollectionAttribute<Drugs, Treatment> treatments;

}