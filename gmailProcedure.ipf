#pragma TextEncoding = "Windows-1252"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.

Function gmailMessage(username, password, recipients, subject, message)
string username, password, recipients, subject, message
 
variable sockID,ii
make/t/o buf
Wave/t buf
try
	sockitopenconnection/q sockID, "localhost",5000,buf
	if(sockID<1)
		abort
	endif
	sockitsendnrecv/SMAL/TIME=2 sockID, "EHLO gmail.com\n"
	if(V_Flag || !stringmatch(S_tcp[0,2],"220"))
		abort
	endif
	sockitsendnrecv/SMAL/TIME=2 sockID, "AUTH LOGIN\n"
	if(V_Flag  || !stringmatch(S_tcp[0,2],"334"))
		abort
	endif
	sockitsendnrecv/SMAL/TIME=2 sockid, base64encode(username)+"\n"
	if(V_Flag  || !stringmatch(S_tcp[0,2],"334"))
		abort
	endif
	sockitsendnrecv/SMAL/TIME=2 sockid, base64encode(password)+"\n"
	if(V_Flag  || !stringmatch(S_tcp[0,2],"235"))
		abort
	endif
	sockitsendnrecv/SMAL/TIME=2 sockID, "MAIL FROM:<"+username+"@gmail.com>\n"
	if(V_Flag  || !stringmatch(S_tcp[0,2],"250"))
		abort
	endif
	for(ii=0 ; ii<itemsinlist(recipients) ; ii+=1)
		sockitsendnrecv/SMAL/TIME=2 sockID, "RCPT TO:<"+stringfromlist(ii, recipients)+">\n"
	endfor
	sockitsendnrecv/SMAL/TIME=2 sockID, "DATA\n"
	if(V_Flag  || !stringmatch(S_tcp[0,2],"354"))
		abort
	endif
	sockitsendnrecv sockID, "From:"+username+"\n"
	for(ii=0; ii<itemsinlist(recipients) ; ii+=1)
		sockitsendnrecv sockID, "To:"+stringfromlist(ii, recipients)+"\n"
	endfor
	sockitsendnrecv sockID, "Subject:"+subject+"\n\n"
	sockitsendnrecv sockID, message+"\r\n"
	sockitsendnrecv sockID, "."+"\r\n"
	if(V_Flag  || !stringmatch(S_tcp[0,2],"250"))
		abort
	endif
catch
	print "Failed to send email"
endtry
sockitsendnrecv sockID, "QUIT\n"
 
sockitcloseconnection(sockID)
killwaves/z buf
End