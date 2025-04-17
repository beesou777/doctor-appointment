<?php
session_start();

// Check if user is logged in and is of type 'patient'
if (isset($_SESSION["user"])) {
    if ($_SESSION["user"] == "" || $_SESSION['usertype'] != 'p') {
        header("location: ../login.php");
    } else {
        $useremail = $_SESSION["user"];
    }
} else {
    header("location: ../login.php");
}

// Import database connection
include("../connection.php");

$userrow = $database->query("SELECT * FROM patient WHERE pemail='$useremail'");
$userfetch = $userrow->fetch_assoc();
$userid = $userfetch["pid"];
$username = $userfetch["pname"];

// Set timezone and get today's date
date_default_timezone_set('Asia/Kolkata');
$today = date('Y-m-d');

// Handle search logic
$searchtype = "All";
$insertkey = "";
$q = "";
$sqlmain = "SELECT * FROM schedule 
            INNER JOIN doctor ON schedule.docid = doctor.docid 
            WHERE schedule.scheduledate >= '$today' 
            ORDER BY schedule.scheduledate ASC";

if ($_POST) {
    if (!empty($_POST["search"])) {
        $keyword = $_POST["search"];
        $sqlmain = "SELECT * FROM schedule 
                    INNER JOIN doctor ON schedule.docid = doctor.docid 
                    WHERE schedule.scheduledate >= '$today' AND (
                        doctor.docname LIKE '%$keyword%' OR 
                        schedule.title LIKE '%$keyword%' OR 
                        schedule.scheduledate LIKE '%$keyword%'
                    ) 
                    ORDER BY schedule.scheduledate ASC";
        $insertkey = $keyword;
        $searchtype = "Search Result : ";
        $q = '"';
    }
}

// Run the query to fetch the schedule
$result = $database->query($sqlmain);

// Convert result to an array and filter non-overlapping sessions
$sessions = [];
while ($row = $result->fetch_assoc()) {
    $start = strtotime($row['scheduledate'] . ' ' . $row['scheduletime']);
    $end = $start + 3600; // Assuming 1-hour duration
    $row['start'] = $start;
    $row['end'] = $end;
    $sessions[] = $row;
}

// Sort sessions by end time
usort($sessions, function($a, $b) {
    return $a['end'] <=> $b['end'];
});

// Filter for non-overlapping sessions (greedy algorithm)
$filtered_sessions = [];
$last_end = 0;

