<html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">
      <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            div {
            padding-top: 50px;
            padding-right: 30px;
            padding-bottom: 50px;
            padding-left: 30px;
            }
        </style>
        <title> College Database </title>
    </head>
    <body>
<?php
include 'open.php';
if (isset($_POST["SName"])) {
    $SName = $_POST["SName"]; //Get the user input.
    $mysqli->multi_query("CALL ShowCollegeInfo('" . $SName . "');"); // Execute the query with the input.
    $res = $mysqli->store_result();
}
if (isset($_POST["major"])) {
    $major = $_POST["major"];
    $mysqli->multi_query("CALL ShowMajorInfo('" . $major . "');"); // Execute the query with the input.
    $res2 = $mysqli->store_result();
}
if (isset($_POST["sala"])) {
    $sala = $_POST["sala"];
    $mysqli->multi_query("CALL ShowHigherSalary('" . $sala . "');"); // Execute the query with the input.
    $resSala = $mysqli->store_result();
}
if ($res) {
    $row = $res->fetch_assoc();
    if ($row == 0) { //Handle mismatch of college info here?
    } else if ($row['Error Message']) {
        echo "<div>";
        echo "<td ><tr>" . $row['Error Message'] . "</td> </tr>";
        echo "</div>";
    } else {
        $res->data_seek(0);
        echo "<div>";
        echo "<table class=\"pure-table pure-table-horizontal\">";
        // echo "<table border=\"1px solid black\">"; // The procedure executed successfully.
        echo "<thead>";
        echo "<tr><th> School Name</th>";
        echo "<th> School Type</th>";
        echo "<th> Region</th>";
        echo "<th> SAT average</th>";
        echo "<th> Admission Rate</th>";
        echo "<th> Name of Accredited Agency</th></tr>";
        echo "</thead>";
        echo "<tbody>";
        while ($row = $res->fetch_assoc()) {
            echo "<tr><td>" . $row['SchoolName'] . "</td>";
            echo "<td>" . $row['SchoolType'] . "</td>";
            echo "<td>" . $row['Region'] . "</td>";
            echo "<td>" . $row['SATAVG'] . "</td>";
            echo "<td>" . $row['AdmissionRate'] . "</td>";
            echo "<td>" . $row['AccrAgencyName'] . "</td></tr>";
        }
        echo "</tbody>";
        echo "</table>";
        echo "</div>";
    }
    $res->free(); // Clean-up.

}
if ($res2) {
    $row = $res2->fetch_assoc();
    if ($row == 0) {
        echo "<h1> Testing: Empty </h1>";
    } else if ($row['Error Message']) {
        echo "<div>";
        echo "<td><tr>" . $row['Error Message'] . "</td> </tr>";
        echo "</div>";
    } else {
        $res2->data_seek(0);
        echo "<div>";
        echo "<table class=\"pure-table pure-table-horizontal\">";

        // echo "<table border=\"1px solid black\">"; // The procedure executed successfully.
        echo "<thead>";
        echo "<tr><th> Major Name </th>";
        echo "<th> Starting Median Salary </th>";
        echo "<th> Mid-Career Median Salary </th>";
        echo "<th> Percent Change from Starting to Mid Career </th>";
        echo "<th> Mid-Career Salary in the 10th Percentile </th>";
        echo "<th> Mid-Career Salary in the 25th Percentile</th>";
        echo "<th> Mid-Career Salary in the 75th Percentile</th>";
        echo "<th>  Mid-Career Salary in the 90th Percentile</th></tr>";
        echo "</thead>";
        echo "<tbody>";
        while ($row = $res2->fetch_assoc()) {
            echo "<tr><td>" . $row['MajorName'] . "</td>";
            echo "<td>" . $row['StartingMedianSalary'] . "</td>";
            echo "<td>" . $row['MidCareerMedianSalary'] . "</td>";
            echo "<td>" . $row['PercentChangeFromStartingToMidCareer'] . "</td>";
            echo "<td>" . $row['MidCareer10thPercentile'] . "</td>";
            echo "<td>" . $row['MidCareer25thPercentile'] . "</td>";
            echo "<td>" . $row['MidCareer75thPercentile'] . "</td>";
            echo "<td>" . $row['MidCareer90thPercentile'] . "</td></tr>";
        }
        echo "</tbody>";
        echo "</table>";
        echo "</div>";
    }
    $res2->free(); // Clean-up.
}
if ($resSala) {

        echo "<div>";
        echo "<table class=\"pure-table pure-table-horizontal\">";
        echo "<thead>";
        echo "<tr><th> Majors with Higher Salaries </th></tr>";
        echo "</thead>";
        echo "<tbody>";
        while ($row4 = $resSala->fetch_assoc()) {
            echo "<tr>";
            foreach($row4 as $field) {
            echo "<td>" . htmlspecialchars($field) . "</td>";
            }
            echo "</tr>";
        }
        echo "</tbody>";
        echo "</table>";
    echo "</div>";

    $resSala->free(); // Clean-up.
}
echo "<center>";
echo "<h1> Extra Information </h1>";
$mysqli->next_result();
echo "<div>";
echo "<table class=\"pure-table pure-table-horizontal\">";
    echo "<thead>";
    echo "<tr><th> Schools with the lowest admission rates </th></tr>";
    echo "</thead>";
    echo "<tbody>";
    $mysqli->multi_query("CALL LowestAdmissionRate();"); // Execute the query with the input.
    $res3 = $mysqli->store_result();
    while ($row3 = $res3->fetch_assoc()) {
        echo "<tr>";
        foreach($row3 as $field) {
        echo "<td>" . htmlspecialchars($field) . "</td>";
        }
        echo "</tr>";
    }
    echo "</tbody>";
    echo "</table>";
