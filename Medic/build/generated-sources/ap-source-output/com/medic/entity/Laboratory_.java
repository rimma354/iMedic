package com.medic.entity;

import com.medic.entity.LaboratoryReception;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(Laboratory.class)
public class Laboratory_ { 

    public static volatile CollectionAttribute<Laboratory, LaboratoryReception> laboratoryReceptions;
    public static volatile SingularAttribute<Laboratory, String> labTitle;
    public static volatile SingularAttribute<Laboratory, Integer> idLaboratory;

}