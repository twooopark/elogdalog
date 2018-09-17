function initConfig(){
	makeWeekSelectOptions();

	/*기간 정하기 최초 설정.*/
	var $datepicker = $("#mydatepicker");
	$datepicker.datepicker(config.week);

	/*선택된 라디오 버튼에 따라 다르게 나타나는 널짜 선택 칸*/
	$(".pick_type_radio").click(function(){
		if($(this).attr('id')=='week'){
			$("#pick_type_week").show();
			$("#pick_type_choice").hide();
		}else{
			$("#pick_type_week").hide();
			$("#pick_type_choice").show();
		}
	})
}
	
