
CREATE TABLE Specialization (
  id_specialization number(10) NOT NULL, 
  spec_title        number(10) NOT NULL UNIQUE, 
  PRIMARY KEY (id_specialization));
CREATE TABLE History_type (
  id_history_type number(10) NOT NULL, 
  type_title      varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_history_type));
CREATE TABLE Rates_chronyc_illnesses (
  id_medical_card number(10) NOT NULL, 
  id_illness      number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card, 
  id_illness));
CREATE TABLE Rates_allergens (
  id_medical_card number(10) NOT NULL, 
  id_allergens    number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card, 
  id_allergens));
CREATE TABLE Rates_blood (
  id_medical_card number(10) NOT NULL, 
  id_blood_group  number(10) NOT NULL, 
  id_rh           number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card, 
  id_blood_group, 
  id_rh));
CREATE TABLE Card_state (
  id_state    number(10) NOT NULL, 
  state_title varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_state));
CREATE TABLE Sex (
  id_sex    number(10) NOT NULL, 
  sex_title varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_sex));
CREATE TABLE time (
  id_time number(10) NOT NULL, 
  time    timestamp(7) NOT NULL UNIQUE, 
  PRIMARY KEY (id_time));
CREATE TABLE week_day (
  id_week_day number(10) NOT NULL, 
  day         varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_week_day));
CREATE TABLE Rates_vaccinations (
  id_medical_card number(10) NOT NULL, 
  id_vaccination  number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card, 
  id_vaccination));
CREATE TABLE Rates_drugs (
  id_medical_card number(10) NOT NULL, 
  id_drug         number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card, 
  id_drug));
CREATE TABLE Vaccinations (
  id_vaccination    number(10) NOT NULL, 
  vaccination_title varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_vaccination));
CREATE TABLE Drugs (
  id_drug    number(10) NOT NULL, 
  drug_title varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_drug));
CREATE TABLE Allergy_group (
  id_allergy       number(10) NOT NULL, 
  allergy_gr_title varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_allergy));
CREATE TABLE Allergens (
  id_allergens    number(10) NOT NULL, 
  allergens_title varchar2(255) NOT NULL UNIQUE, 
  id_allergy      number(10) NOT NULL, 
  PRIMARY KEY (id_allergens));
CREATE TABLE Group_illnesses (
  id_group          number(10) NOT NULL, 
  ilnesses_gr_title varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_group));
CREATE TABLE Illnesses (
  id_illness      number(10) NOT NULL, 
  illnesses_title varchar2(255) NOT NULL UNIQUE, 
  id_group        number(10) NOT NULL, 
  PRIMARY KEY (id_illness));
CREATE TABLE RH_factor (
  id_rh    number(10) NOT NULL, 
  rh_title varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_rh));
CREATE TABLE Blood_group (
  id_blood_group number(10) NOT NULL, 
  group_title    varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_blood_group));
CREATE TABLE Analisis (
  id_analisis     number(10) NOT NULL, 
  analysis_tittle varchar2(255) NOT NULL, 
  PRIMARY KEY (id_analisis));
CREATE TABLE Treatment (
  id_treatment   number(10) NOT NULL, 
  id_examination number(10) NOT NULL, 
  id_drug        number(10) NOT NULL, 
  dosage         number(10) NOT NULL, 
  quantity       number(10) NOT NULL, 
  duration       number(10) NOT NULL, 
  PRIMARY KEY (id_treatment));
CREATE TABLE Laboratory_schedule (
  id_laboratory number(10) NOT NULL, 
  week_day      number(10) NOT NULL, 
  time          number(10) NOT NULL, 
  PRIMARY KEY (id_laboratory, 
  week_day, 
  time));
CREATE TABLE Laboratory (
  id_laboratory number(10) NOT NULL, 
  lab_title     varchar2(255) NOT NULL, 
  PRIMARY KEY (id_laboratory));
CREATE TABLE Doctor_schedule (
  id_doctor number(10) NOT NULL, 
  week_day  number(10) NOT NULL, 
  time      number(10) NOT NULL, 
  PRIMARY KEY (id_doctor, 
  week_day, 
  time));
