# Installs Nginx server and configures redirect

exec { 'installation':
  provider => shell,
  command  => 'apt -y update && sudo apt -y install nginx',
}

file { '/var/www/html/index.html':
  ensure => file,
  content => "Hello World!",
}

file { '/etc/nginx/sites-enabled/default':
  ensure  => file,
  content => 'server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name _;
        location / {
                try_files \$uri \$uri/ =404;
        }
        if (\$request_filename ~ redirect_me){
                rewrite ^ https://www.youtube.com/watch?v=IotUxgPqbik permanent;
        }
    }'
  notify => Service['nginx'],
}

service { 'nginx':
  ensure => running,
  enabled => true,
  }
