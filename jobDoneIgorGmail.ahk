loop	; infinite loop
{
	IfWinActive, Compose Mail - tungpatrick@gmail.com - Gmail - Google Chrome ; Window title found with Window SPY. Change to personal email
	{
		sleep 500
		send, {Ctrl down}
		send, {Enter}
		send, {Ctrl up}
		break
	}
}
