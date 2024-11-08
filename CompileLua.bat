::
:: Compiles Lua
:: this file is based on https://github.com/Pharap/CompilingLua/blob/master/Compile.bat
:: and contains additional modifications suited to the CrossLua project
:: *THIS ONLY BUILDS LUA CLI! COMPILER IS NOT INCLUDED.*
::

::
:: Set up environment
::

:: Start local variable scope
@SETLOCAL
@ECHO ON

:ENDSETUP

::
:: Process files
::

:: Clean up files from previous builds
@IF EXIST *.o @DEL *.o
@IF EXIST *.obj @DEL *.obj
@IF EXIST *.dll @DEL *.dll
@IF EXIST *.exe @DEL *.exe

:: Compile all .c files into .obj
@CL /nologo /MT /O2 /W3 /GL /c /D_CRT_SECURE_NO_DEPRECATE *.c

:: Rename two special files
@REN lua.obj lua.o
@REN luac.obj luac.o

:: Link lua into an .exe
@LINK /nologo /LTCG /INCREMENTAL:NO /OUT:lua.exe lua.o *.obj

:ENDSCRIPT

:: End local variable scope
@ENDLOCAL