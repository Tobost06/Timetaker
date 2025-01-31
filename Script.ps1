# Define the log file path
$logFile = "C:\filepath here"

# Function for message logging to the file
function Log-Message {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -Append $logFile
}

# Start timetaking
function Start-Logging {
    Log-Message "Started"
}

# Stop timetaking
function Stop-Logging {
    Log-Message "Ended"
}

# Main menu
while ($true) {
    Clear-Host
    Write-Host "Timetaker"
    Write-Host "1. Start logging"
    Write-Host "2. Stop logging"
    Write-Host "3. Quit"
    $choice = Read-Host "Choose an option (1, 2, 3)"

    switch ($choice) {
        1 {
            Start-Logging
        }
        2 {
            Stop-Logging
        }
        3 {
            Write-Host "Quitting script"
            Stop-Process -Id $PID
        }
        default {
            Write-Host "Invalid choice. Choose 1, 2, or 3."
        }
    }
}
