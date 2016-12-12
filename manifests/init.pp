class hosts {
  resources {'host':
    purge => true,
  }

  host { 'localhost':
    ensure       => present,
    host_aliases => ['localhost.localdomain', 'localhost4', 'localhost4.localdomain4'],
    ip           => '127.0.0.1',
  }

  @@host { $facts['fqdn']:
    ensure       => present,
    host_aliases => $facts['hostname'],
    ip           => $facts['ipaddress'],
    tag          => '3031',
  }

  Host <<| tag == '3031' |>>
}
