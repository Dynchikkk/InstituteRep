@ECHO OFF
@REM ###########################################
@REM # Script file to run the flow 
@REM # 
@REM ###########################################
@REM #
@REM # Command line for ngdbuild
@REM #
ngdbuild -p xc3s500efg320-4 -nt timestamp -bm system.bmm "F:/zRabG/Xlnx/UPR2007/P4_edg_dbg/implementation/system.ngc" -uc system.ucf system.ngd 

@REM #
@REM # Command line for map
@REM #
map -o system_map.ncd -pr b system.ngd system.pcf 

@REM #
@REM # Command line for par
@REM #
par -w -ol std system_map.ncd system.ncd system.pcf 

@REM #
@REM # Command line for post_par_trce
@REM #
trce -e 3 -xml system.twx system.ncd system.pcf 

