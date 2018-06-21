<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bobby's Blog</title>
    <link rel="icon" type="image/png" sizes="32x32" href="<?=base_url('public/images/favicon.png')?>">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <!-- Bulma Version 0.7.1-->
    <link rel="stylesheet" type="text/css" href="<?=base_url('public/libs/bulma/bulma.min.css')?>" />
    <link rel="stylesheet" type="text/css" href="<?=base_url('public/css/style.css')?>">
</head>

<body>
    <!-- START NAV -->
    <nav class="navbar">
        <div class="container">
            <div class="navbar-brand">
                <a class="navbar-item" href="<?=base_url()?>"><strong>Bobby's blog</strong></a>
                <span class="navbar-burger burger" data-target="navbarMenu">
                <span></span>
                <span></span>
                <span></span>
                </span>
            </div>
            <div id="navbarMenu" class="navbar-menu">
                <div class="navbar-end">
                    <a class="navbar-item <?=is_active($active, 'home')?>" href="<?=base_url()?>">
                        Home
                    </a>
                    <a class="navbar-item" href="<?=base_url('blog/post/21')?>">
                        About Me
                    </a>
                    <a class="navbar-item <?=is_active($active, 'search')?>" href="<?=base_url('blog/search')?>">
                        Search
                    </a>
                    <?php if ($this->session->userdata('user_id')) {?>
                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">
                            <?=$this->session->userdata['username']?>
                        </a>
                        <div class="navbar-dropdown">
                            <a class="navbar-item <?=is_active($active, 'new_post')?>" href="<?=base_url('blog/new_post')?>">
                                New Post
                            </a>
                            <a class="navbar-item <?=is_active($active, 'upload')?>" href="<?=base_url('upload')?>">
                                Upload
                            </a>
                            <hr class="navbar-divider">
                            <a class="navbar-item" href="<?=base_url('users/logout')?>">
                                Logout
                            </a>
                        </div>
                    </div>
                    <?php } else{ ?>
                    <a class="navbar-item <?=is_active($active, 'login')?>" href="<?=base_url('users/login')?>">
                        Login
                    </a>
                    <a class="navbar-item <?=is_active($active, 'register')?>" href="<?=base_url('users/register')?>">
                        Register
                    </a>
                    <?php } ?>
                </div>
            </div>
        </div>
    </nav>
    <!-- END NAV -->

    <section class="hero is-info is-medium is-bold">
        <div class="hero-body">
            <div class="container has-text-centered">
                <h1 class="title">"Life is like riding a bicycle. To keep your balance, you must keep moving."</h1>
                <div class="subtitle" style="font-weight: 800">Albert Einstein</div>
            </div>
        </div>
    </section>