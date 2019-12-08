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
<title><#709#> - <#307#></title>
<link rel="stylesheet" type="text/css" href="index_style.css">
<link rel="stylesheet" type="text/css" href="form_style.css">
<link rel="stylesheet" type="text/css" href="css/confirm_block.css">
<style>
.FormTable{
margin-top:10px;
}
.Bar_container{
width:85%;
height:21px;
border:1px inset #999;
margin:0 auto;
margin-top:20px \9;
background-color:#FFFFFF;
z-index:100;
}
#proceeding_img_text{
position:absolute;
z-index:101;
font-size:11px; color:#000000;
line-height:21px;
width: 83%;
}
#proceeding_img{
height:21px;
background:#C0D1D3 url(/images/proceeding_img.gif);
}
.button_helplink{
font-weight: bolder;
text-shadow: 1px 1px 0px black;
text-align: center;
vertical-align: middle;
background: transparent url(/images/New_ui/contentbt_normal.png) no-repeat scroll center top;
_background: transparent url(/images/New_ui/contentbt_normal_ie6.png) no-repeat scroll center top;
border:0;
color: #FFFFFF;
height:33px;
width:122px;
font-family:Verdana;
font-size:12px;
overflow:visible;
cursor:pointer;
outline: none; /* for Firefox */
hlbr:expression(this.onFocus=this.blur()); /* for IE */
white-space:normal;
}
.button_helplink:hover{
font-weight: bolder;
background:url(/images/New_ui/contentbt_over.png) no-repeat scroll center top;
height:33px;
width:122px;
cursor:pointer;
outline: none; /* for Firefox */
hlbr:expression(this.onFocus=this.blur()); /* for IE */
}
.aimesh_manual_fw_update_hint {
color: #FFCC00;
margin: 10px;
font-family: Arial, Helvetica, sans-serif;
font-size: 13px;
display: none;
}
.amesh_offline {
color: #FC0;
cursor: pointer;
text-decoration: underline;
margin-left: 10px;
}
.amesh_popup_bg {
position: absolute;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
z-index: 200;
background-color:#2b373b;
margin-left: 140px;
width: 580px;
box-shadow: 3px 3px 10px #000;
display:block;
overflow: auto;
}
.amesh_hint_text {
margin: 15px 25px 0px 25px;
text-shadow: 1px 1px 0px black;
font-family: Arial, Helvetica, sans-serif;
font-size: 16px;
color: #FFFFFF;
font-weight: bolder;
}
.amesh_action_bg {
margin: 15px;
text-align: center;
}
.fwReleaseNote {
text-decoration: underline;
cursor: pointer;
}
.amesh_title {
color: #FFF;
font-size: 12px;
text-align: left;
font-weight: bolder;
border: 1px solid #222;
padding: 3px;
padding-left: 10px;
border-collapse: collapse;
background: #92A0A5;
background: -moz-linear-gradient(top, #92A0A5 0%, #66757C 100%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#92A0A5 ), color-stop(100%,#66757C));
background: -webkit-linear-gradient(top, #92A0A5 0%, #66757C 100%);
background: -o-linear-gradient(top, #92A0A5 0%, #66757C 100%);
background: -ms-linear-gradient(top, #92A0A5 0%, #66757C 100%);
background: linear-gradient(to bottom, #92A0A5 0%, #66757C 100%);
}
</style>
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/help.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/validator.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/jquery.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/confirm_block.js"></script>
<script language="JavaScript" type="text/javascript" src="/switcherplugin/jquery.iphone-switch.js"></script>
<script language="JavaScript" type="text/javascript" src="/form.js"></script>
<script>
$(function () {
if(amesh_support && (isSwMode("rt") || isSwMode("ap"))) {
addNewCSS('/device-map/amesh.css');
}
});
var webs_state_update = '<% nvram_get("webs_state_update"); %>';
var webs_state_upgrade = '<% nvram_get("webs_state_upgrade"); %>';
var webs_state_error = '<% nvram_get("webs_state_error"); %>';
var webs_state_info = '<% nvram_get("webs_state_info"); %>';
var webs_state_REQinfo = '<% nvram_get("webs_state_REQinfo"); %>';
var webs_state_flag = '<% nvram_get("webs_state_flag"); %>';
var confirm_show = '<% get_parameter("confirm_show"); %>';
var webs_release_note= "";
var fwdl_percent="";
var varload = 0;
var helplink = "";
var dpi_engine_status = <%bwdpi_engine_status();%>;
var sig_ver_ori = '<% nvram_get("bwdpi_sig_ver"); %>';
var sig_update_t = '<% nvram_get("sig_update_t"); %>';
if(cfg_sync_support){
var cfg_check = '<% nvram_get("cfg_check"); %>';
var cfg_upgrade = '<% nvram_get("cfg_upgrade"); %>';
}
var amesh_offline_flag = false;
var interval_update_AiMesh_fw_status;
var firmver = '<% nvram_get("firmver"); %>';
var buildno = '<% nvram_get("buildno"); %>';
var extendno = '<% nvram_get("extendno"); %>';
var FWString = '';
FWString = firmver+"."+buildno;
FWString += "_"+extendno;
function initial(){
show_menu();
showtext(document.getElementById("FWString"), FWString);
if(amesh_support && (isSwMode("rt") || isSwMode("ap"))) {
$(".aimesh_manual_fw_update_hint").css("display", "block");
var get_cfg_clientlist_ori = [<% get_cfg_clientlist(); %>];
var have_node = false;
var get_cfg_clientlist = [];
get_cfg_clientlist = get_cfg_clientlist_ori[0];
$("#fw_version_tr").empty();
var html = "";
html += "<tr>";
html += "<th><#854#></th>";
html += "<td>";
html += '<div id="update_div" style="display:none;">';
html += '<input type="button" id="update" name="update" class="button_gen" onclick="show_offline_msg(true);" value="<#2022#>" />';
html += '<div><input type="button" id="amas_update" class="button_gen" style="display:none;" onclick="cfgsync_firmware_upgrade();" value="<#1296#>"/><div>';
html += '</div>';
html += '<div id="linkpage_div" class="button_helplink" style="margin-left:200px;margin-top:-38px;display:none;">';
html += '<a id="linkpage" target="_blank"><div style="padding-top:5px;"><#2022#></div></a>';
html += '</div>';
html += '<div id="check_states">';
html += '<span id="update_states"></span>';
html += '<img id="update_scan" style="display:none;" src="images/InternetScan.gif" />';
html += '</div>';
html += "</td>";
html += "</tr>";
$("#fw_version_tr").before(html);
var mac_id = '<% get_lan_hwaddr(); %>'.replace(/:/g, "");
html = "";
html += "<tr>";
html += "<td class='amesh_title' colspan='2'><#909#></td>";
html += "</tr>";
html += "<tr>";
html += "<th>";
html += "<#710#>";
html += "</th>";
html += "</th>";
html += "<td id='amas_" + mac_id + "'>";
html += "<div id='current_version'><#58#> : " + FWString + "</div>";
html += "<div>";
html += "<#1693#> : ";
html += "<span class='amesh_offline' style='margin-left:0px;' onclick='open_AiMesh_router_fw_upgrade();'><#1297#></span>";
html += "</div>";
html += "<div id='checkNewFW' style='display:none;'><#59#> : <span class='checkFWReuslt'></span></div>";
html += "</td>";
html += "</tr>";
$("#fw_version_tr").before(html);
for (var idx in get_cfg_clientlist) {
if (get_cfg_clientlist.hasOwnProperty(idx)) {
if(idx == "0")
continue;//filter CAP
var model_name = get_cfg_clientlist[idx].model_name;
var fwver = get_cfg_clientlist[idx].fwver;
var online = get_cfg_clientlist[idx].online;
var mac = get_cfg_clientlist[idx].mac;
var mac_id = mac.replace(/:/g, "");
var ip = get_cfg_clientlist[idx].ip;
var alias = "My Home";
if("config" in get_cfg_clientlist[idx]) {
if("misc" in get_cfg_clientlist[idx].config) {
if("cfg_alias" in get_cfg_clientlist[idx].config.misc) {
if(get_cfg_clientlist[idx].config.misc.cfg_alias != "")
alias = get_cfg_clientlist[idx].config.misc.cfg_alias;
}
}
}
html = "";
if(!have_node) {
html += "<tr>";
html += "<td class='amesh_title' colspan='2'><#877#></td>";
html += "</tr>";
}
html += "<tr>";
html += "<th>";
html += model_name + " ( " + mac + " )";
html += "<br>";
html += "<#889#> : " + alias;
html += "</th>";
html += "<td id='amas_" + mac_id + "'>";
html += "<div id='current_version'><#58#> : " + fwver + "</div>";
html += "<div>";
html += "Manual Firmware Update : ";/*untranslated*/
if(online == "0") {
html += "<span class='amesh_offline' style='margin-left:0px;' onclick='show_offline_msg(false);'>Offline</span>";/*untranslated*/
amesh_offline_flag = true;
}
else
html += "<span class='amesh_offline' style='margin-left:0px;' onclick='open_AiMesh_node_fw_upgrade(\"" + ip + "\");'><#1297#></span>";
html += "</div>";
html += "<div id='checkNewFW' style='display:none;'><#59#> : <span class='checkFWReuslt'></span></div>";
html += "</td>";
html += "</tr>";
$("#fw_version_tr").before(html);
have_node = true;
}
}
$("#fw_version_tr").remove();
interval_update_AiMesh_fw_status = setInterval(update_AiMesh_fw, 5000);
}
if(bwdpi_support){
if(dpi_engine_status.DpiEngine == 1)
document.getElementById("sig_ver_field").style.display="";
else
document.getElementById("sig_ver_field").style.display="none";
if(sig_ver_ori == "")
document.getElementById("sig_ver_word").innerHTML = "1.008";
else
document.getElementById("sig_ver_word").innerHTML = sig_ver_ori;
if(sig_update_t == "" || sig_update_t == "0")
document.getElementById("sig_update_date").innerHTML = "";
else
document.getElementById("sig_update_date").innerHTML = "&nbsp;&nbsp;"+transferTimeFormat(sig_update_t*1000);
}
if(cfg_sync_support){
if(cfg_upgrade != "" && cfg_upgrade != "10"){ //Show firmware is still downloading or fw upgrade loading bar if doing webs_upgrade.sh
startDownloading();
}
}
else{
if(webs_state_upgrade != "" && webs_state_upgrade != "1"){ //Show firmware is still downloading or fw upgrade loading bar if doing webs_upgrade.sh
startDownloading();
}
}
if(no_update_support){
document.getElementById("update_div").style.display = "none";
document.getElementById("linkpage_div").style.display = "none";
}
else{
if(!live_update_support || !HTTPS_support){
document.getElementById("update_div").style.display = "none";
document.getElementById("linkpage_div").style.display = "";
helplink = get_helplink();
document.getElementById("linkpage").href = helplink;
}
else{
document.getElementById("update_div").style.display = "";
document.getElementById("linkpage_div").style.display = "none";
if(confirm_show.length > 0 && confirm_show == 0){
if(amesh_support && (isSwMode("rt") || isSwMode("ap"))) {
var interval = setInterval(function() {
if(link_status != undefined) {
clearInterval(interval);
show_offline_msg(true);
}
}, 100);
}
else
do_show_confirm(webs_state_flag);
}
}
}
/* Viz remarked 2016.06.17
if(!live_update_support || !HTTPS_support || exist_firmver[0] == 9){
document.getElementById('auto_upgrade_setting').style.display = "none";
}
else{
document.firmware_form.upgrade_date_x_Sun.checked = getDateCheck(document.firmware_form.fw_schedule.value, 0);
document.firmware_form.upgrade_date_x_Mon.checked = getDateCheck(document.firmware_form.fw_schedule.value, 1);
document.firmware_form.upgrade_date_x_Tue.checked = getDateCheck(document.firmware_form.fw_schedule.value, 2);
document.firmware_form.upgrade_date_x_Wed.checked = getDateCheck(document.firmware_form.fw_schedule.value, 3);
document.firmware_form.upgrade_date_x_Thu.checked = getDateCheck(document.firmware_form.fw_schedule.value, 4);
document.firmware_form.upgrade_date_x_Fri.checked = getDateCheck(document.firmware_form.fw_schedule.value, 5);
document.firmware_form.upgrade_date_x_Sat.checked = getDateCheck(document.firmware_form.fw_schedule.value, 6);
document.firmware_form.upgrade_time_x_hour.value = getfirmwareTimeRange(document.firmware_form.fw_schedule.value, 0);
document.firmware_form.upgrade_time_x_min.value = getfirmwareTimeRange(document.firmware_form.fw_schedule.value, 1);
document.getElementById('auto_upgrade_setting').style.display = "";
hide_upgrade_option('<% nvram_get("fw_schedule_enable"); %>');
}
*/
if(based_modelid == "RT-AC68R"){ //MODELDEP //id: asus_link is in string tag #FW_desc0#
document.getElementById("asus_link").href = "https://www.asus.com/us/supportonly/RT-AC68R/";
document.getElementById("asus_link").innerHTML = "https://www.asus.com/us/supportonly/RT-AC68R/";
}
if(based_modelid == "RT-AC68A"){ //MODELDEP : Spec special fine tune
document.getElementById("fw_note2").style.display = "none";
document.getElementById("fw_note3").style.display = "none";
inputCtrl(document.form.file, 0);
inputCtrl(document.form.upload, 0);
}
else{
inputCtrl(document.form.file, 1);
inputCtrl(document.form.upload, 1);
}
if(amesh_support && (isSwMode("rt") || isSwMode("ap"))) {
$("#manually_upgrade_tr").css("display", "none");
$("#productid_tr").css("display", "none");
document.form.file.onchange = function() {
submitForm();
}
}
}
var dead = 0;
var note_display=0; //formal path
function detect_firmware(flag){
$.ajax({
url: '/detect_firmware.asp',
dataType: 'script',
error: function(xhr){
dead++;
if(dead < 30)
setTimeout("detect_firmware();", 1000);
else{
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').innerHTML="<#1245#>";
document.getElementById('update').disabled = false;
}
},
success: function(){
if(cfg_sync_support){
if(cfg_check == "0" || cfg_check == "1" || cfg_check == "5"){
setTimeout("detect_firmware();", 1000);
}
else{ // got fw info
if(cfg_check == "2"){ //1:wget fail
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').innerHTML="<#1245#>";
document.getElementById('update').disabled = false;
}
else if(cfg_check == "4"){ //3: FW check/RSA check fail
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').innerHTML="<#187#><br><#1688#>";
document.getElementById('update').disabled = false;
}
else{
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').innerHTML="";
document.getElementById('update').disabled = false;
var check_webs_state_info = webs_state_info;
note_display=0;
if(amesh_support && (isSwMode("rt") || isSwMode("ap")))
show_amas_fw_result();
else
do_show_confirm(webs_state_flag);
}
}
}
else{
if(webs_state_update == "0"){
setTimeout("detect_firmware();", 1000);
}
else{ // got fw info
if(webs_state_error == "1"){ //1:wget fail
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').innerHTML="<#1245#>";
document.getElementById('update').disabled = false;
}
else if(webs_state_error == "3"){ //3: FW check/RSA check fail
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').innerHTML="<#187#><br><#1688#>";
document.getElementById('update').disabled = false;
}
else{
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').innerHTML="";
document.getElementById('update').disabled = false;
var check_webs_state_info = webs_state_info;
note_display=0;
do_show_confirm(webs_state_flag);
}
}
}
}
});
}
function do_show_confirm(flag){
if(flag==1 || flag==2){
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').style.display="none";
confirm_asus({
title: "New Firmware Available",
contentA: "<#178#><br>",
contentC: "<br><#781#> <#266#>",
left_button: (flag==2)? "<#162#>":"<#150#>",
left_button_callback: function(){confirm_cancel();},
left_button_args: {},
right_button: (flag==2)? "<#163#>":"<#1296#>",
right_button_callback: function(){
if(cfg_sync_support){
cfgsync_firmware_upgrade();
}
else{
document.start_update.action_mode.value="apply";
document.start_update.action_script.value="start_webs_upgrade";
document.start_update.submit();
}
},
right_button_args: {},
iframe: "get_release_note0.asp",
margin: "100px 0px 0px 25px",
note_display_flag: note_display
});
}
else{
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').style.display="";
document.getElementById('update_states').innerHTML="<#217#>";
}
}
function cfgsync_firmware_check(){
$.ajax({
url: '/apply.cgi?action_mode=firmware_check',
dataType: 'script',
error: function(xhr) {
setTimeout("cfgsync_firmware_check();", 1000);
},
success: function(response){
setTimeout("detect_firmware();", 5000);
}
});
}
function cfgsync_firmware_upgrade(){
$.ajax({
url: '/apply.cgi?action_mode=firmware_upgrade',
dataType: 'script',
error: function(xhr) {
setTimeout("cfgsync_firmware_upgrade();", 1000);
},
success: function(response){
setTimeout("startDownloading();", 1000);
}
});
}
function detect_update(){
if(sw_mode != "1" || (link_status == "2" && link_auxstatus == "0") || (link_status == "2" && link_auxstatus == "2")){
if(cfg_sync_support){
cfgsync_firmware_check();
}
else{
document.start_update.action_mode.value="apply";
document.start_update.action_script.value="start_webs_update";
document.start_update.submit();
}
document.getElementById('update_states').style.display="";
document.getElementById('update_states').innerHTML="<#1211#>";
document.getElementById('update_scan').style.display="";
document.getElementById('update').disabled = true;
}
else if(dualwan_enabled &&
((first_link_status == "2" && first_link_auxstatus == "0") || (first_link_status == "2" && first_link_auxstatus == "2")) ||
((secondary_link_status == "2" && secondary_link_auxstatus == "0") || (secondary_link_status == "2" && secondary_link_auxstatus == "2"))){
document.start_update.action_mode.value="apply";
document.start_update.action_script.value="start_webs_update";
document.getElementById('update_states').style.display="";
document.getElementById('update_states').innerHTML="<#1211#>";
document.getElementById('update_scan').style.display="";
document.getElementById('update').disabled = true;
document.start_update.submit();
}
else{
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').style.display="";
document.getElementById('update_states').innerHTML="<#1245#>";
return false;
}
}
var dead = 0;
function detect_httpd(){
$.ajax({
url: '/httpd_check.xml',
dataType: 'xml',
timeout: 1500,
error: function(xhr){
if(dead > 5){
document.getElementById('loading_block1').style.display = "none";
document.getElementById('loading_block2').style.display = "none";
document.getElementById('loading_block3').style.display = "";
document.getElementById('loading_block3').innerHTML = "<div><#190#></div>";
}
else{
dead++;
}
setTimeout("detect_httpd();", 1000);
},
success: function(){
location.href = "/";
}
});
}
var rebooting = 0;
function isDownloading(){
$.ajax({
url: '/ajax_fwdl_percent.asp',
dataType: 'script',
timeout: 1500,
error: function(xhr){
rebooting++;
if(rebooting < 30){
setTimeout("isDownloading();", 1000);
}
else{
document.getElementById("drword").innerHTML = "<#1245#>";
return false;
}
},
success: function(){
if(cfg_sync_support){
if(cfg_upgrade == "1"){
document.getElementById("drword").innerHTML = "&nbsp;&nbsp;&nbsp;<#1689#>...";
setTimeout("isDownloading();", 1000);
}
else{
if(cfg_upgrade == "2"){
document.getElementById("drword").innerHTML = "<#1245#>";
return false;
}
else if(cfg_upgrade == "3"){
document.getElementById("drword").innerHTML = "<#187#><br><#1688#>";
return false;
}
else{ // start upgrading
document.getElementById("hiddenMask").style.visibility = "hidden";
showLoadingBar(270);
setTimeout("detect_httpd();", 272000);
return false;
}
}
}
else{
if(webs_state_upgrade == 0){
document.getElementById("drword").innerHTML = "&nbsp;&nbsp;&nbsp;<#1689#>..."+fwdl_percent;
setTimeout("isDownloading();", 1000);
}
else{ // webs_upgrade.sh is done
if(webs_state_error == 1){
document.getElementById("drword").innerHTML = "<#1245#>";
return false;
}
else if(webs_state_error == 2){
document.getElementById("drword").innerHTML = "Memory space is NOT enough to upgrade on internet. Please wait for rebooting.<br><#1688#>"; /* untranslated */ //Untranslated. fw_size_higher_mem
return false;
}
else if(webs_state_error == 3){
document.getElementById("drword").innerHTML = "<#187#><br><#1688#>";
return false;
}
else{ // start upgrading
document.getElementById("hiddenMask").style.visibility = "hidden";
showLoadingBar(270);
setTimeout("detect_httpd();", 272000);
return false;
}
}
}
}
});
}
function startDownloading(){
disableCheckChangedStatus();
dr_advise();
document.getElementById("drword").innerHTML = "&nbsp;&nbsp;&nbsp;<#1689#>...";
isDownloading();
}
function check_zip(obj){
var reg = new RegExp("^.*.(zip|ZIP|rar|RAR|7z|7Z)$", "gi");
if(reg.test(obj.value)){
alert("<#1700#>");
obj.focus();
obj.select();
return false;
}
else
return true;
}
function submitForm(){
if(!check_zip(document.form.file))
return;
else {
var status = onSubmitCtrlOnly(document.form.upload, 'Upload1');
if(amesh_support && status && (isSwMode("rt") || isSwMode("ap"))) {
if(interval_update_AiMesh_fw_status) {
clearInterval(interval_update_AiMesh_fw_status);
interval_update_AiMesh_fw_status = false;
}
}
}
}
function sig_version_check(){
document.getElementById("sig_check").disabled = true;
$("#sig_status").show();
document.sig_update.submit();
$("#sig_status").html("Signature checking ..."); /* Untranslated */
document.getElementById("sig_update_scan").style.display = "";
setTimeout("sig_check_status();", 8000);
}
var sdead=0;
var sig_chk_count=60;
function sig_check_status(){
$.ajax({
url: '/detect_firmware.asp',
dataType: 'script',
timeout: 3000,
error: function(xhr){
sdead++;
if(sdead < 20){
setTimeout("sig_check_status();", 1000);
}
else{
return;
}
},
success: function(){
--sig_chk_count;
$("#sig_status").show();
if(sig_state_flag == 0){ // no need upgrade
$("#sig_status").html("Signature is up to date"); /* Untranslated */
document.getElementById("sig_update_scan").style.display = "none";
document.getElementById("sig_check").disabled = false;
}
else if(sig_state_flag == 1){
if(sig_state_error != 0){ // update error
$("#sig_status").html("Signature update failed"); /* Untranslated */
document.getElementById("sig_update_scan").style.display = "none";
document.getElementById("sig_check").disabled = false;
}
else{
if(sig_state_flag == 1 && sig_state_update == 0 && sig_state_upgrade == 1){ //update complete
update_sig_ver();
document.getElementById("sig_check").disabled = false;
}
else{ //updating
if(sig_chk_count < 1){
$("#sig_status").hide();
document.getElementById("sig_update_scan").style.display = "none";
document.getElementById("sig_check").disabled = false;
}
else{
$("#sig_status").html("Signature is updating"); /* Untranslated */
setTimeout("sig_check_status();", 1000);
}
}
}
}
}
});
}
function update_sig_ver(){
$.ajax({
url: '/detect_firmware.asp',
dataType: 'script',
timeout: 3000,
error: function(xhr){
setTimeout('update_sig_ver();', 1000);
},
success: function(){
if(sig_ver_ori == sig_ver){
setTimeout('update_sig_ver();', 1000);
}
else{
document.getElementById("sig_update_date").innerHTML = "";
document.getElementById("sig_update_scan").style.display = "none";
$("#sig_status").html("Signature update completely"); /* Untranslated */
$("#sig_ver_word").html(sig_ver);
}
}
});
}
function check_Timefield_checkbox(){ // To check Date checkbox checked or not and control Time field disabled or not
if( document.firmware_form.upgrade_date_x_Sun.checked == true
|| document.firmware_form.upgrade_date_x_Mon.checked == true
|| document.firmware_form.upgrade_date_x_Tue.checked == true
|| document.firmware_form.upgrade_date_x_Wed.checked == true
|| document.firmware_form.upgrade_date_x_Thu.checked == true
|| document.firmware_form.upgrade_date_x_Fri.checked == true
|| document.firmware_form.upgrade_date_x_Sat.checked == true ){
inputCtrl(document.firmware_form.upgrade_time_x_hour,1);
inputCtrl(document.firmware_form.upgrade_time_x_min,1);
}
else{
inputCtrl(document.firmware_form.upgrade_time_x_hour,0);
inputCtrl(document.firmware_form.upgrade_time_x_min,0);
}
}
function hide_upgrade_option(flag){
document.firmware_form.upgrade_date_x_Sun.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Mon.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Tue.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Wed.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Thu.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Fri.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Sat.disabled = (flag == 1) ? false : true;
(flag == 1) ? inputCtrl(document.firmware_form.upgrade_time_x_hour,1) : inputCtrl(document.firmware_form.upgrade_time_x_hour,0);
(flag == 1) ? inputCtrl(document.firmware_form.upgrade_time_x_min,1) : inputCtrl(document.firmware_form.upgrade_time_x_min,0);
if(flag==1)
check_Timefield_checkbox();
}
function getfirmwareTimeRange(str, pos)
{
if (pos == 0)
return str.substring(7,9);
else if (pos == 1)
return str.substring(9,11);
}
function setfirmwareTimeRange(rd, rh, rm)
{
return(rd.value+rh.value+rm.value);
}
function updateDateTime()
{
if(document.firmware_form.fw_schedule_enable.value == "1"){
document.firmware_form.fw_schedule.value = setDateCheck(
document.firmware_form.upgrade_date_x_Sun,
document.firmware_form.upgrade_date_x_Mon,
document.firmware_form.upgrade_date_x_Tue,
document.firmware_form.upgrade_date_x_Wed,
document.firmware_form.upgrade_date_x_Thu,
document.firmware_form.upgrade_date_x_Fri,
document.firmware_form.upgrade_date_x_Sat);
document.firmware_form.fw_schedule.value = setfirmwareTimeRange(
document.firmware_form.fw_schedule,
document.firmware_form.upgrade_time_x_hour,
document.firmware_form.upgrade_time_x_min);
}
}
function applyRule(){
if(validForm()){
if(live_update_support){
updateDateTime();
}
showLoading();
document.firmware_form.submit();
}
}
function validForm(){
if(live_update_support){
if(!document.firmware_form.upgrade_date_x_Sun.checked && !document.firmware_form.upgrade_date_x_Mon.checked &&
!document.firmware_form.upgrade_date_x_Tue.checked && !document.firmware_form.upgrade_date_x_Wed.checked &&
!document.firmware_form.upgrade_date_x_Thu.checked && !document.firmware_form.upgrade_date_x_Fri.checked &&
!document.firmware_form.upgrade_date_x_Sat.checked && document.firmware_form.fw_schedule_enable.value == "1")
{
alert(Untranslated.filter_lw_date_valid);
document.firmware_form.upgrade_date_x_Sun.focus();
return false;
}
else
return true;
}
else
return true;
}
function transferTimeFormat(time){
if(time == 0){
return "";
}
var t = new Date();
t.setTime(time);
var year = t.getFullYear();
var month = t.getMonth() + 1;
if(month < 10){
month = "0" + month;
}
var date = t.getDate();
if(date < 10){
date = "0" + date;
}
var hour = t.getHours();
if(hour < 10){
hour = "0" + hour;
}
var minute = t.getMinutes();
if(minute < 10){
minute = "0" + minute;
}
var date_format = "<#1701#> : " + year + "/" + month + "/" + date + " " + hour + ":" + minute;
return date_format;
}
function show_offline_msg(_checkFlag) {
if(!amesh_offline_flag && _checkFlag) {
$("#amas_update").css("display", "none");
$(".checkNewFW").css("display", "none");
$(".checkFWReuslt").empty();
$(".checkFWReuslt").removeClass("fwReleaseNote");
detect_update();
return;
}
var $offlineHtml = $('<div>');
$offlineHtml.attr({"id" : "amesh_offline_msg"});
$offlineHtml.addClass("amesh_popup_bg");
$offlineHtml.css("display", "none");
$offlineHtml.attr({"onselectstart" : "return false"});
$offlineHtml.appendTo($('body'));
var $amesh_hint_offline = $('<div>');
$amesh_hint_offline.addClass("amesh_hint_text");
$amesh_hint_offline.css("color", "#FC0");
$amesh_hint_offline.html("<#1699#>");
$offlineHtml.append($amesh_hint_offline);
var $amesh_hint_text = $('<div>');
$amesh_hint_text.addClass("amesh_hint_text");
$amesh_hint_text.html("<#902#> :");
$offlineHtml.append($amesh_hint_text);
var $amesh_hint_content = $('<div>');
$amesh_hint_content.addClass("amesh_hint_text");
$amesh_hint_content.css("margin-left", "auto");
$offlineHtml.append($amesh_hint_content);
var $msg_item = $('<ol>');
var msg_text = "<li><#903#></li>";
msg_text += "<li><#904#></li>";
msg_text += "<li><#905#></li>";
msg_text += "<li><#906#></li>";
msg_text += "<li><#907#></li>";
$msg_item.html(msg_text);
$amesh_hint_content.append($msg_item);
var $amesh_action_bg = $('<div>');
$amesh_action_bg.addClass("amesh_action_bg");
$offlineHtml.append($amesh_action_bg);
var $amesh_ok = $('<input/>');
$amesh_ok.addClass("button_gen");
$amesh_ok.attr({"type" : "button", "value" : "<#1287#>"});
$amesh_action_bg.append($amesh_ok);
$amesh_ok.click(
function() {
if($('.amesh_popup_bg').length == 1) {
$('.amesh_popup_bg').remove();
}
if(_checkFlag) {
detect_update();
}
}
);
$("#amesh_offline_msg").fadeIn(300);
cal_panel_block("amesh_offline_msg", 0.25);
adjust_panel_block_top("amesh_offline_msg", 200);
}
function show_amas_fw_result() {
$.ajax({
url: '/ajax_onboarding.asp',
dataType: 'script',
error: function(xhr) {
amas_fw_detect();
},
success: function() {
document.getElementById('update_states').style.display = "none";
document.getElementById('update_states').innerHTML = "";
document.getElementById('update_scan').style.display = "none";
for (var idx in get_cfg_clientlist) {
if(get_cfg_clientlist.hasOwnProperty(idx)) {
var model_name = get_cfg_clientlist[idx].model_name;
var mac = get_cfg_clientlist[idx].mac;
var newfwver = get_cfg_clientlist[idx].newfwver;
var mac_id = mac.replace(/:/g, "");
var ck_fw_result = "<#217#>";
var online = get_cfg_clientlist[idx].online;
$("#amas_" + mac_id + "").children().find(".checkFWReuslt").html(ck_fw_result);
if(newfwver != "") {
ck_fw_result = newfwver;
$("#amas_" + mac_id + "").children().find(".checkFWReuslt").addClass("fwReleaseNote");
$("#amas_" + mac_id + "").children().find(".checkFWReuslt").html(ck_fw_result);
$("#amas_update").css("display", "");
$("#amas_" + mac_id + "").children().find(".checkFWReuslt").click({"model_name": model_name, "newfwver": newfwver}, show_fw_relese_note);
}
if(online == "1")
$("#amas_" + mac_id + "").children("#checkNewFW").css("display", "");
}
}
}
});
}
function show_fw_relese_note(event) {
if($(".confirm_block").length > 0)
$(".confirm_block").remove();
document.amas_release_note.model.value = event.data.model_name;
document.amas_release_note.version.value = event.data.newfwver;
document.amas_release_note.submit();
confirm_asus({
title: "New Firmware Available",
contentA: "<#178#><br>",
contentC: "<br><#781#> <#266#>",
left_button: "",
left_button_callback: {},
left_button_args: {},
right_button: "<#1271#>",
right_button_callback: function(){confirm_cancel();},
right_button_args: {},
iframe: "get_release_note_amas.asp",
margin: "100px 0px 0px 25px",
note_display_flag: note_display
});
setTimeout(function(){check_fw_relese_note_status();}, 2000);
}
function check_fw_relese_note_status() {
if($(".confirm_block").length > 0) {
$.ajax({
url: '/ajax_onboarding.asp',
dataType: 'script',
success: function() {
switch(cfg_note) {
case "0" :
check_fw_relese_note_status();
break;
case "1" :
show_fw_relese_note_result(true);
break;
case "2" :
case "3" :
show_fw_relese_note_result(false);
break;
}
}
});
}
}
function show_fw_relese_note_result(_status) {
if($(".confirm_block").children().find("#status_iframe").contents().find("#amas_relese_note").length == 0)
show_fw_relese_note_result(_status);
if(_status) {
$(".confirm_block").children().find("#status_iframe").attr("src", "get_release_note_amas.asp");//reload
$(".confirm_block").children().find("#status_iframe").load(function() {
$(".confirm_block").children().find("#status_iframe").contents().find("#amas_relese_note").css("display", "");
$(".confirm_block").children().find("#status_iframe").contents().find("#amas_relese_note_hint").css("display", "none");
});
}
else
$(".confirm_block").children().find("#status_iframe").contents().find("#amas_relese_note_hint").val("Fail to grab release note");/* untranslated */
}
function open_AiMesh_node_fw_upgrade(_ip) {
var url = "http://" + _ip + "/AiMesh_Node_FirmwareUpgrade.asp";
var window_width = 550;
var window_height = 450;
var window_top = screen.availHeight / 2 - window_height / 2;
var window_left = screen.availWidth / 2 - window_width / 2;
window.open(url, '_new' ,'width=' + window_width + ',height=' + window_height + ', top=' + window_top + ',left=' + window_left + ',menubar=no,scrollbars=no,toolbar=no,resizable=no,status=no,location=no');
}
function open_AiMesh_router_fw_upgrade() {
document.form.file.click();
}
function update_AiMesh_fw() {
$.ajax({
url: '/ajax_onboarding.asp',
dataType: 'script',
success: function(){
for (var idx in get_cfg_clientlist) {
if(get_cfg_clientlist.hasOwnProperty(idx)) {
var mac = get_cfg_clientlist[idx].mac;
var fwver = get_cfg_clientlist[idx].fwver;
var mac_id = mac.replace(/:/g, "");
$("#amas_" + mac_id + "").children("#current_version").html("Current Version : " + fwver + "");/* untranslated */
}
}
}
});
}
</script>
</head>
<body onload="initial();">
<div id="TopBanner"></div>
<div id="LoadingBar" class="popup_bar_bg">
<table cellpadding="5" cellspacing="0" id="loadingBarBlock" class="loadingBarBlock" align="center">
<tr>
<td height="80">
<div id="loading_block1" class="Bar_container">
<span id="proceeding_img_text"></span>
<div id="proceeding_img"></div>
</div>
<div id="loading_block2" style="margin:5px auto; width:85%;"><#188#><br><#266#></div>
<div id="loading_block3" style="margin:5px auto;width:85%; font-size:12pt;"></div>
</td>
</tr>
</table>
<!--[if lte IE 6.5]><iframe class="hackiframe"></iframe><![endif]-->
</div>
<div id="Loading" class="popup_bg"></div><div id="hiddenMask" class="popup_bg">
<table cellpadding="5" cellspacing="0" id="dr_sweet_advise" class="dr_sweet_advise" align="center" style="height:100px;">
<tr>
<td>
<div class="drword" id="drword" style="">&nbsp;&nbsp;&nbsp;&nbsp;<#265#> <#262#>...</div>
</td>
</tr>
</table>
<!--[if lte IE 6.5]><iframe class="hackiframe"></iframe><![endif]-->
</div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="post" action="upgrade.cgi" name="form" target="hidden_frame" enctype="multipart/form-data">
<input type="hidden" name="current_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="next_page" value="">
<input type="hidden" name="action_mode" value="">
<input type="hidden" name="action_script" value="">
<input type="hidden" name="action_wait" value="">
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
<td align="left" valign="top" >
<table width="760px" border="0" cellpadding="5" cellspacing="0" class="FormTitle" id="FormTitle">
<tbody>
<tr>
<td bgcolor="#4D595D" valign="top" >
<div>&nbsp;</div>
<div class="formfonttitle"><#303#> - <#307#></div>
<div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
<div class="formfontdesc"><strong><#1696#></strong>
<ol>
<li><#1694#></li>
<li><#193#></li>
<li id="fw_note2"><#1695#></li>
<li id="fw_note3"><#1687#></li>
</ol>
</div>
<br>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead>
<tr>
<td colspan="2"><#1691#></td>
</tr>
</thead>
<tr id="productid_tr">
<th><#1690#></th>
<td><#710#></td>
</tr>
<tr id="sig_ver_field" style="display:none">
<th><#2478#></th>
<td >
<div style="height:33px;margin-top:5px;"><span id="sig_ver_word" style="color:#FFFFFF;"></span><span id="sig_update_date"></span></div>
<div style="margin-left:200px;margin-top:-38px;">
<input type="button" id="sig_check" name="sig_check" class="button_gen" onclick="sig_version_check();" value="<#2022#>">
</div>
<div>
<span id="sig_status" style="display:none"></span>
<img id="sig_update_scan" style="display:none;" src="images/InternetScan.gif">
</div>
</td>
</tr>
<tr id="fw_version_tr">
<th><#1691#></th>
<td>
<div id="FWString" style="height:33px;margin-top:5px;"></div>
<div id="update_div" style="margin-left:200px;margin-top:-38px;display:none;">
<input type="button" id="update" name="update" class="button_gen" onclick="detect_update();" value="<#2022#>" />
</div>
<div id="linkpage_div" class="button_helplink" style="margin-left:200px;margin-top:-38px;display:none;">
<a id="linkpage" target="_blank"><div style="padding-top:5px;"><#2022#></div></a>
</div>
<div id="check_states">
<span id="update_states"></span>
<img id="update_scan" style="display:none;" src="images/InternetScan.gif" />
</div>
</td>
</tr>
<tr id="manually_upgrade_tr">
<th><#1692#></th>
<td>
<input type="file" name="file" class="input" style="color:#FFCC00;*color:#000;width: 194px;">
<input type="button" name="upload" class="button_gen" onclick="submitForm()" value="<#1297#>" />
</td>
</tr>
</table>
<div class="aimesh_manual_fw_update_hint" style="display:none;">
<#1696#> <#1697#>
</div>
</form>
<form method="post" name="firmware_form" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="current_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="next_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="preferred_lang" value="<% nvram_get("preferred_lang"); %>">
<input type="hidden" name="firmver" value="<% nvram_get("firmver"); %>">
<input type="hidden" name="modified" value="0">
<input type="hidden" name="flag" value="">
<input type="hidden" name="action_mode" value="apply">
<input type="hidden" name="action_script" value="restart_time">
<input type="hidden" name="action_wait" value="5">
<input type="hidden" name="fw_schedule_enable" value="<% nvram_get("fw_schedule_enable"); %>">
<input type="hidden" name="fw_schedule" value="<% nvram_get("fw_schedule"); %>">
<table id="auto_upgrade_setting" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable" style="display:none;">
<thead>
<tr>
<td colspan="2">Auto Upgrade Setting</td> </tr>
</thead>
<tr>
<th>Instal Newer Ofiicial Firmware Automatically</th> <td>
<div class="left" style="width:94px; float:left; cursor:pointer;" id="radio_firmware_schedule_enable"></div>
<script type="text/javascript">
$('#radio_firmware_schedule_enable').iphoneSwitch('<% nvram_get("fw_schedule_enable"); %>',
function() {
document.firmware_form.fw_schedule_enable.value = 1;
hide_upgrade_option(1);
},
function() {
document.firmware_form.fw_schedule_enable.value = 0;
hide_upgrade_option(0);
}
);
</script>
</td>
</tr>
<tr>
<th>Day To Install</th> <td>
<input type="checkbox" name="upgrade_date_x_Sun" class="input" onclick="check_Timefield_checkbox();"><#1308#>
<input type="checkbox" name="upgrade_date_x_Mon" class="input" onclick="check_Timefield_checkbox();"><#1306#>
<input type="checkbox" name="upgrade_date_x_Tue" class="input" onclick="check_Timefield_checkbox();"><#1310#>
<input type="checkbox" name="upgrade_date_x_Wed" class="input" onclick="check_Timefield_checkbox();"><#1311#>
<input type="checkbox" name="upgrade_date_x_Thu" class="input" onclick="check_Timefield_checkbox();"><#1309#>
<input type="checkbox" name="upgrade_date_x_Fri" class="input" onclick="check_Timefield_checkbox();"><#1305#>
<input type="checkbox" name="upgrade_date_x_Sat" class="input" onclick="check_Timefield_checkbox();"><#1307#>
</td>
</tr>
<tr>
<th>Time To Install</th> <td>
<input type="text" maxlength="2" class="input_3_table" name="upgrade_time_x_hour" onKeyPress="return validator.isNumber(this,event);" onblur="validator.timeRange(this, 0);" autocorrect="off" autocapitalize="off"> :
<input type="text" maxlength="2" class="input_3_table" name="upgrade_time_x_min" onKeyPress="return validator.isNumber(this,event);" onblur="validator.timeRange(this, 1);" autocorrect="off" autocapitalize="off">
</td>
</tr>
<tr align="center">
<td colspan="2" >
<input type="button" name="apply" class="button_gen" onclick="applyRule()" value="<#148#>" />
</td>
</tr>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</table>
</td>
<td width="10" align="center" valign="top">&nbsp;</td>
</tr>
</table>
<div id="footer"></div>
</form>
<form method="post" name="start_update" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="current_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="next_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="flag" value="liveUpdate">
<input type="hidden" name="action_mode" value="">
<input type="hidden" name="action_script" value="">
<input type="hidden" name="action_wait" value="">
</form>
<form method="post" name="sig_update" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="current_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="next_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="action_mode" value="apply">
<input type="hidden" name="action_script" value="start_sig_check">
<input type="hidden" name="action_wait" value="">
</form>
<form method="post" name="amas_release_note" action="/applyapp.cgi" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="current_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="next_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="action_mode" value="release_note">
<input type="hidden" name="model" value="">
<input type="hidden" name="version" value="">
</form>
</body>
</html>

