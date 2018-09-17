/*주차별 날짜 선택 AREA*/
function makeWeekSelectOptions() {
    var year = $("#w_year").val();
    var month = $("#w_month").val();
 
    var today = new Date();
	
	/*선택된 연,월의 1일에 해당 하는 날짜 생성*/ 
    var sdate = new Date(year, month-1, 01);

    /*해당 월의 마지막 날짜 ex) 1월-31 2월-28or29 3월-31 ...*/
    var lastDay = (new Date(sdate.getFullYear(), sdate.getMonth()+1, 0)).getDate();

    /*선택된 연,월에 해당하는 마지막 일*/
    var endDate = new Date(sdate.getFullYear(), sdate.getMonth(), lastDay);

    /*1일에 해당하는 요일*/
    var week = sdate.getDay();
    
    /*해당 월의 첫 시작일(월요일) 구하기 */
    sdate.setDate(sdate.getDate() - week + 1);

    var edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());

    var obj = document.getElementById("w_week");
    obj.options.length = 0;
    var seled = "";

    while(endDate.getTime() >= edate.getTime()) {
 
        var sYear = sdate.getFullYear();
        var sMonth = (sdate.getMonth()+1);
        var sDay = sdate.getDate();
 
        sMonth = (sMonth < 10) ? "0"+sMonth : sMonth;
        sDay = (sDay < 10) ? "0"+sDay : sDay;
 
        var stxt = sYear + "-" + sMonth + "-" + sDay;
 		
 		/*일요일 구하기*/
        edate.setDate(sdate.getDate() + 6);
 
        var eYear = edate.getFullYear();
        var eMonth = (edate.getMonth()+1);
        var eDay = edate.getDate();
 
        eMonth = (eMonth < 10) ? "0"+eMonth : eMonth;
        eDay = (eDay < 10) ? "0"+eDay : eDay;
 
        var etxt = eYear + "-" + eMonth + "-" + eDay;
 
        if(today.getTime() >= sdate.getTime() && today.getTime() <= edate.getTime()) {
            seled = stxt+"|"+etxt;
        }
 
        obj.options[obj.options.length] = new Option(stxt+"~"+etxt, stxt+"|"+etxt);
 
        sdate = new Date(edate.getFullYear(), edate.getMonth(), edate.getDate() + 1);
        edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
    }
    if(seled) obj.value = seled;
}
/*주차별 날짜 선택 AREA - END*/