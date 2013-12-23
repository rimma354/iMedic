/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.medic.facade;

import com.medic.entity.AdditionalInfo;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Rimma
 */
@Local
public interface AdditionalInfoFacadeLocal {
  void create(AdditionalInfo patient);

    void edit(AdditionalInfo patient);

    void remove(AdditionalInfo patient);

    AdditionalInfo find(Object id);

    List<AdditionalInfo> findAll();
}
