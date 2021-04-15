$files = Get-ChildItem ./ -Recurse -File -Exclude *.map, *.min.js, bootstrap-grid.css, *.min.css, bootstrap.js, bootstrap.bundle.js, bootstrap-reboot.css
$output = @()
foreach($file in $files) {
    $contentRaw = Get-Content -LiteralPath $file -Raw
    if ($contentRaw -match "master") {
        $content = Get-Content $file
        $lineNum = 1
        foreach ($line in $content) {
            if ($line -match "master") {
                $logs = "$($file.FullName) : $lineNum"
                Write-Host $logs
                $output += $logs
            }
            $lineNum = $lineNum + 1
        }
    }
}
$output | Out-File -append ./java_mater.txt