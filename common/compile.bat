:: author: xizero00
:: date:2016/8/22
:: email:xizero00@gmail.com



:: current working directory
set curdir=%~dp0
cd /d %curdir%


:: set the compiling environment
:: use the vs2015's compiler to compile gason and maskApi
:: i tried vs2012's compiler to do it, but it failed
set VC_PATH="C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"
call %VC_PATH%


:: compile cpp to obj
cl gason.cpp /LD
cl maskApi.c /LD

:: convert to obj to lib
lib /OUT:gason.lib gason.obj
lib /OUT:maskApi.lib maskApi.obj

copy /Y gason.h %curdir%..\MatlabAPI\private
copy /Y maskApi.h  %curdir%..\MatlabAPI\private

copy /Y gason.lib %curdir%..\MatlabAPI\private
copy /Y maskApi.lib  %curdir%..\MatlabAPI\private

copy /Y gason.dll %curdir%..\MatlabAPI\private
copy /Y maskApi.dll  %curdir%..\MatlabAPI\private

del gason.lib gason.obj gason.dll maskApi.lib maskApi.obj maskApi.dll

