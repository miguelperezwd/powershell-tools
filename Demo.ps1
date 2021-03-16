# +-----------------------------------------------------------------------------------------------------
# | File: Demo.ps1
# | Version: 1.00
# | Author: Miguel Perez (@miguelperezwd)
# | Purpose: Script for testing the functions from OpsModule.pms1 module
# +-----------------------------------------------------------------------------------------------------

#=======================================================================================

# 0. Import the module
Write-Verbose "Importing OpsModule..." -Verbose
Import-Module "./Module/OpsModule.psm1"

# 1. Call the functions/commandlets
CheckTcpPort -Target "google.com" -Port 5985