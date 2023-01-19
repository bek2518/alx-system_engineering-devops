# Installs Nginx server and configures redirect

exec { 'installation':
  command  => 'sudo apt -y update ; sudo apt -y install nginx ; echo 
  "Hello World!" > /var/www/html/index.html ; sudo service nginx start',
  provider => shell,
}

file { 'Configuration':
  ensure  => file,
  path    => '/etc/nginx/sites-enabled/default',
  content => 
  'server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name _;
        location / {
                try_files $uri $uri/ =404;
        }
        if ($request_filename ~ redirect_me){
                rewrite ^ https://www.youtube.com/watch?v=IotUxgPqbik permanent;
        }
    }'
}



exec { 'restart service':
  provider => shell,
  command  => 'sudo service nginx restart'
  }
