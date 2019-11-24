$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'ftp://ftp.fu-berlin.de/pc/games/idgames/levels/doom2/megawads/d2reload.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Join-Path $toolsDir wad)"
  url           = $url
  checksum      = 'A1C215CEC2013E972F4D52CB409A58203F576860F42398416D755F441B4019F4'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
