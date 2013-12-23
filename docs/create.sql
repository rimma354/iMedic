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
  last_name        varchar2(50) NOT NULL, 
  first_name       varchar2(50) NOT NULL, 
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

CREATE TABLE Group_info (
  id_group_info        number(10) NOT NULL, 
  group_title     varchar2(20) NOT NULL UNIQUE, 
  PRIMARY KEY (id_group_info));
  
CREATE TABLE Additional_info (
  id_info         number(10) NOT NULL, 
  id_medical_card number(10) NOT NULL, 
  id_group_info        number(10) NOT NULL, 
  description     varchar2(255) NOT NULL, 
  PRIMARY KEY (id_info));

 ALTER TABLE Additional_info ADD CONSTRAINT FKMAdditional_info_group FOREIGN KEY (id_group_info) REFERENCES Group_info (id_group_info);
 ALTER TABLE Additional_info ADD CONSTRAINT FKMAdditional_info_card FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);
 
CREATE TABLE History_type (
  id_history_type number(10) NOT NULL, 
  type_title      varchar2(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id_history_type));
 
CREATE TABLE Medical_history (
  id_medical_history number(10) NOT NULL, 
  id_medical_card    number(10) NOT NULL, 
  id_history_type    number(10) NOT NULL, 
  description        varchar2(255) NOT NULL, 
  PRIMARY KEY (id_medical_history));
 
ALTER TABLE Medical_history ADD CONSTRAINT FKMedical_history_type FOREIGN KEY (id_history_type) REFERENCES History_type (id_history_type);
ALTER TABLE Medical_history ADD CONSTRAINT FKMedical_history_card FOREIGN KEY (id_medical_card) REFERENCES Medical_card (id_medical_card);

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
 
CREATE TABLE Group_illnesses (
  id_group_illnesses          number(10) NOT NULL, 
  ilnesses_gr_title varchar2(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id_group_illnesses));
  
CREATE TABLE Illnesses (
  id_illness      number(10) NOT NULL, 
  illnesses_title varchar2(50) NOT NULL UNIQUE, 
  id_group_illnesses        number(10) NOT NULL, 
  PRIMARY KEY (id_illness));
  
ALTER TABLE Illnesses ADD CONSTRAINT FKIllnesses_gr FOREIGN KEY (id_group_illnesses) REFERENCES Group_illnesses (id_group_illnesses);

CREATE TABLE Drugs (
  id_drug          number(10) NOT NULL, 
  drug_title       varchar2(50) NOT NULL UNIQUE, 
  PRIMARY KEY (id_drug));

CREATE TABLE Measure (
  id_measure         number(10) NOT NULL, 
  measure_title      varchar2(10) NOT NULL UNIQUE, 
  PRIMARY KEY (id_measure));
  
CREATE TABLE Work_time (
  id_time number(10) NOT NULL, 
  work_time  DATE NOT NULL UNIQUE, 
  PRIMARY KEY (id_time));
  
  
CREATE TABLE Week_day (
  id_week_day number(10) NOT NULL, 
  week_day     varchar2(10) NOT NULL UNIQUE, 
  PRIMARY KEY (id_week_day));
    
  
CREATE TABLE Analysis (
  id_analysis     number(10) NOT NULL, 
  analysis_title varchar2(50) NOT NULL, 
  PRIMARY KEY (id_analysis));
  

CREATE TABLE Laboratory (
  id_laboratory number(10) NOT NULL, 
  lab_title     varchar2(50) NOT NULL, 
  PRIMARY KEY (id_laboratory));
  
CREATE TABLE Laboratory_schedule (
  id_laboratory number(10) NOT NULL, 
  id_week_day      number(10) NOT NULL, 
  id_time     number(10) NOT NULL, 
  PRIMARY KEY (id_laboratory,id_week_day,id_time));

ALTER TABLE Laboratory_schedule ADD CONSTRAINT FKLaboratory_time FOREIGN KEY (id_time) REFERENCES Work_time (id_time);
ALTER TABLE Laboratory_schedule ADD CONSTRAINT FKLaboratory_day FOREIGN KEY (id_week_day) REFERENCES Week_day (id_week_day);
ALTER TABLE Laboratory_schedule ADD CONSTRAINT FKLaboratory_lab FOREIGN KEY (id_laboratory) REFERENCES Laboratory (id_laboratory);


  
CREATE TABLE Doctor_schedule (
  id_doctor number(10) NOT NULL, 
  id_week_day  number(10) NOT NULL, 
  id_time number(10) NOT NULL, 
  PRIMARY KEY (id_doctor, id_week_day, id_time));
  
