package com.medic.entity;

import com.medic.entity.Diagnosis;
import com.medic.entity.GroupIllnesses;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(Illnesses.class)
public class Illnesses_ { 

    public static volatile SingularAttribute<Illnesses, Integer> idIllness;
    public static volatile CollectionAttribute<Illnesses, Diagnosis> diagnoses;
    public static volatile SingularAttribute<Illnesses, String> illnessesTitle;
    public static volatile SingularAttribute<Illnesses, GroupIllnesses> idGroupIllnesses;

}