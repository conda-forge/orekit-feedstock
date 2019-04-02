cd test
for %%f in (*.py) do (
    python "%%f"
    if errorlevel 1 exit 1
)

