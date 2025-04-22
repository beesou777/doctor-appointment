<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/animations.css">  
    <link rel="stylesheet" href="../css/main.css">  
    <link rel="stylesheet" href="../css/admin.css">
        
    <title>Dashboard</title>
    <style>
        .dashbord-tables{
            animation: transitionIn-Y-over 0.5s;
        }
        .filter-container{
            animation: transitionIn-Y-bottom  0.5s;
        }
        .sub-table,.anime{
            animation: transitionIn-Y-bottom 0.5s;
        }
        .doctor-card {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 15px;
            margin: 10px 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .doctor-card:hover {
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            transform: translateY(-2px);
            transition: all 0.3s ease;
        }
        .doctor-name {
            color: #2c3e50;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .doctor-specialty {
            color: #3498db;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .doctor-email {
            color: #7f8c8d;
            font-size: 14px;
        }
        .book-btn {
            background-color: #3498db;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            text-decoration: none;
            display: inline-block;
        }
        .book-btn:hover {
            background-color: #2980b9;
        }
    </style>
    
    
</head>
<body>
    <?php

    //learn from w3schools.com

    session_start();

    if(isset($_SESSION["user"])){
        if(($_SESSION["user"])=="" or $_SESSION['usertype']!='p'){
            header("location: ../login.php");
        }else{
            $useremail=$_SESSION["user"];
        }

    }else{
        header("location: ../login.php");
    }
    

    //import database
    include("../connection.php");
    $userrow = $database->query("select * from patient where pemail='$useremail'");
    $userfetch=$userrow->fetch_assoc();
    $userid= $userfetch["pid"];
    $username=$userfetch["pname"];


    //echo $userid;
    //echo $username;
    
    ?>
    <div class="container">
        <div class="menu">
            <table class="menu-container" border="0">
                <tr>
                    <td style="padding:10px" colspan="2">
                        <table border="0" class="profile-container">
                            <tr>
                                <td width="30%" style="padding-left:20px" >
                                    <img src="../img/user.png" alt="" width="100%" style="border-radius:50%">
                                </td>
                                <td style="padding:0px;margin:0px;">
                                    <p class="profile-title"><?php echo substr($username,0,13)  ?>..</p>
                                    <p class="profile-subtitle"><?php echo substr($useremail,0,22)  ?></p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="../logout.php" ><input type="button" value="Log out" class="logout-btn btn-primary-soft btn"></a>
                                </td>
                            </tr>
                    </table>
                    </td>
                </tr>
                <tr class="menu-row" >
                    <td class="menu-btn menu-icon-home menu-active menu-icon-home-active" >
                        <a href="index.php" class="non-style-link-menu non-style-link-menu-active"><div><p class="menu-text">Home</p></a></div></a>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-doctor menu-active menu-icon-doctor-active">
                        <a href="recommend.php" class="non-style-link-menu non-style-link-menu-active"><div><p class="menu-text">Symptoms & Recommend</p></a></div>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-doctor">
                        <a href="doctors.php" class="non-style-link-menu"><div><p class="menu-text">All Doctors</p></a></div>
                    </td>
                </tr>
                
                <tr class="menu-row" >
                    <td class="menu-btn menu-icon-session">
                        <a href="schedule.php" class="non-style-link-menu"><div><p class="menu-text">Scheduled Sessions</p></div></a>
                    </td>
                </tr>
                <tr class="menu-row" >
                    <td class="menu-btn menu-icon-appoinment">
                        <a href="appointment.php" class="non-style-link-menu"><div><p class="menu-text">My Bookings</p></a></div>
                    </td>
                </tr>
                <tr class="menu-row" >
                    <td class="menu-btn menu-icon-settings">
                        <a href="settings.php" class="non-style-link-menu"><div><p class="menu-text">Settings</p></a></div>
                    </td>
                </tr>
                
            </table>
        </div>
        <div class="dash-body" style="margin-top: 15px">
            <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;" >
                
<html>
<head>
    <title>Doctor Recommendation</title>
</head>
<body>
<center><form method="POST" action="recommend.php" >
        <h1 style="color: #2c3e50; margin-bottom: 20px;">Enter Your Symptoms</h1>
        <label for="symptoms" style="display: block; font-size: 18px; color: #555555; margin-bottom: 10px;">Symptoms (comma-separated):</label><br>
        <input type="text" name="symptoms" id="symptoms" required style="width: 80%; padding: 15px; font-size: 16px; margin-bottom: 20px; border: 1px solid #cccccc; border-radius: 8px; box-sizing: border-box;"><br><br>
        <button type="submit" style="background-color: #87CEEB; color: white; padding: 15px 30px; font-size: 18px; border: none; border-radius: 8px; cursor: pointer; transition: background-color 0.3s ease;">Get Recommendation</button>
    </form>
</center>
</body>
</html>
<?php
// Database connection
$conn = new mysqli("localhost", "root", "", "edoc");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get symptoms from user input
$user_symptoms = isset($_POST['symptoms']) ? $_POST['symptoms'] : '';
$symptoms_array = array_map('trim', explode(',', $user_symptoms));

// Match symptoms with diseases using FIND_IN_SET
$where_clauses = [];
foreach ($symptoms_array as $symptom) {
    $where_clauses[] = "FIND_IN_SET('" . $conn->real_escape_string($symptom) . "', symptoms) > 0";
}
$sql_where = implode(' OR ', $where_clauses);

// Query to find matching diseases
$sql = "SELECT * FROM diseases WHERE $sql_where";
$result = $conn->query($sql);

$matched_diseases = [];

// Fetch matched diseases
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $matched_diseases[] = $row;
    }
}

