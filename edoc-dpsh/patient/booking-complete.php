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


    if($_POST){
        if(isset($_POST["booknow"])){
            $scheduleid=$_POST["scheduleid"];
            $date=$_POST["date"];
            
            // Get the doctor ID for this schedule
            $schedule_query = "SELECT docid FROM schedule WHERE scheduleid = $scheduleid";
            $schedule_result = $database->query($schedule_query);
            $schedule_data = $schedule_result->fetch_assoc();
            $doctor_id = $schedule_data['docid'];
            
            // Check if patient already has an appointment with this doctor
            $check_query = "SELECT a.appoid FROM appointment a 
                           JOIN schedule s ON a.scheduleid = s.scheduleid 
                           WHERE a.pid = $userid AND s.docid = $doctor_id 
                           AND s.scheduledate >= '$date'";
            $check_result = $database->query($check_query);
            
            if($check_result->num_rows > 0) {
                // Patient already has an appointment with this doctor
                // Instead of showing error, redirect back with doctor ID to disable button
                header("location: schedule.php?doctor_id=" . $doctor_id);
                exit();
            }
            
            // Get the next appointment number by finding the maximum apponum and adding 1
            $result = $database->query("SELECT MAX(apponum) as max_apponum FROM appointment");
            $row = $result->fetch_assoc();
            $next_apponum = ($row['max_apponum'] > 0) ? $row['max_apponum'] + 1 : 1;
            
            // Format the appointment number to be at least 3 digits
            $formatted_apponum = str_pad($next_apponum, 3, '0', STR_PAD_LEFT);
            
            // Insert the appointment with the next appointment number
            $sql2="insert into appointment(pid,apponum,scheduleid,appodate) values ($userid,$next_apponum,$scheduleid,'$date')";
            $result= $database->query($sql2);
            
            header("location: appointment.php?action=booking-added&id=".$formatted_apponum."&titleget=none");
        }
    }
 ?>