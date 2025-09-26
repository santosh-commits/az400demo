$CSVData = Import-Csv -Path C:\Users\santo\Downloads\BulkRGCreation.csv
foreach($record in $CSVData)
{

$existingRG = az group show --name $record.RGName

if($existingRG)
{
 Write-Host "skipping creation of RG as it is already exist "
}
else
{
  az group create --name $record.RGName --location $record.location
}

az storage account create --name $record.storageaccountname --resource-group $record.RGName --location $record.location --sku standard_LRS
}