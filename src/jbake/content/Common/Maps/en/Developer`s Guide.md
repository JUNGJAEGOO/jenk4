title=About
date=2013-09-24
type=page
status=published
big=TCCommon
summary=MapsDV's
~~~~~~
## Common > Maps > Developer's Guide

## 지도

### 1. Web 지도

javascript 기반 TOAST Cloud Maps API를 이용하여 웹 브라우저에 지도를 표시하는 방법을 설명합니다. <br><br>
TOAST Cloud Maps API는 팅크웨어 좌표를 사용합니다. 축약해서 TW 좌표, TW X좌표, TW Y좌표로 표시합니다.
메소드에서 옵션 매개변수는 [param]으로 표시합니다. 옵션 매개변수는 생략할 수 있습니다.

> ※ TOAST Cloud Maps API에서 사용되고 있는 좌표는 팅크웨어 전용 좌표로만 사용되고 있습니다.
<br>팅크웨어 좌표를 위경도 좌표(WGS84)로 변환하기 위해서는 THINKMAP.tw_Wgs84() 함수를 이용하여 변경하시고,
반대로 위경도 좌표(WGS84)를 팅크웨어 좌표로 변환하기 위해서는 THINKMAP.wgs84_Tw() 함수를 이용하시기 바랍니다.


#### 주요 TOAST Cloud Maps API 안내
##### 추가적인 TOAST Cloud Maps API 사용법은 해당 <a href="http://developers1.inavi.com:8086?key=19b6272o5" target="_blank" rel="nofollow">링크</a>를 참조 하시기 바랍니다.  

|API 명|Parameter				|Returns		| 설명			|
|:------:|:------------------------:|:---------------:|:---------------:|
|THINKMAP.initMap(map_div_name, twX, twY, level, init_cb, arrange_type, map_type)|map_div : String<br>지도를 담을 div 태그 ID||지도를 사용하기 위해서 최초에 반드시 호출해야 하는 초기화 함수입니다.|
||twX : Number	<br>지도 초기화 TW X 좌표|||
||twY : Number	<br>지도 초기화 TW Y 좌표|||
||level : Number	<br>지도 초기화 Level<br>- 일반지도 : 1~13<br>- 항공지도 : 1~13|||
||init_cb : function()<br>지도 초기화 이후 호출되는 콜백함수|||
||arrange_type : Number	<br>지도 레이어 정렬방식<br>1 : 중앙정렬방식(resize효과 있음)<br>2 : 전체로딩방식(resize효과 없음)<br> 3 : 우상단정렬방식(resize효과 있음)|||
||map_type : String	<br>지도 타입 설정<br>'i' : 일반맵<br>'a' : 항공맵<br>'s' : 요약맵<br>'m' : 모바일|||
|THINKMAP.imageMap()|||지도를 일반 지도로 전환합니다.|
|THINKMAP.aerialMap()|||지도를 항공 지도로 전환합니다.|
|THINKMAP.setAerialHybrid(active)|active : Boolean<br>항공주기 표시 여부  <br>true : 지도위에 항공주기를 표출   <br>false : 지도위에 항공주기 표출안함||지도 위에 항공지도 주기 표출여부를 설정합니다.|
|THINKMAP.addMapListener(event_name, func_cb)|event_name : String<br> 지도에 등록할 이벤트 이름<br>'movestart'<br>- 지도가 움직이기 시작했을 때<br>'move'<br> - 지도가 움직일 때<br>'moveend'<br>- 지도 움직임이 끝났을 때<br>'zoomend'<br>- 지도가 확대, 축소가 끝났을 때<br>'mouseover'<br>- 지도위에 마우스가 들어왔을 때<br>'mouseout'<br>- 지도에서 마우스가 나갔을 때<br> 'mousemove'<br>- 지도에서 마우스가 움직일 때||지도에 이벤트를 등록합니다.<br>(지도에 관련된 이벤트, 확대/축소, 움직임 등)|
||func_cb : function()<br>	지도에서 이벤트가 발생했을 때 호출되는 콜백 함수<br>(콜백함수에 매개변수로 Map 객체가 전달됩니다)|||
|THINKMAP.removeMapListener(event_name)|event_name : String<br> 지도에 제거할 이벤트 이름<br>'movestart'<br>- 지도가 움직이기 시작했을 때<br>'move'<br> - 지도가 움직일 때<br>'moveend'<br>- 지도 움직임이 끝났을 때<br>'zoomend'<br>- 지도가 확대, 축소가 끝났을 때<br>'mouseover'<br>- 지도위에 마우스가 들어왔을 때<br>'mouseout'<br>- 지도에서 마우스가 나갔을 때<br> 'mousemove'<br>- 지도에서 마우스가 움직일 때||지도에 등록한 이벤트를 제거합니다. <br>THINKMAP.addMapListener 메소드로 등록한 event_name에 해당하는 모든 콜백함수를 삭제하므로 주의가 필요합니다.|
|THINKMAP.createMarker(twX, twY, width, height, iconUrl, [param])|twX : Number	<br>Marker 객체 위치 TW X 좌표	||Marker 객체를 생성합니다. <br>생성한 Marker 객체를 지도에 표출하기 위해서는 THINKMAP.addMarker 메소드로 지도에 Marker 객체를 추가해야합니다.|
||twY : Number	<br>Marker 객체 위치 TW Y 좌표|||
||width : Number <br>Marker 이미지 너비|||
||height : Number <br>Marker 이미지의 높이|||
||iconURL : String <br>Marker 이미지의 URL|||
||param : String <br>Marker 객체의 사용자 변수|||
|THINKMAP.addMarker(marker)|marker : Marker<br>지도에 추가할 대상 Marker 객체||지도에 Marker 객체를 추가합니다.|
|THINKMAP.featureDrawing(draw_type, style, func_cb)|draw_type : String<br>사용자가 그릴 Feature 객체 타입<br>'lineDraw' : 선<br>'polygonDraw' : 다각형<br> 'regularPolygonDraw' :   형태가 정해진 다각형||사용자가 지도에 마우스로 Polyline, Polygon을 직접 그릴 수 있는 그리기모드로 전환합니다.<br>지도 마우스 클릭 시 객체 그리기가 시작되고 마우스를 더블클릭하면 그리기가 완료됩니다. <br>그리기 완료 시 콜백함수로 그려진 Feature 객체를 넘겨줍니다. |
||style : Object<br> Polygon, Polyline의 스타일을 지정하기 위한 Object<br>strokeColor : 선 색<br>- 'red', '#fff123' <br> strokeWidth : 선 두께<br> - 10<br>strokeDashstyle : 선 스타일<br> strokeOpacity : 선 투명도<br>fillColor : 채우기 색<br>fillOpacity : 채우기 투명도|||
||func_cb : function()<br>사용자가 지도를 더블클릭하여<br>Feature 객체 그리기가 완료되었을 때 호출되는 콜백함수|||
|THINKMAP.featureDrawingCancel()|||지도에 사용자가 마우스로 Polyline, Polygon을 직접 그릴 수 있는 그리기모드를 종료합니다. |
|THINKMAP.tw_Wgs84(twX, twY)|twX : Number<br> 변환할 TW X 좌표|coord : Object<br>변환된 WGS84 좌표|TW 좌표를 WGS84 좌표로 변환합니다. |
||twY : Number<br> 변환할 TW Y 좌표<br>|- coord.curx : WGS84 X 좌표||
|||- coord.cury  : WGS84 Y 좌표||
|THINKMAP.wgs84_Tw(wgs_lon, wgs_lat)|wgs_lon : Number<br>변환할 WGS84 경도 좌표|coord : Object<br>변환된 TW 좌표 |WGS84 좌표를 TW 좌표로 변환합니다.|
||wgs_lat : Number<br>변환할 WGS84 위도 좌표|- coord.curx  : TW X 좌표||
|||- coord.cury  : TW Y 좌표 ||

#### TOAST Cloud Maps API 사용하기
```
// 지도 사용을 위한 js 파일을 선언 합니다.
<script type="text/javascript" src="https://api-maps.cloud.toast.com/maps/js/v1.0/map.js"></script>
<script>
	// 지도 사용을 위한 인증을 진행 합니다.
	Map.authentification("appKey");
