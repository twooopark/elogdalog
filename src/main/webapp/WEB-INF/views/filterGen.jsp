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
  <input type="text" id="filenameInput" style="width:400px" value="devweb_dev-admin.ppurio.com_access_18010211.log">
  <br>
  Log data:<br>
  <input type="text" id="logdataInput" style="width:400px" value="[ppurio30  ] jiny|11:42:35|172.21.25.180|PAMenu.qri|main|">
  <br><br>
  <input id="regSplitBtn" type="button" onclick="splitInputSep()" value="텍스트 분할">
</form> 

<p>구분자 : [ ] _ | ^ , . : - 에 따라 자동 분할됩니다. 구분자 수정 가능하게 할 예정</p>

<div ondrop="drop(event)" ondragover="allowDrop(event)">
	<div id="filenameItems" style="height:50px"></div>
	<div id="logdataItems" style="height:50px"></div>
</div>

<form action="/filterGenForm" id="filterGenForm">
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
		<div id="access_date" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	  </th>
      <td>접근 일시</td>
      <td>access_date</td>
    </tr>
    <tr>
      <th scope="row">
		<div id="access_ip" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	  </th>
      <td>접근 IP</td>
      <td>access_ip</td>
    </tr>
    <tr>
      <th scope="row">
		<div id="access_id" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	  </th>
      <td>접근 ID</td>
      <td>access_id</td>
    </tr>
    <tr>
      <th scope="row">
		<div id="access_uri" class="bucket" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
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

//구분자 정규식
var reg = /[-_^\.\s\[\]\|\:]+/;

//구분자에 따라 입력받은 파일명과 로그데이터를 나눈다.
function splitInputSep(){
	//입력한 파일명, 로그데이터
	var filename_str = document.getElementById("filenameInput").value;
	var logdata_str = document.getElementById("logdataInput").value;

	//구분자에 따라 분할
	var filename_items = filename_str.split(reg);
	//Items > span 초기화
	document.getElementById("filenameItems").innerHTML = "";
	//드래그할 item 생성
	for (item in filename_items){
	    var txt = "<span id=\"filenameItem"+item+"\" class=\"item\" draggable=\"true\" ondragstart=\"drag(event)\">"+filename_items[item]+"</span>";
	    document.getElementById("filenameItems").innerHTML += txt;
	}

	//구분자에 따라 분할
	var logdata_items = logdata_str.split(reg)
	//Items > span 초기화
	document.getElementById("logdataItems").innerHTML = "";
	for (item in logdata_items){
	    var txt = "<span id=\"logdataItem"+item+"\" class=\"item\" draggable=\"true\" ondragstart=\"drag(event)\">"+logdata_items[item]+"</span>";
	    document.getElementById("logdataItems").innerHTML += txt;
	}
	
	//extract seperator
	extSep();
	
}

//구분자 정보를 순서대로 추출하여, 필터를 생성할 때 사용한다.
function extSep(){
	
}

function makeFilter(){
	console.log($("#server > span").text());
	
	
	$("#filterGenForm").submit();
}
// ["", "ppurio30", "jiny", "11", "42", "35", "172", "21", "25", "180", "PAMenu", "qri", "main", ""]
</script>
</body>
</html>
