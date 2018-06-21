<?php

class Upload extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->helper('form');
        $this->_extensions = [
            'gif',
            'jpeg',
            'jpg',
            'png'
        ];
    }

    function index() {
        $data = [
            'success' => NULL,
            'errors' => NULL,
            'extensions' => $this->_extensions,
            'active' => 'upload'
        ];
        $this->load->view($data['active'], $data);
    }

    function do_upload() {
        // When the user is not an admin and author
        if (!$this->check_permissions('author')) {
            return redirect(base_url('users/login'));
        }

        $config = [
            'upload_path' => './uploads/',
            'allowed_types' => $this->_extensions,
            'encrypt_name' => TRUE
        ];
        $this->load->library('upload', $config);

        $data = [
            'success' => NULL,
            'errors' => NULL,
            'extensions' => $this->_extensions,
            'active' => 'upload'
        ];
        if (!$this->upload->do_upload('userfile')) {
            $data['errors'] = $this->upload->display_errors('', '<br>');
        } else {
            $data['success'] = $this->upload->data()['file_name'];
        }
        $this->load->view($data['active'], $data);
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