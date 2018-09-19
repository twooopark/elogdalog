<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
.bucket {
	height: 30px;
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


<script>

//구분자 정규식
var regSep = /[\-\_\^\.\s\[\]\|\:]+/;
var regSepR = /[^\-\_\^\.\s\[\]\|\:]+/;
var fieldName = ["server","service","accessDate","accessIp","accessId","accessUri","action","remark"];


	<div class="container theme-showcase" role="main">
		<div class="jumbotron">
			<h1>Logstash Filter Generator</h1>
			<p>파일명, 로그데이터</p>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">파일명, 로그데이터를 구분자로 분할</div>
			<div class="panel-body">
				<form id="frm" action="/filterGen">
					<div class="form-group col-md-6">
						<label>로그 파일명</label> <input type="text" id="filename"
							class="form-control"
							value="devweb_devweb.dcsms.co.kr_access_18081615.log">
					</div>
					<div class="form-group col-md-6">
						<label>파일명 구분자</label> <input type="text" id="filenameSep"
							class="form-control" value="[\_\.\[\]]+">
					</div>
					<div class="form-group col-md-6">
						<label>로그 데이터</label> <input type="text" id="logdata"
							class="form-control"
							value="[2018-08-16 15:57:51] jwmoon|172.21.25.207|/synergy/content/callerbook/limit_list">
					</div>
					<div class="form-group col-md-6">
						<label>로그 데이터 구분자</label> <input type="text" id="logdataSep"
							class="form-control" value="[\^\s\[\]\|]+">
					</div>
					<button id="regSplitBtn" class="btn btn-primary" type="button"
						onclick="startFilterGen()">텍스트 분할</button>
				</form>
			</div>
		</div>

		<div class="panel panel-primary">
			<div class="panel-heading">분할된 항목들 > 필드 데이터 (drag & drop)</div>
			<div class="panel-body">
				<div ondrop="drop(event)" ondragover="allowDrop(event)">
					<div id="filenameItems" style="height: 50px"></div>
					<div id="logdataItems" style="height: 50px"></div>
				</div>
			</div>
		</div>

		<div class="panel panel-primary">
			<div class="panel-heading">필드 데이터, 필드명과 매핑하여 필터 자동 생성</div>
			<div class="panel-body">
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th scope="col" width="60%">필드 데이터</th>
							<th scope="col">항목</th>
							<th scope="col">필드</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">
								<div id="server" class="bucket" ondrop="drop(event)"
									ondragover="allowDrop(event)"></div>
							</th>
							<td>서버 명</td>
							<td>server</td>
						</tr>
						<tr>
							<th scope="row">
								<div id="service" class="bucket" ondrop="drop(event)"
									ondragover="allowDrop(event)"></div>
							</th>
							<td>서비스 명</td>
							<td>service</td>
						</tr>
						<tr>
							<th scope="row">
								<div id="access_date" class="bucket" ondrop="drop(event)"
									ondragover="allowDrop(event)"></div>
							</th>
							<td>접근 일시</td>
							<td>access_date</td>
						</tr>
						<tr>
							<th scope="row">
								<div id="access_ip" class="bucket" ondrop="drop(event)"
									ondragover="allowDrop(event)"></div>
							</th>
							<td>접근 IP</td>
							<td>access_ip</td>
						</tr>
						<tr>
							<th scope="row">
								<div id="access_id" class="bucket" ondrop="drop(event)"
									ondragover="allowDrop(event)"></div>
							</th>
							<td>접근 ID</td>
							<td>access_id</td>
						</tr>
						<tr>
							<th scope="row">
								<div id="access_uri" class="bucket" ondrop="drop(event)"
									ondragover="allowDrop(event)"></div>
							</th>
							<td>URI</td>
							<td>access_uri</td>
						</tr>
						<tr>
							<th scope="row">
								<div id="action" class="bucket" ondrop="drop(event)"
									ondragover="allowDrop(event)"></div>
							</th>
							<td>동작</td>
							<td>action</td>
						</tr>
						<tr>
							<th scope="row">
								<div id="remark" class="bucket" ondrop="drop(event)"
									ondragover="allowDrop(event)"></div>
							</th>
							<td>상세정보</td>
							<td>remark</td>
						</tr>
					</tbody>
				</table>
				<button id="makeFilterBtn" class="btn btn-primary" type="button"
					onclick="makeFilter()">필터 생성</button>

			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>

/*
grok regex patterns example:
	noSep [^\-\_\^\.\s\[\]\|\:]+
	Sep [\-\_\^\.\s\[\]\|\:]+

filter example:
	%{Sep}?%{noSep:server}%{Sep}%{noSep}%{Sep}%{noSep}%{Sep}%{noSep:service}%{Sep}%{noSep}%{Sep}%{noSep}%{Sep}%{noSep:day1}%{Sep}%{noSep:filetype}$
*/

//구분자 정규식(regSepUpdate())
var regSep;
var regSepInv;
//var regIP = /((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})/g;

//필드명, 필드데이터
var fieldName = ["server","service","access_date","access_ip","access_id","access_uri","action","remark"];
var fieldDatas = {};

// fd,ldStr들이 담길 배열(Item갯수만큼 만들어 놓고 내용을 수정하는 방식으로 할 것) 
var fnList = [];
var ldList = [];

var fnCount;
var ldCount;

//ajax로 보낼 데이터
var jsonData = {};

/*
//extract seperator, 구분자 정보를 순서대로 추출하여, 필터를 생성할 때 사용한다.
function extSep(inputId, inputStr, inputItems){
	var Items;
	if(inputId == "filename")
		Items = inputStr.split(regSepFR);
	else
		Items = inputStr.split(regSepLR);
	
	var result = "";
	for (item in Items){
		//console.log(inputId+" item["+item+"] : "+Items[item]+", "+inputItems[item]);
		result += Items[item]+inputItems[item];
	}
	//console.log("result : "+result);
}
*/

function regSepUpdate(inputId){
	reg = document.getElementById(inputId+"Sep").value;
	regSep = new RegExp(reg);
	regSepInv = new RegExp(reg.replace("/[","/[^"));
}

function outputStrInitialize(){
	//로그 스태시에 들어갈 기본 형태(1Item, 1Str 필요)
	var fnStr = "%{fnSep}%{fnSepInv}";
	var ldStr = "%{ldSep}%{ldSepInv}";

	//init
	fnList = [];
	ldList = [];
	
	//생성된 Item 갯수
	for (var i=0; i<fnCount; i++)
		fnList.push(fnStr);
	for (var i=0; i<ldCount; i++)		
		ldList.push(ldStr);
	
	//str.replace(/,/g,'')
}

//구분자에 따라 입력받은 파일명과 로그데이터를 나눈다.
function splitInputSep(inputId){
	//입력한 파일명, 로그데이터
	var inputStr = document.getElementById(inputId).value;
	
	//구분자 수정
	regSepUpdate(inputId);
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
function startFilterGen(){ //이름 바꿔야함
	//입력받은 파일명, 로그데이터 init
	var filenameStr = document.getElementById("filename").value;
	var logdataStr = document.getElementById("logdata").value;
	
 	//생성된 Items > span init
	document.getElementById("filenameItems").innerHTML = "";
	document.getElementById("logdataItems").innerHTML = "";
	
	//bucket > span init
	var divBuckets = document.getElementsByClassName("bucket");
	for (bucket in divBuckets)
		divBuckets[bucket].innerHTML="";
	
	//inputIsEmpty?
	if(filenameStr.length > 0)
		splitInputSep("filename");
	if(logdataStr.length > 0)
		splitInputSep("logdata");
	
	//itemsCount
	fnCount = document.getElementById("filenameItems").children.length;
	ldCount = document.getElementById("logdataItems").children.length;
	
	//필터에 추가될 문자열 init
	outputStrInitialize()
}

//필드 데이터가 한 개인 경우
function singleFd(){
	var fdInfo = fieldDatas[fn][0];
	if(typeof fdInfo != "undefined"){
		jsonData[fieldName[fn]] = fdInfo.id;
	}	
}


//필드 데이터가 여러개인 경우 (Object : List)
function multipleFd(fn){
	
	var jsonList = {};
	//jsonList.keys("filename","logdata");
	for (fd in fieldDatas[fn]){
		var fdInfo = fieldDatas[fn][fd].id;
		if(typeof fdInfo != "undefined"){
			//fdInfo = filenameItem3 --(split)--> filenameItem , 3 
			var fdInfoDoc = fdInfo.slice(0,-1);//filenameItem
			var fdInfoSeq = fdInfo.charAt(fdInfo.length - 1);//3
			
			if(fdInfoDoc == "filenameItem"){
				fnList[fdInfoSeq] = fnList[fdInfoSeq].replace("{fnSepInv}","{fnSepInv:"+fieldName[fn]+"}");
				//console.log("fn:"+fn+" fd:"+fd+" fdInfoSeq:"+fdInfoSeq)
				//fList.push(fdInfoSeq);
				//jsonList[fdInfoDoc] = fList;
			}
			else{
				ldList[fdInfoSeq] = ldList[fdInfoSeq].replace("{ldSepInv}","{ldSepInv:"+fieldName[fn]+"}");
				//lList.push(fdInfoSeq);
				//jsonList[fdInfoDoc] = lList;
			}
		}
	}

	//jsonData[fieldName[fn]] = jsonList;
} 
/*
//결과물
	jsonData =
		{
			"server": {
				"filenameItem": ["0"]
			},
			"service": {
				"filenameItem": ["3"]
			},
			"access_date": {
				"filenameItem": ["6"],
				"logdataItem": ["3", "4"]
			},
			"access_ip": {
				"logdataItem": ["5", "6", "7", "8"]
			},
			"access_id": {
				"logdataItem": ["1"]
			},
			"access_uri": {
				"logdataItem": ["9", "10"]
			},
			"action": {
				"logdataItem": ["11"]
			},
			"remark": {}
		}

*/

//필터 생성 시 실행
function makeFilter(){
	//각 필드마다 드랍된 필드 데이터에 대한 정보를 읽는다. (필터 생성에 필요함)
	//필드 데이터들의 태그 id를 읽어,
	//각 데이터들이 어떤 문자열인지와 순서, 어떤 필드를 나타내는지 알아낸다.
	outputStrInitialize();
	for (fn in fieldName){
		fieldDatas[fn] = document.getElementById(fieldName[fn]).children;
		console.log("fieldName[fn]: "+fieldName[fn]+"fieldDatas[fn].length: "+fieldDatas[fn].length);
		//if(fieldName[fn] == "access_date" || fieldName[fn] == "access_ip" || fieldName[fn] == "access_uri")
	 		multipleFd(fn);
	 	//else 
	 	//	singleFd();
	}

	//맨 앞엔 구분자가 없을 수 있다.
	fnList[0] = fnList[0].replace("{fnSep}","{fnSep}?");
	ldList[0] = ldList[0].replace("{ldSep}","{ldSep}?");
	
	var fnStrOut = fnList.toString().replace(/,/g,"")+"$";
	var ldStrOut = ldList.toString().replace(/,/g,"")+"$";
	
	//[2018-08-16 15:57:51] jwmoon|172.21.25.207|/synergy/content/callerbook/limit_list
	
	/*
	%{fnSep}?%{fnSepInv:server}
	%{fnSep}%{fnSepInv}
	%{fnSep}%{fnSepInv:service}
	%{fnSep}%{fnSepInv}
	%{fnSep}%{fnSepInv}
	%{fnSep}%{fnSepInv}
	%{fnSep}%{fnSepInv}
	%{fnSep}%{fnSepInv}$
	*/
	/*
	%{ldSep}?%{ldSepInv:access_date}
	%{ldSep}%{ldSepInv:access_date}
	%{ldSep}%{ldSepInv:access_id}
	%{ldSep}%{ldSepInv:access_ip}
	%{ldSep}%{ldSepInv:access_uri}
	*/
	
	//send json
	//jsonAjax();
}

function jsonAjax(){
	$.ajax({
	    url:"filterGenForm",
	    type:'POST',
// 	  	dataType:'json',
	    data:jsonData,
	    success:function(res){
	    	alert(res);
	    },
	    error:function(err){
	        alert("err: "+err);
	    }
	});
}
>>>>>>> twooopark

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

<<<<<<< HEAD
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
/* 
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
 */
 
/*

["", "ppurio30", "jiny", "11", "42", "35", "172", "21", "25", "180", "PAMenu", "qri", "main", ""]

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
		
아직 날짜는 어떻게 처리할지 모르겠음. ㅎㅎ; 어렵다... 사용자의 추가적인 입력(날짜형식선택)이 필요할 수도
1. items의 갯수 파악(n개). 양쪽에 구분자 없는 경우, n-1개로 처리해야함
2. n개 만큼 %{Sep}%{noSep}을 만들 건데, 그 중 필드데이터가 뭔지 알아야한다.
3. 아래와 같이 각 필드에 해당하는 데이터를 읽을 수 있다.
	for (fn in fieldName)
		fieldData = document.getElementById(fieldName[fn]).innerText;
4. 하지만, 내가 필요 한 건, 위에서 찾은 div에 하위 항목인 span의 id가 필요하다.
filenameItem3이면, 서버명은 파일네임 아이템들 중에  0123 4번째에 있는 것이다.
>> document.getElementById(fieldName[fn]).children[0].id
 		
		
 */
 
//필터 생성
function makeFilter(){
	var fieldDatas = [];
	//각 필드마다 드랍된 필드 데이터에 대한 정보를 읽는다.
	//필드 데이터들의 id를 읽어,
	//각 데이터들이 어떤 문자열의 어디에 위치해 있던 것이고, 어떤 필드를 나타내는지 알아낸다.
	//그리고 이 정보들을 필터 생성에 사용한다.
	for (fn in fieldName){
		fieldDatas[fn] = document.getElementById(fieldName[fn]).children;
		console.log(fieldName[fn]);
		//필드 데이터가 여러개 일 수 있다.
		for (fd in fieldDatas[fn]){
			var fdInfo = fieldDatas[fn][fd].id;
			if(typeof fdInfo != "undefined"){
				var fdInfoDoc = fdInfo.replace(/[0-9]+/g,"");
				var fdInfoSeq = fdInfo.replace(/[^0-9]+/g,"");
				console.log("fdInfo:"+fdInfo+", fdInfoDoc:"+fdInfoDoc+", fdInfoSeq:"+fdInfoSeq);
			}
		}
	}
	
	/*
	$.ajax({
	    url:"filterGenForm",
	    type:'GET',
	    data: jsonData,
	    success:function(data){r
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

/* 
//필드 데이터가 여러개인 경우(Object, String)
function multipleFd1(fn){
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
// 결과물

 	jsonData = 
		{
		  "server": "filenameItem0",
		  "service": "filenameItem3",
		  "access_date": "filenameItem6,logdataItem3,logdataItem4",
		  "access_ip": "logdataItem5,logdataItem6,logdataItem7,logdataItem8",
		  "access_id": "logdataItem1",
		  "access_uri": "logdataItem9,logdataItem10",
		  "action": "logdataItem11",
		  "remark": "logdataItem12"
		}

*/


/*
//필드 데이터가 여러개인 경우(List Object)
function multipleFd2(fn){
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
//결과물
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
		  "access_date": [
		    {
		      "filenameItem": "6"
		    },
		    {
		      "logdataItem": "4"
		    }
		  ],
		  "access_ip": [
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
		  "access_id": [
		    {
		      "logdataItem": "1"
		    }
		  ],
		  "access_uri": [
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
