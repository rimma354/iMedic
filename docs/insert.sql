--Card_state(id_state, state_title)
INSERT INTO Card_state VALUES (id_state.nextval, 'Open');
INSERT INTO Card_state VALUES (id_state.nextval, 'Close');

--Sex(id_sex, sex_title)
INSERT INTO Sex VALUES (id_sex.nextval, 'Men');
INSERT INTO Sex VALUES (id_sex.nextval, 'Women');

--Patient(id_patient,last_name,first_name,patronymic,id_sex, date_birth, telephone,passport,insurance_number)
INSERT INTO Patient VALUES (id_patient.nextval,'Ivanov','Ivan','Ivanovich',1,TO_DATE('1981-03-17', 'YYYY-MM-DD'),380481234560,1111222220,0123456780);
INSERT INTO Patient VALUES (id_patient.nextval,'Pavlova','Tatiana','Viacheslavovna',2,TO_DATE('1978-11-14', 'YYYY-MM-DD'),380481234561,1111222221,0123456781);
INSERT INTO Patient VALUES (id_patient.nextval,'Gerasimov','Nikolay','Grigorievich',1,TO_DATE('1990-02-06', 'YYYY-MM-DD'),380481234562,1111222222,0123456782);
INSERT INTO Patient VALUES (id_patient.nextval,'Abduliva','Evgenia','Sergeevna',2,TO_DATE('1984-05-12', 'YYYY-MM-DD'),380481234563,1111222223,0123456783);
INSERT INTO Patient VALUES (id_patient.nextval,'Demitrov','Victor','Alexandrovich',1,TO_DATE('1977-08-19', 'YYYY-MM-DD'),380481234564,1111222224,0123456784);
INSERT INTO Patient VALUES (id_patient.nextval,'Volkov','Sergey','Ivanovich',1,TO_DATE('1992-09-11', 'YYYY-MM-DD'),380481234565,1111222225,0123456785);
INSERT INTO Patient VALUES (id_patient.nextval,'Danilov','Sergey','Valentinovich',1,TO_DATE('1990-01-19', 'YYYY-MM-DD'),380481234566,1111222226,0123456786);
INSERT INTO Patient VALUES (id_patient.nextval,'Smirnov','Konstantin','Pavlovich',1,TO_DATE('1981-11-17', 'YYYY-MM-DD'),380481234567,1111222227,0123456787);
INSERT INTO Patient VALUES (id_patient.nextval,'Katina','Elena','Petrovna',2,TO_DATE('1964-10-22', 'YYYY-MM-DD'),380481234568,1111222228,0123456788);
INSERT INTO Patient VALUES (id_patient.nextval,'Sidorava','Valentina','Mihaylovna',2,TO_DATE('1993-07-28', 'YYYY-MM-DD'),380481234569,1111222229,0123456789);
INSERT INTO Patient VALUES (id_patient.nextval,'Ivanov','Oleg','Sergeevich',1,TO_DATE('1990-08-12', 'YYYY-MM-DD'),380487778890,1111222230,0123456790);
--Medical_card (id_medical_card,id_patient,id_state)
INSERT INTO Medical_card VALUES (id_medical_card.nextval,1,1);
INSERT INTO Medical_card VALUES (id_medical_card.nextval,2,1);
INSERT INTO Medical_card VALUES (id_medical_card.nextval,3,1);
INSERT INTO Medical_card VALUES (id_medical_card.nextval,4,1);
INSERT INTO Medical_card VALUES (id_medical_card.nextval,5,1);
INSERT INTO Medical_card VALUES (id_medical_card.nextval,6,1);
INSERT INTO Medical_card VALUES (id_medical_card.nextval,7,1);
INSERT INTO Medical_card VALUES (id_medical_card.nextval,8,1);
INSERT INTO Medical_card VALUES (id_medical_card.nextval,9,1);
INSERT INTO Medical_card VALUES (id_medical_card.nextval,10,1);
INSERT INTO Medical_card VALUES (id_medical_card.nextval,11,1);
--Group_info (id_group_info,group_title)
INSERT INTO Group_info VALUES (id_group_info.nextval,'Allergy');
INSERT INTO Group_info VALUES (id_group_info.nextval,'Blood_group');
INSERT INTO Group_info VALUES (id_group_info.nextval,'Chronyc_illnesses');
INSERT INTO Group_info VALUES (id_group_info.nextval,'Intolerance');
INSERT INTO Group_info VALUES (id_group_info.nextval,'RH_factor');
INSERT INTO Group_info VALUES (id_group_info.nextval,'Vaccinations');

