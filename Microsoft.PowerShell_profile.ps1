#oh-my-posh init pwsh --config ~/.jandedobbeleer.omp.json | Invoke-Expression
oh-my-posh init pwsh --config ~/configs/omp.json | Invoke-Expression

Import-Module -Name Terminal-Icons

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView