# FindString.ps1
if ($args.Count -eq 0) {
    Write-Host "Error: specify search string"
    Write-Host "Example: .\FindString.ps1 hello"
    exit 1
}

$searchStr = $args[0]
$outputFile = "found_files.txt"

Clear-Content -Path $outputFile -ErrorAction SilentlyContinue

Get-ChildItem -Recurse -Filter "*.txt" | ForEach-Object {
    if (Select-String -Path $_.FullName -Pattern $searchStr -Quiet) {
        $_.FullName | Out-File -FilePath $outputFile -Append
    }
}

Write-Host "Done. Found files saved in $outputFile"
Get-Content $outputFile