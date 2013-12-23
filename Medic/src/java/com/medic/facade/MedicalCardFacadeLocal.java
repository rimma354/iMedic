/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.medic.facade;

import com.medic.entity.MedicalCard;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Rimma
 */
@Local
public interface MedicalCardFacadeLocal {
     void create(MedicalCard medicalCard);

    void edit(MedicalCard medicalCard);

    void remove(MedicalCard medicalCard);

    MedicalCard find(Object id);

    List<MedicalCard> findAll();
}
