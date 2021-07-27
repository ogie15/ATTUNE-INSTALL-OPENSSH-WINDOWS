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



# Confirm the firewall rule is configured. It should be created automatically by setup.
if (!(Get-NetFirewallRule -Name *ssh*)) {
    # Write Out message to the screen
    Write-Output "Creating New Firewall Rule called sshd....."

    # Set firewall permissions
    New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
}else {
    # Write Out message to the screen
    Write-Output "Firewall Rule sshd already exist"
}
