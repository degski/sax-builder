
:: create junctions.

@md "c:\usr" 

@mklink /J "c:\usr\vc" "c:\program files (x86)\microsoft visual studio\2019\community\vc\tools\msvc\14.24.28314" >> nul
@mklink /J "c:\usr\vc_community" "c:\program files (x86)\microsoft visual studio\2019\community\vc" >> nul
@mklink /J "c:\usr\clang" "c:\program files\llvm" >> nul
@mklink /J "c:\usr\netfxsdk" "c:\program files (x86)\windows kits\netfxsdk\4.8" >> nul
@mklink /J "c:\usr\kits" "c:\program files (x86)\windows kits\10\include\10.0.18362.0" >> nul

:: call compiler with arguments.

@call "c:\program files (x86)\microsoft visual studio\2019\community\vc\auxiliary\build\vcvarsall.bat" x64

:: https://stackoverflow.com/a/20702597/646940

(
  setlocal enabledelayedexpansion
  set skip=1
  set "params=%1"
  for %%i in (%*) do if !skip! leq 0 (
        set "params=!params! %%i"
    ) else set /a skip-=1
)
(
  endlocal
  set "params=%params%"
)

%cmd% %params%

:: cleanup.

@rd /S /Q "c:\usr"
