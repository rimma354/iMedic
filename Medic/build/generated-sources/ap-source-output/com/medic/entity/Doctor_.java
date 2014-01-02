package com.medic.entity;

import com.medic.entity.DoctorReception;
import com.medic.entity.Specialization;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(Doctor.class)
public class Doctor_ { 

    public static volatile SingularAttribute<Doctor, String> lastName;
    public static volatile SingularAttribute<Doctor, Integer> idDoctor;
    public static volatile SingularAttribute<Doctor, Specialization> idSpecialization;
    public static volatile SingularAttribute<Doctor, String> firstName;
    public static volatile CollectionAttribute<Doctor, DoctorReception> doctorReceptions;
    public static volatile SingularAttribute<Doctor, String> patronymic;

}