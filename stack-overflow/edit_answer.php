<?php
require_once 'functions/web.php';
require_once 'functions/answer.php';
require_once 'functions/db_connection.php';

$active = null;

if (!isLoggedIn()) {
    redirect('signin.php');
}

if (!isset($_GET['answer_id']) && !isset($_POST['answer_id'])) {
    redirect('my_answers.php');
}

if (isset($_POST['submit'])) {
    updateAnswer(
        $_POST['answer'],
        $_POST['answer_id']
    );
    alertMessage('Updated Successfully');
}

$answer = getAnswer($_GET['answer_id'] ?? $_POST['answer_id']);
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
            <form action="edit_answer.php" method="post">
                <div class="row justify-content-md-center">
                    <div class="col-md-12 col-lg-8">
                        <div class="form-group">
                            <textarea name="answer" id="editor" required><?php echo htmlspecialchars_decode($answer['answer']) ?></textarea>
                        </div>
                        <input type="hidden" name="answer_id" value="<?php echo $_GET['answer_id'] ?? $_POST['answer_id'] ?>">
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