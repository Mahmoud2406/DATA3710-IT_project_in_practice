<?php

if( !defined('WPINC') || !defined("ABSPATH") ){
	die();
}


class Vowels_Disable_Comments {

	private static $instance = null;

	private $options;
	private $options_name = 'permanently_disable_comments_vowels';
	private $modified_types = array();

	public static function get_instance() {
		if ( is_null( self::$instance ) ) {
			self::$instance = new self;
		}
		return self::$instance;
	}
	
	public function __construct() {
		$this->options = get_option( $this->options_name , array() );

		$this->hooks();

	}


	private function save_options() {
		update_option( $this->options_name, $this->options );
	}


	private function get_disabled_post_types() {
		$types = '';
		if(isset($this->options['disabled_post_types']) && $this->options['disabled_post_types'] ){
			$types = $this->options['disabled_post_types'];	
		}
		return $types;
	}


	private function hooks() {
		if( isset($this->options['remove_everywhere']) && $this->options['remove_everywhere'] ) {

			add_action( 'template_redirect', array( $this, 'filter_admin_bar' ) );
			add_action( 'widgets_init', array( $this, 'disable_rc_widget' ) );
			add_filter( 'wp_headers', array( $this, 'filter_wp_headers' ) );
			add_action( 'template_redirect', array( $this, 'filter_query' ), 9 );	
			add_action( 'admin_init', array( $this, 'filter_admin_bar' ) );
			}
			add_action( 'plugins_loaded', array( $this, 'register_text_domain' ) );
			add_action( 'wp_loaded', array( $this, 'wp_load_hooks' ) );

			
	}


	public function register_text_domain() {
		load_plugin_textdomain( 'disable-comments-permanently-vowels', false, DISABLE_COMMENTS_PERMANENTLY_VOWELS_PATH . 'languages' );
	}

	public function wp_load_hooks(){
		$disabled_post_types = $this->get_disabled_post_types();

		if( !empty( $disabled_post_types ) ) {
			foreach( $disabled_post_types as $type ) {
				if( post_type_supports( $type, 'comments' ) ) {
					$this->modified_types[] = $type;
					remove_post_type_support( $type, 'comments' );
					remove_post_type_support( $type, 'trackbacks' );
				}
			}
			add_filter( 'comments_array', 	array( $this, 'filter_existing_comments' ), 20, 2 );
			add_filter( 'comments_open', 	array( $this, 'filter_comment_status' ), 	20, 2 );
			add_filter( 'pings_open', 		array( $this, 'filter_comment_status' ), 	20, 2 );
		}
		elseif( is_admin() ) {
			add_action( 'all_admin_notices', array( $this, 'setup_notice' ) );

		}

		if( is_admin() ) {

			add_action( 'admin_menu', array( $this, 'settings_menu' ) );
			add_filter( 'plugin_action_links', array( $this, 'plugin_actions_links'), 10, 2 );

			if( isset($this->options['remove_everywhere']) && $this->options['remove_everywhere'] ) {
				add_action( 'admin_menu', array( $this, 'filter_admin_menu' ), 9999 );
				add_action( 'admin_print_footer_scripts-index.php', array( $this, 'dashboard_js' ) );
				add_action( 'wp_dashboard_setup', array( $this, 'filter_dashboard' ) );
				add_filter( 'pre_option_default_pingback_flag', '__return_zero' );
			}
		} else {
			add_action( 'template_redirect', array( $this, 'check_comment_template' ) );

			if( isset($this->options['remove_everywhere']) && $this->options['remove_everywhere'] ) {
				add_filter( 'feed_links_show_comments_feed', '__return_false' );
				add_action( 'wp_footer', array( $this, 'hide_meta_widget_link' ), 100 );
			}
		}
	}

	public function check_comment_template() {
		if( is_singular() && ( isset($this->options['remove_everywhere']) && $this->options['remove_everywhere'] ) ) {
			wp_deregister_script( 'comment-reply' );
			remove_action( 'wp_head', 'feed_links_extra', 3 );
		}
	}

	public function empty_template_for_comments() { return ''; } // returns blank


	public function filter_wp_headers( $headers ) {
		unset( $headers['X-Pingback'] );
		return $headers;
	}


