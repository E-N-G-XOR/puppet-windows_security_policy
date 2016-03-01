class windows_security_policy::revoke ($privilege, $account) {
  
  require windows_security_policy::install
  
  $command = "Import-Module UserRights; Revoke-UserRight -Privileges ${privilege} -Account ${account}"
  $check = "Import-Module UserRights; Get-UserRight -Account ${account} | Where-Object {\$_.Name -eq \"${privilege}\"}"
  
  exec { 'revoke_windows_security_policy':
    command   => $command,
    onlyif    => "if (${check}) {exit 1}",
    logoutput => true,
    provider  => 'powershell',
  }

}