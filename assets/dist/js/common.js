$(document).ready(function() {
	$("#updateprofile").submit(function(e)
	{
		var postData = $(this).serializeArray();
		var formURL = $(this).attr("action");
		$.ajax(
		{
			url : formURL,
			type: "POST",
			data : postData,
			success:function(data, textStatus, jqXHR) 
			{
				var baseUrl = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)) + "/";
				if(data == '-99'){
					window.location = baseUrl + 'logout.php';
				}
				else{
					alert('Update Profile Information Successfully');
					window.location = baseUrl + 'logout.php';
				}
			},
			error: function(jqXHR, textStatus, errorThrown) 
			{
				alert(textStatus);
			}
		});
		e.preventDefault();
	});
	
	if(jQuery("#modalVerify").length>0){
		jQuery("#modalVerify").modal();
	}
	
});





/*menu handler*/
/*$(function(){
  function stripTrailingSlash(str) {
    if(str.substr(-1) == '/') {
      return str.substr(0, str.length - 1);
    }
    return str;
  }

  var url = window.location.pathname;  
  var activePage = stripTrailingSlash(url);
  $('.sidebar-menu li a').each(function(){  
    var currentPage = stripTrailingSlash($(this).attr('href'));
    if (activePage == currentPage) {
      $(this).parent().addClass('active');
    } 
  });
});*/
// here we done delete function for all page
var gobal_url = '';
function deleteMe(url){
	if(url != ''){
		var iAnswer = confirm("Are you sure you want to delete this row ?");
		if(iAnswer){
			window.location.href = url;
		}
	}
}

//return ajax date for dropdownlist
function getDropdownlistDate(val,token,ddl_name){
	$.get("../ajax/ajax_response.php?id="+val+'&token='+token, function(data, status){
        if(data != 0){
			$("#"+ddl_name).html(data);
		}
		else{
			alert("Bad Request");
		}
    });
}

//return ajax date for dropdownlistWard
function getDropdownlistWard(val,token,ddl_name){
	$.get("../ajax/ajax_response_ward.php?id="+val+'&token='+token, function(data, status){
        if(data != 0){
			$("#"+ddl_name).html(data);
		}
		else{
			alert("Bad Request");
		}
    });
}

function calPrice(){
	calculateGrandTotal();
}

function saveUserInfo(){
	alert('Update profile information successfully');
	$(window).colorbox.close();
}

$('.time').mask('00:00');


//here for allownumbers only
$(document).ready(function() {
    gobal_url = $("#web_url").val();
	$(".allownumberonly").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });

//here for aditional price	
	$("#txtEdiPrice").keyup(function() {
		 if(isTestSelected()){
			  calculateGrandTotal();
		  }
		  else{
		  	$("#txtEdiPrice").val('0.00');
		  }
		 
	});
	//here for discount
	$("#txtDiscount").keyup(function() {
		 if(forDiscountValidation()){
			calculateGrandTotal();
		 }
		 else{
		 	$("#txtDiposite").val('0.00');
		 }
	});
	//here deposit calculation
	$("#txtDiposite").keyup(function() {
		 if(isTestSelected()){
			calculateGrandTotal();
		 }
		 else{
		 	$("#txtDiposite").val('0.00');
		 }
	});
	
	//here for physiotherapy
	$(".phyppc").keyup(function() {
		getTotalPhyPrice();
	});
	
	/*function resetBloodPrice(){
		alert('');
		$("#txtBQty").val('0');
		$("#txtBTotalPrice").val('0.00');
	}*/
	
	$("#txtUPrice").keyup(function() {
		bloodPriceCalculate();
	});
	$("#txtBQty").keyup(function() {
		bloodPriceCalculate();
	});
	
	$("#txtStockItemQty").keyup(function() {
		stockPriceCalculation();
	});
	$("#txtStockItemPrice").keyup(function() {
		stockPriceCalculation();
	});
});

