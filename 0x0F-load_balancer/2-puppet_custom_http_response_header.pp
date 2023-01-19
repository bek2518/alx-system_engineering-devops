# Automates the task of creating a custom HTTP response header response
# using puppet

exec {'Install Configure':
  providers => shell,
  command   => 'sudo apt -y update ; sudo apt -y install nginx ;
  sudo sed -i "/listen 80 default_server;/a add_header X-Served-By $hostname;" /etc/nginx/sites-available/default;
  service nginx restart',
}