--Additional_info (id_info,id_medical_card,id_group,description)
INSERT INTO Additional_info VALUES (id_info.nextval,1,1,'The chocolate');
INSERT INTO Additional_info VALUES (id_info.nextval,2,2,'I');
INSERT INTO Additional_info VALUES (id_info.nextval,3,3,'Insomnia');
INSERT INTO Additional_info VALUES (id_info.nextval,4,4,'Antibiotics');
INSERT INTO Additional_info VALUES (id_info.nextval,5,5,'RH+');
INSERT INTO Additional_info VALUES (id_info.nextval,6,6,'Whooping cough');

--History_type(id_history_type, type_title)
INSERT INTO History_type VALUES (id_history_type.nextval, 'Illness');
INSERT INTO History_type VALUES (id_history_type.nextval, 'Examination');

--Medical_history(id_medical_history,id_medical_card,id_history_type,description)
INSERT INTO Medical_history VALUES (id_medical_history.nextval,1,1,'Scelalgia');
INSERT INTO Medical_history VALUES (id_medical_history.nextval,2,1,'Fever, cough, runny nose');

--Specialization(id_specialization, specialiazation_title)
INSERT INTO Specialization VALUES (id_specialization.nextval, 'Surgeon');
INSERT INTO Specialization VALUES (id_specialization.nextval, 'Therapist');
INSERT INTO Specialization VALUES (id_specialization.nextval, 'ENT');
INSERT INTO Specialization VALUES (id_specialization.nextval, 'Gyn');
INSERT INTO Specialization VALUES (id_specialization.nextval, 'Pathologist');
INSERT INTO Specialization VALUES (id_specialization.nextval, 'Dermatologist');
INSERT INTO Specialization VALUES (id_specialization.nextval, 'Optometrist');
INSERT INTO Specialization VALUES (id_specialization.nextval, 'Radiologist');
INSERT INTO Specialization VALUES (id_specialization.nextval, 'Cardiologist');
INSERT INTO Specialization VALUES (id_specialization.nextval, 'Allergist');

--Doctor (id_doctor,first_name,last_name,patronymic,id_specialization)
INSERT INTO Doctor VALUES   (id_doctor.nextval, 'Ivan', 'Palivoda', 'Nicolaevich',   1);
INSERT INTO Doctor VALUES   (id_doctor.nextval, 'Petr', 'Gaydarji', 'Arcadievich',   2);
INSERT INTO Doctor VALUES   (id_doctor.nextval, 'Semen', 'Vinogradov', 'Pavlovich',   3);
INSERT INTO Doctor VALUES   (id_doctor.nextval, 'Valentin', 'Verbickiy', 'Alexandrovich',   4);

--Group_illnesses(id_group_illnesses, illnesses_gr_title)
INSERT INTO Group_illnesses VALUES (id_group_illnesses.nextval, 'Neurological');
INSERT INTO Group_illnesses VALUES (id_group_illnesses.nextval, 'Cardio');
INSERT INTO Group_illnesses VALUES (id_group_illnesses.nextval, 'Injury');
INSERT INTO Group_illnesses VALUES (id_group_illnesses.nextval, 'Tumor');
INSERT INTO Group_illnesses VALUES (id_group_illnesses.nextval, 'Viral colds');

--Illnesses(id_illness, illnesses_title, id_group)

INSERT INTO Illnesses VALUES (id_illness.nextval, 'Stenocardia', 2);
INSERT INTO Illnesses VALUES (id_illness.nextval, 'Arrhythmia', 2);
INSERT INTO Illnesses VALUES (id_illness.nextval, 'Fracture', 3);
INSERT INTO Illnesses VALUES (id_illness.nextval, 'Tension', 3);
INSERT INTO Illnesses VALUES (id_illness.nextval, 'Benign', 4);
INSERT INTO Illnesses VALUES (id_illness.nextval, 'Malignant', 4);
INSERT INTO Illnesses VALUES (id_illness.nextval, 'Flu', 5);
INSERT INTO Illnesses VALUES (id_illness.nextval, 'Bronchitis', 5);
INSERT INTO Illnesses VALUES (id_illness.nextval, 'Angina', 5);

--Drugs(id_drug, drug_title)
INSERT INTO Drugs VALUES (id_drug.nextval, 'Ibuprofen');
INSERT INTO Drugs VALUES (id_drug.nextval, 'Nazivin');
INSERT INTO Drugs VALUES (id_drug.nextval, 'Noshpa');
INSERT INTO Drugs VALUES (id_drug.nextval, 'Kardiomagnil');
INSERT INTO Drugs VALUES (id_drug.nextval, 'Sorbeks');
INSERT INTO Drugs VALUES (id_drug.nextval, 'Levometsitin');
INSERT INTO Drugs VALUES (id_drug.nextval, 'Viprosal');
INSERT INTO Drugs VALUES (id_drug.nextval, 'Strepsils');
INSERT INTO Drugs VALUES (id_drug.nextval, 'Oxacillin');

