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
@Table(name = "ANALYSIS")
@NamedQueries({
    @NamedQuery(name = "Analysis.findAll", query = "SELECT a FROM Analysis a"),
    @NamedQuery(name = "Analysis.findByIdAnalysis", query = "SELECT a FROM Analysis a WHERE a.idAnalysis = :idAnalysis")})
public class Analysis implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_ANALYSIS")
    @NotNull
    @Column(name = "ID_ANALYSIS")
    private Integer idAnalysis;
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ANALYSIS_TITLE")
    private String analysisTitle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idAnalysis")
    private Collection<LaboratoryReception> laboratoryReceptions;
    
    public Analysis() {
    }

    public Analysis(Integer idAnalysis, String analysisTitle) {
        this.idAnalysis = idAnalysis;
        this.analysisTitle = analysisTitle;
    }

    public Integer getIdAnalysis() {
        return idAnalysis;
    }

    public void setIdAnalysis(Integer idAnalysis) {
        this.idAnalysis = idAnalysis;
    }

    public String getAnalysisTitle() {
        return analysisTitle;
    }

    public void setAnalysisTitle(String analysisTitle) {
        this.analysisTitle = analysisTitle;
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
        if (idAnalysis!=null){
            hash +=idAnalysis.hashCode();
        }
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Analysis)) {
            return false;
        }
        Analysis other = (Analysis) object;
        return this.idAnalysis.equals(other.idAnalysis);   
    }

    @Override
    public String toString() {
        return "Analysis[ idAnalysis=" + idAnalysis + ",analysisTitle=" + analysisTitle + " ]";
    }
    
}
