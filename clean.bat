@echo off
for /r %%z in (*.~*;*.dcu;*.ddp;*.exe) do del "%%z"
pause
