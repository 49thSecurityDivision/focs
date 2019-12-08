﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns:v>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.png">
<link rel="icon" href="images/favicon.png">
<title><#709#> - <#290#></title>
<link rel="stylesheet" type="text/css" href="index_style.css">
<link rel="stylesheet" type="text/css" href="form_style.css">
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" language="JavaScript" src="/help.js"></script>
<script type="text/javascript" language="JavaScript" src="/validator.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/httpApi.js"></script>
<script>
var wans_mode ='<% nvram_get("wans_mode"); %>';
function applyRule(){
if(validForm()){
showLoading();
document.form.submit();
}
}
function validForm(){
if (!mtwancfg_support || !dualWAN_support || wans_dualwan_array.indexOf("none") != -1 || wans_mode != "lb"){
if(document.form.dmz_ip.value != ""){
if(!validator.ipAddrFinal(document.form.dmz_ip, 'dmz_ip')){
return false;
}
if(document.form.dmz_enable[1].checked){
document.form.dmz_ip.value = "";
document.form.dmz1_ip.value = "";
}
}
else{
if(document.form.dmz_enable[0].checked){
alert("<#222#>");
document.form.dmz_ip.focus();
return false;
}
}
}
else{
if(document.form.dmz_enable[0].checked && document.form.dmz_ip.value == "" && document.form.dmz1_ip.value == ""){
alert("<#222#>");
if (document.form.dmz_ip.value == "")
document.form.dmz_ip.focus();
else if (document.form.dmz1_ip.value == "")
document.form.dmz1_ip.focus();
return false;
}
if(document.form.dmz_ip.value != ""){
if(!validator.ipAddrFinal(document.form.dmz_ip, 'dmz_ip'))
return false;
if(document.form.dmz_enable[1].checked)
document.form.dmz_ip.value = "";
}
if(document.form.dmz1_ip.value != ""){
if(!validator.ipAddrFinal(document.form.dmz1_ip, 'dmz1_ip'))
return false;
if(document.form.dmz_enable[1].checked)
document.form.dmz1_ip.value = "";
}
}
return true;
}
function done_validating(action){
refreshpage();
}
function initial(){
show_menu();
httpApi.faqURL("1011722", function(url){document.getElementById("faq").href=url;});
dmz_enable_check();
}
function dmz_enable_check(){
if (!mtwancfg_support || !dualWAN_support || wans_dualwan_array.indexOf("none") != -1 || wans_mode != "lb"){
document.getElementById('wan_dmz_ip_tr').style.display = "none";
document.getElementById('wan_dmz1_ip_tr').style.display = "none";
document.getElementById('dmz1_ip_tr').style.display = "none";
if(document.form.dmz_ip.value == ""){
document.form.dmz_enable[1].checked = "true";
document.getElementById('dmz_ip_tr').style.display = "none";
}
else{
document.form.dmz_enable[0].checked = "true";
document.getElementById('dmz_ip_tr').style.display = "";
}
}
else{
if(document.form.dmz_ip.value == "" && document.form.dmz1_ip.value == ""){
document.form.dmz_enable[1].checked = "true";
}else{
document.form.dmz_enable[0].checked = "true";
}
dmz_on_off();
}
}
function dmz_on_off(){
if(document.form.dmz_enable[0].checked){
document.getElementById('dmz_ip_tr').style.display = "";
document.getElementById('wan_dmz_ip_tr').style.display = "none";
if (mtwancfg_support && dualWAN_support && wans_dualwan_array.indexOf("none") == -1 && wans_mode == "lb"){
document.getElementById('wan_dmz_ip_tr').style.display = "";
document.getElementById('dmz1_ip_tr').style.display = "";
document.getElementById('wan_dmz1_ip_tr').style.display = "";
}else{
document.getElementById('dmz1_ip_tr').style.display = "none";
document.getElementById('wan_dmz1_ip_tr').style.display = "none";
}
}else{
document.getElementById('wan_dmz_ip_tr').style.display = "none";
document.getElementById('dmz_ip_tr').style.display = "none";
document.getElementById('wan_dmz1_ip_tr').style.display = "none";
document.getElementById('dmz1_ip_tr').style.display = "none";
}
}
</script>
</head>
<body onload="initial();">
<div id="TopBanner"></div>
<div id="Loading" class="popup_bg"></div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="post" name="form" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="current_page" value="Advanced_Exposed_Content.asp">
<input type="hidden" name="next_page" value="">
<input type="hidden" name="modified" value="0">
<input type="hidden" name="action_mode" value="apply">
<input type="hidden" name="action_wait" value="5">
<input type="hidden" name="action_script" value="restart_firewall">
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>">
<input type="hidden" name="firmver" value="<% nvram_get("firmver"); %>">
<table class="content" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="17">&nbsp;</td>
<td valign="top" width="202">
<div id="mainMenu"></div>
<div id="subMenu"></div>
</td>
<td valign="top">
<div id="tabMenu" class="submenuBlock"></div>
<table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
<tr>
<td valign="top" >
<table width="760px" border="0" cellpadding="4" cellspacing="0" class="FormTitle" id="FormTitle">
<tbody>
<tr>
<td bgcolor="#4D595D" valign="top" >
<div>&nbsp;</div>
<div class="formfonttitle">
<#286#> - <#290#>
</div>
<div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
<div class="formfontdesc">
<#1835#>
<br/>
<br/>
<#1833#>:
<ul>
<li><#1831#></li>
<li><#1832#></li>
<script>
document.getElementById("addVtsRule_ftp").onclick = function(){
/* untranslated */
if(confirm("Are you sure you want to add a port forwarding rule on FTP service?")){
location.href = "/Advanced_VirtualServer_Content.asp?af=KnownApps&item=ftp";
}
}
</script>
</ul>
</div>
<div class="formfontdesc" style="margin-top:-10px;">
<a id="faq" href="" target="_blank" style="font-family:Lucida Console;text-decoration:underline;">DMZ FAQ</a>
</div>
<div class="formfontdesc" id="lb_note" style="color:#FFCC00; display:none;"><#2009#></div>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<tr>
<th><#1482#></th>
<td>
<input type="radio" name="dmz_enable" class="input" onclick="dmz_on_off()" ><#140#>
<input type="radio" name="dmz_enable" class="input" onclick="dmz_on_off()" ><#139#>
</td>
</tr>
<tr id="wan_dmz_ip_tr">
<th colspan=2><#1472#></th>
</tr>
<tr id="dmz_ip_tr">
<th><#1834#></th>
<td>
<input type="text" maxlength="15" class="input_15_table" name="dmz_ip" value="<% nvram_get("dmz_ip"); %>" onkeypress="return validator.isIPAddr(this, event)" autocorrect="off" autocapitalize="off"/>
</td>
</tr>
<tr id="wan_dmz1_ip_tr">
<th colspan=2><#1478#></th>
</tr>
<tr id="dmz1_ip_tr">
<th><#1834#></th>
<td>
<input type="text" maxlength="15" class="input_15_table" name="dmz1_ip" value="<% nvram_get("dmz1_ip"); %>" onkeypress="return validator.isIPAddr(this, event)" autocorrect="off" autocapitalize="off"/>
</td>
</tr>
</table>
<div class="apply_gen">
<input name="button" type="button" class="button_gen" onclick="applyRule()" value="<#148#>"/>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</form>
</tr>
</table>
</td>
<td width="10" align="center" valign="top">&nbsp;</td>
</tr>
</table>
<div id="footer"></div>
</body>
</html>

