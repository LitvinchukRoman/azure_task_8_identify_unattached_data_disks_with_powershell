$allDisks = Get-AzDisk -ResourceGroupName 'mate-azure-task-5'
$unattached = $allDisks | Where-Object { -not $_.ManagedBy -or $_.DiskState -eq 'Unattached' }
if (-not $unattached) {
    $unattached = @()
}
$json = $unattached | ConvertTo-Json -Depth 10
Out-File -FilePath 'result.json' -InputObject $json -Encoding utf8
