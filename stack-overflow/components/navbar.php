<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position: fixed; width: 100%; top: 0%; z-index: 100;">
    <a class="navbar-brand" href="index.php"><img src="css/logo_text.png" alt="logo" width="200"> 
</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
        <?php
        if (isLoggedIn()) {
            $home = $active === 'home' ? 'active' : '';
            $my_questions = $active === 'my_questions' ? 'active' : '';
            $my_answers = $active === 'my_answers' ? 'active' : '';
            echo '
                <ul class="navbar-nav">
                    <li class="nav-item ' . $home . '">
                        <a class="nav-link" href="index.php">Home</a>
                    </li>
                    <li class="nav-item ' . $my_questions . '">
                        <a class="nav-link" href="my_questions.php">My Questions</a>
                    </li>
                    <li class="nav-item ' . $my_answers . '">
                        <a class="nav-link" href="my_answers.php">My Answers</a>
                    </li>
                </ul>';
        }
        ?>
        <form class="form-inline" action="search.php">
            <input name="search" class="form-control mx-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
        <?php
        if (!isLoggedIn()) {
            echo '
                <div class="d-flex items-content-center justify-content-center">
                    <a href="signin.php" class="btn btn-primary mx-2">Sign In</a>
                    <a href="signup.php" class="btn btn-info">Sign Up</a>
                </div>';
        } else {
            echo '
            <form action="signout.php" method="post" class="form-inline">
                <button name="logout" type="submit" class="btn btn-danger">Logout</button>
            </form>
            ';
        }
        ?>
    </div>
</nav>