--Measure(id_measure, measure_title)
INSERT INTO Measure VALUES (id_measure.nextval, 'Drops');
INSERT INTO Measure VALUES (id_measure.nextval, 'Tablets');
INSERT INTO Measure VALUES (id_measure.nextval, 'ml');


--work_time (id_time, work_time)
INSERT INTO work_time VALUES (id_time.nextval, TO_DATE('01-JAN-1800 08:00:00','DD-MON-YYYY HH24:MI:SS'));
INSERT INTO work_time VALUES (id_time.nextval, TO_DATE('01-JAN-1800 09:00:00','DD-MON-YYYY HH24:MI:SS'));
INSERT INTO work_time VALUES (id_time.nextval, TO_DATE('01-JAN-1800 10:00:00','DD-MON-YYYY HH24:MI:SS'));
INSERT INTO work_time VALUES (id_time.nextval, TO_DATE('01-JAN-1800 11:00:00','DD-MON-YYYY HH24:MI:SS'));
INSERT INTO work_time VALUES (id_time.nextval, TO_DATE('01-JAN-1800 12:00:00','DD-MON-YYYY HH24:MI:SS'));
INSERT INTO work_time VALUES (id_time.nextval, TO_DATE('01-JAN-1800 13:00:00','DD-MON-YYYY HH24:MI:SS'));
INSERT INTO work_time VALUES (id_time.nextval, TO_DATE('01-JAN-1800 14:00:00','DD-MON-YYYY HH24:MI:SS'));
INSERT INTO work_time VALUES (id_time.nextval, TO_DATE('01-JAN-1800 15:00:00','DD-MON-YYYY HH24:MI:SS'));
INSERT INTO work_time VALUES (id_time.nextval, TO_DATE('01-JAN-1800 16:00:00','DD-MON-YYYY HH24:MI:SS'));
INSERT INTO work_time VALUES (id_time.nextval, TO_DATE('01-JAN-1800 17:00:00','DD-MON-YYYY HH24:MI:SS'));
INSERT INTO work_time VALUES (id_time.nextval, TO_DATE('01-JAN-1800 18:00:00','DD-MON-YYYY HH24:MI:SS'));

--week_day(id_week_day, day)

INSERT INTO week_day VALUES (id_week_day.nextval, 'Mn');
INSERT INTO week_day VALUES (id_week_day.nextval, 'Ts');
INSERT INTO week_day VALUES (id_week_day.nextval, 'Wd');
INSERT INTO week_day VALUES (id_week_day.nextval, 'Th');
INSERT INTO week_day VALUES (id_week_day.nextval, 'Fr');
INSERT INTO week_day VALUES (id_week_day.nextval, 'St');
INSERT INTO week_day VALUES (id_week_day.nextval, 'Sn');

--Analysis(id_analysis, analysis_title)
INSERT INTO Analysis VALUES (id_analysis.nextval, 'Complete blood count');
INSERT INTO Analysis VALUES (id_analysis.nextval, 'Blood sugar');
INSERT INTO Analysis VALUES (id_analysis.nextval, 'LHC crop analysis');
INSERT INTO Analysis VALUES (id_analysis.nextval, 'General analysis');
INSERT INTO Analysis VALUES (id_analysis.nextval, 'Aureus analysis');

--Laboratory(id_laboratory, lab_title)
INSERT INTO Laboratory VALUES (id_laboratory.nextval, 'Total');
INSERT INTO Laboratory VALUES (id_laboratory.nextval, 'Special');

--Laboratory_schedule(id_laboratory,id_week_day,id_work_time)
INSERT INTO Laboratory_schedule VALUES (1, 1, 1);
INSERT INTO Laboratory_schedule VALUES (1, 1, 2);
INSERT INTO Laboratory_schedule VALUES (1, 2, 1);
INSERT INTO Laboratory_schedule VALUES (1, 2, 2);
INSERT INTO Laboratory_schedule VALUES (1, 3, 1);
INSERT INTO Laboratory_schedule VALUES (1, 3, 2);
INSERT INTO Laboratory_schedule VALUES (1, 4, 1);
INSERT INTO Laboratory_schedule VALUES (1, 4, 2);
INSERT INTO Laboratory_schedule VALUES (2, 1, 3);
INSERT INTO Laboratory_schedule VALUES (2, 1, 4);
INSERT INTO Laboratory_schedule VALUES (2, 2, 3);
INSERT INTO Laboratory_schedule VALUES (2, 3, 4);
INSERT INTO Laboratory_schedule VALUES (2, 4, 3);
INSERT INTO Laboratory_schedule VALUES (2, 4, 4);
INSERT INTO Laboratory_schedule VALUES (2, 5, 3);
INSERT INTO Laboratory_schedule VALUES (2, 5, 4);

