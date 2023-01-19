# Automates the task of creating a custom HTTP response header response
# using puppet

exec { 'installation':
  command  => 'sudo apt -y update ; sudo apt -y install nginx ; sudo service nginx start',
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
                add_header X-Served-By $hostname;
                try_files $uri $uri/ =404;
        }
    }'
}

exec { 'restart service':
  provider => shell,
  command  => 'sudo service nginx restart'
  }
