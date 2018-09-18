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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

/*
grok-patterns:
	noSep [^\-\_\^\.\s\[\]\|\:]+
	Sep [\-\_\^\.\s\[\]\|\:]+

filter example:
	%{Sep}?%{noSep:server}%{Sep}%{noSep}%{Sep}%{noSep}%{Sep}%{noSep:service}%{Sep}%{noSep}%{Sep}%{noSep}%{Sep}%{noSep:day1}%{Sep}%{noSep:filetype}$
*/

//구분자 정규식
var regSep = /[\-\_\^\.\s\[\]\|\:]+/;
var regSepR = /[^\-\_\^\.\s\[\]\|\:]+/;

var fieldName = ["server","service","accessDate","accessIp","accessId","accessUri","action","remark"];
var fieldDatas = {};

var jsonData = {};
//jsonData.keys(fieldName);


//extract seperator, 구분자 정보를 순서대로 추출하여, 필터를 생성할 때 사용한다.
function extSep(inputId, inputStr, inputItems){
	var Items = inputStr.split(regSepR);
	var result = "";
	for (item in Items){
		//console.log(inputId+" item["+item+"] : "+Items[item]+", "+inputItems[item]);
		result += Items[item]+inputItems[item];
	}
	//console.log("result : "+result);
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
	/* 	
	//추후에 필드 데이터들이 IP인지 판별하는 작업 등에 쓰일 듯(구분자와 데이터를 사용하여)
	if(inputItems.length > 1)
		var inputSep = extSep(inputId, inputStr, inputItems);
	*/
}

//텍스트 분할 클릭 시 실행
function inputIsEmpty(){
	var filenameStr = document.getElementById("filename").value;
	var logdataStr = document.getElementById("logdata").value;
	
 	//Items > span init
	document.getElementById("filenameItems").innerHTML = "";
	document.getElementById("logdataItems").innerHTML = "";
	//bucket > span init
	var divBuckets = document.getElementsByClassName("bucket");
	for (bucket in divBuckets)
		divBuckets[bucket].innerHTML="";
	
	if(filenameStr.length > 0)
		splitInputSep("filename");
	if(logdataStr.length > 0)
		splitInputSep("logdata");
}

//필드 데이터가 한 개인 경우
function singleFd(){
	var fdInfo = fieldDatas[fn][0];
	if(typeof fdInfo != "undefined"){
		jsonData[fieldName[fn]] = fdInfo.id;
	}	
}

//필드 데이터가 여러개인 경우(Object, String)
function multipleFd(fn){
	var jsonList = "";
	for (fd in fieldDatas[fn]){
		var fdInfo = fieldDatas[fn][fd].id;
		if(typeof fdInfo != "undefined"){
			jsonList += fdInfo+",";
		}
	}
	if(jsonList != "")
		jsonData[fieldName[fn]] = jsonList.slice(0,-1);
}

