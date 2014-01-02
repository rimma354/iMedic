/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.medic.facade;

import com.medic.facade.local.AdditionalInfoFacadeLocal;
import com.medic.entity.AdditionalInfo;
import com.medic.entity.Patient;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Rimma
 */
@Stateless (name="AdditionalInfoBean")
public class AdditionalInfoFacade extends AbstractFacade<AdditionalInfo>implements AdditionalInfoFacadeLocal {
@PersistenceContext(unitName = "MedicPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdditionalInfoFacade() {
        super(AdditionalInfo.class);
    }
}
