#//http://randombio.com/linuxsetup107.html
#//Thank you!
#//Try also http://www.johnboyproductions.com/php-upload-progress-bar/

<?php

#$destination_path = $_REQUEST["destination"] . "/"; 
$target_path = "/tmp";
$target_path = $target_path . basename( $_FILES['uploadedfile']['name']); 

#echo "User=" .          $_ENV["USER"] . "<br />";
echo "Source=" .        $_FILES['uploadedfile']['name'] . "<br />"; 
#echo "Destination=" .   $destination_path . "<br />"; 
echo "Target path=" .   $target_path . "<br />"; 
echo "Size=" .          $_FILES['uploadedfile']['size'] . "<br />"; 
echo "Tmp name=" .    $_FILES['uploadedfile']['tmp_name'] . "<br />"; 

print_r($_FILES);
if ($_FILES["uploadedfile"]["error"] > 0)
    {
        echo "Apologies, an error has occurred.";
        echo "Error Code: " . $_FILES["uploadedfile"]["error"];
    }
    else
    {
echo "no errors\n";
echo $_FILES['uploadedfile']['tmp_name'] . "\n";
echo "/tmp/" . $_FILES['uploadedfile']['name'] . "\n";
if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], "/tmp/" . $_FILES['uploadedfile']['name'])) {
    echo "The file ".  basename( $_FILES['uploadedfile']['name']). 
    " has been uploaded";
} else{
    echo "There was an error uploading the file, please try again!";
}
}
?>

