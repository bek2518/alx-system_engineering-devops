# Login with holberton

exec {'hard':
  command  => 'sudo sed -i "/holberton hard/s/5/4096/" /etc/security/limits.conf',
  provider => shell
}

exec {'soft':
  command  => 'sudo sed -i "/holberton hard/s/4/4096/" /etc/security/limits.conf',
  provider => shell
}
