<?php require('partials/_header.php') ?>
<div class="container">
    <section class="articles">
        <div class="column is-8 is-offset-2">
            <div class="card article">
                <div class="card-content">
                    <div class="content article-body">
                        <h2>Upload</h2>
                        <?php if ($success) { ?>
                        <div class="notification">
                            File successfully uploaded to:<br>
                            <strong><a href="<?=base_url('uploads/'.$success)?>" target="_blank"><?=base_url('uploads/'.$success)?></a></strong>.<br>
                            <br>
                            <img src="<?=base_url('uploads/'.$success)?>">
                        </div>
                        <?php } ?>
                        <?php if ($errors) { ?>
                        <div class="notification is-danger">
                            <?=$errors?>
                        </div>
                        <?php } ?>

                        <p>Accepted file extensions: <?=implode(', ', $extensions)?>.</p>

                        <?=form_open_multipart(base_url('upload/do_upload'))?>
                            <div class="field">
                                <input type="file" name="userfile">
                            </div>

                            <div class="field">
                                <p class="control">
                                    <input type="submit" class="button is-primary" value="Upload">
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