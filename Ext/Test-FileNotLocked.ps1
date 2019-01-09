function Test-FileNotLocked {
	Param (
		[String]$fullName
	)
	
	try { 
		[IO.File]::OpenWrite($fullName).close();
		return $true 
	} 
	catch {
		return $false
	}
}


Test-FileNotLocked -fullName "D:\Temp\Book1.xlsx"