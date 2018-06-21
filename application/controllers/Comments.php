<?php

class Comments extends CI_Controller {
    function add_comment($post_id) {
        if (!$this->input->post()) {
            return redirect(base_url('blog/post/'.$post_id));
        }

        $user_type = $this->session->userdata('user_type');
        if (!$user_type) {
            return redirect(base_url('users/login'));
        }

        $this->load->model('comment');
        $data = [
            'post_id' => $post_id,
            'user_id' => $this->session->userdata('user_id'),
            'comment' => $this->input->post('comment')
        ];
        $this->comment->add_comment($data);
        redirect(base_url('blog/post/'.$post_id));
    }
}