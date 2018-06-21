<?php

class Users extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('user');
    }

    function login() {
        // If already logged in
        if ($this->session->userdata('user_id')) {
            return redirect(base_url()); // Redirect to index
        }

        $data['errors'] = [];
        if ($this->input->post()) {
            $username = $this->input->post('username', TRUE);
            $password = $this->input->post('password', TRUE);
            $user_type = $this->input->post('user_type', TRUE);
            $user = $this->user->login($username, $password, $user_type);

            if (!$user) {
                $data['errors'][] = 'Username or password incorrect.';
            } else {
                $this->session->set_userdata('user_id', $user['user_id']);
                $this->session->set_userdata('username', $user['username']);
                $this->session->set_userdata('user_type',$user['user_type']);
                return redirect(base_url());
            }
        }

        $data['active'] = 'login';
        $this->load->view($data['active'], $data);
    }

    function logout() {
        $this->session->sess_destroy();
        redirect(base_url());
    }

    function register() {
        $this->load->library('form_validation');

        $data['errors'] = [];
        if ($this->input->post()) {
            $config = [
                [
                    'field' => 'username',
                    'label' => 'Username',
                    // is_unique[users.username] = is unique username in the users table
                    'rules' => 'trim|required|min_length[3]|is_unique[users.username]'
                ],
                [
                    'field' => 'password',
                    'label' => 'Password',
                    'rules' => 'trim|required|min_length[5]|max_length[20]'
                ],
                [
                    'field' => 'passconf',
                    'label' => 'Password confirmed',
                    'rules' => 'trim|required|matches[password]',
                ],
                [
                    'field' => 'user_type',
                    'label' => 'User type',
                    'rules' => 'trim|required',
                ],
                [
                    'field' => 'email',
                    'label' => 'Email',
                    // is_unique[users.email] = is unique email in the users table
                    'rules' => 'trim|required|is_unique[users.email]|valid_email',
                ],
            ];

            $this->form_validation->set_rules($config);
            if ($this->form_validation->run() == FALSE) {
                $data['errors'] = $this->form_validation->error_array();
            } else {
                $data = [
                    'username' => $this->input->post('username'),
                    'email' => $this->input->post('email'),
                    'password' => sha1($this->input->post('password')),
                    'user_type' => $this->input->post('user_type'),
                ];
                $user_id = $this->user->create_user($data);
                $this->session->set_userdata('user_id',$user_id);
                $this->session->set_userdata('username',$this->input->post('username'));
                $this->session->set_userdata('user_type',$this->input->post('user_type'));
                return redirect(base_url());
            }
        }

        $data['active'] = 'register';
        $this->load->view($data['active'], $data);
    }
}