<?php require('partials/_header.php') ?>
<div class="container">
    <section class="articles">
        <div class="column is-8 is-offset-2">
            <div class="card article">
                <div class="card-content">
                    <div class="content article-body">
                        <h2>Edit Post</h2>
                        <?php if ($success) { ?>
                        <div class="notification is-info">
                            The post has been updated.
                        </div>
                        <?php } ?>
                        <?php if (count($errors)) { ?>
                        <div class="notification is-danger">
                            <?=implode('<br>', $errors)?>
                        </div>
                        <?php } ?>
                        <form action="<?=base_url('blog/edit_post/'.$post['post_id'])?>" method="post">
                            <div class="field">
                                <label class="label">Title</label>
                                <div class="control">
                                    <input class="input" type="text" name="title" value="<?=set_value('title', $post['title'])?>">
                                </div>
                            </div>

                            <div class="field">
                                <label class="label">Description</label>
                                <div class="control">
                                    <textarea class="textarea" name="description"><?=set_value('description', $post['description'])?></textarea>
                                </div>
                            </div>

                            <div class="field">
                                <label class="checkbox">
                                    <input type="checkbox" name="comments" <?=set_checkbox('comments', 'on', $post['comments'])?>>
                                    Allow comments
                                </label>
                            </div>

                            <div class="field">
                                <label class="checkbox">
                                    <input type="checkbox" name="public" <?=set_checkbox('public', 'on', $post['public'])?>>
                                    Public
                                </label>
                            </div>

                            <div class="field is-grouped">
                                <div class="control">
                                    <input type="submit" class="button is-primary" value="Update">
                                </div>
                                <div class="control">
                                    <a class="button is-info" href="<?=base_url('blog/post/'.$post['post_id'])?>">Return to post</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<?php require('partials/_footer.php') ?>