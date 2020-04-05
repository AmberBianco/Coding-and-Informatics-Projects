
--How many of each type of patient in addmission table. The group by returns the count of all admission types each instead of total count of all.
SELECT COUNT(admission_type)
 FROM admissions
 GROUP BY admission_type; 
--5:4 total rows with 1 header row
-- count
-- 1336
-- 7863
-- 7706
-- 42071


 --this is an innerjoin looking at patient ethnicty and gender ordered by ethnicity
 SELECT pt.gender, adm.ethnicity
FROM patients pt
INNER JOIN admissions adm
ON pt.subject_id= adm.subject_id
ORDER BY adm.ethnicity
 limit 100;
 --5000:4999 total rows with 1 header row--
--  gender	ethnicity
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- F	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- F	AMERICAN INDIAN/ALASKA NATIVE
-- F	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- F	AMERICAN INDIAN/ALASKA NATIVE
-- F	AMERICAN INDIAN/ALASKA NATIVE
-- F	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE
-- F	AMERICAN INDIAN/ALASKA NATIVE
-- M	AMERICAN INDIAN/ALASKA NATIVE


-- this joins the patients and admissions table grouped by rows that have the same value
SELECT pt.gender, adm.diagnosis
FROM patients pt
INNER JOIN admissions adm
ON pt.subject_id= adm.subject_id
GROUP BY pt.gender,adm.diagnosis

--5000:4999 rows with 1 header row
-- gender	diagnosis
-- M	LIVER INSUFFICIENCY
-- M	UNSTABLE ANGINA;ELEVATED CREATININE\CATH
-- M	LEFT LUNG CA/SDA
-- M	HYPOTENSION;CONGESTIVE HEART FAILURE;PNEUMONIA
-- F	BENZODIAZEPINE OVERDOSE
-- M	FEVER OF UNKNOWN ORIGEN;JAUNDICE
-- F	HYPERKALEMIA;BRADYCARDIA
-- M	CORONARY ARTERY DISEASE\CORONARY ARTERY BYPASS GRAFT; W/ ? MVR/SDA
-- F	NON ST ELEVATION MI
-- F	CROHN'S COLITIS
-- M	AORTIC DISSECTION 
-- F	CAROTID STENOSIS, RIGHT/SDA
-- F	MITRAL VALVE DISORDER \MVR;? TVR;? CORONARY ARTERY BYPASS GRAFT WITH MVR/SDA
-- F	DILANTIN TOXICITY-MENTAL STATUS CHANGES
-- M	RENAL FAILURE; VASCULITIS
-- F	S/P FALL;DEHYDRATION;ALTERED MENTAL CHANGES
-- M	LARGE FRONTAL MASS
-- F	GASTROINTESITINAL BLEED
-- F	PNEUMOTHORAX
-- F	CHF;OVARIAN CANCER;TELEMETRY;WEAKNESS



-- This joins the admission and microbiologyevent tables from colums admission diagnosis and microbiology org-name grouped by rows with same values
SELECT adm.diagnosis, mbe.org_name
 FROM admissions adm
 INNER JOIN microbiologyevents mbe
 ON adm.subject_id = mbe.subject_id
 GROUP BY mbe.org_name, adm.diagnosis
 limit 100;

--  --4999 total rows with 1 header row--
--  diagnosis	org_name
-- ABDOMINAL ABCESS	2ND ISOLATE
-- ABDOMINAL AORTIC ANEURYSM	2ND ISOLATE
-- ABDOMINAL AORTIC ANEURYSM/SDA	2ND ISOLATE
-- ABDOMINAL PAIN	2ND ISOLATE
-- ABDOMINAL PAIN-CHEST PAIN	2ND ISOLATE
-- ABDOMINAL PAIN/ETOH INTOXICATION	2ND ISOLATE
-- ABDOMINAL PAIN;FEVER	2ND ISOLATE
-- ABDOMINAL WALL BLEEDING	2ND ISOLATE
-- ABD PAIN	2ND ISOLATE
-- ACIDOSIS	2ND ISOLATE
-- ACIDOSIS, RULE OUT  SEPSIS	2ND ISOLATE
-- ACS/CHF	2ND ISOLATE
-- ACUTE ANT MI	2ND ISOLATE
-- ACUTE CORONARY SYNDROME	2ND ISOLATE
-- ACUTE CORONARY SYNDROME\CATH	2ND ISOLATE
-- ACUTE CORONARY SYNDROME;TELEMETRY	2ND ISOLATE
-- ACUTE INFECTED LEFT FOOT;ABSCESS;DIABETES	2ND ISOLATE
-- ACUTE LEUKEMIA	2ND ISOLATE
-- ACUTE LIVER FAILURE	2ND ISOLATE
-- ACUTE LYMPHOCYTIC LEUKEMIA;FEBRILE NEUTROPENIA	2ND ISOLATE


 -- This  calculates displays the total average length of stay from icustays table.DISTINCT eliminates duplicate values in aggregate function calculations.
 SELECT
    AVG(DISTINCT los) AS "AVG(los)"
  FROM icustays;

  --2:1 row with 1 header row--
