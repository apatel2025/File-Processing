::------------------------------------------------------------------------------
:: Description:  A dos batch file (.bat file) that will display a menu of 
::               particular commands and ask the user to make a selection 
::               and then execute the selected command.
::
::				 
:: 
::
::  History:
::   Date           Author          Description
:: 2018-05-12     Aditya Patel   Initial creation
::------------------------------------------------------------------------------
@ECHO OFF
ECHO.
ECHO Select a command to execute:
ECHO.
ECHO 1.attrib           : To find attributes of all the files in the current directory.
ECHO 2.cipher           : To find encryption state of the current directory and all of the files in it.
ECHO 3.hostname         : To find the host name portion of the full computer name of the computer. 
ECHO 4.netstat          : To view the active TCP connections, ports, IPv4 statistics, IPv6 statistics and more.
ECHO 5.getmac           : Gives user the media access control (MAC) address and a number of network protocols 
ECHO                      associated with each MAC address for all network cards. 
ECHO 6.path             : To view the current command path.
ECHO 7.tasklist         : To get a list of currently running processes on the local computer or on a remote computer. 
ECHO 8.route            : To view and modifies the entries in the local IP routing table. It displays help without 
ECHO                      any parameters.
ECHO 9.DNS cache        : To view the contents of the DNS client resolver cache using the ipconfig command.
ECHO A.System Boot Time : To find the system boot time using the "Systeminfo" command which is used to get detailed 
ECHO                      configuration information about a computer and its operating system
ECHO.  
ECHO Press "CTRL + C" to exit.

ECHO.

CHOICE /C 123456789A /M "Enter your choice:"



:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 10 GOTO System Boot Time
IF ERRORLEVEL 9 GOTO DNS cache
IF ERRORLEVEL 8 GOTO route
IF ERRORLEVEL 7 GOTO tasklist
IF ERRORLEVEL 6 GOTO path
IF ERRORLEVEL 5 GOTO getmac
IF ERRORLEVEL 4 GOTO netstat
IF ERRORLEVEL 3 GOTO hostname
IF ERRORLEVEL 2 GOTO cipher
IF ERRORLEVEL 1 GOTO attrib


:System Boot Time
systeminfo | find "System Boot Time"
GOTO End


:DNS cache
ipconfig/displaydns | more
GOTO End


:route
route print | more
GOTO End


:tasklist
tasklist | more
GOTO End

:path
path
GOTO End

:getmac
getmac
GOTO End

:netstat
netstat
GOTO End


:hostname
hostname
GOTO End

:cipher
cipher
GOTO End

:attrib
attrib
GOTO End

:End

@pause
