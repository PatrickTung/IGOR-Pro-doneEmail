#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Run mailsend1.17b14.exe
sleep 1000
send aspmx.l.google.com{enter}	; Change this SMTP to send to non-gmail emails
send tungpatrick@gmail.com{enter}
send tungpatrick@gmail.com{enter}
send Job done{enter}
sleep 5000
send .{enter}
