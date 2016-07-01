@echo off

set dest=%userprofile%\AppData\Roaming\3001SQ\simulation\applications\hello_world.as
:: // compile.bat -- run me from the commandline or double-click in UI to merge mod_*.as submodules plus main.as into a new, replacement hello_world.as

pushd %~dp0

echo //********************************************************* >  %dest%
echo //Merged 3001SQ Script as of %date%-%time% >> %dest%
echo //********************************************************* >> %dest%
echo. >> %dest%

:: //name all your modules EXCEPT your main function implementation as "mod_MODULENAME.as"
for %%i in (mod_*.as) do (
    :: //specify source, useful for finding originating code if in-game compiler throws a line # in its error spew
    echo //from %%i >> %dest%
    :: //push each module's code into the %dest% file where 3001SQ can find
    type %%i >> %dest%
    :: //ensure at least one newline between script modules during merge
    echo. >> %dest%
)

type main.as >> %dest%

popd