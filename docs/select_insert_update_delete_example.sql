SELECT id_specialization, spec_title 
  FROM Specialization;
SELECT id_history_type, type_title 
  FROM History_type;
SELECT id_medical_card, id_illness 
  FROM Rates_chronyc_illnesses;
SELECT id_medical_card, id_allergens 
  FROM Rates_allergens;
SELECT id_medical_card, id_blood_group, id_rh 
  FROM Rates_blood;
SELECT id_state, state_title 
  FROM Card_state;
SELECT id_sex, sex_title 
  FROM Sex;
SELECT id_time, time 
  FROM time;
SELECT id_week_day, day 
  FROM week_day;
SELECT id_medical_card, id_vaccination 
  FROM Rates_vaccinations;
SELECT id_medical_card, id_drug 
  FROM Rates_drugs;
SELECT id_vaccination, vaccination_title 
  FROM Vaccinations;
SELECT id_drug, drug_title 
  FROM Drugs;
SELECT id_allergy, allergy_gr_title 
  FROM Allergy_group;
SELECT id_allergens, allergens_title, id_allergy 
  FROM Allergens;
SELECT id_group, ilnesses_gr_title 
  FROM Group_illnesses;
SELECT id_illness, illnesses_title, id_group 
  FROM Illnesses;
SELECT id_rh, rh_title 
  FROM RH_factor;
SELECT id_blood_group, group_title 
  FROM Blood_group;
SELECT id_analisis, analysis_tittle 
  FROM Analisis;
SELECT id_treatment, id_examination, id_drug, dosage, quantity, duration 
  FROM Treatment;
SELECT id_laboratory, week_day, time 
  FROM Laboratory_schedule;
SELECT id_laboratory, lab_title 
  FROM Laboratory;
SELECT id_doctor, week_day, time 
  FROM Doctor_schedule;
SELECT id_doctor, first_name, last_name, patronymic, id_specialization 
  FROM Doctor;
SELECT id_diagnosis, id_examination, id_illness 
  FROM Diagnosis;
SELECT id_laboratory_reception, id_examination, id_laboratory, analysis_date, result, id_analisis 
  FROM Laboratory_reception;
SELECT id_doctor_reception, id_medical_history, id_doctor, "date", time 
  FROM Doctor_reception;
SELECT id_examination, id_doctor_reception, complaints 
  FROM Examination;
SELECT id_medical_history, id_medical_card, id_history_type, description 
  FROM Medical_History;
SELECT id_patient, first_name, last_name, patronymic, id_sex, date_birth, telephone, passport, insurance_number 
  FROM Patient;
SELECT id_medical_card, id_patient, id_state 
  FROM Medical_card;

  
  
  
  
  
  INSERT INTO Specialization
  (id_specialization, 
  spec_title) 
VALUES 
  (?, 
  ?);
INSERT INTO History_type
  (id_history_type, 
  type_title) 
VALUES 
  (?, 
  ?);
INSERT INTO Rates_chronyc_illnesses
  (id_medical_card, 
  id_illness) 
VALUES 
  (?, 
  ?);
INSERT INTO Rates_allergens
  (id_medical_card, 
  id_allergens) 
VALUES 
  (?, 
  ?);
INSERT INTO Rates_blood
  (id_medical_card, 
  id_blood_group, 
  id_rh) 
VALUES 
  (?, 
  ?, 
  ?);
INSERT INTO Card_state
  (id_state, 
  state_title) 
VALUES 
  (?, 
  ?);
INSERT INTO Sex
  (id_sex, 
  sex_title) 
VALUES 
  (?, 
  ?);
INSERT INTO time
  (id_time, 
  time) 
VALUES 
  (?, 
  ?);
INSERT INTO week_day
  (id_week_day, 
  day) 
VALUES 
  (?, 
  ?);
INSERT INTO Rates_vaccinations
  (id_medical_card, 
  id_vaccination) 
VALUES 
  (?, 
  ?);
INSERT INTO Rates_drugs
  (id_medical_card, 
  id_drug) 
VALUES 
  (?, 
  ?);
INSERT INTO Vaccinations
  (id_vaccination, 
  vaccination_title) 
VALUES 
  (?, 
  ?);
INSERT INTO Drugs
  (id_drug, 
  drug_title) 
VALUES 
  (?, 
  ?);
INSERT INTO Allergy_group
  (id_allergy, 
  allergy_gr_title) 
VALUES 
  (?, 
  ?);
INSERT INTO Allergens
  (id_allergens, 
  allergens_title, 
  id_allergy) 
VALUES 
  (?, 
  ?, 
  ?);
INSERT INTO Group_illnesses
  (id_group, 
  ilnesses_gr_title) 
VALUES 
  (?, 
  ?);
INSERT INTO Illnesses
  (id_illness, 
  illnesses_title, 
  id_group) 
