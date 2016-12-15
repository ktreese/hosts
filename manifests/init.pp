class hosts {
  @@host { $facts['fqdn']:
    ensure       => present,
    host_aliases => $facts['hostname'],
    ip           => $facts['ipaddress'],
    tag          => '3031',
  }
}