</script>

//지도를 담을 DIV를 생성 합니다.
<div id="div_map"></div>
<script type="text/javascript">

	//선언한 DIV에 지도를 표출 합니다.
	THINKMAP.initMap("div_map", 165406, 500198, 12, init, 2, 'i');

	// 지도 init 후 콜백 함수가 실행 됩니다.
	function init(){
		alert('init!');
	}
</script>
```

#### 지도 모드  변경 하기
```
<script type="text/javascript">
	//지도를 일반 지도로 전환
	THINKMAP.imageMap();

	//지도를 항공 지도로 전환
	THINKMAP.aerialMap();

	//지도 위에 항공주기 표출여부 설정
	THINKMAP.setAerialHybrid(active);
</script>
```
#### 지도 이벤트 등록 하기
```
<script type="text/javascript">
	//지도에 move 이벤트를 등록 한다.
	THINKMAP.addMapListener('move', mapEvent_cb);

	//지도 이벤트 발생 시 콜백 함수
	function mapEvent_cb(map){
	    console.log("event callback!");
	}
</script>
```
#### 지도 이벤트 제거 하기
```
<script type="text/javascript">
	//지도에 move 이벤트를 제거 한다.
	THINKMAP.removeMapListener('move');
</script>
```

#### 지도 마커 추가 하기
```
<script type="text/javascript">
	//지도에 마커를 객체를 초기화 한다.
	var marker = null;
	function createMarker(){
		if(!marker){
			//마커 객체를 생성 한다.
			marker = THINKMAP.createMarker(163670, 526934, 47, 46, '../img/img.png', 'my_marker');
			//마커를 지도에 추가 한다.
			THINKMAP.addMarker(marker);
			console.log('id : ' + marker._feature_id + ', param : ' + marker._param);
		}
	}
</script>

```


#### 지도 그리기 모드로 전환 하기
```
<script type="text/javascript">
	//지도를 그리기 모드로 전환 한다.
	var style = {
		strokeColor: '#fff123',
		strokeWidth: 5,
		strokeDashstyle: 'solid',		
		strokeOpacity: 0.8,
		fillColor: 'blue',
		fillopacity: 1
	};

	THINKMAP.featureDrawing("lineDraw", style, drawEvent_cb);

	function drawEvent_cb(){
		alert("그리기 모드 전환!");
	}
</script>

```

#### 지도 그리기 모드 종료 하기
```
<script type="text/javascript">
	//지도 그리기 모드를 종료 한다.
	THINKMAP.featureDrawingCancel();
</script>

```


#### TW 좌표를 WGS 좌표로 변환 하기
```
<script type="text/javascript">
	var wgs;

	// TW 좌표를 WGS좌표로 변환 한다.
	wgs = THINKMAP.tw_Wgs84(165406, 500198);

	console.log(wgs.curx);
	console.log(wgs.cury);
</script>

```


#### WGS 좌표를 TW 좌표로 변환 하기
```
<script type="text/javascript">
	var tw;

	// WGS 좌표를 TW좌표로 변환 한다.
	wgs = THINKMAP.wgs84_Tw(127.28976653131843, 37.56515136725675);

	console.log(tw.curx);
	console.log(tw.cury);
</script>

```

### 2. Static 지도

#### TOAST Cloud Maps API Static 지도 사용하기
```
// Static 지도 사용을 위한 js 파일을 선언 합니다.
<script type="text/javascript" src="https://api-maps.cloud.toast.com/maps/js/v1.0/staticMap.js"> </script>

// 지도를 담을 IMG를 생성 합니다.
<img id='staticMapImg' alt="" src="">

<script>

	// Static 지도 사용을 위한 인증 및 파라미터를 전달 합니다. 	
	StaticMap.authentification('staticMapImg',"appkey",'x=157423&y=266836&width=970&height=300&level=10&maptype=i&mx=158323&my=266836&txt=');