/*
//필드 데이터가 여러개인 경우(List Object)
function multipleFd(fn){
	var fList = {};
	var lList = {};
	var jsonList = [];
	//jsonList.keys("filename","logdata");
	for (fd in fieldDatas[fn]){
		var fdInfo = fieldDatas[fn][fd].id;
		if(typeof fdInfo != "undefined"){
			//filenameItem3 >> filenameItem , 3 split
			var fdInfoDoc = fdInfo.replace(/[0-9]+/g,"");
			var fdInfoSeq = fdInfo.replace(/[^0-9]+/g,"");
			if(fdInfoDoc == "filenameItem"){
				fList[fdInfoDoc] = fdInfoSeq;
				jsonList.push(fList);
			}
			else{
				lList[fdInfoDoc] = fdInfoSeq;
				jsonList.push(lList);
				
			}
		}
	}
	jsonData[fieldName[fn]] = jsonList;
	console.log(jsonData);
}
*/
/*
//필드 데이터가 여러개인 경우 (Object : List)
function multipleFd(fn){
	var fList = [];
	var lList = [];
	var jsonList = {};
	//jsonList.keys("filename","logdata");
	for (fd in fieldDatas[fn]){
		var fdInfo = fieldDatas[fn][fd].id;
		if(typeof fdInfo != "undefined"){
			//filenameItem3 >> filenameItem , 3 split
			var fdInfoDoc = fdInfo.replace(/[0-9]+/g,"");
			var fdInfoSeq = fdInfo.replace(/[^0-9]+/g,"");
			
			if(fdInfoDoc == "filenameItem"){
				fList.push(fdInfoSeq);
				jsonList[fdInfoDoc] = fList;
			}
			else{
				lList.push(fdInfoSeq);
				jsonList[fdInfoDoc] = lList;
			}
		}
	}
	jsonData[fieldName[fn]] = jsonList;
} 
*/
//필터 생성 시 실행
function makeFilter(){
	//각 필드마다 드랍된 필드 데이터에 대한 정보를 읽는다. (필터 생성에 필요함)
	//필드 데이터들의 태그 id를 읽어,
	//각 데이터들이 어떤 문자열인지와 순서, 어떤 필드를 나타내는지 알아낸다.
	for (fn in fieldName){
		fieldDatas[fn] = document.getElementById(fieldName[fn]).children;
		
	 	//if(fieldName[fn] == "accessDate" || fieldName[fn] == "accessIp" || fieldName[fn] == "accessUri")
	 		multipleFd(fn);
	 	//else 
	 	//	singleFd();
	}
	//send json
	jsonAjax();
}

function jsonAjax(){
/*	
 	jsonData =
 		{
 			"server": {
 				"filenameItem": ["0"]
 			},
 			"service": {
 				"filenameItem": ["3"]
 			},
 			"accessDate": {
 				"filenameItem": ["6"],
 				"logdataItem": ["3", "4"]
 			},
 			"accessIp": {
 				"logdataItem": ["5", "6", "7", "8"]
 			},
 			"accessId": {
 				"logdataItem": ["1"]
 			},
 			"accessUri": {
 				"logdataItem": ["9", "10"]
 			},
 			"action": {
 				"logdataItem": ["11"]
 			},
 			"remark": {}
 		}
*/
/*
	jsonData =
		{
		  "server": [
		    {
		      "filenameItem": "0"
		    }
		  ],
		  "service": [
		    {
		      "filenameItem": "3"
		    }
		  ],
		  "accessDate": [
		    {
		      "filenameItem": "6"
		    },
		    {
		      "logdataItem": "4"
		    }
		  ],
		  "accessIp": [
		    {
		      "logdataItem": "8"
		    },
		    {
		      "logdataItem": "8"
		    },
		    {
		      "logdataItem": "8"
		    },
		    {
		      "logdataItem": "8"
		    }
		  ],
		  "accessId": [
		    {
		      "logdataItem": "1"
		    }
		  ],
		  "accessUri": [
		    {
		      "logdataItem": "10"
		    },
		    {
		      "logdataItem": "10"
		    }
		  ],
		  "action": [
		    {
		      "logdataItem": "11"
		    }
		  ],
		  "remark": [
		    {
		      "logdataItem": "12"
		    }
		  ]
		}
*/	
/* 	jsonData = {
			"server":"server",
			"service":"service",
			"accessDate":"accessDate",
			"accessIp":"accessIp",
			"accessId":"accessId",
			"accessUri":"accessUri",
			"action":"action",
			"remark":"remark"
			}
 */	
	$.ajax({
	    url:"filterGenForm",
	    type:'POST',
// 	  	dataType:'json',
	    data:jsonData,
	    success:function(data){
	    	alert(data);
	        alert("완료!");
	    },
	    error:function(err){
	        alert("실패");
	    }
	});
}

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
/*
//구분자에 따라 입력받은 파일명과 로그데이터를 나눈다.
function splitInputSep(){
	//입력한 파일명, 로그데이터
	var filename_str = document.getElementById("filename").value;
	var logdata_str = document.getElementById("logdata").value;

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
*/
</script>
</body>
</html>
