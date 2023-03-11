# Fixes nginx so that it accepts requests without failed requests

exec {'Edit_nginx':
  provider => shell,
  command  => 'sed -i s/15/4096/g /etc/default/nginx',
}

exec {'restart_nginx':
  provider => shell,
  command  => 'service nginx restart'
}
