New-AzureRmResourceGroup –Name 'bbbb' –Location 'Northeurope'
New-AzureRmKeyVault -VaultName 'bbbbault' -ResourceGroupName 'bbbb' -Location 'Northeurope'
Set-AzureRmKeyVaultAccessPolicy -EnabledForTemplateDeployment -VaultName 'bbbbault'
$key = Add-AzureKeyVaultKey -VaultName 'bbbbault' -Name "administratorLoginPassword" -Destination Software