# dev variables
$pk3file = ""
$config = "gzdoom.ini"
$saveDir = ""
$filesLoc = "Engine"
# working code
# get list of mods and parse into array
$rawwadarr = (Get-Content -Path "$($PSScriptRoot)\MODS.txt").Split([System.Environment]::NewLine)
$modarr = @()
foreach($line in $rawwadarr) {
	$name=$line.Split("|")[0]
	$filename=$line.Split("|")[1]
	$saveLoc=$line.Split("|")[2]
	$modarr += @{name=$name;filename=$filename;savelocation=$saveLoc}
}
$optionSelected = -1
while($optionSelected -eq -1) {
	Write-Output "Please select a Mod to load"
	for($i=0;$i -lt $modarr.length;$i++) {
		Write-Output "[$($i)] $($modarr[$i].name) ($($modarr[$i].filename))" -ErrorAction Stop
	}
	[int]$optionSelected = Read-Host -Prompt "Select from [0] to [$($modarr.length-1)]"
	if($optionSelected -lt 0 -or $optionSelected -ge $modarr.length) {
		Write-Warning "Inavlid Number selected, try again!"
		$optionSelected = -1
	}
}
$pk3file = $modarr[$optionSelected].filename
$saveDir = $modarr[$optionSelected].savelocation

# get list of wads and parse into array
$rawwadarr = (Get-Content -Path "$($PSScriptRoot)\PWADs.txt").Split([System.Environment]::NewLine)
$wadarr = @()
foreach($line in $rawwadarr)
{
	$name = $line.Split("|")[0]
    $pwad = $line.Split("|")[1]
	$iwad = $line.Split("|")[2]
	$wadarr += @{name=$name;pwad=$pwad;iwad=$iwad}
}

$optionSelected = $false
$optionInput = -1
do {
	Write-Output "Please select the options below between 0 and $($wadarr.length-1)"
	for($i = 0; $i -lt $wadarr.length; $i++) {
		Write-Output "[$($i)] $($wadarr[$i].name) ($($wadarr[$i].pwad)) [using $($wadarr[$i].iwad)]"
	}
	[int]$optionInput = Read-Host -Prompt "Select from [0] to [$($wadarr.length-1)]"
	if($optionInput -lt 0 -or $optionInput -ge $wadarr.length) {
		Write-Warning "Inavlid Number selected, try again!"
	} else {
		$optionSelected = $true
	}
} while ($optionSelected -eq $false)

$selection = $wadarr[$optionInput]

Start-Process "$($PSScriptRoot)\$($filesLoc)\gzdoom.exe" -ArgumentList "-iwad $($selection.iwad)","-file $($selection.pwad)","-file $($pk3file)","-config $($config)","-savedir $($saveDir)/$($selection.pwad.substring(0,$selection.pwad.ToLower().LastIndexOf(".wad")))"