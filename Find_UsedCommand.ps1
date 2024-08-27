# Define the folder path and the command line to search for
$folderPath = ""
$commandLine = "Download-FileFromLibrary"

# Get all .ps1 files in the folder and subfolders
$ps1Files = Get-ChildItem -Path $folderPath -Recurse -File -Filter *.ps1

# Search each .ps1 file for the specified command line
foreach ($file in $ps1Files) {
    try {
        $content = Get-Content -Path $file.FullName -ErrorAction Stop
        if ($content -match $commandLine) {
            Write-Output "Found in file: $($file.FullName)"
        }
    } catch {
        Write-Output "Could not read file: $($file.FullName)"
    }
}