</script>
```

|값		|타입	|필수| 설명|
|:-------:|:-------:|:----:|:-----:|
|x		|Integer|O	 |지도 중심 X좌표|
|y		|Integer|O	 |지도 중심 Y좌표|
|mx		|Integer|O	 |마커 X좌표|
|my		|Integer|O	 |마커 Y좌표|
|width	|Integer|X	 |지도 넓이 <br> 미입력 시 기본 600px|
|height|Integer|X	 |지도 높이 <br> 미입력 시 기본 600px|
|imgurl|String|X	 |마커 이미지 url<br> 미입력 시 기본 마커 사용|
|level|Integer|X	 |지도 레벨 <br> 미입력 시 기본 10|
|maptype|String|X	 |지도 타입 <br> 미입력 시 기본 일반맵|
|label|String|X	 |라벨 내용|

## 검색

[API 도메인]

|환경|	도메인|
|---|---|
|Real|	https://api-maps.cloud.toast.com|

### 1. 주소검색(주소 -> 좌표)

#### 요청

[URL]

|Http method|	URI|
|:---:|:---:|
|GET|	/maps/v1.0/appkeys/{appkey}/coordinates?query={query}&coordtype={coordtype}&startposition={startposition}&reqcount={reqcount}&admcode={admcode}|

[Path parameter]

|값  |타입|	설명|
|:---:|:---:|:---:|
|appKey|	String|	고유의 appKey|

[Query Parameters]

|값|	타입|	필수|	설명|
|---|---|:---:|---|
|​query|	String|	O|	검색어|
|coordtype|	String|	X| 좌표형식 <br>0:TW 좌표<br> 1:WGS84 좌표<br> 2:TM 좌표|
|startposition|	String|	X|	검색 시작 위치 <br>0:첫번째 위치<br>미입력 시 0으로 조회|
|reqcount|	String|	X|	검색 요청 개수 <br>0으로 설정시 Max Count 반환|
|admcode|	String|	X|	행정코드|


#### 응답

```
{
  "header": {
    "isSuccessful": true,
    "resultCode": 0,
    "resultMessage": ""
  },
  "address": {
    "result": true,
    "totalcount": 2,
    "admtotalcount": 2,
    "admcount": 2,
    "res_type": "NNYN",
    "adm": [
      {
        "type": 2,
        "posx": "168425",
        "posy": "516725",
        "admcode": "4113510800",
        "jibun": "",
        "address": "경기도 성남시 분당구 판교동",
        "roadname": "",
        "roadjibun": "",
        "accuracy": 3
      },
      {
        "type": 2,
        "posx": "167300",
        "posy": "515526",
        "admcode": "4113511000",
        "jibun": "",
        "address": "경기도 성남시 분당구 백현동(판교동)",
        "roadname": "",
        "roadjibun": "",
        "accuracy": 3
      }
    ]
  }
}
```

|값|	타입|	설명|
|---|:---:|:---:|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|address|	Object|	본문 영역|
|- result|	Boolean|	성공여부|
|- totalcount|	Integer|	전체 검색결과 대상 개수|
|- res_type|	String|	검색결과Type명칭 <br>명칭, 카테고리, 주소, 전화번호 순 <br>(ex) NYNN: 명칭 No, 카테고리 YES, 주소 NO, 전화번호 NO|
|- adm|	Array|	검색결과|
|-- type| String|	검색 type <br>1 : 행정계 검색<br> 2 : 지번 검색<br>3 : 새주소 검색|
|-- posx| String|	X좌표|
|-- posy| String|	Y좌표|
|-- admcode| String| 행정코드|
|-- address| String|	주소|
|-- roadname| String|	새주소 도로명|
|-- roadjibun| String|	새주소 지번|
|-- accuracy| Integer|	지번 정확도 <br>0 : 정확 검색<br> 1 : 호지번 확장<br> 2 : 모지번 확장|


### 2. 좌표검색(좌표 -> 주소)

#### 요청

[URL]

|Http method|	URI|
|:---:|:---:|
|GET|	/maps/v1.0/appkeys/{appkey}/addresses?query={query}&posX={posX}&posY={posY}&coordtype={coordtype}|

[Path parameter]

|값|	타입|	설명|
|:---:|:---:|:---:|
|appKey|	String|	고유의 appKey|

[Query Parameters]

|값|	타입|	필수|	설명|
|:---:|:---:|:---:|:---:|
|​posX|	String|	O|	X좌표|
|​posY|	String|	O|	Y좌표|
|coordtype|	String|	X| 요청 좌표형식 <br>0 : TW 좌표<br> 1 : WGS84 좌표<br>미 입력 시 TW 좌표 기준 검색|

#### 응답

```
{
  "header": {
    "isSuccessful": true,
    "resultCode": 0,
    "resultMessage": ""
  },
  "location": {
    "result": true,
    "adm": {
      "posx": "168434",
      "posy": "516700",
      "admcode": "4113511000",
      "address": "경기도 성남시 분당구 백현동",
      "jibun": "519-7",
      "roadname": "",
      "roadjibun": "",
      "distance": 25
    }
  }
}
```

|값|	타입|	설명|
|---|:---:|:---:|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|location|	Object|	본문 영역|
|- result|	Boolean|	성공여부|
|- adm|	Object|	검색결과|
|-- posx| String|	TW X좌표|
|-- posy| String|	TW Y좌표|
|-- admcode| String| 행정코드|
|-- address| String|	주소|
|-- jibun| String|	지번|
|-- roadname| String|	새주소 도로명|
|-- roadjibun| String|	새주소 지번|
|-- accuracy| String|	지번 정확도 <br>0 : 정확 검색<br> 1 : 호지번 확장<br> 2 : 모지번 확장|



### 3. 통합검색

#### 요청

[URL]

|Http method|	URI|
|:---:|:---:|
|GET|	/maps/v1.0/appkeys/{appkey}/searches&query={query}&coordtype&startposition={startposition}&reqcount={reqcount}&spopt={spopt}&radius={radius}&admcode={admcode}&depth={depth}&x1={x1}&y1={y1}&x2={x2}&y2={y2}&sortopt={sortopt}&catecode={catecode}|

[Path parameter]

|값|	타입|	설명|
|:---:|:---:|:---:|
|appKey|	String|	고유의 appKey|

[Query Parameters]

|값|	타입|	필수|	설명|
|---|:---:|:---:|:---:|
|​query|	String|	O|	검색어|
|coordtype|	String|	X| 좌표형식 <br>0:TW 좌표<br> 1:WGS84 좌표<br> 2:TM 좌표|
|startposition|	String|	X|	검색 시작 위치 <br>0:첫번째 위치, 미입력 시 0으로 조회|
|reqcount|	String|	X|	검색 요청 개수 <br>0으로 설정시 Max Count 반환|
|spopt|	String|	X|	공간검색 option <br>0 : 공간검색 사용 안함<br>1 : Extent 검색<br>2 : Range 검색 *spopt값이 설정되지 않은 경우 0으로 설정|
|radius|	String|	X|	반경 <br>spopt가 2인 경우 사용 Meter 단위 |
|admcode|	String|	X|	행정코드|
|depth|	String|	X|	하위시설물 요구 depth <br>1 : 1 depth 만 요청(최상위 depth)<br>2 : 2 depth 까지 요청<br> 3 : 3 depth 까지 요청 *depth값이 설정되지 않은 경우 1로 설정|
|x1|	String|	X|	X1좌표 <br>spopt가 0인 경우 기준점 X좌표<br> spopt가 1인 경우 Extent의 좌상단 X좌표<br> spopt가 2인 경우 기준점 X좌표|
|y1|	String|	X|	Y1좌표 <br>spopt가 0인 경우 기준점 Y좌표<br> spopt가 1인 경우 Extent의 좌상단 Y좌표<br> spopt가 2인 경우 기준점 Y좌표|
|x2|	String|	X|	X2좌표 <br>spopt가 1인 경우 Extent의 우하단 X좌표, spopt가 2인 경우 사용 안함|
|y2|	String|	X|	Y2좌표 <br>spopt가 1인 경우 Extent의 우하단 Y좌표, spopt가 2인 경우 사용 안함|
|sortopt|	String|	X|	정렬option <br>1 : 명칭순 정렬<br> 2 : 거리순 정렬 (좌표를 입력한 경우)<br> 3 : 이름매치->거리순 정렬(좌표를 입력한 경우)<br> 4 : 검색어 Weight 정렬 (엔진기준)<br> 5 : 검색어 Weight 정렬 + length(엔진기준)<br> 6 : 선호카테고리 우선 정렬[V8.1.5 미지원]<br>7 : 최신데이터 순 정렬<br> 8 : 검색어 Weight 정렬(Landmark>거리>PoiWeight) + 거리순(좌표를 입력한 경우)<br> *sortopt값이 설정되지 않은 경우  4로설정|
|catecode|	String|	X|	선호 카테고리 <br>- 선호 카테고리 검색 시 검색어에 카테고리 명칭을 입력한 경우, 검색어 우선 정책에 의해 입력한 선호 카테고리보다 검색어를 기준으로 검색 됨<br>ex) 검색어 : "미용실" , 선호 카테고리 : "100000"(음식점) -> 미용실 기준으로 검색 됨|

#### 응답

```
{
  "header": {
    "isSuccessful": true,
    "resultCode": 0,
    "resultMessage": ""
  },
  search": {
	"result": true,
	"type": 0,
	"totalcount": 126,
	"count": 126,
	"poitotalcount": 95,
	"poicount": 95,
	"ucp_poitotalcount": 0,
	"ucp_poicount": 0,
	"tel_poitotalcount": 31,
	"tel_poicount": 31,
	"admtotalcount": 0,
	"admcount": 0,
	"reftotalcount": 0,
	"refcount": 0,
	"res_type": "YYYY",
	"poi": [
		  {
			"poiid": 4521974,
			"depth": 0,
			"dpx": "169068",
			"dpy": "517049",
			"rpx": "169172",
			"rpy": "517030",
			"name1": "판교역(신분당선)",
			"name2": "판교(판교테크노밸리)역(신분당선)",
			"name3": "판교테크노밸리역(신분당선)",
			"name4": "",
			"admcode": "4113511000",
			"jibun": "19-2",
			"address": "경기도 성남시 분당구 백현동",
			"roadname": "경기도 성남시 분당구 판교역로",
			"roadjibun": "160",
			"detailaddress": "",
			"catecode": "172900",
			"catename": "지하철",
			"dp_catecode": "370",
			"userid": "",
			"imagecount": 0,
			"userimagecount": 0,
			"badgeflag": false,
			"distance": 0,
			"tel": "",
			"islandmark": true,
			"updateTS": "2016-01-26 00:00:00",
			"data_source": "Thinkware",
			"hasoildata": false,
			"hasdetailinfo": true,
			"hassubpoi": true,
			"subpoi": {
			"count": 5
		},
		....
		]
	}
}
```

|값|	타입|	설명|
|---|:---:|:---:|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|address|	Object|	본문 영역|
|- result|	Boolean|	성공여부|
|- type|	Integer|	0 : 일반 검색<br> 1 : Reference 검색|
|- totalcount|	Integer|	전체 검색결과 대상 개수|
|- count|	Integer|	검색 결과 개수|
|- poitotalcount|	Integer|전체 검색결과 대상 개수(Thinkware POI)|
|- poicount|	Integer|검색 결과 개수(Thinkware POI)|
|- tel_poitotalcount|	Integer|전체 검색결과 대상 개수(Tel POI)|
|- tel_poicount|	Integer|검색 결과 개수(Tel POI)|
|- ucp_poitotalcount|	Integer|전체 검색결과 대상 개수(User POI)|
|- ucp_poicount|	Integer|검색 결과 개수(User POI)|
|- admtotalcount|	Integer|adm 전체 검색결과 대상 개수|
|- admcount|	Integer|adm 검색 결과 개수|
|- reftotalcount|	Integer|ref 전체 검색결과 대상 개수|
|- refcount|	Integer|ref 검색 결과 개수|
|- recommendedQuery|	String|검색결과가 없는 경우 오타보정 결과 제공(NULL가능)|
|- recommendedCost|	Integer|오타보정 결과 Cost(0~10000)|
|- res_type|	String|검색결과Type명칭 <br>명칭, 카테고리, 주소, 전화번호 순 <br>(ex) NYNN: 명칭 No, 카테고리 YES, 주소 NO, 전화번호 NO|
|- poi|	Array| POI 검색 결과 리스트|
|-- poiid|	Integer| POI 검색 결과 리스트|
|-- depth|	String| POI depth|
|-- dpx|	String|display X좌표(WGS84의 경우 longitude)|
|-- dpy|	String|display Y좌표(WGS84의 경우 latitude)|
|-- rpx|	String|탐색 X좌표(WGS84의 경우 longitude)|
|-- rpy|	String|탐색 Y좌표(WGS84의 경우 latitude)|
|-- name1|	String|정식명칭|
|-- name2|	String|축약명칭|
|-- name3|	String|확장명칭1|
|-- name4|	String|확장명칭2|
|-- admcode|	String|행정코드|
|-- address|	String|주소|
|-- jibun|	String|지번|
|-- roadname|	String|새주소 도로명|
|-- roadjibun|	String|새주소 지번|
|-- detailaddress|	String|상세주소|
|-- catecode|	String|분류코드|
|-- catename|	String|분류명칭|
|-- dp_catecode|	String|DP 분류코드|
|-- distance|	Integer|좌표와의 거리(해당시에만)|
|-- tel|	String|전화번호|
|-- hasoildata|	Boolean|유가 데이터 존재여부|
|-- hasdetailinfo|	Boolean|상세정보 존재여부|
|-- hassubpoi|	Boolean|하위시설물 존재여부|
|-- adv_count|	Integer|광고코드 개수|
|-- islandmark|	Boolean|랜드마크 여부|
|-- updateTS|	String|최종변경 일시 (Y4-MM-DD HH:mm:ss)포맷|
|-- data_source|	String|poi 생성 정보 구분 (Thinkware/Tel/User)|
|-- badgeflag|	Boolean|Badge 유무(Not Yet:FALSE, Badged:TRUE)|
|-- userid|	String|poi 등록 사용자 ID (UCP인 경우에만)|
|-- imagecount|	Integer|poi 이미지 개수|
|-- oildata| Object| 유가 데이터 정보|
|--- g_price|Integer|휘발유 가격|
|--- hg_price|Integer|고급휘발유 가격|
|--- d_price|Integer|경유 가격|
|--- l_price|Integer|LPG 가격|
|--- updatetime|String|Update 시간|
|--- priceinfo|String|최고,최저 유가 정보<br>(H:최고L:최저X:해당없음)<br>휘발유,고급휘발유, 경유, LPG 순|
|--- wash|Boolean|세차시설여부|
|--- fix|Boolean|정비가능여부|
|--- mart|Boolean|매점여부|
|-- AdInfo| Array| 광고제공업체 광고 코드|
|--- ADCODE|Integer|광고코드.. 1 ~ 99까지 부여가능<br>(최대99개)|
|-- subpoi| Object| 하위 시설물 정보|
|--- count|Integer| 하위 시설물 개수|
|--- poi|Array| POI 정보와 동일|
|- tel|	Array| TEL 검색 결과 리스트 (POI 정보와 동일)|
|- poi|	Array| UCP 검색 결과 리스트 (POI 정보와 동일)|
|- adm|	Array| ADM 검색 결과 리스트|
|-- type| String|	검색 type <br>1 : 행정계 검색<br> 2 : 지번 검색<br>3 : 새주소 검색|
|-- posx| String|	X좌표|
|-- posy| String|	Y좌표|
|-- admcode| String| 행정코드|
|-- address| String|	주소|
|-- roadname| String|	새주소 도로명|
|-- roadjibun| String|	새주소 지번|
|-- accuracy| Integer|	지번 정확도 <br>0 : 정확 검색<br> 1 : 호지번 확장<br> 2 : 모지번 확장|
|- hasgasstation|Boolean|oilprice 정보 제공 여부|
|- oilprice| Object|유가정보|
|-- max_g_price|Integer|최고 휘발유 가격|
|-- min_g_price|Integer|최저 휘발유 가격|
|-- avg_g_price|Integer|평균 휘발유 가격|
|-- max_hg_price|Integer|최고 고급 휘발유 가격|
|-- min_hg_price|Integer|최저 고급 휘발유 가격|
|-- avg_hg_price|Integer|평균 고급 휘발유 가격|
|-- max_d_price|Integer|최고 경유 가격|
|-- min_d_price|Integer|최저 경유 가격|
|-- avg_d_price|Integer|평균 경유 가격|
|-- max_l_price|Integer|최고 LPG 가격|
|-- min_l_price|Integer|최저 LPG 가격|
|-- avg_l_price|Integer|평균 LPG 가격|

### 4. 추천어 검색

#### 요청

[URL]

|Http method|	URI|
|:---:|:---:|
|GET|	/maps/v1.0/appkeys/{appkey}/proposers?query={query}|

[Path parameter]

|값|	타입|	설명|
|:---:|:---:|:---:|
|appKey|	String|	고유의 appKey|

[Query Parameters]

|값|	타입|	필수|	설명|
|:---:|:---:|:---:|:---:|
|​query|	String|	O|	한글/영문/숫자 50Byte(한글 25자)|


#### 응답

```
{
  "header": {
    "isSuccessful": true,
    "resultCode": 0,
    "resultMessage": ""
  },
  "proposer": {
    "result": true,
    "count": 10,
    "keyword": [
      {
        "keyword": "판교역",
        "frequency": 3729938
      },
      {
        "keyword": "판교",
        "frequency": 3729326
      },
      {
        "keyword": "판교IC",
        "frequency": 3729362
      },
      {
        "keyword": "판교도서관",
        "frequency": 3729514
      },
      {
        "keyword": "판교원마을",
        "frequency": 3730051
      },
      {
        "keyword": "판교롯데마트",
        "frequency": 3729602
      },
      {
        "keyword": "판교이노밸리",
        "frequency": 3730186
      },
      {
        "keyword": "판교박물관",
        "frequency": 3729654
      },
      {
        "keyword": "판교중학교",
        "frequency": 3730256
      },
      {
        "keyword": "판교메리어트",
        "frequency": 3729626
      }
    ]
  }
}
```

|값|	타입|	설명|
|---|:---:|:---:|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|proposer|	Object|	본문 영역|
|- result|	 Boolean|	성공 여부|
|- count|	 Integer|	검색어 개수|
|- keyword|	Array|	추천 검색어 리스트|
|-- keyword|	String|	검색어|
|-- frequency|	Integer|	조회 빈도|


### 5. POI 상세 검색

#### 요청

[URL]

|Http method|	URI|
|:---:|:---:|
|GET|	/maps/v1.0/appkeys/{appkey}/pois?poiid={poiid}|

[Path parameter]

|값|	타입|	설명|
|:---:|:---:|:---:|
|appKey|	String|	고유의 appKey |

[Query Parameters]

|값|	타입|	필수|	설명|
|---|:---:|:---:|:---:|
|​poiid|	String|	O| POI ID<br>poiid를 구분자","와 함께 입력 <br>(복수개 가능 186개까지) <br>ex) poiid=123,234,567 |


#### 응답

```
{
  "header": {
    "isSuccessful": true,
    "resultCode": 0,
    "resultMessage": ""
  },
  "poi": {
    "result": true,
    "totalcount": 2,
    "count": 2,
    "poiinfo": [
      {
        "poiid": 510835,
        "dpx": "164939",
        "dpy": "530708",
        "rpx": "164929",
        "rpy": "530731",
        "name1": "현대백화점(무역센터점)",
        "name2": "현대백화점무역센터점",
        "name3": "무역센터현대백화점",
        "name4": "",
        "admcode": "1168010500",
        "jibun": "159-7",
        "address": "서울특별시 강남구 삼성동",
        "roadname": "서울특별시 강남구 삼성동 테헤란로",
        "roadjibun": "517",
        "detailaddress": "",
        "fulladdress": "서울특별시 강남구 삼성동 159-7 ",
        "zip": "",
        "homepage": "http://www.e-hyundai.com",
        "email": "",
        "howtogo": "",
        "tel1": "025522233",
        "tel2": "",
        "fax1": "",
        "fax2": "",
        "catecode": "110102",
        "catename": "쇼핑",
        "dp_catecode": "250",
        "icode": "493-070-3606",
        "externallink": [],
        "detail_count": 10,
        "etc_count": 2,
        "imagecount": 0,
        "badgeflag": false,
        "detailinfo": [
          {
            "name": "휴무일",
            "value": "매월 2회휴무"
          },
          {
            "name": "영업시간",
            "value": "10:30~20:00"
          },
          {
            "name": "주차",
            "value": "1400여대 가능"
          },
          {
            "name": "주차료",
            "value": "1만원이상 구매시 1시간 무료"
          },
          {
            "name": "부대시설1",
            "value": "에메랄드홀(이벤트홀)"
          },
          {
            "name": "부대시설2",
            "value": "테라스가든"
          },
          {
            "name": "규모",
            "value": "지상10층 지하 4층"
          },
          {
            "name": "층별정보1",
            "value": "1층 명품잡화/2층 패션잡화"
          },
          {
            "name": "층별정보2",
            "value": "3~4층 여성의류/6층 골프유니캐주얼"
          },
          {
            "name": "층별정보3",
            "value": "9층 식당가/10층 문화의 광장"
          }
        ],
        "etcinfo": [
          {
            "name": "기타1",
            "value": "금융 중심지인 테헤란로의 심장부에 위치"
          },
          {
            "name": "기타2",
            "value": "전세계에서 한국을 찾아온 고객들을 만족시킬 수 있는 한국 유통의 쇼윈도우"
          }
        ],
        "hasoildata": false
      },
      ....
    ]
  }
}
```

|값|	타입|	설명|
|---|:---:|:---:|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|poi|	Object|	본문 영역|
|- result|	Boolean|	성공여부|
|- totalcount|	Integer|	전체 검색결과 대상 개수|
|- count|	Integer|	검색 결과 개수|
|- poiinfo|	Array| POI 검색 결과 리스트|
|-- poiid |Integer|poi id|
|-- dpx|String|display X좌표(WGS84의 경우 longitude)|
|-- dpy|String|display Y좌표(WGS84의 경우 latitude)|
|-- rpx|String|탐색 X좌표(WGS84의 경우 longitude)|
|-- rpy|String|탐색 Y좌표(WGS84의 경우 latitude)|
|-- name1|String|정식명칭|
|-- name2|String|축약명칭|
|-- name3|String|확장명칭1|
|-- name4|String|확장명칭2|
|-- admcode|String|행정코드|
|-- jibun|String|지번|
|-- address|String|주소|
|-- roadname|String|새주소 도로명|
|-- roadjibun|String|새주소 지번|
|-- detailaddress|String|상세주소|
|-- catecode|String|분류코드|
|-- catename|String|분류명칭|
|-- fulladdress|String|전체주소(행정주소+지번+상세주소)|
|-- zip|String|우편번호|
|-- homeage|String|홈페이지 url|
|-- email|String|email|
|-- howtogo|String|교통편|
|-- tel1|String|전화번호1|
|-- tel2|String|전화번호2|
|-- fax1|String|팩스번호1|
|-- fax2|String|팩스번호2|
|-- icode|String|ICODE|
|-- detail_count|Integer|분류상세항목갯수|
|-- etc_count|Integer|분류기타항목갯수|
|-- badgeflag|Boolean|Badge 유무(Not Yet:FALSE, Badged:TRUE)|
|-- imagecount|Integer|poi 이미지 개수|
|-- hasoildata|Boolean|유가 데이터 존재 유무|
|-- detailinfo|Array|분류상세항목|
|--- name|String|분류상세항목설명|
|--- value|String|분류상세항목내용|
|-- etcinfo|Array|분류기타항목|
|--- name|String|분류기타항목설명|
|--- value|String|분류기타항목내용|
|-- oildata| Object| 유가 데이터 정보|
|--- g_price|Integer|휘발유 가격|
|--- hg_price|Integer|고급휘발유 가격|
|--- d_price|Integer|경유 가격|
|--- l_price|Integer|LPG 가격|
|--- updatetime|String|Update 시간|
|--- priceinfo|String|최고,최저 유가 정보<br>(H:최고L:최저X:해당없음)<br>휘발유,고급휘발유, 경유, LPG 순|
|--- wash|Boolean|세차시설여부|
|--- fix|Boolean|정비가능여부|
|--- mart|Boolean|매점여부|




### 6. POI 하위 시설물 검색

#### 요청

[URL]

|Http method|	URI|
|:---:|:---:|
|GET|	/maps/v1.0/appkeys/{appkey}/sub-pois?poiid={poiid}&x1={x1}&y1={y1}|

[Path parameter]

|값|	타입|	설명|
|:---:|:---:|:---:|
|appKey|	String|	고유의 appKey |

[Query Parameters]

|값|	타입|	필수|	설명|
|---|:---:|:---:|:---:|
|​poiid|	String|	O| POI ID<br>복수개 지원 안됨 |
|​x1|	String|	X| 현위치 또는 지도중심좌표. <br>x, y좌표가 모두 NULL또는 0일 경우 거리 계산을 수행하지 않음. |
|​y1|	String|	X| 현위치 또는 지도중심좌표. <br>x, y좌표가 모두 NULL또는 0일 경우 거리 계산을 수행하지 않음. |

#### 응답

```
{
  "header": {
    "isSuccessful": true,
    "resultCode": 0,
    "resultMessage": ""
  },
  "subpoi": {
    "result": true,
    "totalcount": 5,
    "count": 5,
    "poi": [
      {
        "poiid": 4521976,
        "depth": 1,
        "dpx": "169172",
        "dpy": "517030",
        "rpx": "169172",
        "rpy": "517030",
        "name1": "환승주차장",
        "name2": "",
        "name3": "",
        "name4": "",
        "admcode": "4113511000",
        "jibun": "",
        "address": "경기도 성남시 분당구 백현동",
        "roadname": "",
        "roadjibun": "",
        "detailaddress": "",
        "catecode": "161701",
        "catename": "주차장",
        "dp_catecode": "360",
        "userid": "",
        "imagecount": 0,
        "userimagecount": 0,
        "badgeflag": false,
        "distance": 0,
        "tel": "",
        "islandmark": false,
        "updateTS": "1970-01-01 09:00:00",
        "hasoildata": false,
        "hasdetailinfo": false,
        "hassubpoi": false
      },
      {
        "poiid": 4521977,
        "depth": 1,
        "dpx": "169088",
        "dpy": "517090",
        "rpx": "169088",
        "rpy": "517090",
        "name1": "1번출구",
        "name2": "",
        "name3": "",
        "name4": "",
        "admcode": "4113511000",
        "jibun": "",
        "address": "경기도 성남시 분당구 백현동",
        "roadname": "",
        "roadjibun": "",
        "detailaddress": "",
        "catecode": "173000",
        "catename": "지하철",
        "dp_catecode": "370",
        "userid": "",
        "imagecount": 0,
        "userimagecount": 0,
        "badgeflag": false,
        "distance": 0,
        "tel": "",
        "islandmark": false,
        "updateTS": "1970-01-01 09:00:00",
        "hasoildata": false,
        "hasdetailinfo": false,
        "hassubpoi": false
      },
      ...
    ]
  }
}
```

|값|	타입|	설명|
|---|:---:|:---:|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|subpoi|	Object|	본문 영역|
|- result|	Boolean|	성공여부|
|- totalcount|	String|	전체 검색결과 대상 개수|
|- count|	String|	검색 결과 개수|
|- poi|	Array| POI 검색 결과 리스트|
|-- poiid |Integer|poi id|
|-- depth|String|poi depth|
|-- dpx|String|display X좌표(WGS84의 경우 longitude)|
|-- dpy|String|display Y좌표(WGS84의 경우 latitude)|
|-- rpx|String|탐색 X좌표(WGS84의 경우 longitude)|
|-- rpy|String|탐색 Y좌표(WGS84의 경우 latitude)|
|-- name1|String|정식명칭|
|-- name2|String|축약명칭|
|-- name3|String|확장명칭1|
|-- name4|String|확장명칭2|
|-- admcode|String|행정코드|
|-- address|String|주소|
|-- jibun|String|지번|
|-- roadname|String|새주소 도로명|
|-- roadjibun|String|새주소 지번|
|-- detailaddress|String|상세주소|
|-- catecode|String|분류코드|
|-- catename|String|분류명칭|
|-- dp_catecode|String|DP 분류코드|
|-- distance|Integer|좌표와의 거리(해당시에만)|
|-- tel|String|전화번호|
|-- hasoildata|Boolean|유가 데이터 존재 여부|
|-- hasdetailinfo|Boolean|상세정보 존재 여부|
|-- hassubpoi|Boolean|하위시설물 존재여부|
|-- adv_count|Boolean|광고코드 개수|
|-- islandmark|Boolean|랜드마크 여부|
|-- updateTS|String|최종변경 일시(Y4-MM-DD HH:mm:ss)포맷|
|-- data_source|String|poi 생성 정보 구분 (Thinkware/Tel/User)|
|-- badgeflag|Boolean|Badge 유무(Not Yet:FALSE, Badged:TRUE)|
|-- userid|String|poi 등록 사용자 ID (UCP인 경우에만)|
|-- imagecount|Integer|poi 이미지 개수|
|-- oildata|Object|유가 데이터 정보|
|--- g_price|Integer|휘발유 가격|
|--- hg_price|Integer|고급휘발유 가격|
|--- d_price|Integer|경유 가격|
|--- l_price|Integer|LPG 가격|
|--- updatetime|String|Update 시간|
|--- priceinfo|String|최고,최저 유가 정보<br>(H:최고L:최저X:해당없음)<br>휘발유,고급휘발유, 경유, LPG 순|
|--- wash|Boolean|세차시설여부|
|--- fix|Boolean|정비가능여부|
|--- mart|Boolean|매점여부|

## 탐색

[API 도메인]

|환경|	도메인|
|:---:|:---:|
|Real|	https://api-maps.cloud.toast.com|

### 1. 경로 탐색 요약

#### 요청

[URL]

|Http method|	URI|
|:---:|:---:|
|GET|	/maps/v1.0/appkeys/{appkey}/routes?query={query}&coordtype={coordtype}&startposition={startposition}&reqcount={reqcount}&admcode={admcode}|

[Path parameter]

|값|	타입|	설명|
|:---:|:---:|:---:|
|appKey|	String|	고유의 appKey|

[Query Parameters]

|값|	타입|	필수|	설명|
|---|:---:|:---:|:---:|
|​startX|String|O|출발지 X좌표|
|​startY|String|O|출발지 Y좌표|
|​endX|String|O|도착지 X좌표|
|​endY|String|O|도착지 Y좌표|
|​viaCount|String|X|경유지 개수|
|​via1X|String|X|경유지1 X좌표|
|​via1Y|String|X|경유지1 Y좌표|
|​via2X|String|X|경유지2 X좌표|
|​via2Y|String|X|경유지2 Y좌표|
|​option|String|O|경로탐색 옵션<br>탐색 option "," 단위로 요청<br>ex) option=real_traffic,real_traffic2<br>freeroad_priority : 무료<br>highway_priority : 고속도로<br>real_traffic : 실시간<br>real_traffic_freeroad : 실시간 (무료)<br>real_traffic : 추천1<br>real_traffic2 : 추천2<br>rt_stats : 실시간통계<br>rt_stats_freeroad : 실시간통계(무료)<br>short_distance_priority : 단거리<br>stats : 통계<br>stats_freeroad : 통계(무료)<br>motorcycle : 이륜차|



#### 응답

```
{
  "header": {
    "isSuccessful": true,
    "resultCode": 0,
    "resultMessage": ""
  },
  "route": {
    "SummaryResult": [
      [
        "freeroad_priority",
        68418,
        122
      ],
      [
        "highway_priority",
        77303,
        89
      ],
      [
        "real_traffic",
        63641,
        94
      ],
      [
        "real_traffic_freeroad",
        64469,
        119
      ],
      [
        "recoomendation1",
        4294967295,
        0
      ],
      ...
    ]
  }
}
```

|값|	타입|	설명|
|---|:---:|:---:|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|route|	Object|	본문 영역|
|- SummaryResult|	Array|	요청 경로 결과 리스트|
|-- 0|	String|	옵션 명|
|-- 1|	Integer|	경로 탐색 거리 (단위 : m)|
|-- 2|	Integer|	경로 탐색 시간 (단위 : 분)|


### 2. 경로 탐색 상세

#### 요청

[URL]

|Http method|	URI|
|:---:|:---:|
|GET|	/maps/v1.0/appkeys/{appkey}/route-details?query={query}&coordtype={coordtype}&startposition={startposition}&reqcount={reqcount}&admcode={admcode}|

[Path parameter]

|값|	타입|	설명|
|:---:|:---:|:---:|
|appKey|	String|	고유의 appKey|

[Query Parameters]

|값|	타입|	필수|	설명|
|---|:---:|:---:|:---:|
|​startX|String|O|출발지 X좌표|
|​startY|String|O|출발지 Y좌표|
|​endX|String|O|도착지 X좌표|
|​endY|String|O|도착지 Y좌표|
|​viaCount|String|X|경유지 개수|
|​via1X|String|X|경유지1 X좌표|
|​via1Y|String|X|경유지1 Y좌표|
|​via2X|String|X|경유지2 X좌표|
|​via2Y|String|X|경유지2 Y좌표|
|​option|String|O|경로탐색 옵션<br>탐색 option 하나만 가능<br>ex) option=real_traffic<br>freeroad_priority : 무료<br>highway_priority : 고속도로<br>real_traffic : 실시간<br>real_traffic_freeroad : 실시간 (무료)<br>real_traffic : 추천1<br>real_traffic2 : 추천2<br>rt_stats : 실시간통계<br>rt_stats_freeroad : 실시간통계(무료)<br>short_distance_priority : 단거리<br>stats : 통계<br>stats_freeroad : 통계(무료)<br>motorcycle : 이륜차|



#### 응답

```
{
  "header": {
    "isSuccessful": true,
    "resultCode": 0,
    "resultMessage": ""
  },
  "routeDetail": {
    "DtlInfoRec": [
      [
        8,
        0,
        0,
        -1,
        -1,
        5,
        1
      ],
      [
        79,
        12,
        1,
        -1,
        -1,
        5,
        2
      ],
      ...
    ],
    "NameRec": [
      "일반도로",
      "판교역로242번길",
      "판교역로226번길",
      "일반도로",
      "대왕판교로644번길",
      "우회전",
      "우회전",
      "우회전",
      "백현동,판교(판교테크노밸리)역"
    ],
    "RestRec": [],
    "RouteInfo": {
      "cross_name_cnt": 0,
      "dir_name_cnt": 1,
      "dist": 456,
      "dtl_cnt": 6,
      "max_x": 169113,
      "max_y": 517952,
      "min_x": 169034,
      "min_y": 517648,
      "rd_name_cnt": 5,
      "rest_cnt": 0,
      "sec_cnt": 5,
      "time": 3,
      "toll_cnt": 0,
      "vtx_cnt": 11
    },
    "SecInfoRec": [
      [
        8,
        0,
        0,
        1,
        0
      ],
      [
        126,
        14,
        1,
        2,
        1
      ],
      ...
    ],
    "VtxRec": [
      [
        169038,
        517943
      ],
      [
        169038,
        517952
      ],
      [
        169109,
        517952
      ],
      ...
    ]
  }
}
```

|값|	타입|	설명|
|---|:---:|:---:|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|routeDetail|	Object|	본문 영역|
|- RouteInfo|	Object|	경로 정보|
|-- dist|Integer|	경로의 총 길이 (단위 : m)|
|-- time|Integer|	경로의 총 소요시간 (단위 : 분)|
|-- sec_cnt|Integer|	구간정보 레코드 개수|
|-- dtl_cnt|Integer|	구간 상세정보 레코드 개수|
|-- rd_name_cnt|Integer|	도로 명칭 레코드 개수|
|-- guide_name_cnt|Integer|	안내 명칭 레코드 개수|
|-- cross_name_cnt|Integer|	교차로 명칭 레코드 개수|
|-- dir_name_cnt|Integer|	방면 명칭 레코드 개수|
|-- vtx_cnt|Integer|	보간점(경로 벡터 좌표) 개수|
|-- rest_cnt|Integer|	휴게소 개수|
|-- toll_cnt|Integer|	요금소 개수|
|-- max_x|Integer|	보간점 레코드 중 최대 X 좌표|
|-- max_y|Integer|	보간점 레코드 중 최대 Y 좌표|
|-- min_x|Integer|	보간점 레코드 중 최소 X 좌표|
|-- min_y|Integer|	보간점 레코드 중 최소 Y 좌표|
|- SecInfoRec|	Array|	구간정보 레코드|
|-- 0|	Integer|	구간의 거리(미터)|
|-- 1|	Integer|	구간 속도|
|-- 2|	Integer|	도로번호 혹은 도로 명칭 인덱스|
|-- 3|	String|	구간 상세 정보 레코드 개수|
|-- 4|	String|	구간 상세 정보 테이블 인덱스|
|- DtlInfoRec|	Array|	구간상세정보 레코드|
|-- 0|	Integer|	구간 상세 거리|
|-- 1|	Integer|	구간 상세 속도|
|-- 2|	String|	안내명칭 인덱스|
|-- 3|	String|	교차로명칭 인덱스|
|-- 4|	String|	방면명칭 인덱스|
|-- 5|	String|	도로 종별|
|-- 6|	Integer|	안내지점 보간점 인덱스|
|- NameRec|	Array|	명칭레코드|
|-- 0|	String|	고속도로명칭 or 안내명칭 or 교차로명칭 or 방면명칭|
|- VtxRec|	Array|	보간점 레코드- 경로 벡터 좌표 배열<br>[[twX1, twY1], [twX2, twY2], … [twXn, twYn]]|
|-- 0|	Integer|	twX|
|-- 1|	Integer|	twY|
|- RestRec|	Array|	명칭레코드|
|-- 0|	String|	고속모드 코드|
|-- 1|	String|	주유소 업체 코드 <br>(0 : 없음, 1 : LG 주유소, 2 : SK 주유소, 3 : 쌍용 주유소, 4 : 한화 주유소, 5 : 현대 주유소)|
|-- 2|	String|	LPG 유무 <br>[0:없음, 1:있음]|
|-- 3|	String|	정비소 유무 <br>[0:없음, 1:있음]|
|-- 4|	String|	고속모드 타입|
|-- 5|	String|	Reserved|
|-- 6|	String|	휴게소 명칭|

### 3. 경로 탐색 상세(json Parsing)

#### 경로 탐색 결과 값을 보기 쉽게 Parsing

```
<script type="text/javascript src="https://api-maps.cloud.toast.com/maps/js/v1.0/route.js" > </script>
<script type="text/javascript">
function fnRouteParse(data){ // 경로 탐색 상세 결과값

  var routeParsing = route.jsonParsing(data);
  routeParsing.routeSummaryInfo;		// 탐색 결과 종합
  routeParsing.routeDetailInfo;		// 탐색 경로 리스트
  routeParsing.vtxInfo; 			// 지도 그리기용 좌표 리스트
}
</script>