CREATE TABLE Doctor (
  id_doctor         number(10) NOT NULL, 
  first_name        varchar2(255) NOT NULL, 
  last_name         varchar2(255) NOT NULL, 
  patronymic        varchar2(255) NOT NULL, 
  id_specialization number(10) NOT NULL, 
  PRIMARY KEY (id_doctor));
CREATE TABLE Diagnosis (
  id_diagnosis   number(10) NOT NULL, 
  id_examination number(10) NOT NULL, 
  id_illness     number(10) NOT NULL, 
  PRIMARY KEY (id_diagnosis));
CREATE TABLE Laboratory_reception (
  id_laboratory_reception number(10) NOT NULL, 
  id_examination          number(10) NOT NULL, 
  id_laboratory           number(10) NOT NULL, 
  analysis_date           date NOT NULL, 
  result                  varchar2(255) NOT NULL, 
  id_analisis             number(10) NOT NULL, 
  PRIMARY KEY (id_laboratory_reception));
CREATE TABLE Doctor_reception (
  id_doctor_reception number(10) NOT NULL, 
  id_medical_history  number(10) NOT NULL, 
  id_doctor           number(10) NOT NULL, 
  "date"              date NOT NULL, 
  time                timestamp(7) NOT NULL, 
  PRIMARY KEY (id_doctor_reception));
CREATE TABLE Examination (
  id_examination      number(10) NOT NULL, 
  id_doctor_reception number(10) NOT NULL, 
  complaints          varchar2(255) NOT NULL, 
  PRIMARY KEY (id_examination));
CREATE TABLE Medical_History (
  id_medical_history number(10) NOT NULL, 
  id_medical_card    number(10) NOT NULL, 
  id_history_type    number(10) NOT NULL, 
  description        varchar2(255) NOT NULL, 
  PRIMARY KEY (id_medical_history));
CREATE TABLE Patient (
  id_patient       number(10) NOT NULL, 
  first_name       varchar2(255) NOT NULL, 
  last_name        varchar2(255) NOT NULL, 
  patronymic       varchar2(255) NOT NULL, 
  id_sex           number(10) NOT NULL, 
  date_birth       date NOT NULL, 
  telephone        varchar2(255) NOT NULL, 
  passport         varchar2(255) NOT NULL UNIQUE, 
  insurance_number varchar2(255) NOT NULL UNIQUE, 
  PRIMARY KEY (id_patient));
CREATE TABLE Medical_card (
  id_medical_card number(10) NOT NULL, 
  id_patient      number(10) NOT NULL, 
  id_state        number(10) NOT NULL, 
  PRIMARY KEY (id_medical_card));
