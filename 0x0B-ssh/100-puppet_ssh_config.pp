# Make change to configuration file using puppet

file_line {'password authentication':
  path => '/etc/ssh/ssh_config',
  line => '    PasswordAuthentication no'
  ;
  'Identity file':
  path => '/etc/ssh/ssh_config',
  line => '    IdentityFile ~/.ssh/school'
}
