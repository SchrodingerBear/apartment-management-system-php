<?php
const CURRENCY = '₱';
const WEB_URL = 'http://localhost/ams/';
const ROOT_PATH = 'D:\laragon\www\ams/';

const DB_HOSTNAME = 'localhost';
const DB_USERNAME = 'root';
const DB_PASSWORD = '';
const DB_DATABASE = 'ams';

$link = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE) or die(mysqli_connect_error());
?>