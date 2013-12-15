package com.imedic.entitys;

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
@Table(name = "GROUP_ILLNESSES")
@NamedQueries({
    @NamedQuery(name = "GroupIllnesses.findAll", query = "SELECT g FROM GroupIllnesses g"),
    @NamedQuery(name = "GroupIllnesses.findByIdGroupIllnesses", query = "SELECT g FROM GroupIllnesses g WHERE g.idGroupIllnesses = :idGroupIllnesses")})
public class GroupIllnesses implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_GROUP_ILLNESSES")
    @NotNull
    @Column(name = "ID_GROUP_ILLNESSES")
    private Integer idGroupIllnesses;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ILNESSES_GR_TITLE")
    private String ilnessesGrTitle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idGroupIllnesses")
    private Collection<Illnesses> illnesses;

    public GroupIllnesses() {
    }

    public GroupIllnesses(Integer idGroupIllnesses, String ilnessesGrTitle) {
        this.idGroupIllnesses = idGroupIllnesses;
        this.ilnessesGrTitle = ilnessesGrTitle;
    }

    public Integer getIdGroupIllnesses() {
        return idGroupIllnesses;
    }

    public void setIdGroupIllnesses(Integer idGroupIllnesses) {
        this.idGroupIllnesses = idGroupIllnesses;
    }

    public String getIlnessesGrTitle() {
        return ilnessesGrTitle;
    }

    public void setIlnessesGrTitle(String ilnessesGrTitle) {
        this.ilnessesGrTitle = ilnessesGrTitle;
    }

    public Collection<Illnesses> getIllnesses() {
        return illnesses;
    }

    public void addIllness(Illnesses illness) {
        if (this.illnesses==null){
            this.illnesses=new ArrayList<Illnesses>();
        } 
        this.illnesses.add(illness);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idGroupIllnesses!=null){
            hash +=idGroupIllnesses.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof GroupIllnesses)) {
            return false;
        }
        GroupIllnesses other = (GroupIllnesses) object;
        return this.idGroupIllnesses.equals(other.idGroupIllnesses);   
    }

    @Override
    public String toString() {
        return "GroupIllnesses[ idGroupIllnesses=" + idGroupIllnesses + ",ilnessesGrTitle=" + ilnessesGrTitle + " ]";
    }
    
}
