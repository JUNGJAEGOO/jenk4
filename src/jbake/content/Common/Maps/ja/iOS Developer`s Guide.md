title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > Maps > iOS Developer's Guide

## 지도

### 1. iOS WebView 지도

iOS에서 API를 호출하고 콜백함수로 매개변수를 전달받는 방법에 대해서 설명합니다.


#### A. 주요 TOAST Cloud Maps iOS WebView API 안내
##### 추가적인 TOAST Cloud Maps iOS WebView API 사용법은 해당 <a href="http://developers1.inavi.com:8086?key=19b6272o5" target="_blank" rel="nofollow">링크</a>를 참조 하시기 바랍니다.  

> ※ TOAST Cloud Maps API에서 사용되고 있는 좌표는 팅크웨어 전용 좌표로만 사용되고 있습니다.
<br>팅크웨어 좌표를 위경도 좌표(WGS84)로 변환하기 위해서는 TMWA.getWgs84FromTw() 함수를 이용하여 변경하시고,
반대로 위경도 좌표(WGS84)를 팅크웨어 좌표로 변환하기 위해서는 TMWA.getTwFromWgs84() 함수를 이용하시기 바랍니다.


|API 명|Parameter				|Callback Method|Callback Parameter| 설명			|
|:------:|:------------------------:|:---------------:|:------------------:|:----------------:|
|TMWI.initMap(map_div_name, twX, twY, level, arrange_type, map_type)|map_div : String<br>	지도를 담을 div 태그 ID	|initCB <br><br>|지도 초기화 성공여부<br>'true' : 성공<br> 'false' : 실패|지도를 사용하기 위해서 최초에 반드시 호출해야 하는 초기화 함수입니다.|
||twX : Number	<br>지도 초기화 TW X 좌표||||
||twY : Number	<br>지도 초기화 TW Y 좌표||||
||level : Number	<br>지도 초기화 Level<br>- 일반지도 : 1~13<br>- 항공지도 : 1~13||||
||arrange_type : Number	<br>지도 레이어 정렬방식<br>1 : 중앙정렬방식(resize효과 있음)<br>2 : 전체로딩방식(resize효과 없음)<br> 3 : 우상단정렬방식(resize효과 있음)||||
||map_type : String	<br>지도 타입 설정<br>'i' : 일반맵<br>'a' : 항공맵<br>'s' : 요약맵||||
|TMWI.getLevel()||getLevelCB |지도의 현재 레벨|지도의 레벨을 얻어옵니다.|
|TMWI.getCenter()||getCenterCB|지도의 현재 중심좌표<br> 'twX&#124;twY' |지도의 중심좌표를 얻어옵니다.|
|TMWI.getExtent()||getExtentCB|지도의 영역좌표<br> 'leftX&#124;topY&#124;rightX&#124;bottomY' |현재 지도가 표출되는 영역좌표를 얻어옵니다.|
|TMWI.setMoveend()||moveendCB|	확대,축소,이동 후 지도 중심좌표와 레벨 <br>'twX&#124;twY&#124;level'|지도에 moveend 이벤트를 등록합니다.<br>moveend : 지도 확대,축소,이동이 끝났을 때|
|TMWI.removeMoveend()||||지도에서 moveend 이벤트를 제거합니다.|
|TMWI.setTouchend()||setTouchendCB|터치한 지도 좌표<br> 'twX&#124;twY'|지도에 touchend 이벤트를 등록합니다.<br>  touchend : 지도 터치가 끝났을 때|
|TMWI.removeTouchend()||||지도에서 touchend 이벤트를 제거합니다.|
|TMWI.setZoomend()||zoomendCB|	확대,축소 후 지도 중심좌표와 레벨<br> 'twX&#124;twY&#124;level'|지도에 zoomend 이벤트를 등록합니다. <br> zoomend : 지도 확대,축소가 끝났을 때|
|TMWI.removeZoomend()||||지도에서 zoomend 이벤트를 제거합니다.|
|TMWI.setTouchEvent(event_name)|event_name : String<br>	등록할 이벤트 이름<br> 'touchstart' : 지도터치를 시작했을때<br>  'touchend' : 지도 터치가 끝났을 때<br>  'longpress' : 지도를 길게 눌렀을 때|setTouchEventCB|발생한 이벤트와 터치한 지도 좌표 <br>'event_name&#124;twX&#124;twY'|지도에 touch관련 이벤트를 등록합니다.|
|TMWI.removeTouchEvent(event_name)|event_name : String<br>	등록할 이벤트 이름<br> 'touchstart' : 지도터치를 시작했을때<br>  'touchend' : 지도 터치가 끝났을 때<br>  'longpress' : 지도를 길게 눌렀을 때|||지도에서 touch관련 이벤트를 제거합니다.|
|TMWI.createAndAddMarker(twX, twY, iconWidth, iconHeight, iconUrl, [param])|twX : Number<br>Marker 객체의 TW X 좌표|createMarkerCB|Marker 객체 아이디와 사용자 변수 param<br> 'marker_id&#124;param'|Marker 객체를 생성하고 지도에 추가합니다.|
||twY : Number	<br>Marker 객체의 TW Y 좌표||||
||iconWidth : Number <br>Marker 이미지 너비||||
||iconHeight : Number <br>Marker 이미지의 높이||||
||iconURL : String <br>Marker 이미지의 URL||||
||param : String <br>Marker 객체의 사용자 변수||||
|TMWI.setTouchendMarkerCB(id)|id : Number<br>이벤트를 등록할 대상 Marker 객체 아이디|touchendMarkerCB|Marker 객체 아이디와 Marker 객체의 TW X좌표, TW Y좌표,<br> 사용자 변수 param<br> 'marker_id&#124;twX&#124;twY&#124;param'|Marker 객체에 touchend 이벤트를 등록합니다.|
|TMWI.removeTouchendMarker(id)|id : Number<br>이벤트를 제거할 대상 Marker 객체 아이디|||Marker 객체에 touchend 이벤트를 제거합니다.|
|TMWI.getTwFromWgs84(lon, lat)|lon : Number<br>변환할 WGS84 경도 좌표|getTwFromWgs84CB|변환된 TW 좌표 <br>'twX&#124;twY'|WGS84 좌표를 TW 좌표로 변환합니다.|
||lat : Number<br>변환할 WGS84 위도 좌표||||
|TMWI.getWgs84FromTw(twX, twY)|twX: Number<br>변환할 TW X 좌표|getWgs84FromTwCB|변환된 WGS84 좌표 <br>'lon&#124;lat'|TW 좌표를 WGS84 좌표로 변환합니다.|
||twY : Number<br>변환할 TW Y 좌표||| - |