--   AVG(los)
-- 6.590208904


-- This displays all of the org_names from microbiology evets table that have first letter P
SELECT org_name
  FROM microbiologyevents
 WHERE org_name LIKE 'P%'
--5000: 4999 total rows with 1 header row--

-- org_name
-- POSITIVE FOR METHICILLIN RESISTANT STAPH AUREUS
-- POSITIVE FOR METHICILLIN RESISTANT STAPH AUREUS
-- POSITIVE FOR METHICILLIN RESISTANT STAPH AUREUS
-- PSEUDOMONAS AERUGINOSA
-- PSEUDOMONAS AERUGINOSA
-- PROTEUS MIRABILIS
-- POSITIVE FOR METHICILLIN RESISTANT STAPH AUREUS
-- POSITIVE FOR METHICILLIN RESISTANT STAPH AUREUS
-- POSITIVE FOR METHICILLIN RESISTANT STAPH AUREUS
-- POSITIVE FOR METHICILLIN RESISTANT STAPH AUREUS
-- POSITIVE FOR METHICILLIN RESISTANT STAPH AUREUS
-- POSITIVE FOR METHICILLIN RESISTANT STAPH AUREUS
-- POSITIVE FOR METHICILLIN RESISTANT STAPH AUREUS
-- PRESUMPTIVE CLOSTRIDIUM PERFRINGENS
-- PROTEUS VULGARIS
-- POSITIVE FOR METHICILLIN RESISTANT STAPH AUREUS
-- PROVIDENCIA STUARTII
-- PROVIDENCIA STUARTII
-- PROVIDENCIA STUARTII
-- PROVIDENCIA STUARTII

--This displays the length of each text from notevents table
SELECT LENGTH(text) AS LengthOfText
FROM noteevents
limit 100;

--5000: 4999 total rows and 1 header row
-- lengthoftext
-- 5790
-- 4016
-- 3972
-- 5702
-- 20669
-- 4887
-- 5675
-- 10940
-- 7602
-- 8412
-- 7693
-- 16381
-- 4934
-- 12060
-- 9370
-- 8285
-- 4648
-- 4449
-- 5217
-- 14607



--Characters are extracted from string. 15 is the start place and 80 is the length. UPPER(text) turns all of text into uppercase letters
SELECT SUBSTRING(UPPER(text), 15, 80) AS SubString
FROM noteevents
LIMIT 100;

--1618: 1617 total rows with 1 header row--