VALUES 
  (?, 
  ?, 
  ?);
INSERT INTO RH_factor
  (id_rh, 
  rh_title) 
VALUES 
  (?, 
  ?);
INSERT INTO Blood_group
  (id_blood_group, 
  group_title) 
VALUES 
  (?, 
  ?);
INSERT INTO Analisis
  (id_analisis, 
  analysis_tittle) 
VALUES 
  (?, 
  ?);
INSERT INTO Treatment
  (id_treatment, 
  id_examination, 
  id_drug, 
  dosage, 
  quantity, 
  duration) 
VALUES 
  (?, 
  ?, 
  ?, 
  ?, 
  ?, 
  ?);
INSERT INTO Laboratory_schedule
  (id_laboratory, 
  week_day, 
  time) 
VALUES 
  (?, 
  ?, 
  ?);
INSERT INTO Laboratory
  (id_laboratory, 
  lab_title) 
VALUES 
  (?, 
  ?);
INSERT INTO Doctor_schedule
  (id_doctor, 
  week_day, 
  time) 
VALUES 
  (?, 
  ?, 
  ?);
INSERT INTO Doctor
  (id_doctor, 
  first_name, 
  last_name, 
  patronymic, 
  id_specialization) 
VALUES 
  (?, 
  ?, 
  ?, 
  ?, 
  ?);
INSERT INTO Diagnosis
  (id_diagnosis, 
  id_examination, 
  id_illness) 
VALUES 
  (?, 
  ?, 
  ?);
INSERT INTO Laboratory_reception
  (id_laboratory_reception, 
  id_examination, 
  id_laboratory, 
  analysis_date, 
  result, 
  id_analisis) 
VALUES 
  (?, 
  ?, 
  ?, 
  ?, 
  ?, 
  ?);
INSERT INTO Doctor_reception
  (id_doctor_reception, 
  id_medical_history, 
  id_doctor, 
  "date", 
  time) 
VALUES 
  (?, 
  ?, 
  ?, 
  ?, 
  ?);
INSERT INTO Examination
  (id_examination, 
  id_doctor_reception, 
  complaints) 
VALUES 
  (?, 
  ?, 
  ?);
INSERT INTO Medical_History
  (id_medical_history, 
  id_medical_card, 
  id_history_type, 
  description) 
VALUES 
  (?, 
  ?, 
  ?, 
  ?);
INSERT INTO Patient
  (id_patient, 
  first_name, 
  last_name, 
  patronymic, 
  id_sex, 
  date_birth, 
  telephone, 
  passport, 
  insurance_number) 
VALUES 
  (?, 
  ?, 
  ?, 
  ?, 
  ?, 
  ?, 
  ?, 
  ?, 
  ?);
INSERT INTO Medical_card
  (id_medical_card, 
  id_patient, 
  id_state) 
VALUES 
  (?, 
  ?, 
  ?);

  
  
  
  
  
  
  
  UPDATE Specialization SET 
  spec_title = ? 
WHERE
  id_specialization = ?;
UPDATE History_type SET 
  type_title = ? 
WHERE
  id_history_type = ?;
UPDATE Rates_chronyc_illnesses SET 
   
WHERE
  id_medical_card = ? AND id_illness = ?;
UPDATE Rates_allergens SET 
   
WHERE
  id_medical_card = ? AND id_allergens = ?;
UPDATE Rates_blood SET 
   
WHERE
  id_medical_card = ? AND id_blood_group = ? AND id_rh = ?;
UPDATE Card_state SET 
  state_title = ? 
WHERE
  id_state = ?;
UPDATE Sex SET 
  sex_title = ? 
WHERE
  id_sex = ?;
UPDATE time SET 
  time = ? 
WHERE
  id_time = ?;
UPDATE week_day SET 
  day = ? 
WHERE
  id_week_day = ?;
UPDATE Rates_vaccinations SET 
   
WHERE
  id_medical_card = ? AND id_vaccination = ?;
UPDATE Rates_drugs SET 
   
WHERE
  id_medical_card = ? AND id_drug = ?;
UPDATE Vaccinations SET 
  vaccination_title = ? 
WHERE
  id_vaccination = ?;
UPDATE Drugs SET 
  drug_title = ? 
WHERE
  id_drug = ?;
UPDATE Allergy_group SET 
  allergy_gr_title = ? 
WHERE
  id_allergy = ?;
UPDATE Allergens SET 
  allergens_title = ?, 
  id_allergy = ? 
WHERE
  id_allergens = ?;
UPDATE Group_illnesses SET 
  ilnesses_gr_title = ? 
WHERE
  id_group = ?;
UPDATE Illnesses SET 
  illnesses_title = ?, 
  id_group = ? 
WHERE
  id_illness = ?;
UPDATE RH_factor SET 
  rh_title = ? 
WHERE
  id_rh = ?;
