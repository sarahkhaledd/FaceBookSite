<?php


$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "website";


$conn = mysqli_connect($servername, $username, $password, $dbname);

if (isset($_POST['liked'])) {
    $post_id = $_POST["post_id"];
    $email = $_POST["user_email"];
    $result = mysqli_query($conn, "SELECT * FROM `post` WHERE id=$post_id");
    $row = mysqli_fetch_array($result);
    $n = $row["like_counter"];

    mysqli_query($conn, "UPDATE `post` SET `like_counter`=$n+1 WHERE id=$post_id");
    mysqli_query($conn, "INSERT INTO `post_likes`(`user_email`, `post_id`) VALUES ('$email',$post_id)");
    exit();

}
if (isset($_POST['unliked'])) {
    $post_id = $_POST["post_id"];
    $email = $_POST["user_email"];
    $result = mysqli_query($conn, "SELECT * FROM `post` WHERE id=$post_id");
    $row = mysqli_fetch_array($result);
    $n = $row["like_counter"];

    mysqli_query($conn, "UPDATE `post` SET `like_counter`=$n-1 WHERE id=$post_id");
    mysqli_query($conn, "DELETE FROM `post_likes` WHERE post_id=$post_id AND user_email='$email'");
    exit();

}
?>
