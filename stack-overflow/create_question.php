<!-- Display current user questions with pagination and can edit, delete, add, search -->
<?php
require_once 'functions/web.php';
require_once 'functions/question.php';
require_once 'functions/db_connection.php';

$active = null;

if (!isLoggedIn()) {
    redirect('signin.php');
}

if (isset($_POST['submit'])) {
    createQuestion(
        $_POST['title'],
        $_POST['description'],
        currentUserId()
    );
    alertMessage('Created Successfully');
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stack Overflow</title>
    <?php require_once 'components/styles.php' ?>
</head>

<body>
    <?php require_once 'components/navbar.php' ?>
    <hr><hr><hr><hr><hr>
    <div class="container">
        <div class="container mt-4 mb-4">
            <form action="create_question.php" method="post">
                <div class="row justify-content-md-center">
                    <div class="col-md-12 col-lg-8">
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input name="title" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <textarea name="description" id="editor"></textarea>
                        </div>
                        <button name="submit" type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.tiny.cloud/1/pg1x28xat94v0az13fouoe7y2oo0lfr93byt94whvwtfg393/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

    <script>
        tinymce.init({
            selector: 'textarea',
            plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
            toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
            menubar: false,
        });
    </script>
</body>

</html>