-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: hms_db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admissions`
--

DROP TABLE IF EXISTS `admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `room_id` int DEFAULT NULL,
  `admission_date` date NOT NULL,
  `discharge_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `admissions_ibfk_2` (`room_id`),
  CONSTRAINT `admissions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`idpatients`),
  CONSTRAINT `admissions_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admissions`
--

LOCK TABLES `admissions` WRITE;
/*!40000 ALTER TABLE `admissions` DISABLE KEYS */;
INSERT INTO `admissions` VALUES (1,1,1,'2024-12-20','2024-12-22','2024-12-28 08:00:00','2024-12-28 08:00:00'),(2,2,2,'2024-12-23','2024-12-26','2024-12-28 09:00:00','2024-12-28 09:00:00'),(3,3,3,'2024-12-25',NULL,'2024-12-28 10:00:00','2024-12-28 10:00:00');
/*!40000 ALTER TABLE `admissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `idappointments` int NOT NULL,
  `appointment_date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patient_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  PRIMARY KEY (`idappointments`),
  KEY `patient_id_idx` (`patient_id`),
  KEY `doctor_id_idx` (`doctor_id`),
  CONSTRAINT `doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`idpatients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,'2024-12-30','Scheduled','2024-12-28 08:00:00','2024-12-28 08:00:00',1,2),(2,'2024-12-31','Completed','2024-12-28 09:00:00','2024-12-28 09:00:00',3,4),(3,'2025-01-02','Cancelled','2024-12-28 10:00:00','2024-12-28 10:00:00',5,2);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('Pending','Paid') NOT NULL,
  `bill_date` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`idpatients`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1,500.00,'Paid','2024-12-20','2024-12-28 08:00:00','2024-12-28 08:00:00'),(2,2,1200.00,'Pending','2024-12-21','2024-12-28 09:00:00','2024-12-28 09:00:00'),(3,3,300.00,'Paid','2024-12-22','2024-12-28 10:00:00','2024-12-28 10:00:00');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `floor` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Cardiology',2,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(2,'Neurology',3,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(3,'Orthopedics',4,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(4,'Pediatrics',1,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(5,'General Surgery',5,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(6,'Emergency Medicine',0,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(7,'Oncology',6,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(8,'Radiology',-1,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(9,'Obstetrics and Gynecology',2,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(10,'Dermatology',3,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(11,'ENT (Ear, Nose, Throat)',4,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(12,'Urology',5,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(13,'Psychiatry',7,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(14,'Gastroenterology',6,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(15,'Ophthalmology',1,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(16,'Nephrology',5,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(17,'Pathology',-1,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(18,'Anesthesiology',0,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(19,'Physiotherapy',2,'2024-12-28 13:53:19','2024-12-28 13:53:19'),(20,'Dentistry',1,'2024-12-28 13:53:19','2024-12-28 13:53:19');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `disease_name` varchar(100) NOT NULL,
  `diagnosis_date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `disease_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`idpatients`),
  CONSTRAINT `disease_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease`
--

LOCK TABLES `disease` WRITE;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` VALUES (7,11,2,'Diabetes','2024-01-15','Active','2024-12-29 17:08:34','2024-12-29 17:08:34'),(8,12,3,'Hypertension','2024-02-10','Active','2024-12-29 17:08:34','2024-12-29 17:08:34'),(9,1,4,'Asthma','2024-03-01','Recovered','2024-12-29 17:08:34','2024-12-29 17:08:34'),(10,4,5,'Pneumonia','2024-05-20','Active','2024-12-29 17:08:34','2024-12-29 17:08:34'),(11,5,6,'Cancer','2024-06-15','Active','2024-12-29 17:08:34','2024-12-29 17:08:34'),(12,16,7,'Stroke','2024-07-10','Recovered','2024-12-29 17:08:34','2024-12-29 17:08:34');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `department_id` int NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `availability` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Anil','Naik','Cardiologist',1,'9876543210','anil.naik@example.com','9 AM - 5 PM','2024-12-28 08:00:00','2024-12-28 08:00:00'),(2,'Venkaiah','Ch.','Orthopedist',2,'9123456789','venkaiah.ch@example.com','10 AM - 6 PM','2024-12-28 09:00:00','2024-12-28 09:00:00'),(3,'Vinay','Kumar','Dermatologist',3,'9876123450','vinay.kumar@example.com','11 AM - 7 PM','2024-12-28 10:00:00','2024-12-28 10:00:00'),(4,'Siva','Sarma','Neurologist',4,'9988776655','siva.sarma@example.com','8 AM - 4 PM','2024-12-28 07:30:00','2024-12-28 07:30:00'),(5,'Kirubakaran','A.','Pediatrician',5,'8765432190','kiruba.a@example.com','9 AM - 5 PM','2024-12-28 08:30:00','2024-12-28 08:30:00'),(6,'Ramulu','Ch.','Gastroenterologist',6,'9654321870','ramulu.ch@example.com','10 AM - 6 PM','2024-12-28 09:30:00','2024-12-28 09:30:00'),(7,'Srikanth','N.V.','General Physician',7,'9543218760','srikanth.nv@example.com','11 AM - 7 PM','2024-12-28 10:30:00','2024-12-28 10:30:00'),(8,'Murthy','B.K.','Psychiatrist',8,'9432187650','murthy.bk@example.com','8 AM - 4 PM','2024-12-28 07:00:00','2024-12-28 07:00:00'),(9,'Siva','Kumar','Surgeon',9,'9321876540','siva.kumar@example.com','9 AM - 5 PM','2024-12-28 08:45:00','2024-12-28 08:45:00'),(10,'Kiran','R.','Dentist',10,'9218765430','kiran.r@example.com','10 AM - 6 PM','2024-12-28 09:15:00','2024-12-28 09:15:00');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_results`
--

DROP TABLE IF EXISTS `lab_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `test_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `result_details` text NOT NULL,
  `test_date` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `test_id` (`test_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `lab_results_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`idpatients`),
  CONSTRAINT `lab_results_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `lab_tests` (`id`),
  CONSTRAINT `lab_results_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_results`
--

LOCK TABLES `lab_results` WRITE;
/*!40000 ALTER TABLE `lab_results` DISABLE KEYS */;
INSERT INTO `lab_results` VALUES (1,1,1,2,'Normal blood pressure','2024-12-20','2024-12-28 08:00:00','2024-12-28 08:00:00'),(2,2,2,4,'High glucose levels','2024-12-21','2024-12-28 09:00:00','2024-12-28 09:00:00'),(3,3,3,2,'No significant allergies','2024-12-22','2024-12-28 10:00:00','2024-12-28 10:00:00');
/*!40000 ALTER TABLE `lab_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_tests`
--

DROP TABLE IF EXISTS `lab_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_name` varchar(100) NOT NULL,
  `description` text,
  `cost` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_tests`
--

LOCK TABLES `lab_tests` WRITE;
/*!40000 ALTER TABLE `lab_tests` DISABLE KEYS */;
INSERT INTO `lab_tests` VALUES (1,'Blood Test','Basic blood panel',500.00,'2024-12-28 08:00:00','2024-12-28 08:00:00'),(2,'X-Ray','Chest X-Ray',1500.00,'2024-12-28 09:00:00','2024-12-28 09:00:00'),(3,'MRI','Full body MRI scan',7000.00,'2024-12-28 10:00:00','2024-12-28 10:00:00'),(4,'ECG','Electrocardiogram Test',1200.00,'2024-12-28 07:30:00','2024-12-28 07:30:00'),(5,'Covid Test','RT-PCR test for Covid-19',800.00,'2024-12-28 08:30:00','2024-12-28 08:30:00');
/*!40000 ALTER TABLE `lab_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_records`
--

DROP TABLE IF EXISTS `medical_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `diagnosis` text NOT NULL,
  `treatment` text NOT NULL,
  `prescription` text,
  `record_date` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `medical_records_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`idpatients`),
  CONSTRAINT `medical_records_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_records`
--

LOCK TABLES `medical_records` WRITE;
/*!40000 ALTER TABLE `medical_records` DISABLE KEYS */;
INSERT INTO `medical_records` VALUES (1,1,2,'Hypertension','Lifestyle Change','Amlodipine','2024-12-25','2024-12-28 08:00:00','2024-12-28 08:00:00'),(2,3,4,'Diabetes Type 2','Insulin Therapy','Insulin','2024-12-24','2024-12-28 09:00:00','2024-12-28 09:00:00'),(3,5,2,'Seasonal Allergies','Antihistamines','Loratadine','2024-12-26','2024-12-28 10:00:00','2024-12-28 10:00:00');
/*!40000 ALTER TABLE `medical_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `idpatients` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(9) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `emergencycontact` varchar(100) DEFAULT NULL,
  `created at` varchar(45) DEFAULT 'CURRENT_TIMESTAMP',
  `updated at` varchar(45) DEFAULT 'CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`idpatients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Cholleti','Abhi sai','1995-03-15','Male','123 Main St, Springfield','9989624604','ca22eeb0b33@student.nitw.ac.in','9989624604','2023-01-02 09:15:00','2023-01-02 09:15:00'),(2,'Majjari','Nandana','1988-07-22','Female','45 Elm St, Riverside','6281251186','mn22eeb0b52@student.nitw.ac.in','6281251186','2023-01-03 14:30:00','2023-01-03 14:30:00'),(3,'Tadangi','Gayatri','2002-01-10','Male','678 Oak Ave, Sunnydale','6301406033','tg22eeb0b66@student.nitw.ac.in','6301406033','2023-01-04 16:45:00','2023-01-04 16:45:00'),(4,'Tumma','L','1990-11-05','Female','89 Maple Dr, Greenfield','6303718426','tl22eeb0b37@student.nitw.ac.in','6303718426','2023-01-05 11:20:00','2023-01-05 11:20:00'),(5,'Devaguptapu','Sridhar','1998-06-30','Male','12 Birch Ln, Riverwood','7013324801','ds22eeb0b09@student.nitw.ac.in','7013324801','2023-01-06 12:35:00','2023-01-06 12:35:00'),(6,'Nalaparaju','Mrudhu','1994-02-17','Female','456 Pine St, Hillcrest','7013923686','nm22eeb0b32@student.nitw.ac.in','7013923686','2023-01-07 08:50:00','2023-01-07 08:50:00'),(7,'Abhyuday','Chauhan','1985-09-25','Male','34 Cedar Rd, Brookside','7060326841','ac22eeb0f13@student.nitw.ac.in','7060326841','2023-01-08 10:00:00','2023-01-08 10:00:00'),(8,'Kaaru','Bhavyasri','2000-12-03','Female','567 Aspen Ct, Lakeside','7075448381','kb22eeb0b60@student.nitw.ac.in','7075448381','2023-01-09 14:10:00','2023-01-09 14:10:00'),(9,'Regunta','Thanish','1991-08-14','Male','90 Poplar Blvd, Meadowlands','7330696768','rt22eeb0b57@student.nitw.ac.in','7330696768','2023-01-10 15:30:00','2023-01-10 15:30:00'),(10,'Gunna','Rakesh','1993-04-20','Female','23 Willow Way, Woodland Hills','7396073199','gr22eeb0b50@student.nitw.ac.in','7396073199','2023-01-11 17:00:00','2023-01-11 17:00:00'),(11,'Kayitha','Praagni','1997-10-11','Male','67 Chestnut Ln, Valley View','7396187050','kp22eeb0b27@student.nitw.ac.in','7396187050','2023-01-12 13:15:00','2023-01-12 13:15:00'),(12,'Vattea','Rasagnya','2001-03-08','Female','101 Walnut St, Oakridge','7569708763','vr22eeb0b04@student.nitw.ac.in','7569708763','2023-01-13 09:00:00','2023-01-13 09:00:00'),(13,'Pawan','Balasubramanyam','1989-12-25','Male','456 Sycamore Dr, Cedar Falls','7676832353','pb22eeb0f12@student.nitw.ac.in','7676832353','2023-01-14 18:25:00','2023-01-14 18:25:00'),(14,'Ankita','Kumari','1987-07-07','Female','789 Redwood Ln, Pine Grove','7728882194','ak22eeb0b47@student.nitw.ac.in','7728882194','2023-01-15 19:00:00','2023-01-15 19:00:00'),(15,'Kura','Ashrith','1992-05-18','Male','34 Cherry Ave, Maplewood','7842512585','ka22eeb0b22@student.nitw.ac.in','7842512585','2023-01-16 08:10:00','2023-01-16 08:10:00'),(16,'','Bandaru','1996-09-09','Female','98 Juniper Blvd, Elmwood','7981568677','bt22eeb0b06@student.nitw.ac.in','7981568677','2023-01-17 11:45:00','2023-01-17 11:45:00'),(17,'Mohit','Varma','1999-02-28','Male','12 Magnolia Ct, Birchwood','7995415758','mv22eeb0b08@student.nitw.ac.in','7995415758','2023-01-18 13:00:00','2023-01-18 13:00:00'),(18,'Dudekula','Charishma','1986-10-19','Female','67 Hickory Ln, Rosewood','7997242903','dc22eeb0b43@student.nitw.ac.in','7997242903','2023-01-19 09:55:00','2023-01-19 09:55:00'),(19,'Kammula','Keerthi','1990-06-23','Male','45 Spruce St, Aspen Hill','8008499921','kk22eeb0b21@student.nitw.ac.in','8008499921','2023-01-20 17:10:00','2023-01-20 17:10:00'),(20,'Gudipati','Umesh','1983-08-31','Female','123 Dogwood Rd, Willow Creek','8121594101','gu22eeb0b14@student.nitw.ac.in','8121594101','2023-01-21 12:20:00','2023-01-21 12:20:00'),(21,'Rapolu','Sai','1998-01-04','Male','789 Alder Ln, Bayside','8179243136','rs22eeb0b12@student.nitw.ac.in','8179243136','2023-01-22 16:05:00','2023-01-22 16:05:00'),(22,'Varshin','Bommanaboina','2003-04-25','Female','90 Fir St, Forestville','8374584755','vb22eeb0b51@student.nitw.ac.in','8374584755','2023-01-23 14:25:00','2023-01-23 14:25:00'),(23,'Ambuj','Kumar','1991-11-13','Male','67 Maple Ln, Sunnyside','8545084819','ak22eeb0b36@student.nitw.ac.in','8545084819','2023-01-24 10:40:00','2023-01-24 10:40:00'),(24,'Amula','Akhil','1984-03-16','Female','45 Birchwood Ave, Mountain View','8555801435','aa22eeb0b38@student.nitw.ac.in','8555801435','2023-01-25 11:00:00','2023-01-25 11:00:00'),(25,'Donthula','Sudheer','1982-07-27','Male','89 Chestnut St, Green Hills','8555915775','ds22eeb0b10@student.nitw.ac.in','8555915775','2023-01-26 13:15:00','2023-01-26 13:15:00'),(26,'R','Charantej','1995-09-12','Female','123 Oak Blvd, Shady Pines','8688197832','rc22eeb0b16@student.nitw.ac.in','8688197832','2023-01-27 09:45:00','2023-01-27 09:45:00'),(27,'Gaurav','Bankar','1994-02-06','Male','34 Aspen Ln, Highland Park','8806054466','gb22eeb0b55@student.nitw.ac.in','8806054466','2023-01-28 16:00:00','2023-01-28 16:00:00'),(28,'Dulal','Doley','1990-10-29','Female','456 Willow Ct, River Heights','8822325845','dd22eeb0b63@student.nitw.ac.in','8822325845','2023-01-29 18:30:00','2023-01-29 18:30:00'),(29,'Bhadani','Heet','1988-06-01','Male','789 Cedar Blvd, Meadow Ridge','8850954134','bh22eeb0b23@student.nitw.ac.in','8850954134','2023-01-30 17:00:00','2023-01-30 17:00:00'),(30,'Pathivada','Niharika','1986-05-14','Female','90 Maplewood Dr, Pleasant Valley','8885427406','pn22eeb0b39@student.nitw.ac.in','8885427406','2023-01-31 10:30:00','2023-01-31 10:30:00'),(31,'Chilukani','Vamshi','1993-12-09','Male','67 Pine Ln, Forest Hill','8886667087','cv22eeb0b05@student.nitw.ac.in','8886667087','2023-02-01 12:00:00','2023-02-01 12:00:00'),(32,'Chidugu','Jessyjasmin','2002-03-26','Female','12 Elm St, Sunset Valley','8919331592','cj22eeb0b41@student.nitw.ac.in','8919331592','2023-02-02 14:15:00','2023-02-02 14:15:00'),(33,'Chandragiri','Praneeth','1999-07-15','Male','45 Oakridge Dr, Fairview','8919803985','cp22eeb0b34@student.nitw.ac.in','8919803985','2023-02-03 16:20:00','2023-02-03 16:20:00'),(34,'N','Chandan','1997-01-20','Female','89 Aspen Blvd, Brookhaven','8919858733','nc22eeb0b17@student.nitw.ac.in','8919858733','2023-02-04 11:50:00','2023-02-04 11:50:00'),(35,'Marri','Yadhu','1992-11-02','Male','23 Sycamore Ct, Whispering Pines','8919916765','my22eeb0b56@student.nitw.ac.in','8919916765','2023-02-05 13:05:00','2023-02-05 13:05:00'),(36,'Thodupunuri','Abhinav','1987-04-13','Female','67 Birchwood Ln, Timberland','9000642164','ta22eeb0b07@student.nitw.ac.in','9000642164','2023-02-06 09:25:00','2023-02-06 09:25:00'),(37,'Achanta','Devi','1991-08-05','Male','90 Juniper Dr, Oakmont','9010973336','ad22eeb0b25@student.nitw.ac.in','9010973336','2023-02-07 17:15:00','2023-02-07 17:15:00'),(38,'Jillella','Shivamani','1984-02-19','Female','123 Chestnut St, Lakeview','9014188331','js22eeb0b54@student.nitw.ac.in','9014188331','2023-02-08 15:10:00','2023-02-08 15:10:00'),(39,'Mohammed','Nahil','2000-09-10','Male','456 Maple Dr, Sunnyside Heights','9030453126','mn22eeb0b20@student.nitw.ac.in','9030453126','2023-02-09 18:35:00','2023-02-09 18:35:00'),(40,'Parsharouthu','Bhavani','1996-12-07','Female','789 Willow Blvd, Pine Ridge','9100971815','pb22eeb0b44@student.nitw.ac.in','9100971815','2023-02-10 09:40:00','2023-02-10 09:40:00'),(41,'Durge','Shreya','1983-05-22','Male','34 Oak Ln, Riverbend','9247480750','ds22eeb0b59@student.nitw.ac.in','9247480750','2023-02-11 14:30:00','2023-02-11 14:30:00'),(42,'Kotam','Divya','1990-03-30','Female','89 Aspen Ct, Woodland Park','9247485307','kd22eeb0b58@student.nitw.ac.in','9247485307','2023-02-12 19:05:00','2023-02-12 19:05:00'),(43,'Rama','','1995-11-18','Male','45 Cedar Blvd, Summit Hill','9302955925','rr22eeb0b61@student.nitw.ac.in','9302955925','2023-02-13 08:55:00','2023-02-13 08:55:00'),(44,'Boreddy','Muktheswara','1989-07-02','Female','67 Birchwood Rd, Golden Valley','9390506747','bm22eeb0b18@student.nitw.ac.in','9390506747','2023-02-14 16:45:00','2023-02-14 16:45:00'),(45,'Thangallapally','Rishika','1982-10-27','Male','90 Elm Dr, Lakeside View','9391693013','tr22eeb0b48@student.nitw.ac.in','9391693013','2023-02-15 12:10:00','2023-02-15 12:10:00'),(46,'Kota','Surya','2001-01-14','Female','123 Maplewood Ct, Sunset Hills','9441375244','ks22eeb0b03@student.nitw.ac.in','9441375244','2023-02-16 10:20:00','2023-02-16 10:20:00'),(47,'Surakanti','Akshitha','1994-06-03','Male','456 Oakridge Blvd, Pinewood Estates','9441491323','sa22eeb0b01@student.nitw.ac.in','9441491323','2023-02-17 13:25:00','2023-02-17 13:25:00'),(48,'Arpit','Ghusinga','1986-08-25','Female','789 Sycamore Ln, Meadowlands','9460601073','ag22eeb0b64@student.nitw.ac.in','9460601073','2023-02-18 14:00:00','2023-02-18 14:00:00'),(49,'Samana','Tulasi','1987-12-30','Male','23 Cedar Dr, Spring Valley','9502684318','st22eeb0b30@student.nitw.ac.in','9502684318','2023-02-19 18:15:00','2023-02-19 18:15:00'),(50,'Ganta','Swarna','1998-09-17','Female','67 Redwood St, Aspen Creek','9515661793','gs22eeb0b26@student.nitw.ac.in','9515661793','2023-02-20 09:10:00','2023-02-20 09:10:00'),(51,'Dola','Devisriprasad','1983-02-11','Male','45 Juniper Ave, Woodland Grove','9515821645','dd22eeb0b31@student.nitw.ac.in','9515821645','2023-02-21 10:50:00','2023-02-21 10:50:00'),(52,'Rakesh','Upadhyay','1989-05-28','Female','90 Poplar Blvd, Timber Ridge','9602719369','ru22eeb0b24@student.nitw.ac.in','9602719369','2023-02-22 15:50:00','2023-02-22 15:50:00'),(53,'Boddula','Siri','1996-07-24','Male','34 Cherry Ln, Whispering Hills','9640147590','bs22eeb0b49@student.nitw.ac.in','9640147590','2023-02-23 13:45:00','2023-02-23 13:45:00'),(54,'Sania','Sohel','1991-04-15','Female','12 Dogwood Rd, Lakeshore','9676913951','ss22eeb0b28@student.nitw.ac.in','9676913951','2023-02-24 16:00:00','2023-02-24 16:00:00'),(55,'Maddula','Vineeth','2003-11-04','Male','67 Willow St, Golden Ridge','9704579126','mv22eeb0b11@student.nitw.ac.in','9704579126','2023-02-25 11:40:00','2023-02-25 11:40:00'),(56,'Arya','Aji','1992-06-21','Female','456 Chestnut Blvd, Brookview','9745247080','aa22eeb0b42@student.nitw.ac.in','9745247080','2023-02-26 18:25:00','2023-02-26 18:25:00'),(57,'Dharaneesh','C','1988-08-09','Male','90 Elmwood Ln, Forest Glen','9750556645','dc22eeb0b40@student.nitw.ac.in','9750556645','2023-02-27 10:10:00','2023-02-27 10:10:00'),(58,'B','Varshika','1990-01-08','Female','23 Maple Ave, Sunset Point','9848395846','bv22eeb0b65@student.nitw.ac.in','9848395846','2023-02-28 14:50:00','2023-02-28 14:50:00'),(59,'Thaniparthi','Venkat','1997-03-18','Male','45 Birch Dr, Meadowfield','9866221044','tv22eeb0b15@student.nitw.ac.in','9866221044','2023-03-01 13:00:00','2023-03-01 13:00:00'),(60,'Prabhat','Shukla','1985-10-11','Female','789 Aspen Blvd, Highland Valley','9936400733','ps22eeb0b13@student.nitw.ac.in','9936400733','2023-03-02 12:35:00','2023-03-02 12:35:00'),(61,'Yedla','Sai','1994-05-05','Male','34 Sycamore Rd, Cedar Grove','9948230592','ys22eeb0b19@student.nitw.ac.in','9948230592','2023-03-03 11:10:00','2023-03-03 11:10:00'),(62,'Yechu','Rishi','1993-12-31','Female','67 Pinewood Ct, Willow Hill','9949425417','yr22eeb0b53@student.nitw.ac.in','9949425417','2023-03-04 16:40:00','2023-03-04 16:40:00'),(63,'Banoth','Bharath','1999-07-03','Male','123 Juniper Dr, Green Meadow','9949933861','bb22eeb0b67@student.nitw.ac.in','9949933861','2023-03-05 19:25:00','2023-03-05 19:25:00'),(64,'Nomula','Abhinav','2002-10-16','Female','456 Poplar Blvd, Shady Brook','9963065875','na22eeb0b35@student.nitw.ac.in','9963065875','2023-03-06 09:30:00','2023-03-06 09:30:00'),(65,'Shanigarapu','Madhusree','1987-09-08','Male','90 Cherry Ave, Lakewood Ranch','9963453909','sm22eeb0b46@student.nitw.ac.in','9963453909','2023-03-07 10:45:00','2023-03-07 10:45:00'),(66,'Pilli','Srilatha','1990-11-21','Female','45 Dogwood Ln, Sunny Hill','9963787314','ps22eeb0b45@student.nitw.ac.in','9963787314','2023-03-08 13:55:00','2023-03-08 13:55:00'),(67,'Lingampelli','Nandana','1995-04-06','Male','67 Oakwood Rd, Pleasant Grove','9963982801','ln22eeb0b02@student.nitw.ac.in','9963982801','2023-03-09 17:50:00','2023-03-09 17:50:00'),(68,'Dommalapati','Shamitha','1996-07-24','Male','789 Aspen Blvd, Highland Valley','9985682073','ds22eeb0b29@student.nitw.ac.in','9985682073','2023-03-10 16:30:00','2023-03-10 16:30:00'),(69,'Rohit','','1991-04-15','Male','34 Sycamore Rd, Cedar Grove','9990282835','rr22eeb0b62@student.nitw.ac.in','9990282835','2023-03-11 12:25:00','2023-03-11 12:25:00'),(70,'Aakifah','Fatima','2003-11-04','Male','67 Pinewood Ct, Willow Hill','7386527819','af22eeb0f14@student.nitw.ac.in','7386527819','2023-03-12 14:05:00','2023-03-12 14:05:00'),(71,'Paul','Bobby','1992-06-21','Male','123 Juniper Dr, Green Meadow','8714538559','pb22eeb0f11@student.nitw.ac.in','8714538559','2023-03-13 11:00:00','2023-03-13 11:00:00');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `price_per_unit` decimal(10,2) NOT NULL,
  `supplier_name` varchar(100) DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy`
--

LOCK TABLES `pharmacy` WRITE;
/*!40000 ALTER TABLE `pharmacy` DISABLE KEYS */;
INSERT INTO `pharmacy` VALUES (1,'Paracetamol',200,2.00,'HealthCare Pharma','2025-06-30','2024-12-28 08:00:00','2024-12-28 08:00:00'),(2,'Amoxicillin',150,5.00,'MediSupply Ltd.','2025-03-31','2024-12-28 09:00:00','2024-12-28 09:00:00'),(3,'Ibuprofen',300,3.00,'GoodHealth Inc.','2025-09-30','2024-12-28 10:00:00','2024-12-28 10:00:00'),(4,'Insulin',100,20.00,'DiabeticCare Co.','2025-12-31','2024-12-28 07:30:00','2024-12-28 07:30:00'),(5,'Cough Syrup',120,7.00,'PharmaMedics LLC','2025-01-31','2024-12-28 08:30:00','2024-12-28 08:30:00');
/*!40000 ALTER TABLE `pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medical_record_id` int NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `dosage` varchar(50) NOT NULL,
  `frequency` varchar(50) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `medical_record_id` (`medical_record_id`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`medical_record_id`) REFERENCES `medical_records` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,1,'Amlodipine','10mg','1 time a day','30 days','2024-12-28 08:00:00','2024-12-28 08:00:00'),(2,2,'Insulin','15IU','Before meals','14 days','2024-12-28 09:00:00','2024-12-28 09:00:00'),(3,3,'Loratadine','5mg','1 time a day','10 days','2024-12-28 10:00:00','2024-12-28 10:00:00');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int DEFAULT NULL,
  `room_type` enum('General','ICU','Private') NOT NULL,
  `floor` int NOT NULL,
  `status` enum('Available','Occupied') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `room_number_idx` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,101,'General',1,'Available','2024-12-28 21:50:39','2024-12-28 21:50:39'),(2,102,'General',1,'Occupied','2024-12-28 21:50:39','2024-12-28 21:50:39'),(3,201,'Private',2,'Available','2024-12-28 21:50:39','2024-12-28 21:50:39'),(4,202,'ICU',2,'Occupied','2024-12-28 21:50:39','2024-12-28 21:50:39'),(5,301,'Private',3,'Available','2024-12-28 21:50:39','2024-12-28 21:50:39'),(6,302,'ICU',3,'Occupied','2024-12-28 21:50:39','2024-12-28 21:50:39'),(7,401,'General',4,'Available','2024-12-28 21:50:39','2024-12-28 21:50:39'),(8,402,'Private',4,'Occupied','2024-12-28 21:50:39','2024-12-28 21:50:39'),(9,501,'ICU',5,'Available','2024-12-28 21:50:39','2024-12-28 21:50:39'),(10,502,'General',5,'Occupied','2024-12-28 21:50:39','2024-12-28 21:50:39'),(11,103,'Private',2,'Available','2024-12-29 16:30:18','2024-12-29 16:30:18');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `role` enum('Nurse','Receptionist','Admin','Lab Technician','Cleaner','Pharmacist','Security') DEFAULT NULL,
  `department_id` int NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Sarah','Johnson','Nurse',1,'9123456780','sarah.johnson@example.com','2024-12-28 08:00:00','2024-12-28 08:00:00'),(2,'Emily','Davis','Receptionist',2,'9876543211','emily.davis@example.com','2024-12-28 09:00:00','2024-12-28 09:00:00'),(3,'James','Smith','Lab Technician',3,'8765432100','james.smith@example.com','2024-12-28 10:00:00','2024-12-28 10:00:00'),(4,'Linda','Wilson','Nurse',4,'9654321876','linda.wilson@example.com','2024-12-28 07:30:00','2024-12-28 07:30:00'),(5,'Robert','Martinez','Cleaner',5,'9543218765','robert.martinez@example.com','2024-12-28 08:30:00','2024-12-28 08:30:00'),(6,'Karen','Brown','Admin',6,'9432187654','karen.brown@example.com','2024-12-28 09:30:00','2024-12-28 09:30:00'),(7,'Michael','Taylor','Pharmacist',7,'9321876543','michael.taylor@example.com','2024-12-28 10:30:00','2024-12-28 10:30:00'),(8,'Susan','Moore','Receptionist',8,'9218765432','susan.moore@example.com','2024-12-28 07:00:00','2024-12-28 07:00:00'),(9,'David','Harris','Security',9,'9876123457','david.harris@example.com','2024-12-28 08:45:00','2024-12-28 08:45:00'),(10,'Jessica','Clark','Nurse',10,'9988776654','jessica.clark@example.com','2024-12-28 09:15:00','2024-12-28 09:15:00');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('Admin','Doctor','Patient','Staff') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','5f4dcc3b5aa765d61d','Admin','2024-12-28 08:00:00','2024-12-28 08:00:00'),(2,'doctor.jones','a4b61598b03d1cd89e','Doctor','2024-12-28 09:00:00','2024-12-28 09:00:00'),(3,'patient01','2bb80d537b1da3e38b','Patient','2024-12-28 10:00:00','2024-12-28 10:00:00'),(4,'staff.smith','3a8f1a37f2c3bdf8c9','Staff','2024-12-28 07:30:00','2024-12-28 07:30:00'),(5,'patient02','1d7355c5061b2f32d1','Patient','2024-12-28 08:30:00','2024-12-28 08:30:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13  0:55:30