function bloodPriceCalculate(){
	var q = 0;
	var u = 0.00;
	q = $("#txtBQty").val();
	u = $("#txtUPrice").val();
	var total = parseFloat(parseFloat(q) * parseFloat(u));
	total = total.toFixed(2);
	$("#txtBTotalPrice").val(total);
	$("#txtHTotalPrice").val(total);
}

function isTestSelected(){
	if (!$(".tt_cat").is(":checked")) {
    	alert("Please select atlest one patient Test Category");
		return false;
	}
	else{
		return true;
	}
}

function forDiscountValidation(){
	if(parseFloat($("#txtPathoPrice").val()) > 0){
		return true;
	}
	else{
		alert("Your Total Price is Zero so please select category");
		return false;
	}
}

function calculateGrandTotal(){
	var e_price = 0;
	var ttp = totalTestCategoryPrice();
	if($("#txtEdiPrice").val() != ''){
		e_price = $("#txtEdiPrice").val();
	}
	var d_price = $("#txtDiscount").val();
	var dup_price = $("#txtDiposite").val();
	if(parseFloat(ttp) > 0){
	  var x1 = 0;
	  var tp_ep = parseFloat(parseFloat(ttp) + parseFloat(e_price));
	  
	  if(parseFloat(d_price) > 0){
		  x1 = parseFloat(parseFloat(tp_ep) - parseFloat(parseFloat(parseFloat(tp_ep) * parseFloat(d_price))/100));
	  }
	 
	  if(parseFloat(dup_price) > 0){
		  if(parseFloat(x1) > 0){
			  var x2 = parseFloat(parseFloat(x1) - parseFloat(dup_price));
			  var x77 = x2.toFixed(2);
			  $("#txtDue").val(x77);
		  }
		  else{
			  var x2 = parseFloat(parseFloat(tp_ep) - parseFloat(dup_price));
			  var x77 = x2.toFixed(2);
			  $("#txtDue").val(x77);
		  }
	  }
	  else{
		  if(parseFloat(x1) > 0){
			  var x33 = x1.toFixed(2);
			  $("#txtDue").val(x33);
		  }
		  else{
			  var x33 = tp_ep.toFixed(2);
			  $("#txtDue").val(x33);
		  }
	  }
	  if(parseFloat(x1) > 0){
		  var x22 = x1.toFixed(2);
		  $("#txtPathoPrice").val(x22);
	  }
	  else{
		  var tt = tp_ep.toFixed(2);
		  $("#txtPathoPrice").val(tt);
	  }
   }
   else{
   	  $("#txtEdiPrice").val('0');
	  $("#txtDiscount").val('0');
	  $("#txtDiposite").val('0.00');
	  $("#txtDue").val('0.00');
	  $("#txtPathoPrice").val('0.00');
   }
}

function totalTestCategoryPrice(){
	var total_price = 0.00;
	$('.tt_cat:checked').each(function() {
	   var x1 = $(this).attr("p_test_price");
	   if(x1 != '' && parseFloat(x1) > 0){
	   	 total_price = parseFloat(parseFloat(total_price) + parseFloat(x1));
	   }
	});
	total_price = total_price.toFixed(2);
	return total_price;
}


//here for physiotherapy

function getTotalPhyPrice(){
	var per_day_price = $("#txtTherapyPrice").val();
	var total_days = $("#txtTDS").val();
	var discount = $("#txtPDiscount").val();
	var deposit = $("#txtPDeposit").val();
	if(parseFloat(per_day_price) > 0){
		if(parseInt(total_days) > 0){
			var total = parseFloat(per_day_price) * parseFloat(total_days);
			if(parseFloat(discount) > 0){
				total = parseFloat(parseFloat(total) - parseFloat(parseFloat(parseFloat(total) * parseFloat(discount)) / 100));
			}
			total = total.toFixed(2);
			if(parseFloat(deposit) > 0){
				var x2 = parseFloat(total) - parseFloat(deposit);
				var x3 = x2.toFixed(2);
				$("#txtPDue").val(x3);
				$("#txtTherapyTotalAmount").val(total);
			}
			else{
				$("#txtPDue").val(total);
				$("#txtTherapyTotalAmount").val(total);
			}
		}
		else{
			$("#txtTherapyTotalAmount").val('0.00');
		}
	}
	else{
		alert('Price per day required');
		$("#txtTherapyPrice").val('0.00');
	}
}

