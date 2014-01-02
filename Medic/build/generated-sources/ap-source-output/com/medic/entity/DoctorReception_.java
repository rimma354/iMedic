package com.medic.entity;

import com.medic.entity.Doctor;
import com.medic.entity.Examination;
import com.medic.entity.MedicalHistory;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2014-01-02T01:13:38")
@StaticMetamodel(DoctorReception.class)
public class DoctorReception_ { 

    public static volatile SingularAttribute<DoctorReception, Doctor> idDoctor;
    public static volatile SingularAttribute<DoctorReception, Date> receptionDate;
    public static volatile SingularAttribute<DoctorReception, MedicalHistory> idMedicalHistory;
    public static volatile SingularAttribute<DoctorReception, Examination> idExamination;
    public static volatile SingularAttribute<DoctorReception, Integer> idDoctorReception;

}