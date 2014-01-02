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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name = "ILLNESSES")
@NamedQueries({
    @NamedQuery(name = "Illnesses.findAll", query = "SELECT i FROM Illnesses i"),
    @NamedQuery(name = "Illnesses.findByIdIllness", query = "SELECT i FROM Illnesses i WHERE i.idIllness = :idIllness")})
public class Illnesses implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_ILLNESS")
    @NotNull
    @Column(name = "ID_ILLNESS")
    private Integer idIllness;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ILLNESSES_TITLE")
    private String illnessesTitle;
    @ManyToOne
    @JoinColumn(name = "ID_GROUP_ILLNESSES")
    private GroupIllnesses idGroupIllnesses;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idIllness")
    private Collection <Diagnosis> diagnoses;
    
    public Illnesses() {
    }

    public Illnesses(Integer idIllness, String illnessesTitle) {
        this.idIllness = idIllness;
        this.illnessesTitle = illnessesTitle;
    }

    public Integer getIdIllness() {
        return idIllness;
    }

    public void setIdIllness(Integer idIllness) {
        this.idIllness = idIllness;
    }

    public String getIllnessesTitle() {
        return illnessesTitle;
    }

    public void setIllnessesTitle(String illnessesTitle) {
        this.illnessesTitle = illnessesTitle;
    }

    public GroupIllnesses getIdGroupIllnesses() {
        return idGroupIllnesses;
    }

    public void setIdGroupIllnesses(GroupIllnesses idGroupIllnesses) {
        this.idGroupIllnesses = idGroupIllnesses;
    }
    
    public Collection<Diagnosis> getDiagnoses() {
        return this.diagnoses;
    }

    public void addDiagnosis(Diagnosis diagnosis) {
        if (this.diagnoses==null){
            this.diagnoses=new ArrayList<Diagnosis>();
        }
        this.diagnoses.add(diagnosis);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idIllness!=null){
            hash +=idIllness.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Illnesses)) {
            return false;
        }
        Illnesses other = (Illnesses) object;
        return this.idIllness.equals(other.idIllness);   
    }

    @Override
    public String toString() {
        return "Illnesses[ idIllness=" + idIllness + ",illnessesTitle=" + illnessesTitle + ",idGroupIllnesses=" + idGroupIllnesses + " ]";
    }
    
}
