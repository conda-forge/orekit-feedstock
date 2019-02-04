cd test
for %%f in (*.py) do python "%%f" || exit /b 1
