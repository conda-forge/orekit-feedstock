cd test
setlocal EnableDelayedExpansion
set error=0

for %%f in (*.py) do (
    python "%%f"
    if "!errorlevel!" NEQ "0" (
        set error=1
    )
)

if %error% NEQ 0 exit /B 1

