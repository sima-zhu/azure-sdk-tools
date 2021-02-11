$files = Get-ChildItem ./ -Recurse -File -Exclude *.map, *.min.js, bootstrap-grid.css, *.min.css, bootstrap.js, bootstrap.bundle.js, bootstrap-reboot.css

foreach($file in $files) {
    $contentRaw = Get-Content $file -Raw
    if ($contentRaw -match "master") {
        $content = Get-Content $file
        $lineNum = 1
        foreach ($line in $content) {
            if ($line -match "master") {
                Write-Host "$($file.FullName) : $lineNum"
            }
            $lineNum = $lineNum + 1
        }
    }
}