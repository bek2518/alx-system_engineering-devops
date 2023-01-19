# Installs Nginx server and configures redirect

exec { 'installation':
  command  => 'sudo apt -y update ; sudo apt -y install nginx',
  provider => shell,
}

file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
}

exec { 'start nginx':
  provider => shell
  command  => 'sudo service nginx start',
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
}

exec { 'restart service':
  provider => shell,
  command  => 'sudo service nginx restart',
  }