echo "</div>";
$res3->free();

$mysqli->next_result();
echo "<div>";
echo "<table class=\"pure-table pure-table-horizontal\">";
    echo "<thead>";
    echo "<tr><th> Ivy School Median Salary </th></tr>";
    echo "</thead>";
    echo "<tbody>";
    $mysqli->multi_query("CALL IvyMedianSalary();"); // Execute the query with the input.
    $res4 = $mysqli->store_result();
    while ($row4 = $res4->fetch_assoc()) {
        echo "<tr>";
        foreach($row4 as $field) {
        echo "<td>" . htmlspecialchars($field) . "</td>";
        }
        echo "</tr>";
    }
    echo "</tbody>";
    echo "</table>";
echo "</div>";
$res4->free();

$mysqli->next_result();
echo "<div>";
echo "<table class=\"pure-table pure-table-horizontal\">";
    echo "<thead>";
    echo "<tr><th> Major with the highest Mid Career Median Salary in each percentile </th></tr>";

    echo "<tr><th> MidCareerHighestTenthPercentile </th>";
    echo "<th> MidCareerHighestTwentyfifthPercentile </th>";
    echo "<th> MidCareerHighestSeventiethPercentile </th>";
    echo "<th> MidCareerHighestNintiethPercentile </th></tr>";

    echo "</thead>";
    echo "<tbody>";
    $mysqli->multi_query("CALL MajorHighestMedCareerMedian();"); // Execute the query with the input.
    $res5 = $mysqli->store_result();
    while ($row5 = $res5->fetch_assoc()) {
        echo "<tr>";
        foreach($row5 as $field) {
        echo "<td>" . htmlspecialchars($field) . "</td>";
        }
        echo "</tr>";
    }
    echo "</tbody>";
    echo "</table>";
echo "</div>";
$res5->free();
echo "</center>";
// else {
//     printf("<br>Error: %s\n", $mysqli->error); // The procedure failed to execute.
// }
$mysqli->close();
?>
    </body>
</html>
