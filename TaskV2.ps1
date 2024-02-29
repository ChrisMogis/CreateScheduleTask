$Trigger= New-ScheduledTaskTrigger -At 11:59am –Daily # Specify the trigger settings
$User= $env:USERNAME # Specify the account to run the script
$Action= New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument '-ExecutionPolicy Bypass -windowstyle hidden -file "C:\Temp\Script.ps1"' # Specify what program to run and with its parameters
Register-ScheduledTask -TaskName "_Test2" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force # Specify the name of the task
