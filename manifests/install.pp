class windows_security_policy::install (
    $powershell_module_path = $windows_security_policy::params::powershell_module_path,
    $powershell_module_name = $windows_security_policy::params::powershell_module_name
  ) inherits windows_security_policy::params {
  
  $userRightsPath = "${powershell_module_path}/${powershell_module_name}"
  file {$userRightsPath:
    ensure => 'directory',
    group  => 'Administrators',
    mode   => '0770',
  }
  
  file {"${userRightsPath}/Lsa.dll":
    ensure  => 'present',
    group   => 'Administrators',
    mode    => '0660',
    content => template('windows_security_policy/Lsa.dll')
  }
  
  file {"${userRightsPath}/Lsa.pdb":
    ensure  => 'present',
    group   => 'Administrators',
    mode    => '0660',
    content => template('windows_security_policy/Lsa.pdb')
  }
  
  file {"${userRightsPath}/Security2.dll":
    ensure  => 'present',
    group   => 'Administrators',
    mode    => '0660',
    content => template('windows_security_policy/Security2.dll')
  }

  file {"${userRightsPath}/Security2.pdb":
    ensure  => 'present',
    group   => 'Administrators',
    mode    => '0660',
    content => template('windows_security_policy/Security2.pdb')
  }

  file {"${userRightsPath}/UserRights.dll":
    ensure  => 'present',
    group   => 'Administrators',
    mode    => '0660',
    content => template('windows_security_policy/UserRights.dll')
  }
  
  file {"${userRightsPath}/UserRights.format.ps1xml":
    ensure  => 'present',
    group   => 'Administrators',
    mode    => '0660',
    content => template('windows_security_policy/UserRights.format.ps1xml')
  }
  
  file {"${userRightsPath}/UserRights.pdb":
    ensure  => 'present',
    group   => 'Administrators',
    mode    => '0660',
    content => template('windows_security_policy/UserRights.pdb')
  }
  
  file {"${userRightsPath}/UserRights.psd1":
    ensure  => 'present',
    group   => 'Administrators',
    mode    => '0660',
    content => template('windows_security_policy/UserRights.psd1')
  }
  
}