```

|값|	타입|	설명|
|---|:---:|:---:|
|routeSummaryInfo|	Object|	탐색 결과 종합|
|- distance|	Integer|	경로 총길이 (단위 : m)|
|- time|	Integer|	경로의 총 소요시간 (단위 :분)|
|- max_x|	String|	보간점 레코드 중 최대 X 좌표|
|- max_y|	String|	보간점 레코드 중 최대 Y 좌표|
|- min_x|	String|	보간점 레코드 중 최소 X 좌표|
|- min_y|	String|	보간점 레코드 중 최소 Y 좌표|
|routeDetailInfo|	Array|	탐색 경로 리스트|
|- distance|	Integer|	구간 상세거리 (단위 : m)|
|- speed|	Integer|	구간 상세 속도 (단위 : km/h)|
|- roadName|	String|	도로명|
|- direction|	String|	방향 정보|
|- district|	String|	방면 정보|
|- cross|	String|	안내 정보|
|- directionDetail|	String|	상세 경로 설명|
|vtxInfo|	Array|	지도 그리기용 좌표 리스트|
|- 0|	Integer|	twX|
|- 1|	Integer|	twY|


## 결과 코드
|resultCode|	resultMessage|	설명|	비고|
|:---:|:---:|:---:|:---:|
|0|	|성공|	공통|
|100|Result Not Found|		결과없음|	검색전용|
|101|Argument Error|	파라미터 오류|	공통|
|102|Internal Server Error|서버 오류|	검색전용|
|201|	Searching for Security| POI	보안시설물|	검색전용|
|202|	Longitude/Latitude |경위도|	검색전용|
|203|	Mobile Phone Number|전화번호(Mobile)|	검색전용|
|204|	Invalid Query|기타 입력 범위 오류|	검색전용
|205|	POI not in given Admin|결과없음(지역설정)|	검색전용|
|206|	POI not in given Area|결과없음(영역설정)|	검색전용|
|207|	POI not in given Category|결과없음(분류설정)|	검색전용|
|208|	Neighbor Search Only|결과없음(주변검색만입력)|	검색전용|
|209|	Neighbor Search not Found|결과없음(주변 + 키워드 검색 결과 없음)|	검색전용|
|300|	AppKey Error|AppKey 인증 오류	|공통|
