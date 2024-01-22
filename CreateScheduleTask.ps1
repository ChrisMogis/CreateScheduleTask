<#
.DESCRIPTION
    Script permettant la création d'une tache planifiée via PowerShell

.NOTES
    Version       : 1.0.0
    Author        : Christopher Mogis
    Creation Date : 22/01/2024
#>

# Action à exécuter - script Powershell RT
$action=New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass C:\Temp\TonScript.ps1"

# Planification de la tâche
$trigger=New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME

# Enregistrement de la tâche et "Exécuter sous"
Register-ScheduledTask -TaskName "Execution RT" -Trigger $trigger -Action $action -Description "Readiness Toolkit Execution"
