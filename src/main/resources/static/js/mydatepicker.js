/**
 * 날짜 입력 UI
 */
var monday = getMonday(new Date());

		var config={	
		  	// 주 설정
		  	week : {
		  		range:true,
		  		todayButton:true,
		  		multipleDatesSeparator:" ~ ",
		  		inline: false,
			    autoClose: true,
			    toggleSelected: false,
			    language: "en",
			    view: "days",
			    minView: "days",
			    dateFormat: "yyyy-mm-dd",
			    onSelect: function (formattedDate, date, inst) {
			    	// $("#result").html(formattedDate);
			    	parseDate(formattedDate);
   		 		}
		  	}
		}

		/*최초 설정입니다.*/
		var $datepicker = $("#mydatepicker");
			$datepicker.datepicker(config.week);

		/* Set the default selected time */
		// $datepicker.data('datepicker').selectDate(new Date());

		/* 해당 주차의 월요일을 구합니다.*/
		function getMonday(today){
			// console.log(today);
		}

		/* 시작일 ~ 마지막일 각각의 년/월/일을 구하기 위한 함수입니다*/
		function parseDate(rangeDate){
			console.log("TODAY : " + rangeDate);
			var startDate = (rangeDate.split("~")[0]).trim();
			var endDate = (rangeDate.split("~")[1]).trim();

			var startY = startDate.split("-")[0];
			var startM = startDate.split("-")[1];
			var startD = startDate.split("-")[2];

			var endY = endDate.split("-")[0];
			var endM = endDate.split("-")[1];
			var endD = endDate.split("-")[2];

			console.log(startY + " " + startM + " " + startD);
			console.log(endY + " " + endM + " " + endD);
		}