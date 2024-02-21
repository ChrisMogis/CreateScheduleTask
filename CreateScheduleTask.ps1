<#
.DESCRIPTION
    Script permettant la création d'une tache planifiée via PowerShell

.NOTES
    Version       : 1.0.1
    Author        : Christopher Mogis
    Creation Date : 22/01/2024

    v1.0.1 : Ajout des parametres liés à la gestion de l'énergie
#>

# Action à exécuter - script Powershell RT
$action=New-ScheduledTaskAction -Execute "powershell.exe" -Argument '-ExecutionPolicy Bypass -windowstyle hidden -file "MyScript.ps1"'

# Planification de la tâche
$trigger=New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME

# Parametres de la tâche
$taskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

# Enregistrement de la tâche et "Exécuter sous"
Register-ScheduledTask -TaskName "Execution RT" -Trigger $trigger -Action $action -Description "Readiness Toolkit Execution" -Settings $taskSettings