// Display recommendations

ini_set('display_errors', 1);
error_reporting(E_ALL);
if (!empty($matched_diseases)) {
    echo '<div style="background-color: #f0f8ff; border: 1px solid #ccc; border-radius: 8px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">';
    echo '<h2 style="color: #2c3e50; margin-top: 0;">Recommendations</h2>';
    $item_index = 0; // To alternate colors
    foreach ($matched_diseases as $disease) {
        $bg_color = $item_index % 2 == 0 ? '#e6f7ff' : '#f5faff';
        echo '<div style="background-color: ' . $bg_color . '; padding: 10px; margin-bottom: 10px; border-radius: 5px;">';
        echo "<strong>Disease:</strong> " . $disease['name'] . "<br>";
        echo "<strong>Symptoms:</strong> " . $disease['symptoms'] . "<br>";

        // Query to get recommendations for the matched disease
        $recommend_sql = "SELECT recommendation FROM recommendations WHERE disease_id=" . $disease['id'];
        $recommend_result = $conn->query($recommend_sql);

        if ($recommend_result->num_rows > 0) {
            while ($recommendation = $recommend_result->fetch_assoc()) {
                echo "<strong>Recommendation:</strong> " . $recommendation['recommendation'] . "<br>";
            }
        } else {
            echo "<strong>Recommendation:</strong> No specific recommendation available.<br>";
        }
        echo '</div>';
        $item_index++;
    }
    echo '</div>';

    // Get recommended doctors based on the matched diseases
    echo '<div style="background-color: #f0f8ff; border: 1px solid #ccc; border-radius: 8px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">';
    echo '<h2 style="color: #2c3e50; margin-top: 0;">Recommended Doctors</h2>';
    
    // Get specialties that match the diseases
    $specialty_ids = [];
    foreach ($matched_diseases as $disease) {
        if (isset($disease['specialty_id'])) {
            $specialty_ids[] = $disease['specialty_id'];
        }
    }
    
    if (!empty($specialty_ids)) {
        $specialty_ids_str = implode(',', $specialty_ids);
        
        // Query to get doctors with matching specialties
        $doctor_sql = "SELECT d.*, s.sname as specialty_name 
                       FROM doctor d 
                       JOIN specialties s ON d.specialties = s.id 
                       WHERE d.specialties IN ($specialty_ids_str)";
        
        $doctor_result = $database->query($doctor_sql);
        
        if ($doctor_result->num_rows > 0) {
            echo '<div style="display: flex; flex-wrap: wrap; justify-content: space-between;">';
            while ($doctor = $doctor_result->fetch_assoc()) {
                echo '<div class="doctor-card" style="width: 48%; margin-bottom: 15px;">';
                echo '<div class="doctor-name">Dr. ' . $doctor['docname'] . '</div>';
                echo '<div class="doctor-specialty">Specialty: ' . $doctor['specialty_name'] . '</div>';
                echo '<div class="doctor-email">Email: ' . $doctor['docemail'] . '</div>';
                echo '<a href="schedule.php?search=' . urlencode($doctor['docname']) . '" class="book-btn">Book Appointment</a>';
                echo '</div>';
            }
            echo '</div>';
        } else {
            echo '<p style="color: #7f8c8d; font-style: italic;">No specific doctors found for these symptoms. Please check our <a href="doctors.php">complete doctor list</a>.</p>';
        }
    } else {
        // If no specialty IDs found, show all doctors
        $all_doctors_sql = "SELECT d.*, s.sname as specialty_name 
                           FROM doctor d 
                           JOIN specialties s ON d.specialties = s.id";
        $all_doctors_result = $database->query($all_doctors_sql);
        
        if ($all_doctors_result->num_rows > 0) {
            echo '<p style="color: #7f8c8d; margin-bottom: 15px;">Here are all our available doctors:</p>';
            echo '<div style="display: flex; flex-wrap: wrap; justify-content: space-between;">';
            while ($doctor = $all_doctors_result->fetch_assoc()) {
                echo '<div class="doctor-card" style="width: 48%; margin-bottom: 15px;">';
                echo '<div class="doctor-name">Dr. ' . $doctor['docname'] . '</div>';
                echo '<div class="doctor-specialty">Specialty: ' . $doctor['specialty_name'] . '</div>';
                echo '<div class="doctor-email">Email: ' . $doctor['docemail'] . '</div>';
                echo '<a href="schedule.php?search=' . urlencode($doctor['docname']) . '" class="book-btn">Book Appointment</a>';
                echo '</div>';
            }
            echo '</div>';
        } else {
            echo '<p style="color: #7f8c8d; font-style: italic;">No doctors found in the system.</p>';
        }
    }
    
    echo '</div>';
} else {
    echo '<div style="background-color: #fff3f3; border: 1px solid #ffcccc; border-radius: 8px; padding: 20px; margin: 20px 0; color: #a94442;">';
    echo "<p>No matching diseases found. Please consult a doctor for further advice.</p>";
    echo '</div>';
}

$conn->close();
?>