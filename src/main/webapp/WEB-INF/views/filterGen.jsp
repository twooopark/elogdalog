<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>테이블에 동적으로 td 추가 /삭제 하기</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#btnAddRow").on("click",function() {
                // clone
                $.tdClone = $("#memberTable td:last").clone().html();
                $.newtd = $("<td>"+$.tdClone+"</td>");
 
                // append
                $("#memberTable").append($.newtd);
 
                // delete Button 추가
                $.btnDelete = $(document.createElement("input"));
                $.btnDelete.attr({
                    name : "btnRemove",
                    type : "button" ,
                    value : "삭제"
                });
                $("#memberTable td:last tr:last").html("");
                $("#memberTable td:last tr:last").append($.btnDelete);
 
                // 버튼에 클릭 이벤트 추가
                $("#memberTable td>tr:last>input[type='button']").on('click', function(){
                    $(this).parent().parent().remove();
                });
            });
 
            // 초기화
            $("#tableReset").on("click",function(){ 
                $("#frmTest").each(function(){ this.reset(); });
 
                $("input[name='btnRemove']").each(function () {
                    $(this).trigger('click');
                });
            });
        });
    </script>
</head>
 
<body >﻿
<div style="width:500px;text-align:right;">
    <input type="button" value="행추가"  id="btnAddRow" />
    <input type="button" value="reset" id="tableReset"/>
</div>
 
 
<form method="post" id="frmTest">
<table id="memberTable" border="1" style="width:500px;">
    <tr>
        <td><input type="text" id="fullName" /></td>
        <td><input type="text" id="age"  /></td>
        <td><input type="text" id="addr" /></td>
        <td style="width:50px;"></td>
    </tr>
</table>
</form>
</body>
</html>