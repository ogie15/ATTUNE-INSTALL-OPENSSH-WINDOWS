#Region for ExecutionPolicy
# ===========================================================================
# Get Execution Policy of the current process
$Script:ProcessEP = Get-ExecutionPolicy -Scope Process

#Get the value of the Execution Policy and save it in the Variable
$Script:ValueProcessEP = ($Script:ProcessEP).value__

# Check if the Execution Policy of the process is set to Unrestricted
if ($Script:ValueProcessEP -eq 0) {

    # echo the message
    Write-Output "Execution Policy is already set to Unrestricted for the Process"
# Check if the Execution Policy of the process is already set
}else{

    # Set the ExecutionPolicy of the Process to Unrestricted
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force -Confirm:$false

    # Checks if the Execution Policy has been set
    if ((Get-ExecutionPolicy -Scope Process).value__ -eq 0) {

        # echo the message
        Write-Output "Execution Policy is now set to Unrestricted for the Process"
    }
}
# ===========================================================================
#EndRegion for ExecutionPolicy 



#Region for Installing OpenSSH
# ===========================================================================
# Download OpenSSH (64bit) from Microsoft github repo
$Sourcerepo = "https://github.com/PowerShell/Win32-OpenSSH/releases/download/V8.6.0.0p1-Beta/OpenSSH-Win64.zip"
$Destination = ($env:TMP + "\OpenSSH-Win64.zip")
Invoke-RestMethod -Uri $Sourcerepo -OutFile $Destination

# Unzip the file from the downloaded repo to Program Files on C Drive
Expand-Archive -Path ($env:TMP + "\OpenSSH-Win64.zip")`
-DestinationPath ($env:ProgramFiles)

# Write Out message to the screen
Write-Output "Installing OpenSSH....."

# Pause the script for 1 millisecond
Start-Sleep -m 1

# Install OpenSSH
. ($env:ProgramFiles + "\OpenSSH-Win64\install-sshd.ps1")

# Remove the Downloaded OpenSSH file 
Remove-Item -Path ($env:TMP + "\OpenSSH-Win64.zip") -Force
# ===========================================================================
#EndRegion for Installing OpenSSH