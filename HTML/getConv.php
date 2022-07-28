<?php
include 'config.php';
$conn = OpenCon();
function resultToArray($result)
{
    $rows = array();
    while ($row = $result->fetch_assoc()) {
        $rows[] = $row;
    }
    return $rows;
}

$user1 = $_POST['user1'];
$user2 = $_POST['user2'];

$sql = "SELECT * FROM message WHERE user1_email = '$user1' and user2_email ='$user2' 
        union 
        SELECT * FROM message WHERE user1_email = '$user2' and user2_email ='$user1'
        ORDER BY id";

$result = mysqli_query($conn, $sql);
$rows = resultToArray($result);
header('Content-Type: application/json');
echo json_encode(array('messages' => $rows));
exit;
