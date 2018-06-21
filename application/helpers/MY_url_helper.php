<?php

if (!function_exists('is_active')) {
	function is_active($active = NULL, $page = '') {
        if ($active == $page) { return 'is-active'; }
        return '';
	}
}