function stockPriceCalculation(){
	var qty = 0;
	var item_price = 0.00;
	var total = 0.00;
	if($("#txtStockItemPrice").val() != ''){
		item_price = $("#txtStockItemPrice").val();
	}
	if($("#txtStockItemQty").val() != ''){
		qty = $("#txtStockItemQty").val();
	}
	total = parseFloat(item_price) * parseInt(qty);
	total = total.toFixed(2);
	$("#txtStockTotalAmount").val(total);
}


function openDialogPopup(){
  $( "#dialog-message" ).dialog({
	modal: true,
	width:400,
	height:300
  });
}
//Report Delivery here
function getEmailAddress(empid,dcolume,fill){
	if(empid != ''){
		$.get("../ajax/getemployee.php?empid=" + empid + '&dcolume=' + dcolume, function(data, status){
			if(data != ''){
				var xdata = data.split(":");
				$("#" + fill).val(xdata[0]);
				$("#txtBranchName").val(xdata[1]);
			}
			else{
				alert('No information found');
				$("#" + fill).val('');
				$("#txtBranchName").val('');
			}
		});
	}
}

//login form submit
function validateLoginForm(){
	var bcon = true;
	if($("#username").val() == ''){
		alert("Email Required");
		$("#username").focus();
		bcon = false;
	}
	else if(!checkEmail('username')){
		bcon = false;
	}
	else if($("#password").val() == ''){
		alert("Please enter your password");
		$("#password").focus();
		bcon = false;
	}
	else if($("#ddlLoginType").val() == '-1'){
		alert("Please select login type");
		bcon = false;
	}
	else if($("#ddlBranch").val() == '-1'){
		alert("Please select Your Branch");
		bcon = false;
	}
	return bcon;
}

function checkEmail(txtEmail) {
    var email = document.getElementById(txtEmail);
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email.value)) {
   	 	alert($("#email_validate_text").val());
    	email.focus;
    	return false;
 	}
	return true;
}

function checkValidEmail(txtEmail) {
    var email = document.getElementById(txtEmail);
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email.value)) {
    	email.focus;
    	return false;
 	}
	return true;
}

function getDepartment(val){
	if(val != ''){
		if(val == '3'){
			$("#deplogin").show();
		}
		else{
			$("#deplogin").hide();
		}
	}
	else{
		alert('Select Login Type');
		$("#deplogin").hide();
	}
}

$(function () {
	$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
	  checkboxClass: 'icheckbox_minimal-blue',
	  radioClass: 'iradio_minimal-blue'
	});
});

var loadFile = function(event) {
	var output = document.getElementById('output');
	output.src = URL.createObjectURL(event.target.files[0]);
};

$(function () {
	$('.sakotable').dataTable({
	  "bPaginate": true,
	  "bLengthChange": true,
	  "bFilter": true,
	  "bSort": true,
	  "bInfo": false,
	  "bAutoWidth": false,
	  "dom": 'T<"clear">lfrtip',
        "tableTools": {
            "sSwfPath": gobal_url + "dist/swf/copy_csv_xls_pdf.swf",
			"aButtons": [
                //"print",
				//"csv",
				//"xls",
				//"pdf"
            ]
        }
	});
});

//get date and time
$(function() {
	$( ".datepicker" ).datepicker({format: 'dd/mm/yyyy', autoclose: true, todayHighlight: true});
});

//get print for windows
function printContent(area,title){
	$("#"+area).printThis({
		 pageTitle: title
	});
}

function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}
//get bed information with type and floor
function getfloor(val){
	if(val != ''){
		$.get("../ajax/getfloor.php?typeid=" + val , function(data, status){
			$("#floor_no").html(data);
		});
	}
	else{
		alert('Please select any type');
		$("#floor_no").html("");
		$("#floor_no").html("<option>--Select Floor--</option>");
	}
}

