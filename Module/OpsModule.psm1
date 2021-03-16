## +-----------------------------------------------------------------------------------------------------
# | File: OpsModule.psm1
# | Version: 1.00
# | Author: Miguel Perez (@miguelperezwd)
# | Purpose: Module with functions to peform common infrastructure operations.
# +-----------------------------------------------------------------------------------------------------

#=======================================================================================

function CheckTcpPort {
    <#
    .SYNOPSYS
        Check if a TCP port is open in a target server
    .DESCRIPTION
        Check if a TCP port is open in a target server
    .PARAMETER
        $Target
        $Port
    .EXAMPLE
        CheckTcpPort -Target YourServer01 -Port 80
    .INPUTS
        String
    .OUTPUTS
        System.Object[]
    #>
    [CmdletBinding()]
    param (
        # Name of the Target Server
        [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()]
        [string] $Target,
        # Target server Port
        [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()]
        [string] $Port
    )

    try {
        # Perform connectivity test to the target server through the specified port
        Write-Verbose -Verbose "Running connectivity test to $Target trhough port $Port..."
        $portConnectivityTest = New-Object System.Net.Sockets.TcpClient("$Target", $Port)

        if ($portConnectivityTest.Connected -eq $true) {
            Write-Verbose -Verbose "Server $Target is reachable trhough port $Port"   
        }

    }

    catch {
        Write-Error -Message "Something wrong happened when trying to connect to $Target through port $Port" -ErrorAction Stop
    }
    
}