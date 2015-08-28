:: Rename list of PDF files
:: - puts ".X" after filename
:: - e.g.: 28QAG011.pdf -> 28QAG011.X.pdf

@echo off

setlocal enabledelayedexpansion

dir /b *.pdf > fileList.txt

set /a countAll=0
set /a countRenamed=0

for /f "tokens=1,2 delims=." %%i in (fileList.txt) do (

	if "%%j" == "pdf" (
		set /a countRenamed+=1
	)

	set /a countAll+=1
	
	ren %%i.%%j %%i.X.%%j 2>NUL
)

echo !countRenamed! file(s) of !countAll! renamed

del fileList.txt