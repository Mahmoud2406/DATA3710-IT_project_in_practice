<?php
/*
Plugin Name: Disable Comments Permanently in one click
Plugin URI: https://vowelsform.com/disable-comments-permanently-in-one-click
Description: disable comments in one click for your website. It covers posts, pages. Delete comments from old post. 
Version: 1.0.7
Author: binitaa
Author URI: https://www.vowelsform.com/disable-comments-permanently-in-one-click
License: GPL2
Text Domain: disable-comments-permanently-in-one-click
Domain Path: /languages/
*/

if( !defined('WPINC') || !defined("ABSPATH") ) die();

define("DISABLE_COMMENTS_PERMANENTLY_VOWELS_PATH", plugin_dir_path( __FILE__ ) );
define("DISABLE_COMMENTS_PERMANENTLY_VOWELS_VERSION", '1.0.7' );

include_once( DISABLE_COMMENTS_PERMANENTLY_VOWELS_PATH .'class_disable-comments-permanently-in-one-click.php');

Vowels_Disable_Comments::get_instance();
