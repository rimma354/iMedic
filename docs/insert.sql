--Sex(id_sex, sex_title)
INSERT INTO Sex VALUES (1, 'мужской');
INSERT INTO Sex VALUES (2, 'женский');

--History_type(id_history_type, type_title)
INSERT INTO History_type VALUES (1, 'болезнь');
INSERT INTO History_type VALUES (2, 'осмотр');

--Analisis(id_analisis, analisis_title)
INSERT INTO Analisis VALUES (1, 'кровь');
INSERT INTO Analisis VALUES (2, 'моча');
INSERT INTO Analisis VALUES (3, 'кал');
INSERT INTO Analisis VALUES (4, 'вич');
INSERT INTO Analisis VALUES (5, 'беременность');
INSERT INTO Analisis VALUES (6, 'гепатит');

--Laboratory(id_laboratory, lab_title)
INSERT INTO Laboratory VALUES (1, 'общая');
INSERT INTO Laboratory VALUES (2, 'специальная');

--Card_state(id_state, state_title)
INSERT INTO Card_state VALUES (1, 'открыта');
INSERT INTO Card_state VALUES (2, 'закрыта');

--week_day(id_week_day, day)
INSERT INTO week_day VALUES (1, 'пн');
INSERT INTO week_day VALUES (2, 'вт');
INSERT INTO week_day VALUES (3, 'ср');
INSERT INTO week_day VALUES (4, 'чт');
INSERT INTO week_day VALUES (5, 'пт');
INSERT INTO week_day VALUES (6, 'сб');
INSERT INTO week_day VALUES (7, 'вс');

--work_time (id_time, work_time)
INSERT INTO work_time VALUES (1, '08:00:00');
INSERT INTO work_time VALUES (2, '09:00:00');
INSERT INTO work_time VALUES (3, '10:00:00');
INSERT INTO work_time VALUES (4, '11:00:00');
INSERT INTO work_time VALUES (5, '12:00:00');
INSERT INTO work_time VALUES (6, '13:00:00');
INSERT INTO work_time VALUES (7, '14:00:00');
INSERT INTO work_time VALUES (8, '15:00:00');
INSERT INTO work_time VALUES (9, '16:00:00');
INSERT INTO work_time VALUES (10, '17:00:00');
INSERT INTO work_time VALUES (11, '18:00:00');

--Specialiazation(id_specialiazation, specialiazation_title)
INSERT INTO Specialization VALUES (1, 'хирург');
INSERT INTO Specialization VALUES (2, 'терапевт');
INSERT INTO Specialization VALUES (3, 'лор');
INSERT INTO Specialization VALUES (4, 'гинеколог');
INSERT INTO Specialization VALUES (5, 'патологоанатом');
INSERT INTO Specialization VALUES (6, 'дерматолог');
INSERT INTO Specialization VALUES (7, 'окулист');
INSERT INTO Specialization VALUES (8, 'рентгенолог');
INSERT INTO Specialization VALUES (9, 'кардиолог');
INSERT INTO Specialization VALUES (10, 'аллерголог');

--Vaccinations(id_vaccination, vaccination_title)
INSERT INTO Vaccinations VALUES (1, 'живые');
INSERT INTO Vaccinations VALUES (2, 'корпускулярные');
INSERT INTO Vaccinations VALUES (3, 'химические');
INSERT INTO Vaccinations VALUES (4, 'рекомбинантные');

--Blood_group(id_blood_group, group_title)
INSERT INTO Blood_group VALUES (1, 'I');
INSERT INTO Blood_group VALUES (2, 'II');
INSERT INTO Blood_group VALUES (3, 'III');
INSERT INTO Blood_group VALUES (4, 'IV');

--RH_factor(id_rh, rh_title)
INSERT INTO RH_factor VALUES (1, 'RH+');
INSERT INTO RH_factor VALUES (2, 'RH-');

--Drugs(id_drug, drug_title)
INSERT INTO Drugs VALUES (1, 'Ибупрофен');
INSERT INTO Drugs VALUES (2, 'Називин');
INSERT INTO Drugs VALUES (3, 'Ношпа');
INSERT INTO Drugs VALUES (4, 'Кардиомагнил');
INSERT INTO Drugs VALUES (5, 'Сорбекс');
INSERT INTO Drugs VALUES (6, 'Левомецитин');
INSERT INTO Drugs VALUES (7, 'Випросал');
INSERT INTO Drugs VALUES (8, 'Стрепсилс');
INSERT INTO Drugs VALUES (9, 'оксациллин');

--Group_illnesses(id_group, illnesses_gr_title)
INSERT INTO Group_illnesses VALUES (1, 'венерические');
INSERT INTO Group_illnesses VALUES (2, 'кардио');
INSERT INTO Group_illnesses VALUES (3, 'травмы');
INSERT INTO Group_illnesses VALUES (4, 'опухоли');
INSERT INTO Group_illnesses VALUES (5, 'орви');

