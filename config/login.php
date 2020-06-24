<?php
if ($_SERVER['REQUEST_METHOD']=='POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    require_once 'conn.php';

    $sql = "SELECT * FROM mahasiswa WHERE nim='$email'";

    $response = mysqli_query($conn, $sql);

    $result = array();
    $result['login'] = array();

    if (mysqli_num_rows($response) === 1) {
        
        $row = mysqli_fetch_assoc($response);

        if ($password == $row['password_mahasiswa']) {
            
            $index['name'] = $row['nim'];
            $index['email'] = $row['nama_mahasiswa'];

            array_push($result['login'], $index);

            $result['success'] = "1";
            $result['message'] = "success";

            header('Content-Type: application/json');
            echo json_encode($result);

            mysqli_close($conn);

        } else {

            $result['success'] = "0";
            $result['message'] = "error";

            header('Content-Type: application/json');
            echo json_encode($result);

            mysqli_close($conn);

        }

    }
}

if ($_SERVER['REQUEST_METHOD']=='GET') {
    $email = $_GET['email'];
    $password = $_GET['password'];

    require_once 'conn.php';

    $sql = "SELECT * FROM mahasiswa WHERE nim='$email'";

    $response = mysqli_query($conn, $sql);

    $result = array();
    $result['login'] = array();

    if (mysqli_num_rows($response) === 1) {
        
        $row = mysqli_fetch_assoc($response);

        if ($password == $row['password_mahasiswa']) {
            
            $index['name'] = $row['nim'];
            $index['email'] = $row['nama_mahasiswa'];

            array_push($result['login'], $index);

            $result['success'] = "1";
            $result['message'] = "success";

            header('Content-Type: application/json');
            echo json_encode($result);

            mysqli_close($conn);

        } else {

            $result['success'] = "0";
            $result['message'] = "error";

            header('Content-Type: application/json');
            echo json_encode($result);

            mysqli_close($conn);

        }

    }
}