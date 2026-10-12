<?php
require_once __DIR__ . '/env.php';

$db = pglife_db_config();
$conn = mysqli_connect($db['host'], $db['user'], $db['pass'], $db['name'], $db['port']);

if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL! Please contact the admin.";
    return;
}

mysqli_set_charset($conn, 'utf8mb4');
