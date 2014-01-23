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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "SPECIALIZATION")
@NamedQueries({
    @NamedQuery(name = "Specialization.findAll", query = "SELECT s FROM Specialization s"),
    @NamedQuery(name = "Specialization.findByIdSpecialization", query = "SELECT s FROM Specialization s WHERE s.idSpecialization = :idSpecialization")})
public class Specialization implements Serializable {

    @Id
    @GeneratedValue(strategy = SEQUENCE, generator = "ID_SPECIALIZATION")
    @SequenceGenerator(name = "ID_SPECIALIZATION", sequenceName = "ID_SPECIALIZATION", allocationSize = 1)
    @NotNull
    @Column(name = "ID_SPECIALIZATION")
    private Integer idSpecialization;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "SPEC_TITLE")
    private String specTitle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idSpecialization")
    private Collection<Doctor> doctors;

    public Specialization() {
    }

    public Specialization(String specTitle) {
        if (specTitle != null) {
            this.specTitle = specTitle;
        }
    }

    public Integer getIdSpecialization() {
        return idSpecialization;
    }

    public String getSpecTitle() {
        return specTitle;
    }

    public void setSpecTitle(String specTitle) {
        if (specTitle != null) {
            this.specTitle = specTitle;
        }
    }

    public Collection<Doctor> getDoctors() {
        return doctors;
    }

    public void addDoctor(Doctor doctor) {
        if (this.doctors == null) {
            this.doctors = new ArrayList<Doctor>();
        }
        this.doctors.add(doctor);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idSpecialization != null) {
            hash += idSpecialization.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Specialization)) {
            return false;
        }
        Specialization other = (Specialization) object;
        return this.idSpecialization.equals(other.idSpecialization);
    }

    @Override
    public String toString() {
        return "Specialization[ idSpecialization=" + idSpecialization + ",specTitle=" + specTitle + " ]";
    }

}
