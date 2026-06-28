param(
  # Parameter: SYSTEM ARCHITECTURE
  [Parameter(Mandatory = $true, Position = 1)]
  [ValidateSet("windows-x86_64", "linux-x86_64")]
  [Alias("sys")]
  [string]$System = "windows-x86_64",

  # Parameter: BUILD TYPE
  [Parameter(Mandatory = $true, Position = 2)]
  [ValidateSet("Debug", "Release")]
  [Alias("type")]
  [string]$BuildType = "Debug")

# SET ARGUMENTS FOR CMAKE
$cmakeArgs = @(
  "-S .",
  "-B build/$BuildType",
  "-G Ninja",
  "--preset $BuildType-config-$System",
  "-DCMAKE_BUILD_TYPE=$BuildType")

# CREATE STRING OF ESCAPED ARGUMENTS FOR DISPLAY PURPOSES
$escapedString = $cmakeArgs | ForEach-Object {
  if ($_ -match '/s') { '"{0}"' -f $_ } else { $_ }
}

# DISPLAY CMAKE COMMAND
Write-Host "`n`n`nEXECUTING CMAKE COMMAND: " -ForegroundColor Blue
Write-Host "cmake $escapedString" -ForegroundColor Cyan
Write-Host "`n"

# ------ EXECUTE ------
& cmake @cmakeArgs
