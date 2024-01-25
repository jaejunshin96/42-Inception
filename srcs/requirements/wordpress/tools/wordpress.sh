#!/bin/bash
mkdir -p /run/php/
sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
	exec "$@";
	exit 0;
fi

if [ ! -d "/usr/local/bin/wp/" ]; then
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -d "/var/www/html/wordpress" ]; then
    mkdir -p /var/www/html/wordpress
fi

cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*

wp core download --allow-root

wp config create --allow-root --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci"
wp core install --allow-root --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL
wp user create --allow-root $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD
wp theme install inspiro --allow-root --activate
wp plugin update --allow-root --all 

exec "$@"