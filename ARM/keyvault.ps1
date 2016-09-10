New-AzureRmResourceGroup –Name 'bbbb' –Location 'Northeurope'
New-AzureRmKeyVault -VaultName 'bbbbault' -ResourceGroupName 'bbbb' -Location 'Northeurope'
Set-AzureRmKeyVaultAccessPolicy -EnabledForTemplateDeployment -VaultName 'bbbbault'



$secretvalue = ConvertTo-SecureString '!Q2w3e4r' -AsPlainText -Force
$secret = Set-AzureKeyVaultSecret -VaultName 'bbbbault' -Name 'administratorLoginPassword' -SecretValue $secretvalue