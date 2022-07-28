

<?php

SESSION_START();

if(isset($_SESSION["email"]))
{

$email = $_SESSION['email'];

$servername = "localhost";
$username = "root";
$password = "password";
$db = "website";

$conn = mysqli_connect($servername, $username, $password,$db);
if (!$conn) {

   die("Connection failed: " . mysqli_connect_error());

}

$sql = "SELECT * FROM `user` where email='$email'";
$sql2 ="SELECT * FROM `normal_user` where normal_email='$email' " ;
$result = mysqli_query($conn, $sql);
$result2 = mysqli_query($conn, $sql2);

 if(mysqli_num_rows($result) ==1)
 {
  $row = mysqli_fetch_assoc($result);
  
 
}

if(mysqli_num_rows($result2) ==1)
 {
  $row2 = mysqli_fetch_assoc($result2);
  
 
}

}
else
{
	header("location: login-register.html");
}

?>


<html>

<head>
    <link rel="stylesheet" href="../CSS/edit-user-profile.css?"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="../JS/edit-user-profile.js"></script>
</head> 

<body>

    <div class="container" id="container">
        
            <form action="editInfo.php" method="post" enctype="multipart/form-data">
                <h1>Update Info</h1>
                <input type="text" placeholder="Name" name="name" id="name" value="<?php echo $row['name'];?>" />
                <input type="email" placeholder="Email" name="email" id="email" value="<?php echo $row['email'];?>"/>
				<input type="password" placeholder="Password"  name="password" id="password" value="<?php echo $row['password'];?>" />
                <input type="Bio" placeholder="Bio" name="bio" id="bio" value="<?php echo $row2['bio'];?>" />
                <input type="info" placeholder="info" name="info" id="info" value="<?php echo $row2['info'];?>" />
                <input type="skills" name="skills" id="skills" value="<?php echo $row2['skills'];?>" placeholder="write you skills seperated by a comma" />
                Upload Picture: <input type="file" name="my_image" id="my_image" class="btn btn-info" value="Upload Picture">
                <button type="submit" name="btn" id="btn" >Update my info</button>
            </form>
        
    </div>
</body>

</html>


