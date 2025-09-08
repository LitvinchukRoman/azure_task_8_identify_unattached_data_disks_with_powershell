# Write your code here
$AllDisks = Get-AzDisk -ResourceGroupName 'mate-azure-task-5'
$disks = @()
foreach ($disk in $AllDisks) {
    if ($disk.ManagedBy -eq $null) {
        $disk = $disk | ConvertTo-Json
        $disks += $disk
    }
}
Out-File -FilePath result.json -InputObject $disks