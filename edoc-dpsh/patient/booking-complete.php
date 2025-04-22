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
            
            // Get the next appointment number by finding the maximum apponum and adding 1
            $result = $database->query("SELECT MAX(apponum) as max_apponum FROM appointment");
            $row = $result->fetch_assoc();
            $next_apponum = ($row['max_apponum'] > 0) ? $row['max_apponum'] + 1 : 1;
            
            // Insert the appointment with the next appointment number
            $sql2="insert into appointment(pid,apponum,scheduleid,appodate) values ($userid,$next_apponum,$scheduleid,'$date')";
            $result= $database->query($sql2);
            
            header("location: appointment.php?action=booking-added&id=".$next_apponum."&titleget=none");
        }
    }
 ?>