ALTER TABLE Treatment ADD CONSTRAINT FKTreatment666507 FOREIGN KEY (id_drug) REFERENCES Drugs (id_drug);
ALTER TABLE Doctor ADD CONSTRAINT FKDoctor546800 FOREIGN KEY (id_specialization) REFERENCES Specialization (id_specialization);
ALTER TABLE Medical_History ADD CONSTRAINT FKMedical_Hi464416 FOREIGN KEY (id_history_type) REFERENCES History_type (id_history_type);
ALTER TABLE Rates_chronyc_illnesses ADD CONSTRAINT FKRates_chro774805 FOREIGN KEY (id_illness) REFERENCES Illnesses (id_illness);
ALTER TABLE Rates_chronyc_illnesses ADD CONSTRAINT FKRates_chro715883 FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
ALTER TABLE Rates_allergens ADD CONSTRAINT FKRates_alle649374 FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
ALTER TABLE Rates_allergens ADD CONSTRAINT FKRates_alle564204 FOREIGN KEY (id_allergens) REFERENCES Allergens (id_allergens);
ALTER TABLE Rates_blood ADD CONSTRAINT FKRates_bloo564576 FOREIGN KEY (id_rh) REFERENCES RH_factor (id_rh);
ALTER TABLE Rates_blood ADD CONSTRAINT FKRates_bloo118078 FOREIGN KEY (id_blood_group) REFERENCES Blood_group (id_blood_group);
ALTER TABLE Rates_blood ADD CONSTRAINT FKRates_bloo385557 FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
ALTER TABLE Rates_drugs ADD CONSTRAINT FKRates_drug354234 FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
ALTER TABLE Rates_vaccinations ADD CONSTRAINT FKRates_vacc743592 FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
ALTER TABLE Rates_vaccinations ADD CONSTRAINT FKRates_vacc410689 FOREIGN KEY (id_vaccination) REFERENCES Vaccinations (id_vaccination);
ALTER TABLE Medical_card ADD CONSTRAINT FKMedical_ca177479 FOREIGN KEY (id_state) REFERENCES Card_state (id_state);
ALTER TABLE Patient ADD CONSTRAINT FKPatient904186 FOREIGN KEY (id_sex) REFERENCES Sex (id_sex);
ALTER TABLE Doctor_schedule ADD CONSTRAINT FKDoctor_sch167436 FOREIGN KEY (time) REFERENCES time (id_time);
ALTER TABLE Doctor_schedule ADD CONSTRAINT FKDoctor_sch453833 FOREIGN KEY (week_day) REFERENCES week_day (id_week_day);
ALTER TABLE Laboratory_schedule ADD CONSTRAINT FKLaboratory671335 FOREIGN KEY (time) REFERENCES time (id_time);
ALTER TABLE Laboratory_schedule ADD CONSTRAINT FKLaboratory949933 FOREIGN KEY (week_day) REFERENCES week_day (id_week_day);
ALTER TABLE Diagnosis ADD CONSTRAINT FKDiagnosis988087 FOREIGN KEY (id_illness) REFERENCES Illnesses (id_illness);
ALTER TABLE Rates_drugs ADD CONSTRAINT FKRates_drug819718 FOREIGN KEY (id_drug) REFERENCES Drugs (id_drug);
ALTER TABLE Allergens ADD CONSTRAINT FKAllergens856097 FOREIGN KEY (id_allergy) REFERENCES Allergy_group (id_allergy);
ALTER TABLE Illnesses ADD CONSTRAINT FKIllnesses538415 FOREIGN KEY (id_group) REFERENCES Group_illnesses (id_group);
ALTER TABLE Examination ADD CONSTRAINT FKExaminatio347613 FOREIGN KEY (id_doctor_reception) REFERENCES Doctor_reception (id_doctor_reception);
ALTER TABLE Laboratory_reception ADD CONSTRAINT FKLaboratory460270 FOREIGN KEY (id_analisis) REFERENCES Analisis (id_analisis);
ALTER TABLE Treatment ADD CONSTRAINT FKTreatment564467 FOREIGN KEY (id_examination) REFERENCES Examination (id_examination);
ALTER TABLE Laboratory_reception ADD CONSTRAINT FKLaboratory982749 FOREIGN KEY (id_examination) REFERENCES Examination (id_examination);
ALTER TABLE Laboratory_reception ADD CONSTRAINT FKLaboratory303820 FOREIGN KEY (id_laboratory) REFERENCES Laboratory (id_laboratory);
ALTER TABLE Laboratory_schedule ADD CONSTRAINT FKLaboratory807718 FOREIGN KEY (id_laboratory) REFERENCES Laboratory (id_laboratory);
ALTER TABLE Doctor_schedule ADD CONSTRAINT FKDoctor_sch991574 FOREIGN KEY (id_doctor) REFERENCES Doctor (id_doctor);
ALTER TABLE Doctor_reception ADD CONSTRAINT FKDoctor_rec718297 FOREIGN KEY (id_doctor) REFERENCES Doctor (id_doctor);
ALTER TABLE Diagnosis ADD CONSTRAINT FKDiagnosis227470 FOREIGN KEY (id_examination) REFERENCES Examination (id_examination);
ALTER TABLE Doctor_reception ADD CONSTRAINT FKDoctor_rec37530 FOREIGN KEY (id_medical_history) REFERENCES Medical_History (id_medical_history);
ALTER TABLE Medical_History ADD CONSTRAINT FKMedical_Hi110714 FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
ALTER TABLE Medical_card ADD CONSTRAINT FKMedical_ca186214 FOREIGN KEY (id_patient) REFERENCES Patient (id_patient);
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
