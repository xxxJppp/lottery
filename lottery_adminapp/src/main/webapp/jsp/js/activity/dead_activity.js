$(document).ready(function() {
	var ue = UE.getEditor('editor');
	ue.addListener("ready", function () {
        ue.setContent($("#content").val());
	});
	$("#dead_user_menu").addClass("active");
});