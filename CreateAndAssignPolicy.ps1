$jsonFilePath = "C:\Users\jonny\Documents\Policy\Policy\RGPolicy.json"


$policyJson = Get-Content -Path $jsonFilePath -Raw

$policyDefinition = New-AzPolicyDefinition -Name "Allowed locations for specific resource groups-CD001" -Policy $policyJson

$policyDefinition


$subs = @("/subscriptions/c95c8c04-05c8-43dc-9152-14d24911ae8b/resourceGroups/demogroup1", "/subscriptions/c95c8c04-05c8-43dc-9152-14d24911ae8b/resourceGroups/TestRG")

foreach($sub in $subs){
New-AzPolicyAssignment -Name "Assignment - Allowed locations for resources - CA001" -DisplayName "Allowed locations for resources - CA001" -PolicyDefinition $policyDefinition.Id -Scope $sub
}