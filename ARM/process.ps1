#ready
New-AzureRmResourceGroup –Name 'bbbb' –Location 'Northeurope'
New-AzureRmKeyVault -VaultName 'bbbbault' -ResourceGroupName 'bbbb' -Location 'Northeurope'
Set-AzureRmKeyVaultAccessPolicy -EnabledForTemplateDeployment -VaultName 'bbbbault'
#set
$secretvalue = ConvertTo-SecureString '!Q2w3e4r' -AsPlainText -Force
$secret = Set-AzureKeyVaultSecret -VaultName 'bbbbault' -Name 'administratorLoginPassword' -SecretValue $secretvalue
#go
$path = "C:\git\bbbb-is-the-word\ARM\parent.json"
$parameters = @{
    "SITENAME-PRIMARY"="bbbb-1s-the-word"
    "SITENAME-SECONDARY"="bbbb-1s-the-wordd"
    "HOSTINGPLAN-PRIMARY"="h-Plan-a"
    "HOSTINGPLAN-SECONDARY"="h-Plan-b"
    "SKU"="F1"
    "ADMINISTRATORLOGIN"="dba"
    "SECRETNAME"="administratorLoginPassword"
    "DATABASENAME"="database"
    "SERVERNAME"="bbbb-sq1-pr1"
    "SERVERREPLICANAME"="bbbb-sq1-rep1"
    "STORAGEACCOUNTNAME"="bbbb-storage-acc7"
}
New-AzureRmResourceGroupDeployment -Name _ -ResourceGroupName bbbb -TemplateFile $path -TemplateParameterObject $parameters
#finish
