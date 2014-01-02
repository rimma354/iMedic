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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name = "LABORATORY")
@NamedQueries({
    @NamedQuery(name = "Laboratory.findAll", query = "SELECT l FROM Laboratory l"),
    @NamedQuery(name = "Laboratory.findByIdLaboratory", query = "SELECT l FROM Laboratory l WHERE l.idLaboratory = :idLaboratory")})
public class Laboratory implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_LABORATORY")
    @NotNull
    @Column(name = "ID_LABORATORY")
    private Integer idLaboratory;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "LAB_TITLE")
    private String labTitle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idLaboratory")
    private Collection<LaboratoryReception> laboratoryReceptions;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "laboratory")
//    private Collection<LaboratorySchedule> laboratorySchedules;
    
    public Laboratory() {
    }

    public Laboratory(Integer idLaboratory, String labTitle) {
        this.idLaboratory = idLaboratory;
        this.labTitle = labTitle;
    }

    public Integer getIdLaboratory() {
        return idLaboratory;
    }

    public void setIdLaboratory(Integer idLaboratory) {
        this.idLaboratory = idLaboratory;
    }

    public String getLabTitle() {
        return labTitle;
    }

    public void setLabTitle(String labTitle) {
        this.labTitle = labTitle;
    }

    public Collection<LaboratoryReception> getLaboratoryReceptios() {
        return laboratoryReceptions;
    }

    public void addLaboratoryReception(LaboratoryReception laboratoryReception) {
        if (this.laboratoryReceptions==null){
            this.laboratoryReceptions=new ArrayList<LaboratoryReception>();
        }
        this.laboratoryReceptions.add(laboratoryReception);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idLaboratory!=null){
            hash +=idLaboratory.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Laboratory)) {
            return false;
        }
        Laboratory other = (Laboratory) object;
        return this.idLaboratory.equals(other.idLaboratory);   
    }

    @Override
    public String toString() {
        return "comLaboratory[ idLaboratory=" + idLaboratory + ",labTitle=" + labTitle + " ]";
    }

//    public Collection<LaboratorySchedule> getLaboratorySchedules() {
//        return laboratorySchedules;
//    }
//
//    public void addLaboratorySchedule(LaboratorySchedule laboratorySchedule) {
//        if (this.laboratorySchedules==null){
//            this.laboratorySchedules=new ArrayList<LaboratorySchedule>();
//        }
//        this.laboratorySchedules.add(laboratorySchedule);
//    }
    
}
