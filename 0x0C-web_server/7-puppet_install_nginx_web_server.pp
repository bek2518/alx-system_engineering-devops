# Installs Nginx server and configures redirect

exec { 'installation':
  provider => shell,
  command  => 'sudo apy -y update ; sudo apt -y install nginx ; echo 
  "Hello World!" > /var/www/html/index.html'
}

file { 'configuration':
  ensure  => present,
  content => 'server {
        listen 80;
        listen [::]:80 default_server;
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name _;
        location / {
                try_files \$uri \$uri/ =404;
        }
        if (\$request_filename ~ redirect_me){
                rewrite ^ https://www.youtube.com/watch?v=IotUxgPqbik permanent;
        }'
}

exec { 'start service':
  provider => shell,
  command  => sudo service nginx start
}