	public function filter_query() {
		if( is_comment_feed() ) {
			wp_die( __( 'Comments are closed.' ), '', array( 'response' => 403 ) );
		}
	}

	public function filter_admin_bar() {
		if( is_admin_bar_showing() ) {
			remove_action( 'admin_bar_menu', 'wp_admin_bar_comments_menu', 60 );
		}
	}

	
	private function settings_page_url() {
		return add_query_arg( 'page', 'disable_comments__perm_vowels_settings', admin_url( 'options-general.php' ) );
	}
	
public function settings_menu() {
		$title = __( 'Disable Comments Permanently Vowels', 'disable-comments-permanently-vowels' );
		add_submenu_page( 'options-general.php', $title, $title, 'manage_options', 'disable_comments__perm_vowels_settings', array( $this, 'options' ) );
	}
	
public function filter_admin_menu(){
		global $pagenow;

		if ( $pagenow == 'comment.php' || $pagenow == 'edit-comments.php' || $pagenow == 'options-discussion.php' )
			wp_die( __( 'Comments are closed.' ), '', array( 'response' => 403 ) );

		remove_menu_page( 'edit-comments.php' );
		remove_submenu_page( 'options-general.php', 'options-discussion.php' );
	}


public function hide_meta_widget_link(){
		if ( is_active_widget( false, false, 'meta', true ) && wp_script_is( 'jquery', 'enqueued' ) ) {
			echo '<script> jQuery(function($){ $(".widget_meta a[href=\'' . esc_url( get_bloginfo( 'comments_rss2_url' ) ) . '\']").parent().remove(); }); </script>';
		}
	}

	
	public function setup_notice(){
		if( strpos( get_current_screen()->id, 'settings_disable_comments_per_vowels' ) === 0 )
			return;
		$hascaps = current_user_can( 'manage_options' );
		if( $hascaps ) {
			echo '<div class="updated fade"><p>' . sprintf( __( 'The <em>Disable Comments</em> plugin is active, & blocking all comments. Rate us please. if some comments are not being deleted then go to settings and save again.  <a href="%s">Settings</a> for disable comments ', 'disable-comments-permanently-in-one-click'), esc_attr( $this->settings_page_url() ) ) . '</p></div>';
		}
		
		if ( get_site_option( 'perm_d_c_vowels2' )!=1) {
			
		
					$options['remove_everywhere'] = '1';
					$options['delete_pending_c'] = '';
					$options['delete_all_c'] = '';
					$options['disabled_post_types'][0] = 'post';
					$options['disabled_post_types'][1] = 'page';
					$options['disabled_post_types'][2] = 'attachment';
					update_site_option( 'permanently_disable_comments_vowels', $options );	
					update_site_option( 'perm_d_c_vowels2', 1 );	
		}
		
		
	}
	
	public function filter_comment_status( $open, $post_id ) {
		$post = get_post( $post_id );
		return ( $this->options['remove_everywhere'] ) ? false : $open;
	}
	
	public function plugin_actions_links( $links, $file ) {
		static $plugin;

		if( $file == 'disable-comments-permanently-in-one-click/disable-comments-vowels.php' && current_user_can('manage_options') ) {
			array_unshift(
				$links,
				sprintf( '<a href="%s">%s</a>', esc_attr( $this->settings_page_url() ), __( 'Settings' ) )
			);
		}

		return $links;
	}
	
	public function options() {
		include( DISABLE_COMMENTS_PERMANENTLY_VOWELS_PATH .'options.php');
	}
	
	public function filter_dashboard(){
		remove_meta_box( 'dashboard_recent_comments', 'dashboard', 'normal' );
	}


	public function dashboard_js(){
		echo '<script>
		jQuery(function($){
			$("#dashboard_per_vowels .comment-count, #latest-comments-vowels").hide();
		 	$("#permanently-disable-comments-vowels .permanently-disable-v-comments").parent().hide();
		});
		</script>';
	}


	

	public function filter_existing_comments($comments, $post_id) {
		$post = get_post( $post_id );
		return ( $this->options['remove_everywhere'] ) ? array() : $comments;
	}


	public function disable_rc_widget() {
		unregister_widget( 'WP_Widget_Recent_Comments' );
	}


	
}