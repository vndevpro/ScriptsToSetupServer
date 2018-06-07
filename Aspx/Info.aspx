<%@ Page Language="C#" %>

<div>Page Result: OK</div>

<div>
	MachineName = <%= System.Environment.MachineName %>
</div>

<div>
	IP = <%= Request.ServerVariables["LOCAL_ADDR"] %>
</div>
