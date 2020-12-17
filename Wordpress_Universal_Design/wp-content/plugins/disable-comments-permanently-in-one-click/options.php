<?php
if( !defined('WPINC') || !defined("ABSPATH") ){
	die();
}
        global $wpdb;

$types = get_post_types( array( 'public' => true ), 'objects' );
foreach( array_keys( $types ) as $type ) {
	if( ! in_array( $type, $this->modified_types ) && ! post_type_supports( $type, 'comments' ) )
		unset( $types[$type] );
}

if ( isset( $_POST['submit'] ) ) {
	check_admin_referer( 'disable-comments-permanently-options' );
	$this->options['remove_everywhere'] = ( $_POST['mode'] == 'remove_everywhere' );

	if( $this->options['remove_everywhere'] )
		$disabled_post_types = array_keys( $types );
	else
		$disabled_post_types =  array() ;

	
	$disabled_post_types = array_intersect( $disabled_post_types, array_keys( $types ) );


	$this->options['disabled_post_types'] = $disabled_post_types;

	$this->options['delete_pending_c'] = ( $_POST['delete_pending_c'] == '1' );
	$this->options['delete_all_c'] = ( $_POST['delete_all_c'] == '1' );



	$this->save_options();
	
	if($this->options['delete_all_c']=='1' && $this->options['delete_pending_c']!='1')
	{
	if($wpdb->query("DELETE FROM $wpdb->comments") != FALSE)
	            {
                    $wpdb->query("DELETE FROM $wpdb->comments");
                    echo "<p style='color:green'><strong>All comments have been deleted.</strong></p>";
                }	
		
	}
	elseif($this->options['delete_pending_c']=='1')
	{
		 if($wpdb->query("DELETE FROM $wpdb->comments WHERE comment_approved = '0'") != FALSE)
	            {
                    $wpdb->query("DELETE FROM $wpdb->comments WHERE comment_approved = '0'");
                    echo "<p style='color:#0BEA91'><strong>All Pending comments have been deleted.</strong></p>";
                }
	}
	
}


?>

<style> .indent {padding-left: 2em} </style>
<div class="wrap">
	<h1><?php _e( 'Disable Comments Settings', 'disable-comments-permanently-in-one-click'); ?></h1>
	<p>
	</p><hr><br>
	<form action="" method="post" id="disable-comments">
		<ul>
			<li>
				<label for="remove_everywhere">
					<input type="radio" id="remove_everywhere" name="mode" value="remove_everywhere" <?php checked( isset($this->options['remove_everywhere']) && $this->options['remove_everywhere'] );?> /> 
					<strong>
						<?php _e( 'Disable all comments', 'disable-comments-permanently-in-one-click'); ?>
					</strong>
				</label>			
			</li>
			<li>
				<label for="disable_comments_permanently_off">
					<input type="radio" id="disable_comments_permanently_off" name="mode" value="disable_comments_permanently_off" <?php checked(  !isset($this->options['remove_everywhere']) ||  !$this->options['remove_everywhere'] );?> /> 
					<strong>
						<?php _e( 'Dont disable', 'disable-comments-permanently-in-one-click'); ?>
					</strong>
				</label>
				<br><br><hr><br>
			</li>
			
			
			
			<li>
				<label for="delete_pending_comments">
					<input type="checkbox" id="delete_pending_comments" name="delete_pending_c" value="1" <?php checked( 1, $this->options['delete_pending_c'], true );?> /> 
					<strong>
						<?php _e( 'Delete all pending comments', 'disable-comments-permanently-in-one-click'); ?>
					</strong>
				</label>			
			</li>
			
			
			<li>
				<label for="delete_all_comments">
					<input type="checkbox" id="delete_all_comments" name="delete_all_c" value="1" <?php checked( 1, $this->options['delete_all_c'], true );?> />  
					<strong>
						<?php _e( 'Delete all comments', 'disable-comments-permanently-in-one-click'); ?>
					</strong>
				</label>			
			</li>
			
			
			
		</ul>
		<?php wp_nonce_field( 'disable-comments-permanently-options' ); ?>
		<p class="submit">
			<input class="button-primary" type="submit" name="submit" value="<?php _e( 'Save', 'disable-comments-permanently-in-one-click'); ?>">
		</p>
	</form>
	
	<a href="https://wordpress.org/support/plugin/disable-comments-permanently-in-one-click/reviews/?filter=5" target="_blank"><?php _e( 'Rate Us Please. Its Free and need your support', 'disable-comments-permanently-in-one-click'); ?></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="https://translate.wordpress.org/projects/wp-plugins/disable-comments-permanently-in-one-click" target="_blank"><?php _e( 'Translate Request', 'disable-comments-permanently-in-one-click'); ?></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="https://wordpress.org/support/plugin/disable-comments-permanently-in-one-click" target="_blank"><?php _e( 'Support Forum', 'disable-comments-permanently-in-one-click'); ?></a>

	</div>
