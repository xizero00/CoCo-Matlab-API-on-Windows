# CoCo-Matlab-API-on-Windows
This repo compiles the CoCo matlab binding on windows.

## Requirments
0. You have to install the vs2015 to support C99 standard while compiling the gason library on windows
1. You have to set the default c++ and c compiler to vc2015, use mex -setup

## Compiling

0. first you can find the compile.bat in the gason directory
1. modify the path in commom/compile.bat to your own vs2015 directory
2. in the MatlabAPI directory you have to run the buildMEXOnWindows.m
