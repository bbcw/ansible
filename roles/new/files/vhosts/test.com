server
{
    listen 80;
    server_name test.com;
    index index.html index.htm index.php;
    root /data/www;

    location ~ \.php$ {
        include fastcgi_params;
#        fastcgi_pass unix:/tmp/php-fcgi.sock;
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME /data/www$fastcgi_script_name;
    }

}
