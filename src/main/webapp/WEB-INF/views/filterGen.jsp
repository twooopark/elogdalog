<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<style>
.bucket {
    width: 200px;
    height: 30px;
    padding: 10px;
    border: 1px solid #aaaaaa;
}
.item {
    padding: 10px;
    border: 1px solid #aaaaaa;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
<form id="frm" action="/filterGen">
  File name:<br>
  <input type="text" id="filename" style="width:400px" value="devweb_dev-admin.ppurio.com_access_18010211.log">
  <br>
  Log data:<br>
  <input type="text" id="logdata" style="width:400px" value="[ppurio30  ] jiny|11:42:35|172.21.25.180|PAMenu.qri|main|">
  <br><br>
  <input id="regSplitBtn" type="button" onclick="inputIsEmpty()" value="텍스트 분할"/>
</form> 

<p>구분자 : [ ] _ | ^ , . : - 에 따라 자동 분할됩니다. 구분자 수정 가능하게 할 예정</p>

<div ondrop="drop(event)" ondragover="allowDrop(event)">
	<div id="filenameItems" style="height:50px"></div>
	<div id="logdataItems" style="height:50px"></div>
</div>

<form id="makeFilterForm" action="/makeFilterCtrl">
<table class="table">
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">항목</th>
      <th scope="col">필드</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">
		<div id="server" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	  </th>
      <td>서버 명</td>
      <td>server</td>
    </tr>
    <tr>
      <th scope="row">
		<div id="service" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	  </th>
      <td>서비스 명</td>
      <td>service</td>
    </tr>
    <tr>
      <th scope="row">
		<div id="accessDate" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	  </th>
      <td>접근 일시</td>
      <td>access_date</td>
    </tr>
    <tr>
      <th scope="row">
		<div id="accessIp" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	  </th>
      <td>접근 IP</td>
      <td>access_ip</td>
    </tr>
    <tr>
      <th scope="row">
		<div id="accessId" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	  </th>
      <td>접근 ID</td>
      <td>access_id</td>
    </tr>
    <tr>
      <th scope="row">
		<div id="accessUri" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	  </th>
      <td>URI</td>
      <td>access_uri</td>
    </tr>
    <tr>
      <th scope="row">
		<div id="action" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	  </th>
      <td>동작</td>
      <td>action</td>
    </tr>
    <tr>
      <th scope="row">
		<div id="remark" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	  </th>
      <td>상세정보</td>
      <td>remark</td>
    </tr>
    <tr>
      <td><input id="makeFilterBtn" type="button" onclick="makeFilter()" value="필터 생성 및 등록"></td>
    </tr>
  </tbody>
</table>
</form>

<script>

//구분자 정규식
var regSep = /[\-\_\^\.\s\[\]\|\:]+/;
var regSepR = /[^\-\_\^\.\s\[\]\|\:]+/;
var fieldName = ["server","service","accessDate","accessIp","accessId","accessUri","action","remark"];
var jsonData;

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}


function inputIsEmpty(){
	var filenameStr = document.getElementById("filename").value;
	var logdataStr = document.getElementById("logdata").value;

	//Items > span 초기화
	document.getElementById("filenameItems").innerHTML = "";
	document.getElementById("logdataItems").innerHTML = "";
	
	if(filenameStr.length > 0)
		splitInputSep("filename");
	if(logdataStr.length > 0)
		splitInputSep("logdata");
}

//구분자에 따라 입력받은 파일명과 로그데이터를 나눈다.
function splitInputSep(inputId){
	//입력한 파일명, 로그데이터
	var inputStr = document.getElementById(inputId).value;
	//구분자에 따라 분할
	var inputItems = inputStr.split(regSep);
	
	//구분자로 시작하는 경우, 공란이 생긴다. 제거
	if(inputItems[0]=="")
		inputItems.shift();
	
	//드래그할 item 생성
	for (item in inputItems){
	    var txt = "<span id=\""+inputId+"Item"+item+"\" class=\"item\" draggable=\"true\" ondragstart=\"drag(event)\">"+inputItems[item]+"</span>";
	    document.getElementById(inputId+"Items").innerHTML += txt;
	}
	
	if(inputItems.length > 1)
		var inputSep = extSep(inputId, inputStr, inputItems);
}

