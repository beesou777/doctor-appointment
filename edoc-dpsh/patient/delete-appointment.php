<?php

    session_start();

    if(isset($_SESSION["user"])){
        if(($_SESSION["user"])=="" or $_SESSION['usertype']!='p'){
            header("location: ../login.php");
        }

    }else{
        header("location: ../login.php");
    }
    
    
    if($_GET){
        //import database
        include("../connection.php");
        $id=$_GET["id"];
        
        // Get appointment details before deletion
        $appointment_query = "SELECT a.*, p.pname, p.pemail, s.title, s.scheduledate, s.scheduletime, d.docname, d.docemail 
                             FROM appointment a 
                             JOIN patient p ON a.pid = p.pid 
                             JOIN schedule s ON a.scheduleid = s.scheduleid 
                             JOIN doctor d ON s.docid = d.docid 
                             WHERE a.appoid = '$id'";
        $appointment_result = $database->query($appointment_query);
        $appointment_data = $appointment_result->fetch_assoc();
        
        if($appointment_data) {
            $patient_name = $appointment_data['pname'];
            $patient_email = $appointment_data['pemail'];
            $doctor_name = $appointment_data['docname'];
            $doctor_email = $appointment_data['docemail'];
            $session_title = $appointment_data['title'];
            $session_date = $appointment_data['scheduledate'];
            $session_time = $appointment_data['scheduletime'];
            $appointment_num = $appointment_data['apponum'];
            
            // Delete the appointment
            $sql = $database->query("DELETE FROM appointment WHERE appoid='$id'");
            
            // Send notification to patient
            $patient_subject = "Appointment Cancellation Notification";
            $patient_message = "Dear $patient_name,\n\n";
            $patient_message .= "Your appointment with Dr. $doctor_name for $session_title on $session_date at $session_time (Appointment #$appointment_num) has been cancelled.\n\n";
            $patient_message .= "If you did not request this cancellation, please contact the admin immediately.\n\n";
            $patient_message .= "Best regards,\neDoc Team";
            
            // Send notification to admin
            $admin_query = "SELECT aemail FROM admin LIMIT 1";
            $admin_result = $database->query($admin_query);
            $admin_email = $admin_result->fetch_assoc()['aemail'];
            
            $admin_subject = "Appointment Cancellation Alert";
            $admin_message = "An appointment has been cancelled:\n\n";
            $admin_message .= "Patient: $patient_name ($patient_email)\n";
            $admin_message .= "Doctor: Dr. $doctor_name ($doctor_email)\n";
            $admin_message .= "Session: $session_title on $session_date at $session_time\n";
            $admin_message .= "Appointment #: $appointment_num\n\n";
            $admin_message .= "This is an automated notification.";
            
            // Send emails (in a real system, you would use a proper email library)
            // For now, we'll just log the notifications
            $notification_log = "Patient notification: $patient_email - $patient_subject\n";
            $notification_log .= "Admin notification: $admin_email - $admin_subject\n";
            
            // Log the notification (in a real system, you would store this in a database)
            file_put_contents("../logs/appointment_notifications.log", $notification_log, FILE_APPEND);
        }
        
        header("location: appointment.php");
    }


?>