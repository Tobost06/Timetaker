# Definer banen til loggfilen
$logFile = "C:\filepath here"

# Funksjon for logging av meldinger til filen
function Log-Message {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -Append $logFile
}

# Start tidsporing
function Start-Logging {
    Log-Message "Startet"
}

# Stopp tidsporing
function Stop-Logging {
    Log-Message "Sluttet"
}

# Hovedmeny
while ($true) {
    Clear-Host
    Write-Host "Tidstager"
    Write-Host "1. Start logging"
    Write-Host "2. Stopp logging"
    Write-Host "3. Avslutt"
    $choice = Read-Host "Velg noe (1, 2, 3)"

    switch ($choice) {
        1 {
            Start-Logging
        }
        2 {
            Stop-Logging
        }
        3 {
            Write-Host "Avslutter script"
            Stop-Process -Id $PID
        }
        default {
            Write-Host "Ugyldig valg. Velg 1, 2, eller 3."
        }
    }
}
