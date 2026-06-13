# Rename local workspace folder: TGM-discord-server-mgmt -> UnderbossHQ
# Close Cursor (this workspace) before running.

$oldPath = "d:\TGM-discord-server-mgmt"
$newPath = "d:\UnderbossHQ"

if (-not (Test-Path $oldPath)) {
    if (Test-Path $newPath) {
        Write-Host "Already renamed: $newPath"
        exit 0
    }
    Write-Error "Folder not found: $oldPath"
    exit 1
}

if (Test-Path $newPath) {
    Write-Error "Target already exists: $newPath"
    exit 1
}

try {
    Rename-Item -Path $oldPath -NewName "UnderbossHQ"
    Write-Host "Done. Reopen Cursor at: $newPath"
} catch {
    Write-Error "Could not rename (folder may still be in use). Close Cursor and File Explorer windows, then retry."
    exit 1
}
