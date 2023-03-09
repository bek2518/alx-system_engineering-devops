# Fixes nginx so that it accepts requests without failed requests

exec {'Edit nginx default file':
  provider => shell,
  command  => 'sudo sed -i "s/15/10000" /etc/default/nginx',
  before   => 'restart nginx'
}

exec {'restart nginx':
  provider => shell,
  command  => 'sudo service nginx restart'
}