ALTER TABLE Doctor_schedule ADD CONSTRAINT FKDoctor_schedule_time FOREIGN KEY (id_time) REFERENCES Work_time (id_time);
ALTER TABLE Doctor_schedule ADD CONSTRAINT FKDoctor_schedule_day FOREIGN KEY (id_week_day) REFERENCES Week_day (id_week_day);
ALTER TABLE Doctor_schedule ADD CONSTRAINT FKDoctor_schedule_doc FOREIGN KEY (id_doctor) REFERENCES Doctor (id_doctor);

 
  
CREATE TABLE Doctor_reception (
  id_doctor_reception number(10) NOT NULL, 
  id_medical_history  number(10) NOT NULL, 
  id_doctor           number(10) NOT NULL, 
  reception_date      date NOT NULL, 
  PRIMARY KEY (id_doctor_reception));
  
 ALTER TABLE Doctor_reception ADD CONSTRAINT FKDoctor_reception_doc FOREIGN KEY (id_doctor) REFERENCES Doctor (id_doctor);
 ALTER TABLE Doctor_reception ADD CONSTRAINT FKDoctor_reception_history FOREIGN KEY (id_medical_history) REFERENCES Medical_history (id_medical_history);

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
  id_analysis             number(10) NOT NULL, 
  PRIMARY KEY (id_laboratory_reception));
  
ALTER TABLE Laboratory_reception ADD CONSTRAINT FKLaboratory_reception_an FOREIGN KEY (id_analysis) REFERENCES Analysis (id_analysis);
ALTER TABLE Laboratory_reception ADD CONSTRAINT FKLaboratory_reception_exam FOREIGN KEY (id_examination) REFERENCES Examination (id_examination);
ALTER TABLE Laboratory_reception ADD CONSTRAINT FKLaboratory_reception_lab FOREIGN KEY (id_laboratory) REFERENCES Laboratory (id_laboratory);

CREATE TABLE Treatment (
  id_treatment   number(10) NOT NULL, 
  id_examination number(10) NOT NULL, 
  id_drug        number(10) NOT NULL,
  id_measure     number(10) NOT NULL,
  dosage         number(10,2) NOT NULL, 
  quantity       number(10) NOT NULL, 
  duration       number(10) NOT NULL, 
  PRIMARY KEY (id_treatment));
 
ALTER TABLE Treatment ADD CONSTRAINT FKTreatment_drug FOREIGN KEY (id_drug) REFERENCES Drugs (id_drug);
ALTER TABLE Treatment ADD CONSTRAINT FKTreatment_exam FOREIGN KEY (id_examination) REFERENCES Examination (id_examination);
ALTER TABLE Treatment ADD CONSTRAINT FKTreatment_meas FOREIGN KEY (id_measure) REFERENCES Measure (id_measure);

CREATE TABLE Diagnosis (
  id_diagnosis   number(10) NOT NULL, 
  id_examination number(10) NOT NULL, 
  id_illness     number(10) NOT NULL, 
  PRIMARY KEY (id_diagnosis));
 
ALTER TABLE Diagnosis ADD CONSTRAINT FKDiagnosis_il FOREIGN KEY (id_illness) REFERENCES Illnesses (id_illness);
ALTER TABLE Diagnosis ADD CONSTRAINT FKDiagnosis_exam FOREIGN KEY (id_examination) REFERENCES Examination (id_examination);

CREATE SEQUENCE id_specialization;
CREATE SEQUENCE id_history_type;
CREATE SEQUENCE id_state;
CREATE SEQUENCE id_sex;
CREATE SEQUENCE id_time;
CREATE SEQUENCE id_week_day;
CREATE SEQUENCE id_drug;
CREATE SEQUENCE id_measure;
CREATE SEQUENCE id_group_illnesses;
CREATE SEQUENCE id_illness;
CREATE SEQUENCE id_analysis;
CREATE SEQUENCE id_treatment;
CREATE SEQUENCE id_laboratory;
CREATE SEQUENCE id_doctor;
CREATE SEQUENCE id_diagnosis;
CREATE SEQUENCE id_laboratory_reception;
CREATE SEQUENCE id_doctor_reception;
CREATE SEQUENCE id_examination;
CREATE SEQUENCE id_medical_history;
CREATE SEQUENCE id_patient;
CREATE SEQUENCE id_medical_card;
CREATE SEQUENCE id_group_info;
CREATE SEQUENCE id_info;


