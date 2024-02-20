$uri="https://github.com/nathan2801/mcmods/raw/main/mods.zip"
$out="marmota-mods"
$out_zip="$out.zip"
$mods_folder="$env:APPDATA\.minecraft\mods"

if (Test-Path -path $out) {
	Remove-Item -Recurse -Confirm:$false $out
}

if (Test-Path -path $out_zip) {
	Remove-Item -Confirm:$false $out_zip
}

Remove-Item -Recurse -Confirm:$false $mods_folder\*

Invoke-WebRequest -uri $uri -OutFile $out_zip
Expand-Archive $out_zip -DestinationPath $out
Move-Item -Path $out\* -Destination $mods_folder
