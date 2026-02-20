echo ::group::Tests
nmake test > ..\test_output.log 2>&1
echo ::endgroup::

echo ::group::Test output
type ..\test_output.log
echo ::endgroup::

echo ::group::Failed tests
setlocal enabledelayedexpansion

set found=0
for %%F in (tests\*.log) do (
	set found=1
	echo ==^> %%F ^<==
	type "%%F"
	echo.
)
if "!found!"=="0" echo No failures

endlocal
echo ::endgroup::
