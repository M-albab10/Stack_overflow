<?php

require_once 'functions/web.php';

if (isset($_POST['logout'])) {
    logout();
}
redirect('index.php');