//get bed information with floor and room
function getRoom(val){
	if(val != ''){
		$.get("../ajax/getroom.php?floorid=" + val , function(data, status){
			//success
			$("#dllroom_no").html(data);
		});
	}
	else{
		alert('Please select any floor');
		$("#dllroom_no").html("");
		$("#dllroom_no").html("<option>--Select Room--</option>");
	}
}

//for floor and unit retrive
function getUnit(){
   var floor_no = $("#ddlFloorNo").val();
   if(floor_no != ''){
	   $.ajax({
		  url: '../ajax/getunit.php',
		  type: 'POST',
		  data: '&floor_no=' + floor_no + '&token=getunitinfo',
		  dataType: 'html',
		  success: function(data) {
			 if(data != '-99'){
			 	$("#ddlUnitNo").html(data);
			 }
			 else{
			 	window.location.href = '../index.php';
			 }
		  }
	   });
   }
}

//for floor and unit retrive
function getActiveUnit(floor_no){
   if(floor_no != ''){
	   $.ajax({
		  url: '../ajax/getunit.php',
		  type: 'POST',
		  data: '&floor_no=' + floor_no + '&token=getunitinforeport',
		  dataType: 'html',
		  success: function(data) {
			 if(data != '-99'){
			 	$("#ddlUnitNo").html(data);
			 }
			 else{
			 	window.location.href = '../index.php';
			 }
		  }
	   });
   }
}

//for floor and unit retrive
function getUnitReport(){
   var floor_no = $("#ddlFloorNo").val();
   if(floor_no != ''){
	   $.ajax({
		  url: '../ajax/getunit.php',
		  type: 'POST',
		  //data: 'category_type=' + category_type + '&cabin_type=' + cabin_type '&floor_type=' + floor_type + '&token=opu',
		  data: '&floor_no=' + floor_no + '&token=getunitinforeport',
		  dataType: 'html',
		  success: function(data) {
			 if(data != '-99'){
			 	$("#ddlUnitNo").html(data);
			 }
			 else{
			 	window.location.href = '../index.php';
			 }
		  }
	   });
   }
}

//for rent info
function getRentInfo(unit_id){
   var floor_no = $("#ddlFloorNo").val();
   if(floor_no != ''){
	   $.ajax({
		  url: '../ajax/getunit.php',
		  type: 'POST',
		  data: 'floor_id=' + floor_no + '&unit_id=' + unit_id + '&token=getRentInfo',
		  dataType: 'json',
		  success: function(data) {
			 if(data != '-99'){
			 	$("#txtRent").val(data.fair);
				$("#hdnFair").val(data.fair);
				$("#txtRentName").val(data.name);
				$("#hdnRentedId").val(data.rid);
				calculateFairTotal();
			 }
			 else{
			 	window.location.href = '../index.php';
			 }
		  }
	   });
   }
}

//update leave request status
function change_leave_status(status, leave_id){
   if(status != '' && leave_id != ''){
	   $.ajax({
		  url: '../ajax/getunit.php',
		  type: 'POST',
		  data: 'leave_id=' + leave_id + '&status=' + status + '&token=updateLeaveStatus',
		  dataType: 'json',
		  success: function(data) {
			 if(data != ''){
			 	alert(data.msg);
			 }
			 else{
			 	window.location.href = '../index.php';
			 }
		  }
	   });
   }
}

//for owner info
function getOwnerInfo(unit_id){
   if(unit_id != ''){
	   $.ajax({
		  url: '../ajax/getunit.php',
		  type: 'POST',
		  data: 'unit_id=' + unit_id + '&token=getOwnerInfo',
		  dataType: 'json',
		  success: function(data) {
			 if(data != '-99'){
				$("#txtOwnerName").val(data.name);
				$("#hdnOwnerdId").val(data.ownid);
				calculateFairTotal1();
			 }
			 else{
			 	window.location.href = '../index.php';
			 }
		  }
	   });
   }
}

