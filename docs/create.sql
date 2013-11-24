CREATE TABLE Card_state (
  id_state    number(10) NOT NULL, 
  state_title varchar2(15) NOT NULL UNIQUE, 
  PRIMARY KEY (id_state));
  
CREATE TABLE Sex (
  id_sex    number(10) NOT NULL, 
  sex_title varchar2(15) NOT NULL UNIQUE, 
  PRIMARY KEY (id_sex));
  
CREATE TABLE Patient (
  id_patient       number(10) NOT NULL, 
  first_name       varchar2(50) NOT NULL, 
  last_name        varchar2(50) NOT NULL, 
  patronymic       varchar2(50) NOT NULL, 
  id_sex           number(10) NOT NULL, 
  date_birth       date NOT NULL, 
  telephone        varchar2(50) NOT NULL, 
  passport         varchar2(50) NOT NULL UNIQUE, 
  insurance_number varchar2(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id_patient));
  
ALTER TABLE Patient ADD CONSTRAINT FKPatient_sex FOREIGN KEY (id_sex) REFERENCES Sex (id_sex);

  
CREATE TABLE Medical_card (
  id_medical_card number(10) NOT NULL, 
  id_patient      number(10) NOT NULL, 
  id_state        number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card));
  
ALTER TABLE Medical_card ADD CONSTRAINT FKMedical_card_state FOREIGN KEY (id_state) REFERENCES Card_state (id_state);
ALTER TABLE Medical_card ADD CONSTRAINT FKMedical_card_patient FOREIGN KEY (id_patient) REFERENCES Patient (id_patient);

CREATE TABLE History_type (
  id_history_type number(10) NOT NULL, 
  type_title      varchar2(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id_history_type));
 
CREATE TABLE Medical_History (
  id_medical_history number(10) NOT NULL, 
  id_medical_card    number(10) NOT NULL, 
  id_history_type    number(10) NOT NULL, 
  description        varchar2(255) NOT NULL, 
  PRIMARY KEY (id_medical_history));
 
ALTER TABLE Medical_History ADD CONSTRAINT FKMedical_History_type FOREIGN KEY (id_history_type) REFERENCES History_type (id_history_type);
ALTER TABLE Medical_History ADD CONSTRAINT FKMedical_History_card FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);

CREATE TABLE Specialization (
  id_specialization number(10) NOT NULL, 
  spec_title        varchar2(50)  NOT NULL UNIQUE, 
  PRIMARY KEY (id_specialization));
  
CREATE TABLE Doctor (
  id_doctor         number(10) NOT NULL, 
  first_name        varchar2(50) NOT NULL, 
  last_name         varchar2(50) NOT NULL, 
  patronymic        varchar2(50) NOT NULL, 
  id_specialization number(10) NOT NULL, 
  PRIMARY KEY (id_doctor));
  
ALTER TABLE Doctor ADD CONSTRAINT FKDoctor_spec FOREIGN KEY (id_specialization) REFERENCES Specialization (id_specialization);
 
CREATE TABLE Vaccinations (
  id_vaccination    number(10) NOT NULL, 
  vaccination_title varchar2(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id_vaccination));
  
  
CREATE TABLE Drugs (
  id_drug    number(10) NOT NULL, 
  drug_title varchar2(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id_drug));
  
CREATE TABLE Allergy_group (
  id_allergy       number(10) NOT NULL, 
  allergy_gr_title varchar2(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id_allergy));
  
CREATE TABLE Allergens (
  id_allergens    number(10) NOT NULL, 
  allergens_title varchar2(50) NOT NULL UNIQUE, 
  id_allergy      number(10) NOT NULL, 
  PRIMARY KEY (id_allergens));
  
 ALTER TABLE Allergens ADD CONSTRAINT FKAllergens_gr FOREIGN KEY (id_allergy) REFERENCES Allergy_group (id_allergy);

CREATE TABLE Group_illnesses (
  id_group          number(10) NOT NULL, 
  ilnesses_gr_title varchar2(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id_group));
  
CREATE TABLE Illnesses (
  id_illness      number(10) NOT NULL, 
  illnesses_title varchar2(50) NOT NULL UNIQUE, 
  id_group        number(10) NOT NULL, 
  PRIMARY KEY (id_illness));
  
ALTER TABLE Illnesses ADD CONSTRAINT FKIllnesses_gr FOREIGN KEY (id_group) REFERENCES Group_illnesses (id_group);
  
CREATE TABLE RH_factor (
  id_rh    number(10) NOT NULL, 
  rh_title varchar2(3) NOT NULL UNIQUE, 
  PRIMARY KEY (id_rh));
    
CREATE TABLE Blood_group (
  id_blood_group number(10) NOT NULL, 
  group_title    varchar2(10) NOT NULL UNIQUE, 
  PRIMARY KEY (id_blood_group));
  