foreach ($sessions as $session) {
    if ($session['start'] >= $last_end) {
        $filtered_sessions[] = $session;
        $last_end = $session['end'];
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/animations.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/admin.css">
    <title>Sessions</title>
    <style>
        .popup {
            animation: transitionIn-Y-bottom 0.5s;
        }
        .sub-table {
            animation: transitionIn-Y-bottom 0.5s;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="menu">
            <table class="menu-container" border="0">
                <tr>
                    <td style="padding:10px" colspan="2">
                        <table border="0" class="profile-container">
                            <tr>
                                <td width="30%" style="padding-left:20px">
                                    <img src="../img/user.png" alt="" width="100%" style="border-radius:50%">
                                </td>
                                <td style="padding:0px;margin:0px;">
                                    <p class="profile-title"><?php echo substr($username, 0, 13); ?>..</p>
                                    <p class="profile-subtitle"><?php echo substr($useremail, 0, 22); ?></p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="../logout.php"><input type="button" value="Log out" class="logout-btn btn-primary-soft btn"></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="menu-row" >
                    <td class="menu-btn menu-icon-home " >
                        <a href="index.php" class="non-style-link-menu "><div><p class="menu-text">Home</p></a></div></a>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-doctor">
                        <a href="doctors.php" class="non-style-link-menu"><div><p class="menu-text">All Doctors</p></a></div>
                    </td>
                </tr>
                
                <tr class="menu-row" >
                    <td class="menu-btn menu-icon-session menu-active menu-icon-session-active">
                        <a href="schedule.php" class="non-style-link-menu non-style-link-menu-active"><div><p class="menu-text">Scheduled Sessions</p></div></a>
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

        <div class="dash-body">
            <table border="0" width="100%" style="border-spacing: 0; margin:0; padding:0; margin-top:25px;">
                <tr>
                    <td width="13%">
                        <a href="schedule.php"><button class="login-btn btn-primary-soft btn btn-icon-back" style="padding-top:11px;padding-bottom:11px;margin-left:20px;width:125px"><font class="tn-in-text">Back</font></button></a>
                    </td>
                    <td>
                        <form action="" method="post" class="header-search">
                            <input type="search" name="search" class="input-text header-searchbar" placeholder="Search Doctor name or Date (YYYY-MM-DD)" list="doctors" value="<?php echo $insertkey; ?>" />
                            <input type="submit" value="Search" class="login-btn btn-primary btn" style="padding-left: 25px;padding-right: 25px;padding-top: 10px;padding-bottom: 10px;">
                        </form>
                    </td>
                    <td width="15%">
                        <p style="font-size: 14px;color: rgb(119, 119, 119); padding: 0;margin: 0;text-align: right;">
                            Today's Date
                        </p>
                        <p class="heading-sub12" style="padding: 0;margin: 0;">
                            <?php echo $today; ?>
                        </p>
                    </td>
                    <td width="10%">
                        <button class="btn-label" style="display: flex;justify-content: center;align-items: center;"><img src="../img/calendar.svg" width="100%"></button>
                    </td>
                </tr>

                <tr>
                    <td colspan="4" style="padding-top:10px;width: 100%;">
                        <p class="heading-main12" style="margin-left: 45px;font-size:18px;color:rgb(49, 49, 49)">
                            <?php echo $searchtype . " Sessions(" . count($filtered_sessions) . ")"; ?>
                        </p>
                        <p class="heading-main12" style="margin-left: 45px;font-size:22px;color:rgb(49, 49, 49)">
                            <?php echo $q . $insertkey . $q; ?>
                        </p>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <center>
                            <div class="abc scroll">
                                <table width="100%" class="sub-table scrolldown" border="0" style="padding: 50px; border:none;">
                                    <tbody>
                                        <?php
                                        if (count($filtered_sessions) == 0) {
                                            echo '<tr>
                                                    <td colspan="4">
                                                    <br><br><br><br>
                                                    <center>
                                                    <img src="../img/notfound.svg" width="25%">
                                                    <br>
                                                    <p class="heading-main12" style="margin-left: 45px;font-size:20px;color:rgb(49, 49, 49)">No sessions found!</p>
                                                    <a class="non-style-link" href="schedule.php"><button class="login-btn btn-primary-soft btn">Show all Sessions</button></a>
                                                    </center>
                                                    <br><br><br><br>
                                                    </td>
                                                  </tr>';
                                        } else {
                                            foreach ($filtered_sessions as $session) {
                                                echo '<tr>
                                                        <td style="width: 25%;">
                                                        <div class="dashboard-items search-items">
                                                            <div style="width:100%">
                                                                <div class="h1-search">' . substr($session['title'], 0, 21) . '</div><br>
                                                                <div class="h3-search">' . substr($session['docname'], 0, 30) . '</div>
                                                                <div class="h4-search">' . $session['scheduledate'] . '<br>Starts: <b>@' . substr($session['scheduletime'], 0, 5) . '</b> (24h)</div>
                                                                <br>
                                                                <a href="booking.php?id=' . $session['scheduleid'] . '">
                                                                <button class="login-btn btn-primary-soft btn" style="padding-top:11px;padding-bottom:11px;width:100%">
                                                                <font class="tn-in-text">Book Now</font></button></a>
                                                            </div>
                                                        </div>
                                                        </td>
                                                    </tr>';
                                            }
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </center>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