//for employee designation info
function getDesgInfo(unit_id){
   var emp_name = $("#ddlEmpName").val();
   if(emp_name != ''){
	   $.ajax({
		  url: '../ajax/getunit.php',
		  type: 'POST',
		  data: 'emp_id=' + emp_name + '&token=getDesgInfo',
		  dataType: 'html',
		  success: function(data) {
			 if(data != '-99'){
			 	$("#txtEmpDesignation").val(data);
				$("#hdnDesg").val(data);
			 }
			 else{
			 	window.location.href = '../index.php';
			 }
		  }
	   });
   }
}

//get all employee data //ams
function getEmployeeData(unit_id){
   var emp_name = $("#ddlEmpName").val();
   if(emp_name != ''){
	   $.ajax({
		  url: '../ajax/getunit.php',
		  type: 'POST',
		  data: 'emp_id=' + emp_name + '&token=getDesgInfoWithAll',
		  dataType: 'JSON',
		  success: function(response) {
			 if(response.data != ''){
			 	$("#txtEmpDesignation").val(response.data.member_type);
				$("#txtEmpAmount").val(response.data.salary);
				$("#hdnDesg").val(response.data.member_type);
			 }
			 else{
			 	window.location.href = '../index.php';
			 }
		  }
	   });
   }
}

//for total fair collection
function calculateFairTotal(){
	var box_1 = 0.00;
	var box_2 = 0.00;
	var box_3 = 0.00;
	var box_4 = 0.00;
	var box_5 = 0.00;
	var box_6 = 0.00;
	var box_7 = 0.00;
	if($("#txtRent").val() != ''){
		box_1 = parseFloat($("#txtRent").val());
	}
	if($("#txtWaterBill").val() != ''){
		box_2 = parseFloat($("#txtWaterBill").val());
	}
	if($("#txtElectricBill").val() != ''){
		box_3 = parseFloat($("#txtElectricBill").val());
	}
	if($("#txtGasBill").val() != ''){
		box_4 = parseFloat($("#txtGasBill").val());
	}
	if($("#txtSecurityBill").val() != ''){
		box_5 = parseFloat($("#txtSecurityBill").val());
	}
	if($("#txtUtilityBill").val() != ''){
		box_6 = parseFloat($("#txtUtilityBill").val());
	}
	if($("#txtOtherBill").val() != ''){
		box_7 = parseFloat($("#txtOtherBill").val());
	}
	var total = parseFloat(box_1 + box_2 + box_3 + box_4 + box_5 + box_6 + box_7);
	total = total.toFixed(2);
	$("#txtTotalRent").val(total);
	$("#hdnTotal").val(total);
}
//for total Owner Utility collection
function calculateFairTotal1(){
	var box_2 = 0.00;
	var box_3 = 0.00;
	var box_4 = 0.00;
	var box_5 = 0.00;
	var box_6 = 0.00;
	var box_7 = 0.00;
	if($("#txtWaterBill").val() != ''){
		box_2 = parseFloat($("#txtWaterBill").val());
	}
	if($("#txtElectricBill").val() != ''){
		box_3 = parseFloat($("#txtElectricBill").val());
	}
	if($("#txtGasBill").val() != ''){
		box_4 = parseFloat($("#txtGasBill").val());
	}
	if($("#txtSecurityBill").val() != ''){
		box_5 = parseFloat($("#txtSecurityBill").val());
	}
	if($("#txtUtilityBill").val() != ''){
		box_6 = parseFloat($("#txtUtilityBill").val());
	}
	if($("#txtOtherBill").val() != ''){
		box_7 = parseFloat($("#txtOtherBill").val());
	}
	var total = parseFloat(box_2 + box_3 + box_4 + box_5 + box_6 + box_7);
	total = total.toFixed(2);
	$("#txtTotalRent").val(total);
	$("#hdnTotal").val(total);
}

function set_language(obj) {
	var _lang_code = jQuery(obj).attr('lang');
	delete_cookie('ams_lang_code');
	setCookie('ams_lang_code',_lang_code,3);
	window.location.reload();
}
function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires="+ d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
var delete_cookie = function(name) {
    document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
};

function setBranch(branch_id){
	delete_cookie('ams_branch_code');
	setCookie('ams_branch_code', branch_id, 3);
	window.location.reload();
}