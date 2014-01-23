package com.medic.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "DOCTOR")
@NamedQueries({
    @NamedQuery(name = "Doctor.findAll", query = "SELECT d FROM Doctor d"),
    @NamedQuery(name = "Doctor.findByIdDoctor", query = "SELECT d FROM Doctor d WHERE d.idDoctor = :idDoctor"),
    @NamedQuery(name = "Doctor.findByLastName", query = "SELECT d FROM Doctor d WHERE d.lastName = :lastName")})
public class Doctor implements Serializable {

    @Id
    @GeneratedValue(strategy = SEQUENCE, generator = "ID_DOCTOR")
    @SequenceGenerator(name = "ID_DOCTOR", sequenceName = "ID_DOCTOR", allocationSize = 1)
    @NotNull
    @Column(name = "ID_DOCTOR")
    private Integer idDoctor;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "FIRST_NAME")
    private String firstName;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "LAST_NAME")
    private String lastName;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "PATRONYMIC")
    private String patronymic;
    @ManyToOne
    @JoinColumn(name = "ID_SPECIALIZATION")
    private Specialization idSpecialization;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idDoctor")
    private Collection<DoctorReception> doctorReceptions;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "doctor")
//    private Collection<DoctorSchedule> doctorSchedules;

    public Doctor() {
    }

    public Doctor(String firstName, String lastName, String patronymic) {
        if ((firstName != null) && (lastName != null) && (patronymic != null)) {
            this.firstName = firstName;
            this.lastName = lastName;
            this.patronymic = patronymic;
        }
    }

    public Integer getIdDoctor() {
        return idDoctor;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        if (firstName != null) {
            this.firstName = firstName;
        }
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        if (lastName != null) {
            this.lastName = lastName;
        }
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        if (patronymic != null) {
            this.patronymic = patronymic;
        }
    }

    public Specialization getIdSpecialization() {
        return idSpecialization;
    }

    public void setIdSpecialization(Specialization idSpecialization) {
        if (idSpecialization != null) {
            this.idSpecialization = idSpecialization;
        }
    }

    public Collection<DoctorReception> getDoctorReceptions() {
        return doctorReceptions;
    }

    public void addDoctorReception(DoctorReception doctorReception) {
        if (this.doctorReceptions == null) {
            this.doctorReceptions = new ArrayList<DoctorReception>();
        }
        this.doctorReceptions.add(doctorReception);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idDoctor != null) {
            hash += idDoctor.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Doctor)) {
            return false;
        }
        Doctor other = (Doctor) object;
        return this.idDoctor.equals(other.idDoctor);

    }

    @Override
    public String toString() {
        return "Doctor[ idDoctor=" + idDoctor + ",firstName=" + firstName + ",lastName=" + lastName + ",patronymic=" + patronymic + ",idSpecialization=" + idSpecialization + " ]";
    }

//    public Collection<DoctorSchedule> getDoctorSchedules() {
//        return doctorSchedules;
//    }
//
//    public void addDoctorSchedules(DoctorSchedule doctorSchedule) {
//        if (this.doctorSchedules==null){
//            this.doctorSchedules=new ArrayList<DoctorSchedule>();
//        }
//        this.doctorSchedules.add(doctorSchedule);
//    }
}