--Illnesses(id_illness, illnesses_title, id_group)
INSERT INTO Illnesses VALUES (1, 'сифилис', 1);
INSERT INTO Illnesses VALUES (2, 'триппер', 1);
INSERT INTO Illnesses VALUES (3, 'стенокардия', 2);
INSERT INTO Illnesses VALUES (4, 'аритмия', 2);
INSERT INTO Illnesses VALUES (5, 'перелом', 3);
INSERT INTO Illnesses VALUES (6, 'растяжение', 3);
INSERT INTO Illnesses VALUES (7, 'доброкачественная', 4);
INSERT INTO Illnesses VALUES (8, 'злокачественная', 4);
INSERT INTO Illnesses VALUES (9, 'насморк', 5);
INSERT INTO Illnesses VALUES (10, 'кашель', 5);
INSERT INTO Illnesses VALUES (11, 'ангина', 5);

--Allergy_group(id_allergy, allergy_gr_title)
INSERT INTO Allergy_group VALUES (1, 'сезонные');
INSERT INTO Allergy_group VALUES (2, 'хронические');
INSERT INTO Allergy_group VALUES (3, 'растительные');
INSERT INTO Allergy_group VALUES (4, 'бытовые');

--Allergens(id_illness, illnesses_title, id_group)
INSERT INTO Allergens VALUES (1, 'жара', 1);
INSERT INTO Allergens VALUES (2, 'холод', 1);
INSERT INTO Allergens VALUES (3, 'насекомые', 2);
INSERT INTO Allergens VALUES (4, 'пух', 3);
INSERT INTO Allergens VALUES (5, 'пыльца', 3);
INSERT INTO Allergens VALUES (6, 'химикаты', 4);
INSERT INTO Allergens VALUES (7, 'продукты', 4);

--Patient(id_patient,first_name,last_name,patronymic,id_sex, date_birth, telephone,passport,insurance_number)
INSERT INTO PATIENT VALUES (1,'ИВАНОВ','ИВАН','ИВАНОВИЧ',1,TO_DATE('1981-03-17', 'YYYY-MM-DD'),380481234560,1111222220,0123456780);
INSERT INTO PATIENT VALUES (2,'ПАВЛОВА','ТАТЬЯНА','ВЯЧЕСЛАВОВНА',2,TO_DATE('1978-11-14', 'YYYY-MM-DD'),380481234561,1111222221,0123456781);
INSERT INTO PATIENT VALUES (3,'ГЕРОСИМОВ','НИКОЛАЙ','ГРИГОРЬЕВИЧ',1,TO_DATE('1990-02-06', 'YYYY-MM-DD'),380481234562,1111222222,0123456782);
INSERT INTO PATIENT VALUES (4,'АБДУЛОВА','ЕВГЕНИЯ','СЕРГЕЕВНА',2,TO_DATE('1984-05-12', 'YYYY-MM-DD'),380481234563,1111222223,0123456783);
INSERT INTO PATIENT VALUES (5,'ДЕМИТРОВ','ВИКТОР','АЛЕКСАНДРОВИЧ',1,TO_DATE('1977-08-19', 'YYYY-MM-DD'),380481234564,1111222224,0123456784);
INSERT INTO PATIENT VALUES (6,'ВОЛКОВ','СЕРГЕЙ','ИВАНОВИЧ',1,TO_DATE('1992-09-11', 'YYYY-MM-DD'),380481234565,1111222225,0123456785);
INSERT INTO PATIENT VALUES (7,'ДАНИЛОВ','СЕРГЕЙ','ВАЛЕНТИНОВИЧ',1,TO_DATE('1990-01-19', 'YYYY-MM-DD'),380481234566,1111222226,0123456786);
INSERT INTO PATIENT VALUES (8,'СМИРНОВ','КОНСТАНТИН','ПАВЛОВИЧ',1,TO_DATE('1981-11-17', 'YYYY-MM-DD'),380481234567,1111222227,0123456787);
INSERT INTO PATIENT VALUES (9,'КАТИНА','ЕЛЕНА','ПЕТРОВНА',2,TO_DATE('1964-10-22', 'YYYY-MM-DD'),380481234568,1111222228,0123456788);
INSERT INTO PATIENT VALUES (10,'СИДОРОВА','ВАЛЕНТИНА','МИХАЙЛОВНА',2,TO_DATE('1993-07-28', 'YYYY-MM-DD'),380481234569,1111222229,0123456789);

