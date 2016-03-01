class windows_security_policy::grant ($privilege, $account) {
  
  require windows_security_policy::install
  
  $command = "Import-Module UserRights; Grant-UserRight -Privileges ${privilege} -Account ${account}"
  $check = "Import-Module UserRights; Get-UserRight -Account ${account} | Where-Object {\$_.Name -eq \"${privilege}\"}"
  
  exec { 'grant_windows_security_policy':
    command   => $command,
    onlyif    => $check,
    logoutput => true,
    provider  => 'powershell',
  }

}