-- substring
-- "UMERIC IDENTIFIER 64018**]
-- ADMISSION DATE: [**2193-7-12**]
-- DISCHARGE DATE: [**21"
-- "UMERIC IDENTIFIER 64020**]
-- ADMISSION DATE: [**2140-9-9**]
-- DISCHARGE DATE: [**214"
-- ":  [**2125-9-8**]              DISCHARGE DATE:   [**2125-9-18**]

-- DATE OF BIRTH:"
-- ":  [**2126-1-1**]              DISCHARGE DATE:   [**2126-1-4**]

-- DATE OF BIRTH: "
-- ":  [**2102-8-5**]              DISCHARGE DATE:   [**2102-8-23**]

-- DATE OF BIRTH:"
-- ":  [**2133-7-4**]              DISCHARGE DATE:   [**2133-7-17**]

-- DATE OF BIRTH:"
-- ": [**2201-5-12**]        DISCHARGE DATE: [**2201-6-5**]

-- DATE OF BIRTH:  [**2201"
-- ": [**2110-6-4**]        DISCHARGE DATE: [**2110-6-12**]

-- DATE OF BIRTH:  [**2110"
-- ":  [**2192-7-5**]              DISCHARGE DATE:   [**2192-7-16**]

-- DATE OF BIRTH:"
-- ":  [**2184-11-22**]              DISCHARGE DATE:   [**2184-11-24**]

-- DATE OF BIR"
-- ":  [**2188-1-28**]              DISCHARGE DATE:   [**2188-1-30**]

-- DATE OF BIRTH"
-- ":  [**2180-11-6**]              DISCHARGE DATE:   [**2180-11-23**]

-- DATE OF BIRT"
-- ":  [**2136-6-21**]              DISCHARGE DATE:   [**2136-6-26**]

-- DATE OF BIRTH"
-- ": [**2154-7-31**]        DISCHARGE DATE: [**2154-12-11**]

-- DATE OF BIRTH:  [**21"
-- ": [**2173-6-4**]        DISCHARGE DATE: [**2173-6-16**]

-- DATE OF BIRTH:  [**2095"
-- ":  [**2117-6-30**]              DISCHARGE DATE:   [**2117-7-9**]

-- DATE OF BIRTH:"
-- ": [**2102-7-12**]        DISCHARGE DATE: [**2102-7-29**]

-- DATE OF BIRTH:  [**210"
-- ": [**2159-7-25**]        DISCHARGE DATE: [**2159-8-11**]

-- DATE OF BIRTH:  [**215"
-- "UMERIC IDENTIFIER 64057**]
-- ADMISSION DATE: [**2133-6-24**]
-- DISCHARGE DATE: [**21"
-- ":  [**2183-2-19**]              DISCHARGE DATE:   [**2183-2-24**]


-- SERVICE: MED"


--this joins the icustays and microbiologyevents table displaying the first_careunit and org_name colums ordered by first_careunit
SELECT ics.first_careunit, mic.org_name
FROM icustays ics
INNER JOIN microbiologyevents mic
ON ics.subject_id= mic.subject_id
ORDER BY ics.first_careunit

--5000: 4999 total rows + 1 header row
-- first_careunit	org_name
-- CCU	ENTEROCOCCUS SP.
-- CCU	ENTEROCOCCUS SP.
-- CCU	ENTEROCOCCUS SP.
-- CCU	ENTEROCOCCUS SP.
-- CCU	ENTEROCOCCUS SP.
-- CCU	
-- CCU	CLOSTRIDIUM DIFFICILE
-- CCU	
-- CCU	
-- CCU	ENTEROCOCCUS SP.
-- CCU	YEAST
-- CCU	ENTEROCOCCUS SP.
-- CCU	ENTEROCOCCUS SP.
-- CCU	ENTEROCOCCUS SP.
-- CCU	ENTEROCOCCUS SP.
-- CCU	
-- CCU	STAPH AUREUS COAG +
-- CCU	
-- CCU	STAPH AUREUS COAG +
-- CCU	


--this joins the icustays and admissions table displaying the last_careunit and discharge_location columns
SELECT ics.last_careunit, adm.discharge_location
FROM icustays ics
INNER JOIN admissions adm
ON ics.subject_id= adm.subject_id
ORDER BY adm.discharge_location
 limit 100;

 --5000: 4999 total rows with 1 header row--
--  last_careunit	discharge_location
-- MICU	DEAD/EXPIRED
-- MICU	DEAD/EXPIRED
-- CSRU	DEAD/EXPIRED
-- CSRU	DEAD/EXPIRED
-- MICU	DEAD/EXPIRED
-- MICU	DEAD/EXPIRED
-- MICU	DEAD/EXPIRED
-- TSICU	DEAD/EXPIRED
-- TSICU	DEAD/EXPIRED
-- TSICU	DEAD/EXPIRED
-- TSICU	DEAD/EXPIRED
-- TSICU	DEAD/EXPIRED
-- MICU	DEAD/EXPIRED
-- MICU	DEAD/EXPIRED
-- TSICU	DEAD/EXPIRED
-- MICU	DEAD/EXPIRED
-- MICU	DEAD/EXPIRED
-- SICU	DEAD/EXPIRED
-- MICU	DEAD/EXPIRED
-- CCU	DEAD/EXPIRED