--Doctor_shedule(id_doctor,id_week_day,id_work_time)
INSERT INTO Doctor_schedule VALUES   (1, 1, 1);
INSERT INTO Doctor_schedule VALUES   (1, 1, 2);
INSERT INTO Doctor_schedule VALUES   (1, 2, 1);
INSERT INTO Doctor_schedule VALUES   (1, 2, 2);
INSERT INTO Doctor_schedule VALUES   (1, 3, 3);
INSERT INTO Doctor_schedule VALUES   (1, 3, 4);
INSERT INTO Doctor_schedule VALUES   (1, 4, 3);
INSERT INTO Doctor_schedule VALUES   (1, 4, 4);
INSERT INTO Doctor_schedule VALUES   (2, 2, 1);
INSERT INTO Doctor_schedule VALUES   (2, 2, 2);
INSERT INTO Doctor_schedule VALUES   (2, 3, 1);
INSERT INTO Doctor_schedule VALUES   (2, 3, 2);
INSERT INTO Doctor_schedule VALUES   (2, 4, 4);
INSERT INTO Doctor_schedule VALUES   (2, 4, 5);
INSERT INTO Doctor_schedule VALUES   (2, 5, 4);
INSERT INTO Doctor_schedule VALUES   (2, 5, 5);

--Doctor_reception(id_doctor_reception,id_medical_history,id_doctor,reception_date)
INSERT INTO Doctor_reception VALUES(id_doctor_reception.nextval,1,1,TO_DATE('11-NOV-2013 9:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO Doctor_reception VALUES(id_doctor_reception.nextval,2,2,TO_DATE('15-NOV-2013 12:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO Doctor_reception VALUES(id_doctor_reception.nextval,2,3,TO_DATE('16-NOV-2013 9:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO Doctor_reception VALUES(id_doctor_reception.nextval,2,3,TO_DATE('08-JAN-2014 9:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO Doctor_reception VALUES(id_doctor_reception.nextval,2,3,TO_DATE('01-NOV-2013 9:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO Doctor_reception VALUES(id_doctor_reception.nextval,2,3,TO_DATE('02-JAN-2014 9:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO Doctor_reception VALUES(id_doctor_reception.nextval,2,3,TO_DATE('03-NOV-2013 9:00:00', 'DD-MON-YYYY HH24:MI:SS'));
INSERT INTO Doctor_reception VALUES(id_doctor_reception.nextval,2,3,TO_DATE('04-JAN-2014 9:00:00', 'DD-MON-YYYY HH24:MI:SS'));

--Examination (id_examination,id_doctor_reception,complaints)
INSERT INTO Examination VALUES(id_examination.nextval,1,'It hurts to step on foot, foot swollen');
INSERT INTO Examination VALUES(id_examination.nextval,2,'Fever, weakness, cough');
INSERT INTO Examination VALUES(id_examination.nextval,3,'Pharyngalgia');

--Laboratory_reception (id_laboratory_reception,id_examination,id_laboratory,analysis_date,analysis_result,id_analysis)
INSERT INTO Laboratory_reception VALUES(id_laboratory_reception.nextval,2,1,TO_DATE('15-NOV-2013', 'dd-mm-yyyy'),'Normal',1);
INSERT INTO Laboratory_reception VALUES(id_laboratory_reception.nextval,2,1,TO_DATE('15-NOV-2013', 'dd-mm-yyyy'),'Normal',2);

--Treatment (id_treatment,id_examination,id_drug,id_measure,dosage,quantity,duration)
INSERT INTO Treatment VALUES(id_treatment.nextval,1,1,2,1,3,5);
INSERT INTO Treatment VALUES(id_treatment.nextval,1,7,3,10,3,5);
INSERT INTO Treatment VALUES(id_treatment.nextval,3,8,2,1,5,5);
INSERT INTO Treatment VALUES(id_treatment.nextval,3,9,2,0.5,3,5);


--Diagnosis (id_diagnosis,id_examination,id_illness)
INSERT INTO Diagnosis VALUES(id_diagnosis.nextval,1,6);
INSERT INTO Diagnosis VALUES(id_diagnosis.nextval,3,9);