CREATE TABLE Rates_chronyc_illnesses (
  id_medical_card number(10) NOT NULL, 
  id_illness      number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card,id_illness));
  
ALTER TABLE Rates_chronyc_illnesses ADD CONSTRAINT FKRates_chronyc_illnesses_il FOREIGN KEY (id_illness) REFERENCES Illnesses (id_illness);
ALTER TABLE Rates_chronyc_illnesses ADD CONSTRAINT FKRates_chronyc_illnesses_card FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
  
  
CREATE TABLE Rates_allergens (
  id_medical_card number(10) NOT NULL, 
  id_allergens    number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card,id_allergens));
  
ALTER TABLE Rates_allergens ADD CONSTRAINT FKRates_allergens_card FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
ALTER TABLE Rates_allergens ADD CONSTRAINT FKRates_allergens_al FOREIGN KEY (id_allergens) REFERENCES Allergens (id_allergens);
  
CREATE TABLE Rates_blood (
  id_medical_card number(10) NOT NULL, 
  id_blood_group  number(10) NOT NULL, 
  id_rh           number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card,id_blood_group,id_rh));
  
ALTER TABLE Rates_blood ADD CONSTRAINT FKRates_blood_rh FOREIGN KEY (id_rh) REFERENCES RH_factor (id_rh);
ALTER TABLE Rates_blood ADD CONSTRAINT FKRates_blood_gr FOREIGN KEY (id_blood_group) REFERENCES Blood_group (id_blood_group);
ALTER TABLE Rates_blood ADD CONSTRAINT FKRates_blood_card FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
  
CREATE TABLE Rates_vaccinations (
  id_medical_card number(10) NOT NULL, 
  id_vaccination  number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card, id_vaccination));
  
ALTER TABLE Rates_vaccinations ADD CONSTRAINT FKRates_vaccinations_card FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
ALTER TABLE Rates_vaccinations ADD CONSTRAINT FKRates_vaccinations_vac FOREIGN KEY (id_vaccination) REFERENCES Vaccinations (id_vaccination);
  
CREATE TABLE Rates_drugs (
  id_medical_card number(10) NOT NULL, 
  id_drug         number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card, id_drug));
  
ALTER TABLE Rates_drugs ADD CONSTRAINT FKRates_drug_card FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
ALTER TABLE Rates_drugs ADD CONSTRAINT FKRates_drug_dr FOREIGN KEY (id_drug) REFERENCES Drugs (id_drug);
 
CREATE TABLE work_time (
  id_time number(10) NOT NULL, 
  work_time  varchar2(10) NOT NULL UNIQUE, 
  PRIMARY KEY (id_time));
  
  
CREATE TABLE week_day (
  id_week_day number(10) NOT NULL, 
  week_day    varchar2(20) NOT NULL UNIQUE, 
  PRIMARY KEY (id_week_day));
    
  
CREATE TABLE Analisis (
  id_analisis     number(10) NOT NULL, 
  analysis_tittle varchar2(50) NOT NULL, 
  PRIMARY KEY (id_analisis));
  

CREATE TABLE Laboratory (
  id_laboratory number(10) NOT NULL, 
  lab_title     varchar2(50) NOT NULL, 
  PRIMARY KEY (id_laboratory));
  
CREATE TABLE Laboratory_schedule (
  id_laboratory number(10) NOT NULL, 
  week_day      number(10) NOT NULL, 
  work_time     number(10) NOT NULL, 
  PRIMARY KEY (id_laboratory,week_day,work_time));

ALTER TABLE Laboratory_schedule ADD CONSTRAINT FKLaboratory_time FOREIGN KEY (work_time) REFERENCES work_time (id_time);
ALTER TABLE Laboratory_schedule ADD CONSTRAINT FKLaboratory_day FOREIGN KEY (week_day) REFERENCES week_day (id_week_day);
ALTER TABLE Laboratory_schedule ADD CONSTRAINT FKLaboratory_lab FOREIGN KEY (id_laboratory) REFERENCES Laboratory (id_laboratory);


  
CREATE TABLE Doctor_schedule (
  id_doctor number(10) NOT NULL, 
  week_day  number(10) NOT NULL, 
  work_time number(10) NOT NULL, 
  PRIMARY KEY (id_doctor, week_day, work_time));
  
ALTER TABLE Doctor_schedule ADD CONSTRAINT FKDoctor_schedule_time FOREIGN KEY (work_time) REFERENCES work_time (id_time);
ALTER TABLE Doctor_schedule ADD CONSTRAINT FKDoctor_schedule_day FOREIGN KEY (week_day) REFERENCES week_day (id_week_day);
ALTER TABLE Doctor_schedule ADD CONSTRAINT FKDoctor_schedule_doc FOREIGN KEY (id_doctor) REFERENCES Doctor (id_doctor);

 
  