--Medical_card (id_medical_card,id_patient,id_state)
INSERT INTO MEDICAL_CARD VALUES (1,1,1);
INSERT INTO MEDICAL_CARD VALUES (2,2,1);
INSERT INTO MEDICAL_CARD VALUES (3,3,1);
INSERT INTO MEDICAL_CARD VALUES (4,4,1);
INSERT INTO MEDICAL_CARD VALUES (5,5,1);
INSERT INTO MEDICAL_CARD VALUES (6,6,1);
INSERT INTO MEDICAL_CARD VALUES (7,7,1);
INSERT INTO MEDICAL_CARD VALUES (8,8,1);
INSERT INTO MEDICAL_CARD VALUES (9,9,1);
INSERT INTO MEDICAL_CARD VALUES (10,10,1);

--Rates_chronyc_illnesses (id_medical_card, id_illness)
INSERT INTO Rates_chronyc_illnesses VALUES (1, 5);
INSERT INTO Rates_chronyc_illnesses VALUES (2, 4);
INSERT INTO Rates_chronyc_illnesses VALUES (3, 3);
INSERT INTO Rates_chronyc_illnesses VALUES (4, 2);
INSERT INTO Rates_chronyc_illnesses VALUES (5, 1);
INSERT INTO Rates_chronyc_illnesses VALUES (6, 10);
INSERT INTO Rates_chronyc_illnesses VALUES (7, 9);
INSERT INTO Rates_chronyc_illnesses VALUES (8, 8);
INSERT INTO Rates_chronyc_illnesses VALUES (9, 7);
INSERT INTO Rates_chronyc_illnesses VALUES (10, 6);

--Rates_allergens (id_medical_card, id_allergens)
INSERT INTO Rates_allergens VALUES (1, 3);
INSERT INTO Rates_allergens VALUES (2, 1);
INSERT INTO Rates_allergens VALUES (3, 7);
INSERT INTO Rates_allergens VALUES (4, 7);
INSERT INTO Rates_allergens VALUES (5, 6);
INSERT INTO Rates_allergens VALUES (6, 5);
INSERT INTO Rates_allergens VALUES (7, 4);
INSERT INTO Rates_allergens VALUES (8, 3);
INSERT INTO Rates_allergens VALUES (9, 2);
INSERT INTO Rates_allergens VALUES (10, 1);

--Rates_blood (id_medical_card, id_blood_group, id_rh)
INSERT INTO Rates_blood VALUES (1, 1, 1);
INSERT INTO Rates_blood VALUES (2, 1, 2);
INSERT INTO Rates_blood VALUES (3, 2, 1);
INSERT INTO Rates_blood VALUES (4, 2, 2);
INSERT INTO Rates_blood VALUES (5, 3, 1);
INSERT INTO Rates_blood VALUES (6, 3, 2);
INSERT INTO Rates_blood VALUES (7, 4, 1);
INSERT INTO Rates_blood VALUES (8, 4, 2);
INSERT INTO Rates_blood VALUES (9, 2, 1);
INSERT INTO Rates_blood VALUES (10, 4, 1);

--Rates_vaccinations (id_medical_card, id_vaccination)
INSERT INTO Rates_vaccinations VALUES (1, 1);
INSERT INTO Rates_vaccinations VALUES (2, 2);
INSERT INTO Rates_vaccinations VALUES (3, 3);
INSERT INTO Rates_vaccinations VALUES (4, 4);
INSERT INTO Rates_vaccinations VALUES (5, 1);
INSERT INTO Rates_vaccinations VALUES (6, 1);
INSERT INTO Rates_vaccinations VALUES (7, 3);
INSERT INTO Rates_vaccinations VALUES (8, 2);
INSERT INTO Rates_vaccinations VALUES (9, 4);
INSERT INTO Rates_vaccinations VALUES (10, 1);

--Rates_drugs (id_medical_card, id_drug)
INSERT INTO Rates_drugs VALUES (1, 4);
INSERT INTO Rates_drugs VALUES (2, 2);
INSERT INTO Rates_drugs VALUES (3, 1);
INSERT INTO Rates_drugs VALUES (4, 3);
INSERT INTO Rates_drugs VALUES (5, 6);
INSERT INTO Rates_drugs VALUES (6, 5);
INSERT INTO Rates_drugs VALUES (7, 3);
INSERT INTO Rates_drugs VALUES (8, 2);
INSERT INTO Rates_drugs VALUES (9, 4);
INSERT INTO Rates_drugs VALUES (10, 1);

--Doctor (id_doctor,first_name,last_name,patronymic,id_specialization)
INSERT INTO Doctor VALUES   (1, 'Ivan', 'Palivoda', 'Nicolaevich',   1);
INSERT INTO Doctor VALUES   (2, 'Petr', 'Gaydarji', 'Arcadievich',   2);
INSERT INTO Doctor VALUES   (3, 'Semen', 'Vinogradov', 'Pavlovich',   3);
INSERT INTO Doctor VALUES   (4, 'Valentin', 'Verbickiy', 'Alexandrovich',   4);

