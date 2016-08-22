# CoCo-Matlab-API-on-Windows
This repo compiles the CoCo matlab binding on windows.

## Requirments
0. You have to install the vs2015 to support C99 standard while compiling the gason library on windows
0. You have to set the default c++ and c compiler to vc2015, use mex -setup
0. Download the coco dataset

## Compiling

0. first you can find the compile.bat in the gason directory
0. modify the path in commom/compile.bat to your own vs2015 directory then run it to compile gason and maskApi
0. in the MatlabAPI directory you have to run the buildMEXOnWindows.m
0. you can run the showKeypoints.m to show annotations
