# Automates the task of creating a custom HTTP response header response
# using puppet

exec { 'Install Configure':
  provider => shell,
  command  => 'sudo apt -y update ; sudo apt -y install nginx ; sudo service nginx start ;
  sudo sed -i "/listen 80 default_server;/a add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default;
  service nginx restart',
}