CREATE TABLE Doctor_reception (
  id_doctor_reception number(10) NOT NULL, 
  id_medical_history  number(10) NOT NULL, 
  id_doctor           number(10) NOT NULL, 
  reception_date      date NOT NULL, 
  reception_time      varchar2(10) NOT NULL, 
  PRIMARY KEY (id_doctor_reception));
  
 ALTER TABLE Doctor_reception ADD CONSTRAINT FKDoctor_reception_doc FOREIGN KEY (id_doctor) REFERENCES Doctor (id_doctor);
 ALTER TABLE Doctor_reception ADD CONSTRAINT FKDoctor_reception_history FOREIGN KEY (id_medical_history) REFERENCES Medical_History (id_medical_history);

CREATE TABLE Examination (
  id_examination      number(10) NOT NULL, 
  id_doctor_reception number(10) NOT NULL, 
  complaints          varchar2(255) NOT NULL, 
  PRIMARY KEY (id_examination));
  
  ALTER TABLE Examination ADD CONSTRAINT FKExaminatio_doc FOREIGN KEY (id_doctor_reception) REFERENCES Doctor_reception (id_doctor_reception);

 CREATE TABLE Laboratory_reception (
  id_laboratory_reception number(10) NOT NULL, 
  id_examination          number(10) NOT NULL, 
  id_laboratory           number(10) NOT NULL, 
  analysis_date           date NOT NULL, 
  analysis_result         varchar2(255) NOT NULL, 
  id_analisis             number(10) NOT NULL, 
  PRIMARY KEY (id_laboratory_reception));
  
ALTER TABLE Laboratory_reception ADD CONSTRAINT FKLaboratory_reception_an FOREIGN KEY (id_analisis) REFERENCES Analisis (id_analisis);
ALTER TABLE Laboratory_reception ADD CONSTRAINT FKLaboratory_reception_exam FOREIGN KEY (id_examination) REFERENCES Examination (id_examination);
ALTER TABLE Laboratory_reception ADD CONSTRAINT FKLaboratory_reception_lab FOREIGN KEY (id_laboratory) REFERENCES Laboratory (id_laboratory);

CREATE TABLE Treatment (
  id_treatment   number(10) NOT NULL, 
  id_examination number(10) NOT NULL, 
  id_drug        number(10) NOT NULL, 
  dosage         number(10,2) NOT NULL, 
  quantity       number(10) NOT NULL, 
  duration       number(10) NOT NULL, 
  PRIMARY KEY (id_treatment));
 
ALTER TABLE Treatment ADD CONSTRAINT FKTreatment_drug FOREIGN KEY (id_drug) REFERENCES Drugs (id_drug);
ALTER TABLE Treatment ADD CONSTRAINT FKTreatment_exam FOREIGN KEY (id_examination) REFERENCES Examination (id_examination);

CREATE TABLE Diagnosis (
  id_diagnosis   number(10) NOT NULL, 
  id_examination number(10) NOT NULL, 
  id_illness     number(10) NOT NULL, 
  PRIMARY KEY (id_diagnosis));
 
ALTER TABLE Diagnosis ADD CONSTRAINT FKDiagnosis_il FOREIGN KEY (id_illness) REFERENCES Illnesses (id_illness);
ALTER TABLE Diagnosis ADD CONSTRAINT FKDiagnosis_exam FOREIGN KEY (id_examination) REFERENCES Examination (id_examination);

CREATE SEQUENCE seq_Specialization;
CREATE SEQUENCE seq_History_type;
CREATE SEQUENCE seq_Card_state;
CREATE SEQUENCE seq_Sex;
CREATE SEQUENCE seq_time;
CREATE SEQUENCE seq_week_day;
CREATE SEQUENCE seq_Vaccinations;
CREATE SEQUENCE seq_Drugs;
CREATE SEQUENCE seq_Allergy_group;
CREATE SEQUENCE seq_Allergens;
CREATE SEQUENCE seq_Group_illnesses;
CREATE SEQUENCE seq_Illnesses;
CREATE SEQUENCE seq_RH_factor;
CREATE SEQUENCE seq_Blood_group;
CREATE SEQUENCE seq_Analisis;
CREATE SEQUENCE seq_Treatment;
CREATE SEQUENCE seq_Laboratory;
CREATE SEQUENCE seq_Doctor;
CREATE SEQUENCE seq_Diagnosis;
CREATE SEQUENCE seq_Laboratory_reception;
CREATE SEQUENCE seq_Doctor_reception;
CREATE SEQUENCE seq_Examination;
CREATE SEQUENCE seq_Medical_History;
CREATE SEQUENCE seq_Patient;
CREATE SEQUENCE seq_Medical_card;
