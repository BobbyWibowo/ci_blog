<?php

class Blog extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('database');
    }

    // Index page
    function index($start = 0) {
        $data['posts'] = $this->database->get_posts(5, $start);

        // Pagination
        $this->load->library('pagination');
        $config['base_url'] = base_url('blog/index'); // URL to set pagination
        $config['total_rows'] = $this->database->get_post_count();
        $config['per_page'] = 5;
        $this->pagination->initialize($config);
        $data['pages'] = $this->pagination->create_links(); // Links of pages

        $data['active'] = 'home';
        $this->load->view($data['active'], $data);
    }

    // Search results page
    function search($query = '') {
        $query = $query != '' ? $query : $this->input->get('query', TRUE);

        $data = [
            'posts' => [],
            'pages' => NULL,
            'query' => $query,
            'active' => 'search'
        ];
        if ($query) {
            $data['posts'] = $this->database->search_posts($query);
        }

        $data['active'] = 'search';
        $this->load->view($data['active'], $data);
    }

    // Single post page
    function post($post_id) {
        $this->load->model('comment');
        $data['comments'] = $this->comment->get_comment($post_id);
        $data['post'] = $this->database->get_post($post_id);

        $data['active'] = 'single_post';
        $this->load->view($data['active'], $data);
    }

    // New post page
    function new_post() {
        // When the user is not an admin and author
        if (!$this->check_permissions('author')) {
            return redirect(base_url('users/login'));
        }

        $data = [
            'title' => '',
            'description' => '',
            'active' => 'new_post',
            'errors' => []
        ];
        if ($this->input->post()) {
            $input = [
                'title' => trim($this->input->post('title')),
                'description' => trim($this->input->post('description')),
                'active' => 1,
                'user_id' => $this->session->userdata('user_id')
            ];

            if (!strlen($input['title'])) {
                $data['errors'][] = 'Title can not be empty.';
            }

            if (!strlen($input['description'])) {
                $data['errors'][] = 'Description can not be empty.';
            }

            if (count($data['errors'])) {
                $data['title'] = $input['title'];
                $data['description'] = $input['description'];
                return $this->load->view($data['active'], $data);
            }

            $this->database->insert_post($input);
            return redirect(base_url());
        }

        $this->load->view($data['active'], $data);
    }

    // Edit post page
    function edit_post($post_id) {
        // When the user is not an admin and author
        if (!$this->check_permissions('author')) {
            return redirect(base_url('users/login'));
        }

        $data = [
            'title' => '',
            'description' => '',
            'active' => 'edit_post',
            'success' => FALSE,
            'errors' => []
        ];
        if ($this->input->post()) {
            $input = [
                'title' => $this->input->post('title'),
                'description' => $this->input->post('description'),
                'active' => 1
            ];

            if (!strlen($input['title'])) {
                $data['errors'][] = 'Title can not be empty.';
            }

            if (!strlen($input['description'])) {
                $data['errors'][] = 'Description can not be empty.';
            }

            if (count($data['errors'])) {
                $data['post'] = [
                    'title' => $input['title'],
                    'description' => $input['description']
                ];
                return $this->load->view($data['active'], $data);
            }

            $this->database->update_post($post_id, $input);
            $data['success'] = TRUE;
        }

        $data['post'] = $this->database->get_post($post_id);
        $this->load->view($data['active'], $data);
    }

    // Delete post page
    function delete_post($post_id) {
        // When the user is not an admin and author
        if (!$this->check_permissions('author')) {
            return redirect(base_url('users/login'));
        }

        $this->database->delete_post($post_id);
        redirect(base_url());
    }

    // Checking current user's permission
    function check_permissions($required) {
        $user_type = $this->session->userdata('user_type'); // Current user

        if ($required == 'user') {
            return isset($user);
        } elseif ($required == 'author') {
            return $user_type == 'author' || $user_type == 'admin';
        } elseif ($required == 'admin') {
            return $user_type == 'admin';
        }
    }
}