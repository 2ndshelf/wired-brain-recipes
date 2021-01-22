$vms = Get-View -ViewType VirtualMachine

$results = foreach ($vm in $vms) {
    [PSCustomObject]@{
        "hostname" = $vm.name
        "memory" = $vm.config.hardware.memorymb
    }
}

$vcenterservers = "vcsa-01a.corp.local","vcsa-01b.corp.local"
foreach ($vcenterserver in $vcenterservers){
Connect-VIServer $vcenterserver
Write-Host "this is $vcenter"
disconnect-viserver -force
}