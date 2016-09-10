#¿wha?
$resourceGroupName = 'bbbb'
$location = 'northeurope'
$vautlName = 'bbbbault'

#¡ready
New-AzureRmResourceGroup –Name $resourceGroupName –Location $location
New-AzureRmKeyVault -VaultName $vautlName -ResourceGroupName $resourceGroupName -Location $location
Set-AzureRmKeyVaultAccessPolicy -EnabledForTemplateDeployment -VaultName $vautlName

#set!
$secretvalue = ConvertTo-SecureString '!Q2w3e4r' -AsPlainText -Force
$secret = Set-AzureKeyVaultSecret -VaultName 'bbbbault' -Name 'administratorLoginPassword' -SecretValue $secretvalue

#¡go!
$parameters = @{
    'Name' = 'bbbb-is-the-word'   
    'ResourceGroupName' = $resourceGroupName
    "TemplateUri"="https://raw.githubusercontent.com/4c74356b41/bbbb-is-the-word/master/ARM/parent.json"
    "SITENAME-PRIMARY"="bbbb-1s-the-word"
    "SITENAME-SECONDARY"="bbbb-1s-the-wordd"
    "HOSTINGPLAN-PRIMARY"="Plan-a"
    "HOSTINGPLAN-SECONDARY"="Plan-b"
    "SKU"="F1"
    "ADMINISTRATORLOGIN"="dba"
    "SECRETNAME"="administratorLoginPassword"
    "DATABASENAME"="database"
    "SERVERNAME"="bbbb-sq1-pr1"
    "SERVERREPLICANAME"="bbbb-sq1-rep1"
    "STORAGEACCOUNTNAME"="bbbbistheword"
}
New-AzureRmResourceGroupDeployment @parameters
# >>finish<<