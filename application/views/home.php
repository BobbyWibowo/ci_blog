<?php require('partials/_header.php') ?>
<div class="container">
        <!-- START ARTICLE FEED -->
        <section class="articles">
            <div class="column is-8 is-offset-2">
                <?php foreach ($posts as $post) {?>
                <!-- START ARTICLE -->
                <div class="card article">
                    <div class="card-content">
                        <div class="media">
                            <div class="media-center">
                                <img src="<?=base_url('public/images/blogging.png')?>" class="author-image" alt="Placeholder image">
                            </div>
                            <div class="media-content has-text-centered">
                                <a class="title article-title" href="<?=base_url('blog/post/'.$post['post_id'])?>"><?=$post['title'];?></a>
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
                <!-- END ARTICLE -->
                <?php } ?>
            </div>
            <?=$pages?>
        </section>
        <!-- END ARTICLE FEED -->
</div>
<?php require('partials/_footer.php') ?>