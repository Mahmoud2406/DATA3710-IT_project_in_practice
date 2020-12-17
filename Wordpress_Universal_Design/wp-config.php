<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'ict' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '=OM5E0ib$K=gW75JrP{;;oMSh0)qL|<sG*&3@Q/2T{$KiGyE$@t|Yubjons^._DT' );
define( 'SECURE_AUTH_KEY',  'N7[K5WX>%st%;<(Hmy?E^J/8Tk,Jz^+-pD)$=/14.^gIijSH3H Gt&O*/C(iZ1~L' );
define( 'LOGGED_IN_KEY',    'kr/[BR+`~EhD+K4<jHQ2&nBx<B?fw6 J@^xKzAc)U^*M]Ym[y`&msJLiwZ{AG5|5' );
define( 'NONCE_KEY',        'v.DAp|@=<[-@[;@*{!A,Ul[}>:-@z9m-(mvxLG&I>baD4UJ|kS[<fD/U. ?zU-{R' );
define( 'AUTH_SALT',        'fv_+wBT. 7,fbSQ4BX(((J%0uW{x;zQ<.~F7.~,8n?fZl3_%N`sUC=<ZOPcA9?>p' );
define( 'SECURE_AUTH_SALT', ' _vdAK?@W}[-0>T6{U-hr1-UE`, f@}eN[QY(fM_t/|pKn/1Wf*DrXGF=<*^6K#Z' );
define( 'LOGGED_IN_SALT',   'cLo$qH&4/N-/h,DLH~<BhC<H:_;d`;C:y%T IPi4nvm%0s-A6d6%yi)<i2#4+.w8' );
define( 'NONCE_SALT',       'zcfC0YlXdJRHyqw=x9o)trD/zKrO-SaDP/8h!Jr6^E$G@ehXmJ:c bjFy>%DD2rC' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
