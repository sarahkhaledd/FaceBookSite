<?php
include 'config.php';
$conn = OpenCon();

$sender_email = $_POST['sender_email'];
$receiver_email = $_POST['receiver_email'];
$msg = $_POST['body'];

$sql = "INSERT INTO message (user1_email,body,user2_email) VALUES ('$sender_email', '$msg', '$receiver_email')";
mysqli_query($conn, $sql);


exit();
?>