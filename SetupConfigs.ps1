# Elevate to admin privilidges to be able to create links
if (!
    #current role
    (New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent()
    #is admin?
    )).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
) {
    #elevate script and exit current non-elevated runtime
    Start-Process `
        -FilePath 'pwsh ' `
        -ArgumentList (
            #flatten to single array
            '-File', $MyInvocation.MyCommand.Source, $args `
            | ForEach-Object { $_ }
        ) `
        -Verb RunAs
    exit
}

enum CopyMode {
	link
	copy
}

Function FileInfo()
{
	param(
		$Source,
		$Target,
		[CopyMode[]] $Mode
	)

	[PSCustomObject]@{
		Source = "$Source"
		Target = "$Target"
		Mode = $Mode
	}
}

$SourceDir="$HOME\\github.com\\derwiath\\vim-config"
$NvimSourceDir="$SourceDir\\nvim"
$NvimTargetDir="$HOME\\AppData\\Local\\nvim"

$FileInfos=@(
	FileInfo -Source "$SourceDir\\_vimrc" -Target "$HOME\\_vimrc" -Mode copy
	FileInfo -Source "$NvimSourceDir\\init.vim" -Target "$NvimTargetDir\\init.vim" -Mode link
	FileInfo -Source "$NvimSourceDir\\coc-settings.json" -Target "$NvimTargetDir\\coc-settings.json" -Mode link
)

$FileInfos |
ForEach-Object {
	$Source=$_.Source
	$Target=$_.Target
	$Mode=$_.Mode

	$SourceExist=Test-Path -Path "$Source" -PathType Leaf
	$TargetExist=Test-Path -Path "$Target" -PathType Leaf

	Write-Host "$Source -> $Target"
	if ($TargetExist) {
		Write-Host "Skipping target exist"
	} elseif (-not($SourceExist)) {
		Write-Host "Skipping source does not exist"
	} else {
		switch ($Mode) {
			link {
				Write-Host "Creating link"
				New-Item -ItemType SymbolicLink -Path $Target -Target $Source
			}
			copy {
				Write-Host "Copying file"
				Copy-Item $Source -Destination $Target
			}
		}
	}
}

pause
