$range = 1..254 | % { "192.168.$_.1" }
$ping = $range | %{ Test-Connection -ComputerName $_ -Count 1 -BufferSize 16 -AsJob }
$results = $ping | Wait-Job | Receive-Job | Select-Object @{Name="IPAddress";Expression={$_.Address}}, TimeResponse, StatusCode

#$results
$results | Where-Object { $_.StatusCode -eq 0 } | ForEach-Object { Write-Host $($_.IPAddress)}
