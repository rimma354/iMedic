package com.medic.entity;

import com.medic.entity.Patient;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2013-12-23T16:50:57")
@StaticMetamodel(Sex.class)
public class Sex_ { 

    public static volatile SingularAttribute<Sex, Integer> idSex;
    public static volatile CollectionAttribute<Sex, Patient> patients;
    public static volatile SingularAttribute<Sex, String> sexTitle;

}