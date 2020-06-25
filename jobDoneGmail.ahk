Run, mailto:tungpatrick@gmail.com?subject=Job Done&body=Time to complete was ; Make sure to enable gmail as default mail client, and that you're logged in
;loop	; infinite loop
;{
	;IfWinActive, Compose Mail - tungpatrick@gmail.com - Gmail - Google Chrome ; Window title found with Window SPY. Change to personal email
	;{
		WinActivate Compose Mail - tungpatrick@gmail.com - Gmail - Google Chrome
		sleep 10000
		send, {tab}
		WinActivate Compose Mail - tungpatrick@gmail.com - Gmail - Google Chrome
		send, {tab}
		WinActivate Compose Mail - tungpatrick@gmail.com - Gmail - Google Chrome
		send, {tab}
		WinActivate Compose Mail - tungpatrick@gmail.com - Gmail - Google Chrome
		send, {Ctrl down}
		WinActivate Compose Mail - tungpatrick@gmail.com - Gmail - Google Chrome
		send, {Enter}
		WinActivate Compose Mail - tungpatrick@gmail.com - Gmail - Google Chrome
		send, {Ctrl up}
		
		sleep 5000
		WinActivate Compose Mail - tungpatrick@gmail.com - Gmail - Google Chrome
		send, {Ctrl down}
		WinActivate Compose Mail - tungpatrick@gmail.com - Gmail - Google Chrome
		send, {w}
		WinActivate Compose Mail - tungpatrick@gmail.com - Gmail - Google Chrome
		send, {Ctrl up}
		;break
	;}
;}
