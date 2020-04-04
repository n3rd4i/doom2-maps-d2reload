$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

& $ENV:COMSPEC /C IF EXIST $wad_lnk DEL /S /Q $wad_lnk
