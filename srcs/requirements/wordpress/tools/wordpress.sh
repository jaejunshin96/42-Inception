#!/bin/bash

# Check wp-config.php, if so, stops.
if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
	exec "$@";
	exit 0;
fi

# Install wp command
if [ ! -d "/usr/local/bin/wp/" ]; then
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
fi

# Create the directory
if [ ! -d "/var/www/html/wordpress" ]; then
    mkdir -p /var/www/html/wordpress
fi

cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*

wp core download --allow-root

wp config create	--allow-root \
					--dbname=$DATABASE_NAME \
					--dbuser=$DATABASE_ROOT \
					--dbpass=$DATABASE_ROOT_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/html/wordpress/'

wp core install		--allow-root \
					--url=$DOMAIN_NAME \
					--title=$WORDPRESS_TITLE \
					--admin_user=$WORDPRESS_ADMIN_USER \
					--admin_password=$WORDPRESS_ADMIN_PASSWORD \
					--admin_email=$WORDPRESS_ADMIN_EMAIL

wp user create		--allow-root \
					$WORDPRESS_SUB_USER \
					$WORDPRESS_SUB_EMAIL \
					--role=$WORDPRESS_SUB_ROLE \
					--user_pass=$WORDPRESS_SUB_PASSWORD

echo "Ready to go"

exec "$@"