--Doctor_shedule(id_doctor,week_day,work_time)
INSERT INTO Doctor_schedule VALUES   (1,   1,   1);
INSERT INTO Doctor_schedule VALUES   (1,   1,   2);
INSERT INTO Doctor_schedule VALUES   (1,   2,   1);
INSERT INTO Doctor_schedule VALUES   (1,   2,   2);
INSERT INTO Doctor_schedule VALUES   (1,   3,   3);
INSERT INTO Doctor_schedule VALUES   (1,   3,   4);
INSERT INTO Doctor_schedule VALUES   (1,   4,   3);
INSERT INTO Doctor_schedule VALUES   (1,   4,   4);
INSERT INTO Doctor_schedule VALUES   (2,   2,   1);
INSERT INTO Doctor_schedule VALUES   (2,   2,   2);
INSERT INTO Doctor_schedule VALUES   (2,   3,   1);
INSERT INTO Doctor_schedule VALUES   (2,   3,   2);
INSERT INTO Doctor_schedule VALUES   (2,   4,   4);
INSERT INTO Doctor_schedule VALUES   (2,   4,   5);
INSERT INTO Doctor_schedule VALUES   (2,   5,   4);
INSERT INTO Doctor_schedule VALUES   (2,   5,   5);

--Laboratory_schedule(id_laboratory,week_day,work_time)
INSERT INTO Laboratory_schedule VALUES (1,   1,   1);
INSERT INTO Laboratory_schedule VALUES (1,   1,   2);
INSERT INTO Laboratory_schedule VALUES (1,   2,   1);
INSERT INTO Laboratory_schedule VALUES (1,   2,   2);
INSERT INTO Laboratory_schedule VALUES (1,   3,   1);
INSERT INTO Laboratory_schedule VALUES (1,   3,   2);
INSERT INTO Laboratory_schedule VALUES (1,   4,   1);
INSERT INTO Laboratory_schedule VALUES (1,   4,   2);
INSERT INTO Laboratory_schedule VALUES (2,   1,   3);
INSERT INTO Laboratory_schedule VALUES (2,   1,   4);
INSERT INTO Laboratory_schedule VALUES (2,   2,   3);
INSERT INTO Laboratory_schedule VALUES (2,   3,   4);
INSERT INTO Laboratory_schedule VALUES (2,   4,   3);
INSERT INTO Laboratory_schedule VALUES (2,   4,   4);
INSERT INTO Laboratory_schedule VALUES (2,   5,   3);
INSERT INTO Laboratory_schedule VALUES (2,   5,   4);

--Medical_history(id_medical_history,id_medical_card,id_history_type,description)
INSERT INTO Medical_history VALUES (1,1,1,'Боль в ноге');
INSERT INTO Medical_history VALUES (2,2,1,'Температура, кашель, насморк');

--Doctor_reception(id_doctor_reception,id_medical_history,id_doctor,reception_date,reception_time)
INSERT INTO Doctor_reception VALUES(1,1,1,TO_DATE('11-11-2013', 'dd-mm-yyyy'),'9:00:00');
INSERT INTO Doctor_reception VALUES(2,2,2,TO_DATE('15-11-2013', 'dd-mm-yyyy'),'12:00:00');
INSERT INTO Doctor_reception VALUES(3,2,3,TO_DATE('16-11-2013', 'dd-mm-yyyy'),'9:00:00');

--Examination (id_examination,id_doctor_reception,complaints)
INSERT INTO Examination VALUES(1,1,'Больно наступать на ногу, нога опухла');
INSERT INTO Examination VALUES(2,2,'Высокая температура, общая слабость, кашель');
INSERT INTO Examination VALUES(3,3,'Боль в горле');

--Laboratory_reception (id_laboratory_reception,id_examination,id_laboratory,analysis_date,analysis_result,id_analisis)
INSERT INTO Laboratory_reception VALUES(1,2,1,TO_DATE('15-11-2013', 'dd-mm-yyyy'),'Все показатели в норме',1);
INSERT INTO Laboratory_reception VALUES(2,2,1,TO_DATE('15-11-2013', 'dd-mm-yyyy'),'Все показатели в норме',2);

--Treatment (id_treatment,id_examination,id_drug,dosage,quantity,duration)
INSERT INTO Treatment VALUES(1,1,1,600,3,5);
INSERT INTO Treatment VALUES(2,1,7,10,3,5);
INSERT INTO Treatment VALUES(3,3,8,1,5,5);
INSERT INTO Treatment VALUES(4,3,9,0.5,3,5);


--Diagnosis (id_diagnosis,id_examination,id_illness)
INSERT INTO Diagnosis VALUES(1,1,6);
INSERT INTO Diagnosis VALUES(2,3,11);