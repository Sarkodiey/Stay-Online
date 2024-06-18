   <#
    .SYNOPSIS
    Keeps the computer online for a specified duration.
   
    .AUTHOR
    Yaw Sarkodie

    .VERSION
    1.0

    .DESCRIPTION
    This function uses the SendKeys class from the Windows Forms namespace to simulate a key press every 10 seconds.
    This simulates activity on the computer and keeps it online.
    
    .NOTES
    This function requires PowerShell 5.1 or higher.
    To load the function, you must run the following command: . .\Invoke-YSStayOnline.ps1

    .PARAMETER Hours
    The number of hours you want to stay online.

    .PARAMETER Minutes
    The number of minutes you want to stay online.

    .PARAMETER Seconds
    The number of seconds you want to stay online.

    .EXAMPLE
    Invoke-YSStayOnline -Hours 2 -Minutes 30 -Seconds 100
    This example keeps the computer online for 2 hours, 30 minutes, and 100 seconds.

    .EXAMPLE
    Invoke-YSStayOnline
    This example keeps the computer online for 5 minutes by default.
    #>
function Invoke-YSStayOnline {
    
    #CmdletBinding allows you to utilize Powershell's advanced function features
    [CmdletBinding()]
    
    #Set the parameters for the function
    param (
        [ValidateNotNullOrEmpty()]
        [int]$Hours = 0,
        [int]$Minutes = 0,
        [int]$Seconds = 0
    )

    
        #Set a New Time Span with the specified number of hours, minutes, and seconds
        $Duration = New-TimeSpan -Hours $Hours -Minutes $Minutes -Seconds $Seconds
        #Set a default time span of 5 minutes if the user does not specify one
        if (0 -eq $Duration.Hours -and 0 -eq $Duration.Minutes -and 0 -eq $Duration.Seconds) 
                {
                    $Duration = New-TimeSpan -Minutes 5; Write-Output "You will stay online for 5 minutes by default"
                }

        $StartTime = Get-Date 
        
        #Add the duration to the start time to get when the script should end
        $EndTime = $StartTime + $Duration
        
        #Get the current time
        $CurrentTime = Get-Date 

        #Write the duration to the terminal
        Write-Output "Start Time: $StartTime"
        Write-Output "End Time: $EndTime"
        Write-Output "You will Stay Online for $($Duration.Hours) Hour(s) , $($Duration.Minutes) Minute(s), $($Duration.Seconds) Second(s)"
        Write-Output "Enjoy your free time!"


        #While the current time is less than the end time
        while ($CurrentTime -lt $EndTime) 
            { 
                #Send the F13 key press
                [System.Windows.Forms.SendKeys]::SendWait("{F13}") ; Start-Sleep -Seconds 10
                
                #Get the current time again to check if the end time has been reached
                $CurrentTime = Get-Date 

                #Write-Output $CurrentTime; Start-Sleep -Milliseconds 1000
            }

}