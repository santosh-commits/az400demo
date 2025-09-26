Connect-AzAccount

New-AzResourceGroupDeployment `
  -Name "CreateNewVnet" `
  -ResourceGroupName "az104-santosh_a-RG" `
  -TemplateFile "C:\Users\santo\Downloads\ExportedTemplate-az104-santosh_a-RG\template.json" `
  -TemplateParameterFile "C:\Users\santo\Downloads\ExportedTemplate-az104-santosh_a-RG\parameters.json"