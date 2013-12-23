package com.medic.entity;

import com.medic.entity.Sex;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2013-12-22T11:52:03")
@StaticMetamodel(Patient.class)
public class Patient_ { 

    public static volatile SingularAttribute<Patient, String> lastName;
    public static volatile SingularAttribute<Patient, String> insuranceNumber;
    public static volatile SingularAttribute<Patient, Sex> idSex;
    public static volatile SingularAttribute<Patient, Integer> idPatient;
    public static volatile SingularAttribute<Patient, String> firstName;
    public static volatile SingularAttribute<Patient, Date> dateBirth;
    public static volatile SingularAttribute<Patient, String> passport;
    public static volatile SingularAttribute<Patient, String> telephone;
    public static volatile SingularAttribute<Patient, String> patronymic;

}