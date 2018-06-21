<?php require('partials/_header.php') ?>
<div class="container">
    <section class="articles">
        <div class="column is-8 is-offset-2">
            <div class="card article">
                <div class="card-content">
                    <div class="media">
                        <div class="media-center">
                            <img src="<?=base_url('public/images/blogging.png')?>" class="author-image" alt="Placeholder image">
                        </div>
                        <div class="media-content has-text-centered">
                            <h2 class="title article-title" href="<?=base_url('blog/post/'.$post['post_id'])?>"><?=$post['title'];?></h2>
                            <div class="tags has-addons level-item">
                                <span class="tag is-rounded is-info"><?=$post['username']?></span>
                                <span class="tag is-rounded"><?=date_format(date_create($post['date_added']), 'Y-m-d H:i:s')?></span>
                            </div>
                        </div>
                    </div>
                    <div class="content article-body">
                        <?=$post['description']?>
                        <?php if ($this->session->userdata('user_id') && $this->session->userdata('user_type') != 'user') {?>
                            <p><a href="<?=base_url('blog/edit_post/'.$post['post_id'])?>">Edit</a> | <a href="<?=base_url('blog/delete_post/'.$post['post_id'])?>">Delete</a></p>
                        <?php }?>
                    </div>
                </div>
            </div>

            <div class="card article" style="margin-top: 1rem">
                <div class="card-content">
                    <div class="content article-body">
                        <?php if ($post['comments']) { ?>
                            <?php if (count($comments)) { ?>
                                <?php foreach ($comments as $row) {?>
                                    <blockquote>
                                        <strong><?=$row['username']?></strong> <small><?=date_format(date_create($row['date_added']), 'Y-m-d H:i:s')?></small>
                                        <br>
                                        <?=strip_tags($row['comment'])?>
                                    </blockquote>
                                <?php }?>
                            <?php } else { ?>
                                <p>Currently, there are no comments.</p>
                            <?php } ?>
                            <?php if ($this->session->userdata('user_id')) {?>
                                <form action="<?=base_url('comments/add_comment/'.$post['post_id'])?>" method="post">
                                    <div class="field">
                                        <label class="label">New comment</label>
                                        <div class="control">
                                            <textarea class="textarea" name="comment"></textarea>
                                        </div>
                                    </div>

                                    <div class="field">
                                        <p class="control">
                                            <input type="submit" class="button is-primary" value="Submit">
                                        </p>
                                    </div>
                                </form>
                            <?php } else { ?>
                                <a href="<?=base_url('users/login')?>">Login to comment</a>.
                            <?php } ?>
                        <?php } else { ?>
                            <p>Comments are disabled for this post.</p>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<?php require('partials/_footer.php') ?>