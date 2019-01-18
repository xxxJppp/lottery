$(document).ready(function() {
	var ue = UE.getEditor('editor');
	ue.addListener("ready", function () {
        ue.setContent($("#summary").val());
	});
	var ss=$("#activityType").val();
	if(ss!="NO"){
		if(ss=="FRC"){
			$("#frist_recharge_menu").addClass("active");
		}
		if(ss=="REG"){
			$("#reg_menu").addClass("active");
		}
		if(ss=="TRC" || ss=="BET" || ss=="AWA"){
			$("#bet_menu").addClass("active");
		}
	}else{
		$("#reg_menu").addClass("active");
	}
	$("#startTime").bind("click",function(){
		WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d'});
	});
	$("#endTime").bind("click",function(){
		WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d'});
	});
	$("#regStartTime").bind("click",function(){
		WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});
	});
	$("#regEndTime").bind("click",function(){
		WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});
	});
	 $.checkFrom.initBind(".checkedAttr", true, true,true);
	 
	 $("#updateActivity").on('click',function(){
		 regActivity.updateActivity(this);
	});
});

var regActivity = function(){
	
	return {
		updateActivity:function(obj){
			var check = $.checkFrom.checkAllType("#updatesActivity");
			if(!check){
				return;
			}
			
			var attrs = new Array();
			var vals = new Array();
			$("#updatesActivity").find("input[type='text']").each(function(){
				var name = $(this).attr("name");
				var val = $(this).val();
				if(name=="regStartTime"||name=="regEndTime"||name=="ativityMoney"){
					attrs.push("registerTempl."+name);
					vals.push(val);
				}else if(name!="summary"){
					attrs.push(name);
					vals.push(val);
				}
				
			});
			
			attrs.push("model");
			var model = $("#awardType").val();
			vals.push(model);
			
			attrs.push("sourceType");
			var sourceType = $("#sourceType").val();
			vals.push(sourceType);
			
			attrs.push("type");
			vals.push("REG");
			
			var ue = UE.getEditor('editor');
			var content = ue.getContent();
			attrs.push("summary");
			vals.push(content);
			
			attrs.push("id");
			var id = $("#id").val();
			vals.push(id);
			
			console.info(vals);
			formPost.submitAjaxForm("activity/addUpeRegTempl.do",attrs,vals,this.updateSuccess);
		},
		updateSuccess:function(data){
			var info= data.success;
			formPost.showErrorMessage(info);
		}
	};
}();