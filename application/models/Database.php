<?php

class Database extends CI_Model {
    function get_posts($number = 10, $start = 0) {
        $this->db->select('posts.*,users.username');
        $this->db->from('posts');
        $this->db->join('users', 'users.user_id = posts.user_id', 'left');
        $this->db->where('public', 1);
        $this->db->order_by('date_added', 'desc');
        $this->db->limit($number, $start);
        $query = $this->db->get();
        return $query->result_array();
    }

	function search_posts($query) {
		$this->db->select('posts.*,users.username');
		$this->db->from('posts');
        $this->db->join('users', 'users.user_id = posts.user_id', 'left');
		$this->db->like('title', $query, 'both');
		$this->db->or_like('description', $query, 'both');
        $this->db->where('public', 1);
		$this->db->order_by('date_added', 'desc');
		$query = $this->db->get();
		return $query->result_array();
    }

    function get_post_count() {
        $this->db->select()->from('posts')->where('public', 1);
        $query = $this->db->count_all_results();
        return $query;
    }

    function get_post($post_id) {
        $this->db->select('posts.*,users.username');
        $this->db->from('posts');
        $this->db->join('users', 'users.user_id = posts.user_id', 'left');
        $this->db->where('post_id', $post_id);
        $this->db->order_by('date_added', 'desc');
        $query = $this->db->get();
        $array = $query->first_row('array');
        $array['public'] = (bool) $array['public'];
        $array['comments'] = (bool) $array['comments'];
        return $array;
    }

    function insert_post($data) {
        $this->db->insert('posts', $data);
        return $this->db->insert_id();
    }

    function update_post($post_id, $data) {
        $this->db->where('post_id', $post_id);
        $this->db->update('posts', $data);
    }

    function delete_post($post_id) {
        $this->db->where('post_id', $post_id);
        $this->db->delete('posts');
    }
}
