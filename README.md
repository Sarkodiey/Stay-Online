# Stay-Online PowerShell Script

## Overview
This script is designed to keep your session active and prevent the system from going idle.

## Requirements
- Windows Operating System
- PowerShell 5.1 or higher

## Setup
To use this script, you must first set the execution policy to allow scripts to run. You can do this by running PowerShell as Administrator and executing:
```powershell
Set-ExecutionPolicy RemoteSigned
```

## Usage
Load the script into your PowerShell session:
```powershell
. .\Invoke-YSStayOnline.ps1
```
After loading the script, you can keep your system online by calling the function:
```powershell
Invoke-YSStayOnline -Hours <hours> -Minutes <minutes> -Seconds <seconds>
```

## Example
To keep the system online for 1 hour and 30 minutes, you would use:

```powershell
Invoke-YSStayOnline -Hours 1 -Minutes 30
```

## Note
This script is for educational purposes only. Please use responsibly.

## Author
- Yaw Sarkodie

## Acknowledgments
- Thanks to Rob C for contributing to the initial version of the script

