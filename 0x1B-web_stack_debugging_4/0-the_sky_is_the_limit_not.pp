# Fixes nginx so that it accepts requests without failed requests

exec {'Edit nginx default file':
  provider => shell,
  command  => 'sudo sed -i "s5s/[0-9]\+/$( ulimit -n )/" /etc/default/nginx'
}

exec {'restart nginx':
  provider => shell,
  command  => 'sudo service nginx restart'
}