//extract seperator, 구분자 정보를 순서대로 추출하여, 필터를 생성할 때 사용한다.
function extSep(inputId, inputStr, inputItems){
	var Items = inputStr.split(regSepR);
	var result = "";
	for (item in Items){
		//
		console.log(inputId+" item["+item+"] : "+Items[item]+", "+inputItems[item]);
		result += Items[item]+inputItems[item];
	}
	console.log("result : "+result);
	
}
/*
최종적으로 만들어야 할 필터 양식...
filename >>
SEP = /[^\-\_\^\.\s\[\]\|\:]+/;
%{SEP:server}\_%{SEP}\-%{SEP}\.%{SEP:service}\.%{SEP}\_%{SEP}\_%{SEP:day1}\.%{SEP:filetype}

1. 구분자에 따라 \X%{WORD2}를 item 수 만큼 String 배열로 만든다.
2. 첫 구분자 유무에 따라 첫 배열의 \X를 제거한다.
3. 그리고 필드에 추가된 item은 배열에서 찾아 %{WORD2}에서 %{WORD2:필드명}으로 바꾼다.
	Date >> %{DATENUM2:access_date}
	IP >> %{IPORHOST:access_ip}
	id >> %{USER:access_id}
	uri, action, remark>> %{DATA:~}
4. 가장 마지막에 "$"을 추가해야, 마지막에 있는 값이 제대로 들어간다.	 

수정 >>
정규식으로 구분자, 구분자 아님을 구분만 하도록 변경함.
noSep [^\-\_\^\.\s\[\]\|\:]+
Sep [\-\_\^\.\s\[\]\|\:]+
%{Sep}?%{noSep:server}%{Sep}%{noSep}%{Sep}%{noSep}%{Sep}%{noSep:service}%{Sep}%{noSep}%{Sep}%{noSep}%{Sep}%{noSep:day1}%{Sep}%{noSep:filetype}$
맨 처음엔 구분자 없을수도 있어서 ?로 함.
		
아직 날짜는 어떻게 처리할지 모르겠음. ㅎㅎ; 너무 어렵다...
1. items의 갯수 파악(n개). 양쪽에 구분자 없는 경우, n-1개로 처리해야함
2. items를 하나씩 확인한다...(?)

		
		
 */
function makeFilter(){
	for (fn in fieldName){
		//fieldData = document.getElementById(fieldName[fn]).innerText;
		
	}
	/*
	$.ajax({
	    url:"filterGenForm",
	    type:'GET',
	    data: jsonData,
	    success:function(data){
	        alert("완료!");
	        window.opener.location.reload();
	        self.close();
	    },
	    error:function(jqXHR, textStatus, errorThrown){
	        alert("에러\n" + textStatus + " : " + errorThrown);
	        self.close();
	    }
	});
	*/
}

// ["", "ppurio30", "jiny", "11", "42", "35", "172", "21", "25", "180", "PAMenu", "qri", "main", ""]
/*
//구분자에 따라 입력받은 파일명과 로그데이터를 나눈다.
function splitInputSep_old(){
	//입력한 파일명, 로그데이터
	var filenameStr = document.getElementById("filename").value;
	var logdataStr = document.getElementById("logdata").value;

	//구분자에 따라 분할
	var filenameItems = filenameStr.split(regSep);
	//Items > span 초기화
	document.getElementById("filenameItems").innerHTML = "";
	//드래그할 item 생성
	for (item in filenameItems){
	    var txt = "<span id=\"filenameItem"+item+"\" class=\"item\" draggable=\"true\" ondragstart=\"drag(event)\">"+filenameItems[item]+"</span>";
	    document.getElementById("filenameItems").innerHTML += txt;
	}

	//구분자에 따라 분할
	var logdataItems = logdataStr.split(regSep)
	//Items > span 초기화
	document.getElementById("logdataItems").innerHTML = "";
	for (item in logdataItems){
	    var txt = "<span id=\"logdataItem"+item+"\" class=\"item\" draggable=\"true\" ondragstart=\"drag(event)\">"+logdataItems[item]+"</span>";
	    document.getElementById("logdataItems").innerHTML += txt;
	}
	
	//extract seperator
	if(filenameItems.length > 1)
		var filenameSep = extSep(filenameStr);
	if(logdataItems.length > 1)
		var logdataSep = extSep(logdataStr);
	
}
 */
</script>
</body>
</html>
