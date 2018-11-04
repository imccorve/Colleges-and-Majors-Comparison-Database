-- Enter College Name (test)
delimiter //
DROP PROCEDURE IF EXISTS ShowCollegeInfo //
CREATE PROCEDURE ShowCollegeInfo(IN SName VARCHAR(255))
    BEGIN
        IF EXISTS ( SELECT SName FROM School WHERE SName = School.SchoolName) THEN
            SELECT SchoolName, SchoolType, Region, SATAVG, AdmissionRate, AccrAgencyName
            FROM School, SchoolType, SATScore, AccredAgency, salaries_by_region, Admission
            WHERE School.SchoolName = SName
            and School.SchoolID = SchoolType.SchoolID
            and School.SchoolID = SATScore.SchoolID
            and School.SchoolID = AccredAgency.SchoolID
            and School.SchoolID = Admission.SchoolID
            and School.SchoolName = salaries_by_region.School_Name;

        ELSE
            SELECT 'ERROR: College Does not exist in Database' AS 'Error Message';
        END IF;
    END//
delimiter ;
-- Enter Major Name
delimiter //
DROP PROCEDURE IF EXISTS ShowMajorInfo //
CREATE PROCEDURE ShowMajorInfo(IN major VARCHAR(255))
    BEGIN
        IF EXISTS ( SELECT major FROM Major WHERE major = Major.MajorName) THEN
            SELECT MajorName, StartingMedianSalary, MidCareerMedianSalary, PercentChangeFromStartingToMidCareer,
            MidCareer10thPercentile, MidCareer25thPercentile, MidCareer75thPercentile, MidCareer90thPercentile
            FROM Major, MajorStartingToMidCareer, MajorMidCareerPercentile
            WHERE Major.MajorName = major
            and Major.MajorID = MajorStartingToMidCareer.MajorID
            and Major.MajorID = MajorMidCareerPercentile.MajorID;
        ELSE
            SELECT 'ERROR: Major Does not exist in Database' AS 'Error Message';
        END IF;
    END//
delimiter ;
