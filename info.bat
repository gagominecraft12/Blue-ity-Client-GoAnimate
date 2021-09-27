:start

title Blue'ity Client - Info
pushd "./main/"
@echo off && cls
ping -n 1 127.0.0.1>nul
echo Your software info:
ping -n 2 127.0.0.1>nul
echo Software Info: %COMPUTERNAME%
echo User: %USERNAME%
echo Processor: %PROCESSOR_IDENTIFIER%
echo Processor Type: %PROCESSOR_ARCHITECTURE%
echo Processor Level: %PROCESSOR_LEVEL%
echo Processor Revision: %PROCESSOR_REVISION%
echo Processor Numbers:
wmic cpu get caption
echo NOTE: YOU SHOULD HIDE THIS IN STREAM/VIDEO THAT YOUR DOING RIGHT
Pause