package com.medic.entity;

import com.medic.entity.MedicalCard;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2013-12-23T16:50:57")
@StaticMetamodel(CardState.class)
public class CardState_ { 

    public static volatile SingularAttribute<CardState, Integer> idState;
    public static volatile SingularAttribute<CardState, String> stateTitle;
    public static volatile CollectionAttribute<CardState, MedicalCard> medicalCards;

}