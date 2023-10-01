@ECHO OFF
REM ------------------------------
RMDIR /Q /S db
RMDIR /Q /S incremental_db
RMDIR /Q /S output_files
REM ------------------------------
DEL /Q *.qws
DEL /Q *.bak
