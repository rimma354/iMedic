package com.medic.entity;

import com.medic.entity.Doctor;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(Specialization.class)
public class Specialization_ { 

    public static volatile SingularAttribute<Specialization, String> specTitle;
    public static volatile SingularAttribute<Specialization, Integer> idSpecialization;
    public static volatile CollectionAttribute<Specialization, Doctor> doctors;

}