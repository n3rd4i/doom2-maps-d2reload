$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url        = 'ftp://ftp.fu-berlin.de/pc/games/idgames/levels/doom2/megawads/d2reload.zip'
$unzipLocation = "$(Join-Path $toolsDir wad)"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $unzipLocation
  url           = $url
  checksum      = 'A1C215CEC2013E972F4D52CB409A58203F576860F42398416D755F441B4019F4'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

# Cleanup link first (safely)
& $ENV:COMSPEC /C IF EXIST $wad_lnk DEL /S /Q $wad_lnk

# Install symbolic link for later use
$wad_src = "$(Join-Path $unzipLocation $wad)"
& $ENV:COMSPEC /C MKLINK $wad_lnk $wad_src
