param (
    $repo
)
$ciyamls = Get-ChildItem $repo -Recurse -File -Include ci*.yml

foreach($file in $ciyamls) {
    Write-Host $file.FullName
    $contentRaw = Get-Content $file -Raw
    $newContent = $contentRaw -replace "(- master)", "`$1`r`n      - main"
    Set-Content -Path $newContent -NoNewline
}
