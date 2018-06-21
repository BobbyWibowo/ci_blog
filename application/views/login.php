<?php require('partials/_header.php') ?>
<div class="container">
    <section class="articles">
        <div class="column is-8 is-offset-2">
            <div class="card article">
                <div class="card-content">
                    <div class="content article-body">
                        <h2>Login</h2>
                        <form action="<?=base_url('users/login')?>" method="post">
                            <?php if (count($errors)) { ?>
                            <div class="notification is-danger">
                                <?=implode('<br>', $errors)?>
                            </div>
                            <?php } ?>

                            <div class="field">
                                <label class="label">Username</label>
                                <div class="control">
                                    <input class="input" type="text" name="username">
                                </div>
                            </div>

                            <div class="field">
                                <label class="label">Password</label>
                                <div class="control">
                                    <input class="input" type="password" name="password">
                                </div>
                            </div>

                            <div class="field">
                                <label class="label">User Type</label>
                                <div class="control">
                                    <div class="select">
                                    <select name="user_type">
                                        <option value="admin">Admin</option>
                                        <option value="author">Author</option>
                                        <option value="user" selected>User</option>
                                    </select>
                                    </div>
                                </div>
                            </div>

                            <div class="field">
                                <p class="control">
                                    <input type="submit" class="button is-primary" value="Login">
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<?php require('partials/_footer.php') ?>