UPDATE Blood_group SET 
  group_title = ? 
WHERE
  id_blood_group = ?;
UPDATE Analisis SET 
  analysis_tittle = ? 
WHERE
  id_analisis = ?;
UPDATE Treatment SET 
  id_examination = ?, 
  id_drug = ?, 
  dosage = ?, 
  quantity = ?, 
  duration = ? 
WHERE
  id_treatment = ?;
UPDATE Laboratory_schedule SET 
   
WHERE
  id_laboratory = ? AND week_day = ? AND time = ?;
UPDATE Laboratory SET 
  lab_title = ? 
WHERE
  id_laboratory = ?;
UPDATE Doctor_schedule SET 
   
WHERE
  id_doctor = ? AND week_day = ? AND time = ?;
UPDATE Doctor SET 
  first_name = ?, 
  last_name = ?, 
  patronymic = ?, 
  id_specialization = ? 
WHERE
  id_doctor = ?;
UPDATE Diagnosis SET 
  id_examination = ?, 
  id_illness = ? 
WHERE
  id_diagnosis = ?;
UPDATE Laboratory_reception SET 
  id_examination = ?, 
  id_laboratory = ?, 
  analysis_date = ?, 
  result = ?, 
  id_analisis = ? 
WHERE
  id_laboratory_reception = ?;
UPDATE Doctor_reception SET 
  id_medical_history = ?, 
  id_doctor = ?, 
  "date" = ?, 
  time = ? 
WHERE
  id_doctor_reception = ?;
UPDATE Examination SET 
  id_doctor_reception = ?, 
  complaints = ? 
WHERE
  id_examination = ?;
UPDATE Medical_History SET 
  id_medical_card = ?, 
  id_history_type = ?, 
  description = ? 
WHERE
  id_medical_history = ?;
UPDATE Patient SET 
  first_name = ?, 
  last_name = ?, 
  patronymic = ?, 
  id_sex = ?, 
  date_birth = ?, 
  telephone = ?, 
  passport = ?, 
  insurance_number = ? 
WHERE
  id_patient = ?;
UPDATE Medical_card SET 
  id_patient = ?, 
  id_state = ? 
WHERE
  id_medical_card = ?;

  
  
  
  
  
  
  
  
  DELETE FROM Specialization 
  WHERE id_specialization = ?;
DELETE FROM History_type 
  WHERE id_history_type = ?;
DELETE FROM Rates_chronyc_illnesses 
  WHERE id_medical_card = ? AND id_illness = ?;
DELETE FROM Rates_allergens 
  WHERE id_medical_card = ? AND id_allergens = ?;
DELETE FROM Rates_blood 
  WHERE id_medical_card = ? AND id_blood_group = ? AND id_rh = ?;
DELETE FROM Card_state 
  WHERE id_state = ?;
DELETE FROM Sex 
  WHERE id_sex = ?;
DELETE FROM time 
  WHERE id_time = ?;
DELETE FROM week_day 
  WHERE id_week_day = ?;
DELETE FROM Rates_vaccinations 
  WHERE id_medical_card = ? AND id_vaccination = ?;
DELETE FROM Rates_drugs 
  WHERE id_medical_card = ? AND id_drug = ?;
DELETE FROM Vaccinations 
  WHERE id_vaccination = ?;
DELETE FROM Drugs 
  WHERE id_drug = ?;
DELETE FROM Allergy_group 
  WHERE id_allergy = ?;
DELETE FROM Allergens 
  WHERE id_allergens = ?;
DELETE FROM Group_illnesses 
  WHERE id_group = ?;
DELETE FROM Illnesses 
  WHERE id_illness = ?;
DELETE FROM RH_factor 
  WHERE id_rh = ?;
DELETE FROM Blood_group 
  WHERE id_blood_group = ?;
DELETE FROM Analisis 
  WHERE id_analisis = ?;
DELETE FROM Treatment 
  WHERE id_treatment = ?;
DELETE FROM Laboratory_schedule 
  WHERE id_laboratory = ? AND week_day = ? AND time = ?;
DELETE FROM Laboratory 
  WHERE id_laboratory = ?;
DELETE FROM Doctor_schedule 
  WHERE id_doctor = ? AND week_day = ? AND time = ?;
DELETE FROM Doctor 
  WHERE id_doctor = ?;
DELETE FROM Diagnosis 
  WHERE id_diagnosis = ?;
DELETE FROM Laboratory_reception 
  WHERE id_laboratory_reception = ?;
DELETE FROM Doctor_reception 
  WHERE id_doctor_reception = ?;
DELETE FROM Examination 
  WHERE id_examination = ?;
DELETE FROM Medical_History 
  WHERE id_medical_history = ?;
DELETE FROM Patient 
  WHERE id_patient = ?;
DELETE FROM Medical_card 
  WHERE id_medical_card = ?;
