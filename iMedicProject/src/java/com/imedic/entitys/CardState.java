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
@Table(name = "CARD_STATE")
@NamedQueries({
    @NamedQuery(name = "CardState.findAll", query = "SELECT c FROM CardState c"),
    @NamedQuery(name = "CardState.findByIdState", query = "SELECT c FROM CardState c WHERE c.idState = :idState")})
public class CardState implements Serializable {
    @Id
    @GeneratedValue(strategy=SEQUENCE, generator="ID_STATE")
    @NotNull
    @Column(name = "ID_STATE")
    private Integer idState;
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "STATE_TITLE")
    private String stateTitle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idState")
    private Collection <MedicalCard> medicalCards;
    
    public CardState() {
    }

    public CardState(Integer idState, String stateTitle) {
        this.idState = idState;
        this.stateTitle = stateTitle;
    }

    public int getIdState() {
        return idState;
    }

    public void setIdState(Integer idState) {
        this.idState = idState;
    }

    public String getStateTitle() {
        return stateTitle;
    }

    public void setStateTitle(String stateTitle) {
        this.stateTitle = stateTitle;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        if (idState!=null){
            hash +=idState.hashCode();
        }
        return hash;
    }
    
    public Collection<MedicalCard> getMedicalCards() {
        return medicalCards;
    }

    public void addMedicalCard(MedicalCard medicalCard) {
        if (this.medicalCards==null){
            this.medicalCards=new ArrayList<MedicalCard>();
        }
        this.medicalCards.add(medicalCard);
    }
    
    @Override
    public boolean equals(Object object) {
        if (!(object instanceof CardState)) {
            return false;
        }
        CardState other = (CardState) object;
        return this.idState.equals(other.idState);   
    }

    @Override
    public String toString() {
        return "CardState[ idState=" + idState + ",stateTitle=" + stateTitle + " ]";
    }
    
}
