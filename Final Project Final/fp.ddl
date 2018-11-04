+--------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| AccredAgency | CREATE TABLE `AccredAgency` (
  `SchoolID` int(11) unsigned DEFAULT NULL,
  `AccrAgencyName` varchar(255) DEFAULT NULL,
  KEY `SchoolID` (`SchoolID`),
  CONSTRAINT `AccredAgency_ibfk_1` FOREIGN KEY (`SchoolID`) REFERENCES `School` (`SchoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+--------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

---------------------------------------------------------------------------------------------------------+
| Admission | CREATE TABLE `Admission` (
  `SchoolID` int(11) unsigned DEFAULT NULL,
  `AdmissionRate` decimal(10,1) DEFAULT NULL,
  KEY `SchoolID` (`SchoolID`),
  CONSTRAINT `Admission_ibfk_1` FOREIGN KEY (`SchoolID`) REFERENCES `School` (`SchoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+-----------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
------------------------------------------------------------------------------------------------------------+
| City  | CREATE TABLE `City` (
  `CityName` varchar(255) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `StateID` int(11) DEFAULT NULL,
  `CityID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`CityID`)
) ENGINE=InnoDB AUTO_INCREMENT=3502 DEFAULT CHARSET=utf8 |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

----------------------------+
| MajorMidCareerPercentile | CREATE TABLE `MajorMidCareerPercentile` (
  `MajorID` int(11) DEFAULT NULL,
  `MidCareer10thPercentile` decimal(10,2) DEFAULT NULL,
  `MidCareer25thPercentile` decimal(10,2) DEFAULT NULL,
  `MidCareer75thPercentile` decimal(10,2) DEFAULT NULL,
  `MidCareer90thPercentile` decimal(10,2) DEFAULT NULL,
  KEY `MajorID` (`MajorID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 |
+--------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
---------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| MajorStartingToMidCareer | CREATE TABLE `MajorStartingToMidCareer` (
  `MajorID` int(11) DEFAULT NULL,
  `StartingMedianSalary` decimal(10,2) DEFAULT NULL,
  `MidCareerMedianSalary` decimal(10,2) DEFAULT NULL,
  `PercentChangeFromStartingToMidCareer` decimal(4,1) DEFAULT NULL,
  KEY `MajorID` (`MajorID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 |
+--------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

+--------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Region | CREATE TABLE `Region` (
  `RegionName` varchar(12) DEFAULT NULL,
  `RegionID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`RegionID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 |
+--------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-----------------------------------------------------------------------------------------+
| SATScore | CREATE TABLE `SATScore` (
  `SchoolID` int(11) unsigned DEFAULT NULL,
  `SATAVG` int(11) DEFAULT NULL,
  KEY `SchoolID` (`SchoolID`),
  CONSTRAINT `SATScore_ibfk_1` FOREIGN KEY (`SchoolID`) REFERENCES `School` (`SchoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
+--------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| School | CREATE TABLE `School` (
  `SchoolName` varchar(255) DEFAULT NULL,
  `SchoolID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`SchoolID`)
) ENGINE=InnoDB AUTO_INCREMENT=7790 DEFAULT CHARSET=utf8 |
+--------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-----------------------------------------------------------------------------------------------------------------------------+
| SchoolMidCareerPercentile | CREATE TABLE `SchoolMidCareerPercentile` (
  `MidCareer10thPercentile` decimal(10,2) DEFAULT NULL,
  `MidCareer25thPercentile` decimal(10,2) DEFAULT NULL,
  `MidCareer75thPercentile` decimal(10,2) DEFAULT NULL,
  `MidCareer90thPercentile` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 |
+---------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| SchoolRegion | CREATE TABLE `SchoolRegion` (
  `SchoolID` int(11) unsigned NOT NULL DEFAULT '0',
  `RegionID` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 |
+--------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
---------------------------------------------------------------------------+
| SchoolStartingToMidCareer | CREATE TABLE `SchoolStartingToMidCareer` (
  `SchoolID` int(11) unsigned NOT NULL DEFAULT '0',
  `StartingMedian` decimal(10,2) DEFAULT NULL,
  `Mid_CareerMedian` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 |
+---------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
--------------------------------+
| SchoolType | CREATE TABLE `SchoolType` (
  `SchoolID` int(11) unsigned DEFAULT NULL,
  `SchoolType` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  KEY `SchoolID` (`SchoolID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 |
+------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-----------------------------------------------------------------------------------------------------------------------------+
| degrees_that_pay_back | CREATE TABLE `degrees_that_pay_back` (
  `Undergraduate_Major` varchar(36) DEFAULT NULL,
  `Starting_Median_Salary` decimal(10,2) DEFAULT NULL,
  `Mid_Career_Median_Salary` decimal(10,2) DEFAULT NULL,
  `Percent_change_from_Starting_to_Mid_Career_Salary` decimal(4,1) DEFAULT NULL,
  `Mid_Career_10th_Percentile_Salary` decimal(10,2) DEFAULT NULL,
  `Mid_Career_25th_Percentile_Salary` decimal(10,2) DEFAULT NULL,
  `Mid_Career_75th_Percentile_Salary` decimal(10,2) DEFAULT NULL,
  `Mid_Career_90th_Percentile_Salary` decimal(10,2) DEFAULT NULL,
  `MajorID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MajorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| salaries_by_college_type | CREATE TABLE `salaries_by_college_type` (
  `SchoolName` varchar(255) DEFAULT NULL,
  `SchoolType` varchar(255) DEFAULT NULL,
  `Starting_Median_Salary` decimal(10,2) DEFAULT NULL,
  `Mid_Career_Median_Salary` decimal(10,2) DEFAULT NULL,
  `Mid_Career_10th_Percentile_Salary` decimal(10,2) DEFAULT NULL,
  `Mid_Career_25th_Percentile_Salary` decimal(10,2) DEFAULT NULL,
  `Mid_Career_75th_Percentile_Salary` decimal(10,2) DEFAULT NULL,
  `Mid_Career_90th_Percentile_Salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+--------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

-----------------------------------------------------------------------------------------------------------------------------------------------------------+
| salaries_by_region | CREATE TABLE `salaries_by_region` (
  `School_Name` varchar(67) DEFAULT NULL,
  `Region` varchar(12) DEFAULT NULL,
  `Starting_Median_Salary` varchar(10) DEFAULT NULL,
  `Mid_Career_Median_Salary` varchar(11) DEFAULT NULL,
  `Mid_Career_10th_Percentile_Salary` varchar(10) DEFAULT NULL,
  `Mid_Career_25th_Percentile_Salary` varchar(11) DEFAULT NULL,
  `Mid_Career_75th_Percentile_Salary` varchar(11) DEFAULT NULL,
  `Mid_Career_90th_Percentile_Salary` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+--------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
