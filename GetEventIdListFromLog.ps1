# Example to get the list of a specific event id (6009) from a chosen log (System)

Get-EventLog -LogName System | Where-Object {$_.EventID -eq 6009}
