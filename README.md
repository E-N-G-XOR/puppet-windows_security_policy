# windows_security_policy
A Puppet module to handle Windows security policy (ntrights).

## Description
This is a Puppet module to handle Window's security policies, previously done by ntrights.exe. This module is based on the work of <a href="https://userrights.codeplex.com/team/view">raandree</a>. His "UserRights" Powershell code can be found <a href="">here</a>

## Defaults
The UserRights module will be installed by default in 'C:\Program Files\WindowsPowerShell\Modules\ under 'UserRights'

## Example usage

$windows_security_policy::grant("SeNetworkLogon", "domain\luksi1")
$windows_security_policy::revoke("SeNetworkLogon", "domain\luksi1")

To change the default values:

$windows_security_policy::params::powershell_module_path = 'C:\foo\modules'

## Testing

I have only tested that the module conforms to the style guide via puppet-lint.





