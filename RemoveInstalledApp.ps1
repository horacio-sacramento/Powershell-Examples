# Script example to remove Silverlight from a given list of machines

$serverList = Get-Content "C:\Temp\serverList.txt"
$appName = "Microsoft Silverlight"
$accessAccount = Get-Credential

ForEach ($serverName in $serverList) {
    Invoke-Command -ComputerName $serverName -Credential $accessAccount -ScriptBlock {
        Get-WmiObject Win32_product | Where {$_.name -eq $appName} | ForEach {
            $_.Uninstall()
        }
    }
}