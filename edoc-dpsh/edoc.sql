-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2025 at 06:06 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aemail` varchar(255) NOT NULL,
  `apassword` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aemail`, `apassword`) VALUES
('admin@edoc.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appoid` int(11) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `apponum` int(3) DEFAULT NULL,
  `scheduleid` int(10) DEFAULT NULL,
  `appodate` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appoid`, `pid`, `apponum`, `scheduleid`, `appodate`) VALUES
(12, 8, 2, 9, '2024-11-22'),
(10, 3, 1, 9, '2024-11-22'),
(15, 3, 2, 11, '2024-11-22'),
(4, 3, 4, 1, '2024-08-14'),
(5, 4, 5, 1, '2024-08-16'),
(6, 4, 6, 1, '2024-08-25'),
(13, 8, 1, 11, '2024-11-22'),
(14, 3, 5, 1, '2024-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `symptoms` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `name`, `symptoms`) VALUES
(1, 'Common Cold', 'Runny nose, Sore throat, Cough, Fatigue'),
(2, 'Influenza (Flu)', 'Fever, Cough, Fatigue, Muscle ache, Chills, Sore throat'),
(3, 'COVID-19', 'Fever, Cough, Shortness of breath, Loss of taste, Loss of smell, Fatigue'),
(4, 'Migraine', 'Headache, Sensitivity to light, Nausea, Vomiting, Dizziness'),
(5, 'Diabetes', 'Frequent urination, Excessive sweating, Weight loss, Fatigue'),
(6, 'Hypertension', 'High blood pressure, Headache, Fatigue, Chest pain'),
(7, 'Asthma', 'Shortness of breath, Chest pain, Cough, Rapid breathing'),
(8, 'Gastroenteritis', 'Abdominal pain, Diarrhea, Nausea, Vomiting, Fatigue'),
(9, 'Allergic Rhinitis', 'Runny nose, Itchy eyes, Nasal congestion, Sneezing, Cough'),
(10, 'Arthritis', 'Joint pain, Swelling in legs or feet, Fatigue, Muscle ache'),
(11, 'Anemia', 'Fatigue, Pale skin, Dizziness, Cold hands or feet, Shortness of breath'),
(12, 'Skin Allergy', 'Skin rash, Itchy eyes, Dry mouth, Swollen lymph nodes'),
(13, 'Heart Disease', 'Chest pain, Heart palpitations, Shortness of breath, Swelling in legs or feet'),
(14, 'Hypothyroidism', 'Weight gain, Fatigue, Hair loss, Constipation, Dry mouth'),
(15, 'Insomnia', 'Sleep disturbances, Fatigue, Mood swings, Headache'),
(16, 'Pneumonia', 'Fever, Cough, Shortness of breath, Chest pain, Chills'),
(17, 'Common Cold', 'Runny nose, Sore throat, Cough, Fatigue, Sneezing'),
(18, 'Influenza', 'Fever, Cough, Sore throat, Fatigue, Muscle ache'),
(21, 'Asthma', 'Shortness of breath, Cough, Wheezing, Fatigue'),
(22, 'Pneumonia', 'Cough, Fever, Difficulty breathing, Chest pain'),
(23, 'Tuberculosis', 'Cough, Weight loss, Night sweats, Fatigue'),
(24, 'Chronic Obstructive Pulmonary Disease (COPD)', 'Shortness of breath, Chronic cough, Wheezing'),
(25, 'Gastroesophageal Reflux Disease (GERD)', 'Heartburn, Chest pain, Regurgitation, Difficulty swallowing'),
(26, 'Diabetes', 'Frequent urination, Excessive thirst, Fatigue, Weight loss'),
(27, 'Hypertension', 'Headache, Fatigue, Shortness of breath, Chest pain'),
(28, 'Hypothyroidism', 'Fatigue, Weight gain, Dry skin, Cold intolerance'),
(29, 'Hyperthyroidism', 'Weight loss, Anxiety, Tremors, Increased appetite'),
(30, 'Anemia', 'Fatigue, Pale skin, Shortness of breath, Dizziness'),
(31, 'Osteoarthritis', 'Joint pain, Swelling, Stiffness'),
(32, 'Rheumatoid Arthritis', 'Joint pain, Swelling, Fatigue, Morning stiffness'),
(33, 'Heart Disease', 'Chest pain, Shortness of breath, Fatigue, Swelling in legs'),
(34, 'Stroke', 'Sudden numbness, Trouble speaking, Trouble seeing, Weakness on one side of the body'),
(35, 'Chronic Fatigue Syndrome', 'Fatigue, Sleep disturbances, Muscle pain, Memory problems'),
(36, 'Gallbladder Disease', 'Abdominal pain, Nausea, Vomiting, Fatigue'),
(37, 'Liver Disease', 'Jaundice, Fatigue, Abdominal pain, Swollen abdomen'),
(38, 'Kidney Disease', 'Fatigue, Swelling in legs, Back pain, Blood in urine'),
(39, 'Urinary Tract Infection (UTI)', 'Painful urination, Frequent urination, Lower abdominal pain'),
(40, 'Gallstones', 'Abdominal pain, Nausea, Vomiting, Jaundice'),
(41, 'Celiac Disease', 'Diarrhea, Abdominal pain, Weight loss, Fatigue'),
(42, 'Peptic Ulcer', 'Abdominal pain, Nausea, Vomiting, Weight loss'),
(43, 'Irritable Bowel Syndrome (IBS)', 'Abdominal pain, Diarrhea, Constipation'),
(44, 'Diverticulitis', 'Abdominal pain, Fever, Nausea, Vomiting'),
(45, 'Inflammatory Bowel Disease', 'Diarrhea, Abdominal pain, Weight loss, Fatigue'),
(46, 'Food Allergy', 'Hives, Swelling, Abdominal pain, Vomiting'),
(47, 'Lactose Intolerance', 'Bloating, Diarrhea, Stomach cramps'),
(48, 'Chronic Sinusitis', 'Nasal congestion, Sore throat, Headache, Fatigue'),
(49, 'Panic Disorder', 'Heart palpitations, Shortness of breath, Chest pain'),
(50, 'Anxiety Disorder', 'Restlessness, Fatigue, Trouble sleeping, Muscle tension'),
(51, 'Depression', 'Sadness, Fatigue, Insomnia, Loss of appetite'),
(52, 'Bipolar Disorder', 'Mood swings, Irritability, Fatigue, Anxiety'),
(53, 'Schizophrenia', 'Hallucinations, Delusions, Disorganized speech'),
(54, 'Alzheimer\'s Disease', 'Memory loss, Confusion, Difficulty with speech'),
(55, 'Parkinson\'s Disease', 'Tremors, Muscle rigidity, Slowed movement'),
(56, 'Multiple Sclerosis', 'Fatigue, Muscle weakness, Difficulty walking'),
(57, 'Epilepsy', 'Seizures, Memory loss, Confusion'),
(58, 'Fibromyalgia', 'Chronic pain, Fatigue, Sleep disturbances'),
(59, 'Sleep Apnea', 'Snoring, Fatigue, Shortness of breath'),
(60, 'Insomnia', 'Difficulty sleeping, Fatigue, Anxiety'),
(61, 'Obesity', 'Excess body fat, Shortness of breath, Joint pain'),
(62, 'Hepatitis', 'Jaundice, Fatigue, Abdominal pain, Loss of appetite'),
(63, 'HIV/AIDS', 'Fatigue, Fever, Weight loss, Swollen lymph nodes'),
(64, 'Tuberculosis', 'Cough, Weight loss, Night sweats, Fatigue'),
(65, 'Meningitis', 'Headache, Fever, Stiff neck, Sensitivity to light'),
(66, 'Bronchitis', 'Cough, Fatigue, Chest discomfort, Shortness of breath'),
(67, 'Lung Cancer', 'Cough, Chest pain, Weight loss, Shortness of breath'),
(68, 'Prostate Cancer', 'Difficulty urinating, Blood in urine, Pain in back'),
(69, 'Breast Cancer', 'Lump in breast, Pain in breast, Swelling in lymph nodes'),
(70, 'Skin Cancer', 'Mole changes, Itching, Skin lesions'),
(71, 'Leukemia', 'Fatigue, Pale skin, Unexplained weight loss, Fever'),
(72, 'Lymphoma', 'Swollen lymph nodes, Fatigue, Weight loss'),
(73, 'Stomach Cancer', 'Abdominal pain, Loss of appetite, Nausea, Vomiting'),
(74, 'Colorectal Cancer', 'Blood in stool, Abdominal pain, Weight loss'),
(75, 'Ovarian Cancer', 'Bloating, Abdominal pain, Weight loss'),
(76, 'Endometriosis', 'Pelvic pain, Heavy periods, Painful intercourse'),
(77, 'Polycystic Ovary Syndrome (PCOS)', 'Irregular periods, Weight gain, Acne'),
(78, 'Cervical Cancer', 'Pelvic pain, Abnormal bleeding, Pain during intercourse'),
(79, 'Uterine Cancer', 'Abnormal bleeding, Pelvic pain, Painful urination'),
(80, 'Chronic Migraine', 'Severe headache, Sensitivity to light, Nausea'),
(81, 'Chronic Back Pain', 'Back pain, Muscle stiffness, Difficulty walking'),
(82, 'Carpal Tunnel Syndrome', 'Numbness, Pain in wrist, Weakness in hand'),
(83, 'Gout', 'Joint pain, Swelling, Redness, Heat'),
(84, 'Shingles', 'Painful rash, Blisters, Itching, Burning sensation'),
(85, 'Herpes Simplex Virus (HSV)', 'Painful sores, Itching, Redness'),
(86, 'Chickenpox', 'Fever, Rash, Itching, Fatigue'),
(87, 'Hepatitis C', 'Fatigue, Jaundice, Abdominal pain, Loss of appetite'),
(88, 'HIV/AIDS', 'Fever, Weight loss, Swollen lymph nodes, Night sweats'),
(89, 'Cold Sores', 'Blisters, Itching, Pain, Swelling'),
(90, 'Conjunctivitis (Pink Eye)', 'Redness, Itching, Swelling, Eye discharge'),
(91, 'Glaucoma', 'Blurred vision, Eye pain, Nausea'),
(92, 'Cataracts', 'Blurry vision, Sensitivity to light, Fading colors'),
(93, 'Acid Reflux', 'Heartburn'),
(94, 'Aortic Aneurysm', 'Chest pain'),
(95, 'Chronic Sinusitis', 'Nasal congestion'),
(96, 'Sickle Cell Anemia', 'Fatigue'),
(97, 'Pneumothorax', 'Chest pain'),
(98, 'Emphysema', 'Shortness of breath'),
(99, 'Esophageal Cancer', 'Difficulty swallowing'),
(100, 'Lung Embolism', 'Shortness of breath'),
(101, 'Peptic Ulcer Disease', 'Abdominal pain'),
(102, 'Hemorrhoids', 'Painful urination'),
(103, 'Gout', 'Joint pain'),
(104, 'Bursitis', 'Joint pain'),
(105, 'Osteoporosis', 'Bone pain'),
(106, 'Rheumatic Fever', 'Joint pain'),
(107, 'Septic Arthritis', 'Joint pain'),
(108, 'Hypothyroidism', 'Fatigue'),
(109, 'Hyperthyroidism', 'Weight loss'),
(110, 'Hashimoto\'s Thyroiditis', 'Fatigue'),
(111, 'Cushing\'s Syndrome', 'Fatigue'),
(112, 'Alopecia', 'Hair loss'),
(113, 'Polycystic Ovary Syndrome (PCOS)', 'Irregular periods'),
(114, 'Menopause', 'Mood swings'),
(115, 'Diabetic Neuropathy', 'Numbness in feet'),
(116, 'Multiple Sclerosis', 'Muscle weakness'),
(117, 'Parkinson\'s Disease', 'Tremors'),
(118, 'Bell\'s Palsy', 'Facial paralysis'),
(119, 'Lupus', 'Fatigue'),
(120, 'Celiac Disease', 'Abdominal pain'),
(121, 'Crohn\'s Disease', 'Abdominal pain'),
(122, 'Ulcerative Colitis', 'Abdominal pain'),
(123, 'Gallstones', 'Abdominal pain'),
(124, 'Chronic Fatigue Syndrome', 'Fatigue'),
(125, 'Panic Attack', 'Heart palpitations'),
(126, 'Heart Failure', 'Shortness of breath'),
(127, 'Liver Cirrhosis', 'Jaundice'),
(128, 'Chronic Bronchitis', 'Cough'),
(129, 'Tuberculosis', 'Cough'),
(130, 'Asthma', 'Wheezing'),
(131, 'Bronchiectasis', 'Cough'),
(132, 'Chronic Obstructive Pulmonary Disease (COPD)', 'Cough'),
(133, 'Interstitial Lung Disease', 'Shortness of breath'),
(134, 'Sleep Apnea', 'Snoring'),
(135, 'Epilepsy', 'Seizures'),
(136, 'Stroke', 'Weakness on one side'),
(137, 'Hydrocephalus', 'Headache'),
(138, 'Tinnitus', 'Ear ringing'),
(139, 'Vertigo', 'Dizziness'),
(140, 'Menieres Disease', 'Dizziness'),
(141, 'Glaucoma', 'Blurred vision'),
(142, 'Cataracts', 'Blurred vision'),
(143, 'Age-related Macular Degeneration', 'Blurred vision'),
(144, 'Retinal Detachment', 'Blurred vision'),
(145, 'Conjunctivitis', 'Itchy eyes'),
(146, 'Hordeolum (Stye)', 'Redness in eyes'),
(147, 'Blepharitis', 'Redness in eyes'),
(148, 'Shingles', 'Painful rash'),
(149, 'Chickenpox', 'Itching'),
(150, 'Eczema', 'Itching'),
(151, 'Psoriasis', 'Itchy skin'),
(152, 'Rosacea', 'Redness of skin'),
(153, 'Acne', 'Skin lesions'),
(154, 'Moles', 'Skin lesions'),
(155, 'Basal Cell Carcinoma', 'Skin lesions'),
(156, 'Melanoma', 'Skin lesions'),
(157, 'Squamous Cell Carcinoma', 'Skin lesions'),
(158, 'Lupus', 'Rash'),
(159, 'Dermatitis', 'Rash'),
(160, 'Erysipelas', 'Redness of skin'),
(161, 'Leprosy', 'Numbness of skin'),
(162, 'Hepatitis A', 'Jaundice'),
(163, 'Hepatitis B', 'Fatigue'),
(164, 'Hepatitis C', 'Fatigue'),
(165, 'Cholecystitis', 'Abdominal pain'),
(166, 'Pancreatitis', 'Abdominal pain'),
(167, 'Appendicitis', 'Abdominal pain'),
(168, 'Diverticulitis', 'Abdominal pain'),
(169, 'Cystitis', 'Painful urination'),
(170, 'Prostatitis', 'Painful urination'),
(171, 'Urinary Tract Infection', 'Painful urination'),
(172, 'Bladder Cancer', 'Blood in urine'),
(173, 'Kidney Stones', 'Painful urination'),
(174, 'Chronic Kidney Disease', 'Swelling in legs'),
(175, 'Nephritis', 'Swelling in legs'),
(176, 'Pelvic Inflammatory Disease', 'Pelvic pain'),
(177, 'Endometriosis', 'Pelvic pain'),
(178, 'Ovarian Cancer', 'Pelvic pain'),
(179, 'Ectopic Pregnancy', 'Pelvic pain'),
(180, 'Fibroids', 'Pelvic pain'),
(181, 'Ovarian Cyst', 'Pelvic pain'),
(182, 'Testicular Cancer', 'Pain in testicles'),
(183, 'Prostate Cancer', 'Pain in back'),
(184, 'Breast Cancer', 'Pain in breast'),
(185, 'Lung Cancer', 'Chest pain'),
(186, 'Colon Cancer', 'Blood in stool'),
(187, 'Stomach Cancer', 'Abdominal pain'),
(188, 'Pancreatic Cancer', 'Abdominal pain'),
(189, 'Leukemia', 'Fatigue'),
(190, 'Non-Hodgkin’s Lymphoma', 'Swollen lymph nodes'),
(191, 'Hodgkin’s Lymphoma', 'Swollen lymph nodes'),
(192, 'Thyroid Cancer', 'Neck lump'),
(193, 'Cervical Cancer', 'Pelvic pain'),
(194, 'Endometrial Cancer', 'Pelvic pain'),
(195, 'Bladder Cancer', 'Blood in urine'),
(196, 'Prostate Cancer', 'Difficulty urinating'),
(197, 'Eczema', 'Itching'),
(198, 'Psoriasis', 'Itchy skin'),
(199, 'Hives', 'Itchy skin'),
(200, 'Shingles', 'Painful rash'),
(201, 'Chickenpox', 'Itching'),
(202, 'Melanoma', 'Mole changes'),
(203, 'Squamous Cell Carcinoma', 'Skin lesions'),
(204, 'Liver Cancer', 'Jaundice'),
(205, 'Osteoarthritis', 'Joint pain'),
(206, 'Rheumatoid Arthritis', 'Joint pain'),
(207, 'Ankylosing Spondylitis', 'Back pain'),
(208, 'Gout', 'Joint pain'),
(209, 'Fibromyalgia', 'Muscle pain'),
(210, 'Muscular Dystrophy', 'Muscle weakness'),
(211, 'Polymyositis', 'Muscle weakness'),
(212, 'Guillain-Barré Syndrome', 'Muscle weakness'),
(213, 'Myasthenia Gravis', 'Muscle weakness'),
(214, 'Alzheimer’s Disease', 'Memory loss'),
(215, 'Parkinson’s Disease', 'Memory loss'),
(216, 'Huntington’s Disease', 'Memory loss'),
(217, 'Dementia', 'Memory loss'),
(218, 'Brain Tumor', 'Headache'),
(219, 'Multiple Sclerosis', 'Muscle weakness'),
(220, 'Amyotrophic Lateral Sclerosis (ALS)', 'Muscle weakness'),
(221, 'Dystonia', 'Muscle spasms'),
(222, 'Torticollis', 'Neck pain'),
(223, 'Fibromyalgia', 'Chronic pain'),
(224, 'Chronic Fatigue Syndrome', 'Fatigue'),
(225, 'Severe Back Pain', 'Back pain'),
(226, 'Scoliosis', 'Back pain');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `docid` int(11) NOT NULL,
  `docemail` varchar(255) DEFAULT NULL,
  `docname` varchar(255) DEFAULT NULL,
  `docpassword` varchar(255) DEFAULT NULL,
  `docnic` varchar(15) DEFAULT NULL,
  `doctel` varchar(15) DEFAULT NULL,
  `specialties` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`docid`, `docemail`, `docname`, `docpassword`, `docnic`, `doctel`, `specialties`) VALUES
(1, 'doctor@edoc.com', 'Dr. Dipesh', '123', '000000000', '12345', 2),
(2, 'doctor2@edoc.com', 'Dr. khatiwada', '123', '000000001', '1234', 1),
(4, 'doctor3@edoc.com', 'Dr. Dipak', '123', '0002', '12345', 3),
(5, 'doctor4@edoc.com', 'Dr. poudel', '123', '000000001', '1234', 4),
(6, 'doctor5@edoc.com', 'Dr. Aashis', '123', '000000001', '1234', 5),
(7, 'raman@gmail.com', 'raman', '123', '123445', '123456', 16),
(8, 'a@vf.com', 'aaaaa', '1234', 'dfg', 'dsfgfhgjhk', 13);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pid` int(11) NOT NULL,
  `pemail` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `ppassword` varchar(255) DEFAULT NULL,
  `paddress` varchar(255) DEFAULT NULL,
  `pnic` varchar(15) DEFAULT NULL,
  `pdob` date DEFAULT NULL,
  `ptel` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pid`, `pemail`, `pname`, `ppassword`, `paddress`, `pnic`, `pdob`, `ptel`) VALUES
(1, 'patient@edoc.com', 'Test Patient', '123', 'Sri Lanka', '0000000000', '2000-01-01', '0120000000'),
(6, 'Deepak@gmail.com', 'Deepak Poudel', 'Deepak123@', 'Green city', '09876', '1990-08-14', ''),
(3, 'dipesh@gmail.com', 'Dipesh khatiwada', '12345', 'Banasthali', '1', '2002-01-10', '0123456789'),
(4, 'admin@aedoc.com', 'Dipesh khatiwada', '1234', 'Banasthali', '', '2024-08-01', '0123456789'),
(5, 'jan@gmail.com', 'Bibash bhatta', '123456', 'Banasthali', '123', '2010-01-17', ''),
(7, 'Nabin@gmail.com', 'Nabin Adhikari', '123', 'Dhading', '098097', '2003-10-28', ''),
(8, 'dfsgdhfgjh2gh@dfcg.sdd', 'dgg dsff', '1234', 'dfdg', 'ghgfh', '2024-11-25', '');

-- --------------------------------------------------------

--
-- Table structure for table `recommendations`
--

CREATE TABLE `recommendations` (
  `id` int(11) NOT NULL,
  `disease_id` int(11) DEFAULT NULL,
  `recommendation` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `scheduleid` int(11) NOT NULL,
  `docid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  `nop` int(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`scheduleid`, `docid`, `title`, `scheduledate`, `scheduletime`, `nop`) VALUES
(1, '1', 'Test Session', '2050-01-01', '18:00:00', 50),
(2, '1', '1', '2022-06-10', '20:36:00', 10),
(3, '1', '12', '2022-06-10', '20:33:00', 30),
(4, '1', '1', '2022-06-10', '12:32:00', 5),
(5, '1', '1', '2022-06-10', '20:35:00', 12),
(6, '1', '12', '2022-06-10', '20:35:00', 1),
(7, '1', '1', '2022-06-24', '20:36:00', 1),
(8, '1', '12', '2022-06-10', '13:33:00', 1),
(9, '7', 'test', '2024-11-22', '09:00:00', 19),
(10, '5', 'Emergency', '2024-11-24', '06:01:00', 2),
(11, '8', '1', '2024-11-28', '12:38:00', 8);

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

CREATE TABLE `specialties` (
  `id` int(2) NOT NULL,
  `sname` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`id`, `sname`) VALUES
(1, 'Accident and emergency medicine'),
(2, 'Allergology'),
(3, 'Anaesthetics'),
(4, 'Biological hematology'),
(5, 'Cardiology'),
(6, 'Child psychiatry'),
(7, 'Clinical biology'),
(8, 'Clinical chemistry'),
(9, 'Clinical neurophysiology'),
(10, 'Clinical radiology'),
(11, 'Dental, oral and maxillo-facial surgery'),
(12, 'Dermato-venerology'),
(13, 'Dermatology'),
(14, 'Endocrinology'),
(15, 'Gastro-enterologic surgery'),
(16, 'Gastroenterology'),
(17, 'General hematology'),
(18, 'General Practice'),
(19, 'General surgery'),
(20, 'Geriatrics'),
(21, 'Immunology'),
(22, 'Infectious diseases'),
(23, 'Internal medicine'),
(24, 'Laboratory medicine'),
(25, 'Maxillo-facial surgery'),
(26, 'Microbiology'),
(27, 'Nephrology'),
(28, 'Neuro-psychiatry'),
(29, 'Neurology'),
(30, 'Neurosurgery'),
(31, 'Nuclear medicine'),
(32, 'Obstetrics and gynecology'),
(33, 'Occupational medicine'),
(34, 'Ophthalmology'),
(35, 'Orthopaedics'),
(36, 'Otorhinolaryngology'),
(37, 'Paediatric surgery'),
(38, 'Paediatrics'),
(39, 'Pathology'),
(40, 'Pharmacology'),
(41, 'Physical medicine and rehabilitation'),
(42, 'Plastic surgery'),
(43, 'Podiatric Medicine'),
(44, 'Podiatric Surgery'),
(45, 'Psychiatry'),
(46, 'Public health and Preventive Medicine'),
(47, 'Radiology'),
(48, 'Radiotherapy'),
(49, 'Respiratory medicine'),
(50, 'Rheumatology'),
(51, 'Stomatology'),
(52, 'Thoracic surgery'),
(53, 'Tropical medicine'),
(54, 'Urology'),
(55, 'Vascular surgery'),
(56, 'Venereology');

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`id`, `name`) VALUES
(1, 'Fever'),
(2, 'Cough'),
(3, 'Headache'),
(4, 'Fatigue'),
(5, 'Sore throat'),
(6, 'Runny nose'),
(7, 'Shortness of breath'),
(8, 'Nausea'),
(9, 'Diarrhea'),
(10, 'Chest pain'),
(11, 'Dizziness'),
(12, 'Muscle ache'),
(13, 'Skin rash'),
(14, 'Loss of taste'),
(15, 'Loss of smell'),
(16, 'Abdominal pain'),
(17, 'Back pain'),
(18, 'Chills'),
(19, 'Confusion'),
(20, 'Constipation'),
(21, 'Dry mouth'),
(22, 'Excessive sweating'),
(23, 'Frequent urination'),
(24, 'Heart palpitations'),
(25, 'High blood pressure'),
(26, 'Itchy eyes'),
(27, 'Joint pain'),
(28, 'Nasal congestion'),
(29, 'Pale skin'),
(30, 'Swollen lymph nodes'),
(31, 'Vomiting'),
(32, 'Weight loss'),
(33, 'Blurred vision'),
(34, 'Cold hands or feet'),
(35, 'Difficulty swallowing'),
(36, 'Hair loss'),
(37, 'Hearing loss'),
(38, 'Mood swings'),
(39, 'Night sweats'),
(40, 'Rapid breathing'),
(41, 'Sensitivity to light'),
(42, 'Sleep disturbances'),
(43, 'Swelling in legs or feet'),
(44, 'Tingling sensation'),
(45, 'Unexplained bruising'),
(46, 'Abdominal pain'),
(47, 'Back pain'),
(48, 'Chills'),
(49, 'Confusion'),
(50, 'Constipation'),
(51, 'Dry mouth'),
(52, 'Excessive sweating'),
(53, 'Frequent urination'),
(54, 'Heart palpitations'),
(55, 'High blood pressure'),
(56, 'Itchy eyes'),
(57, 'Joint pain'),
(58, 'Nasal congestion'),
(59, 'Pale skin'),
(60, 'Swollen lymph nodes'),
(61, 'Vomiting'),
(62, 'Weight loss'),
(63, 'Blurred vision'),
(64, 'Cold hands or feet'),
(65, 'Difficulty swallowing'),
(66, 'Hair loss'),
(67, 'Hearing loss'),
(68, 'Mood swings'),
(69, 'Night sweats'),
(70, 'Rapid breathing'),
(71, 'Sensitivity to light'),
(72, 'Sleep disturbances'),
(73, 'Swelling in legs or feet'),
(74, 'Tingling sensation'),
(75, 'Unexplained bruising'),
(76, 'Sweating at night'),
(77, 'Loss of appetite'),
(78, 'Fainting'),
(79, 'Frequent headaches'),
(80, 'Severe nausea'),
(81, 'Sore muscles'),
(82, 'Yellow skin'),
(83, 'Rashes'),
(84, 'Chronic cough'),
(85, 'Persistent fatigue'),
(86, 'Hoarseness'),
(87, 'Dry skin'),
(88, 'Eye redness'),
(89, 'Chest discomfort'),
(90, 'Painful urination'),
(91, 'Heartburn'),
(92, 'Tightness in chest'),
(93, 'Coughing up blood'),
(94, 'Memory loss'),
(95, 'Trouble concentrating'),
(96, 'Hot flashes'),
(97, 'Inability to sleep'),
(98, 'Unexplained weight gain'),
(99, 'Severe abdominal bloating'),
(100, 'Leg cramps'),
(101, 'Hiccups'),
(102, 'Mouth sores'),
(103, 'Blood in stool'),
(104, 'Frequent thirst'),
(105, 'Frequent urination'),
(106, 'Painful joints'),
(107, 'Heavy menstrual bleeding'),
(108, 'Pain with swallowing'),
(109, 'Shortness of breath when lying down'),
(110, 'Unexplained bruises'),
(111, 'Indigestion'),
(112, 'Gastroesophageal reflux'),
(113, 'Excessive thirst'),
(114, 'Severe weight loss'),
(115, 'Frequent ear infections'),
(116, 'Ear ringing'),
(117, 'Dull headache'),
(118, 'Stomach cramps'),
(119, 'Chronic back pain'),
(120, 'Numbness in hands'),
(121, 'Frequent chills'),
(122, 'Feeling lightheaded'),
(123, 'Cold sweats'),
(124, 'Bloating after meals'),
(125, 'Insomnia'),
(126, 'Joint stiffness'),
(127, 'Severe skin dryness'),
(128, 'Difficulty breathing'),
(129, 'Itching'),
(130, 'Increased hunger'),
(131, 'Lack of energy'),
(132, 'Difficulty swallowing'),
(133, 'Coughing up mucus'),
(134, 'Blood in urine'),
(135, 'Nighttime leg cramps'),
(136, 'Severe bloating'),
(137, 'Severe chest pain'),
(138, 'Excessive coughing'),
(139, 'Extreme tiredness'),
(140, 'Loss of taste'),
(141, 'Hoarseness in voice'),
(142, 'Swelling in throat'),
(143, 'Pain in lower abdomen'),
(144, 'Feeling faint'),
(145, 'Muscle weakness'),
(146, 'Intestinal gas'),
(147, 'Persistent stomach pain'),
(148, 'Cough with mucus'),
(149, 'Headaches when waking up');

-- --------------------------------------------------------

--
-- Table structure for table `webuser`
--

CREATE TABLE `webuser` (
  `email` varchar(255) NOT NULL,
  `usertype` char(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webuser`
--

INSERT INTO `webuser` (`email`, `usertype`) VALUES
('admin@edoc.com', 'a'),
('doctor@edoc.com', 'd'),
('patient@edoc.com', 'p'),
('Nabin@gmail.com', 'p'),
('dipesh@gmail.com', 'p'),
('raman@gmail.com', 'd'),
('deepa@gmail.com', 'p'),
('abc@gmail.com', 'p'),
('jan@gmail.com', 'p'),
('Deepak@gmail.com', 'p'),
('doctor2@edoc.com', 'd'),
('a@vf.com', 'd'),
('dfsgdhfgjh2gh@dfcg.sdd', 'p');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aemail`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appoid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `scheduleid` (`scheduleid`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`docid`),
  ADD KEY `specialties` (`specialties`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disease_id` (`disease_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`scheduleid`),
  ADD KEY `docid` (`docid`);

--
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webuser`
--
ALTER TABLE `webuser`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `docid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `scheduleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD CONSTRAINT `recommendations_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
