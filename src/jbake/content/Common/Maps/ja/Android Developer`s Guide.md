title=About
date=2013-09-24
type=page
status=published
big=TCCommon
summary=MapsAndroidDV's
~~~~~~
## Common > Maps > Android Developer's Guide

## 지도

### 1. Android WebView 지도

Android에서 API를 호출하고 콜백함수로 매개변수를 전달받는 방법에 대해서 설명합니다.

#### A. 주요 TOAST Cloud Maps Android WebView API 안내
##### 추가적인 TOAST Cloud Maps Android WebView API 사용법은 해당 <a href="http://developers1.inavi.com:8086?key=19b6272o5" target="_blank" rel="nofollow">링크</a>를 참조 하시기 바랍니다.  

> ※ TOAST Cloud Maps API에서 사용되고 있는 좌표는 팅크웨어 전용 좌표로만 사용되고 있습니다.
<br>팅크웨어 좌표를 위경도 좌표(WGS84)로 변환하기 위해서는 TMWA.getWgs84FromTw() 함수를 이용하여 변경하시고,
반대로 위경도 좌표(WGS84)를 팅크웨어 좌표로 변환하기 위해서는 TMWA.getTwFromWgs84() 함수를 이용하시기 바랍니다.


|API 명|Parameter				|Callback Method|Callback Parameter| 설명			|
|:------:|:------------------------:|:---------------:|:------------------:|:----------------:|
|TMWA.initMap(map_div_name, twX, twY, level, arrange_type, map_type)|map_div : String<br>	지도를 담을 div 태그 ID	|initCB <br><br>|지도 초기화 성공여부<br>'true' : 성공<br> 'false' : 실패|지도를 사용하기 위해서 최초에 반드시 호출해야 하는 초기화 함수입니다.|
||twX : Number	<br>지도 초기화 TW X 좌표||||
||twY : Number	<br>지도 초기화 TW Y 좌표||||
||level : Number	<br>지도 초기화 Level<br>- 일반지도 : 1~13<br>- 항공지도 : 1~13||||
||arrange_type : Number	<br>지도 레이어 정렬방식<br>1 : 중앙정렬방식(resize효과 있음)<br>2 : 전체로딩방식(resize효과 없음)<br> 3 : 우상단정렬방식(resize효과 있음)||||
||map_type : String	<br>지도 타입 설정<br>'i' : 일반맵<br>'a' : 항공맵<br>'s' : 요약맵||||
|TMWA.getLevel()||getLevelCB |지도의 현재 레벨|지도의 레벨을 얻어옵니다.|
|TMWA.getCenter()||getCenterCB|지도의 현재 중심좌표<br> 'twX&#124;twY' |지도의 중심좌표를 얻어옵니다.|
|TMWA.getExtent()||getExtentCB|지도의 영역좌표<br> 'leftX&#124;topY&#124;rightX&#124;bottomY' |현재 지도가 표출되는 영역좌표를 얻어옵니다.|
|TMWA.setMoveend()||setMoveendCB|	확대,축소,이동 후 지도 중심좌표와 레벨 <br>'twX&#124;twY&#124;level'|지도에 moveend 이벤트를 등록합니다.<br>moveend : 지도 확대,축소,이동이 끝났을 때|
|TMWA.removeMoveend()||||지도에서 moveend 이벤트를 제거합니다.|
|TMWA.setTouchend()||setTouchendCB|터치한 지도 좌표<br> 'twX&#124;twY'|지도에 touchend 이벤트를 등록합니다.<br>  touchend : 지도 터치가 끝났을 때|
|TMWA.removeTouchend()||||지도에서 touchend 이벤트를 제거합니다.|
|TMWA.setZoomend()||setZoomendCB|	확대,축소 후 지도 중심좌표와 레벨<br> 'twX&#124;twY&#124;level'|지도에 zoomend 이벤트를 등록합니다. <br> zoomend : 지도 확대,축소가 끝났을 때|
|TMWA.removeZoomend()||||지도에서 zoomend 이벤트를 제거합니다.|
|TMWA.setTouchEvent(event_name)|event_name : String<br>	등록할 이벤트 이름<br> 'touchstart' : 지도터치를 시작했을때<br>  'touchend' : 지도 터치가 끝났을 때<br>  'longpress' : 지도를 길게 눌렀을 때|setTouchEventCB|발생한 이벤트와 터치한 지도 좌표 <br>'event_name&#124;twX&#124;twY'|지도에 touch관련 이벤트를 등록합니다.|
|TMWA.removeTouchEvent(event_name)|event_name : String<br>	등록할 이벤트 이름<br> 'touchstart' : 지도터치를 시작했을때<br>  'touchend' : 지도 터치가 끝났을 때<br>  'longpress' : 지도를 길게 눌렀을 때|||지도에서 touch관련 이벤트를 제거합니다.|
|TMWA.createAndAddMarker(twX, twY, iconWidth, iconHeight, iconUrl, [param])|twX : Number<br>Marker 객체의 TW X 좌표|createMarkerCB|Marker 객체 아이디와 사용자 변수 param<br> 'marker_id&#124;param'|Marker 객체를 생성하고 지도에 추가합니다.|
||twY : Number	<br>Marker 객체의 TW Y 좌표||||
||iconWidth : Number <br>Marker 이미지 너비||||
||iconHeight : Number <br>Marker 이미지의 높이||||
||iconURL : String <br>Marker 이미지의 URL||||
||param : String <br>Marker 객체의 사용자 변수||||
|TMWA.setTouchendMarkerCB(id)|id : Number<br>이벤트를 등록할 대상 Marker 객체 아이디|touchendMarkerCB|Marker 객체 아이디와 Marker 객체의 TW X좌표, TW Y좌표,<br> 사용자 변수 param<br> 'marker_id&#124;twX&#124;twY&#124;param'|Marker 객체에 touchend 이벤트를 등록합니다.|
|TMWA.removeTouchendMarker(id)|id : Number<br>이벤트를 제거할 대상 Marker 객체 아이디|||Marker 객체에 touchend 이벤트를 제거합니다.|
|TMWA.getTwFromWgs84(lon, lat)|lon : Number<br>변환할 WGS84 경도 좌표|getTwFromWgs84CB|변환된 TW 좌표 <br>'twX&#124;twY'|WGS84 좌표를 TW 좌표로 변환합니다.|
||lat : Number<br>변환할 WGS84 위도 좌표||||
|TMWA.getWgs84FromTw(twX, twY)|twX: Number<br>변환할 TW X 좌표|getWgs84FromTwCB|변환된 WGS84 좌표 <br>'lon&#124;lat'|TW 좌표를 WGS84 좌표로 변환합니다.|
||twY : Number<br>변환할 TW Y 좌표||| - |


#### TOAST Cloud Maps Android WebView API 사용하기

TOAST Cloud Maps Android WebView API를 사용하기 위해서는
안드로이드 프로젝트에 android.permission.INTERNET 권한을 추가해야합니다.
팅크웨어 WebView API는 웹페이지에 발급받은 appKey를 선언하여 해당 웹페이지를 웹뷰에서 호출하고
발급 키 권한에 따라 다운로드 된 API(자바스크립트)를 호출하고, 콜백함수를 연결하여 사용합니다.
※ 콜백 함수를 사용할 때 주의점 : 안드로이드 버전 4.2 이상에서는 아래와 같이 콜백 함수 위에
@JavascriptInterface 어노테이션을 꼭 써주시기 바랍니다.

```
@JavascriptInterface
public void setMoveendCB(String result){
	String msg = "moveend Event \n twX|twY|level : " + result;
	Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
	toast.show();
}

```


아래는 간단한 맵을 로딩하는 방법입니다.
아래의 예제에서 어떻게 웹페이지와 웹뷰간 API를 호출하고 이벤트 발생 시 콜백함수로 어떤 매개변수를 받는지 볼 수 있습니다.
아래 파일의 경로 : 프로젝트명\assets\www\android_webview.html

```
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title> Android API TEST </title>
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="https://api-maps.cloud.toast.com/maps/js/v1/map.js"></script>
	<script>
	    // 지도 사용을 위한 인증을 진행 합니다.
	    Map.authentification("appKey");
	</script>
	</head>
<body>
	<div id="div_map" style="position:absolute;top:0px;left:0px;width:100%;height:100%;z-index:10;"></div>
</body>
</html>

```
<center>**android_webview.html**</center>


```
public class MainActivity extends AppCompatActivity {
    private WebView mWebView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mWebView = (WebView) findViewById(R.id.webView);

        //자바스크립트 사용
        mWebView.getSettings().setJavaScriptEnabled(true);

        //웹뷰 클라이언트를 설정, 페이지 로딩 시작, 로딩 종료 등 이벤트를 얻어올 수 있음
        mWebView.setWebViewClient(new WebViewClientClass());

        // API로 부터 콜백
        // 자바스크립트로 부터 콜백 함수 발생 시 안드로이드에서 사용할 객체와 자바스크립트에서 사용할 객체 이름 설정
        mWebView.addJavascriptInterface(new AndroidBridge(), "tmjscall");
        // API 키로 권한이 부여된 Javascript 기반 팅크웨어 API 다운
        mWebView.loadUrl("file:///android_asset/www/android_webview.html");

    }

    // 웹뷰 이벤트 감지
    private class WebViewClientClass extends WebViewClient {

        @Override
        public void onPageFinished(WebView view, String url) { // 페이지 로딩이 끝나면
            // 지도를 초기화 한다
            mWebView.loadUrl("javascript:TMWA.initMap('div_map', 163670, 526934, 11, 2, 'i')");
            super.onPageFinished(view, url);
        }

    }

    // Android Bridge
    private class AndroidBridge {
        // TMWA.initMap 콜백함수
        @JavascriptInterface
        public void initCB(String init){
            String msg = "";
            if(init.equals("true")){
                msg = "지도 초기화 성공!";
            }else{
                msg = "지도 초기화 실패!";
            }
            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();
        }

    }

}

```
<center>**MainActivity.java**</center>



지도 초기화 & 정보 얻어오기
이 예제에서는 지도를 초기화 하고 지도 정보를 얻어오는 방법에 대해 설명합니다.
지도를 초기화 하는 방법은 두가지가 있습니다.
웹뷰에서 로딩할 페이지 android_webview.html에서 THINKMAP.initMap을 호출하는 방법과
안드로이드 프로젝트에서 TMWA.initMap을 사용하는 방법이 있습니다.
지도 초기화 이후에 추가로 해야할 작업이 있다면 TMWA.initMap을 사용하여 콜백함수에서 추가 처리 할 수 있습니다.
이 예제에서는 TMWA.initMap을 호출하는 방법을 사용하였습니다.


```
public class MainActivity extends AppCompatActivity {
    private WebView mWebView;

    //버튼
    Button getLevel, getCenter, getExtent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mWebView = (WebView) findViewById(R.id.webView);

        //자바스크립트 사용
        mWebView.getSettings().setJavaScriptEnabled(true);

        //웹뷰 클라이언트를 설정, 페이지 로딩 시작, 로딩 종료 등 이벤트를 얻어올 수 있음
        mWebView.setWebViewClient(new WebViewClientClass());

        // 자바스크립트로 부터 콜백 함수 발생 시 안드로이드에서 사용할 객체와 자바스크립트에서 사용할 객체 이름 설정
        mWebView.addJavascriptInterface(new AndroidBridge(), "tmjscall");
        // API 키로 권한이 부여된 Javascript 기반 팅크웨어 API 다운
        mWebView.loadUrl("file:///android_asset/www/android_webview.html");

        // 버튼 이벤트 연결
        getLevel = (Button) findViewById(R.id.getLevel);
        getLevel.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                mWebView.loadUrl("javascript:TMWA.getLevel()");
            }
        });

        getCenter = (Button) findViewById(R.id.getCenter);
        getCenter.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                mWebView.loadUrl("javascript:TMWA.getCenter()");
            }
        });

        getExtent = (Button) findViewById(R.id.getExtent);
        getExtent.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                mWebView.loadUrl("javascript:TMWA.getExtent()");
            }
        });

    }

    // 웹뷰 이벤트 감지
    private class WebViewClientClass extends WebViewClient {

        @Override
        public void onPageFinished(WebView view, String url) { // 페이지 로딩이 끝나면
            // 지도를 초기화 한다
            mWebView.loadUrl("javascript:TMWA.initMap('div_map', 163670, 526934, 11, 2, 'i')");
            super.onPageFinished(view, url);
        }

    }

    // Android Bridge
    private class AndroidBridge {
        // TMWA.initMap 콜백함수
        @JavascriptInterface
        public void initCB(String init){
            String msg = "";
            if(init.equals("true")){
                msg = "지도 초기화 성공!";
            }else{
                msg = "지도 초기화 실패!";
            }
            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();
        }

        //  TMWA.getLevel 콜백함수
        @JavascriptInterface
        public void getLevelCB(String level){
            String msg = "지도 레벨 :" + level;

            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();

        }

        // TMWA.getCenter 콜백함수
        @JavascriptInterface
        public void getCenterCB(String cn){
            String msg = "지도 중심 : " + cn;

            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();
        }

        // TMWA.getExtent 콜백함수
        @JavascriptInterface
        public void getExtentCB(String ex){
            String msg = "현재 지도영역 : " + ex;

            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();

        }

    }

}

```
<center>**MainActivity.java**</center>


지도 이벤트
<br>이 예제에서는 지도에 이벤트를 등록하고 제거하는 방법에 대해 설명합니다.

```
public class MainActivity extends AppCompatActivity {
    private WebView mWebView;

    //버튼
    Button btnMove, btnTouchend, btnZoom, btnTouch;
    Boolean moveFlag = false;
    Boolean touchendFlag = false;
    Boolean zoomFlag = false;
    Boolean touchFlag = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // 공통 코드 생략 (지도 초기화 예제 참조)

        // 버튼 이벤트 등록
        btnMove = (Button) findViewById(R.id.setMoveend);
        btnMove.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!moveFlag){
                    mWebView.loadUrl("javascript:TMWA.setMoveend()");
                    btnMove.setText("removeMoveend");
                    moveFlag = true;
                }else{
                    mWebView.loadUrl("javascript:TMWA.removeMoveend()");
                    btnMove.setText("setMoveend");
                    moveFlag = false;
                }
            }
        });

        btnTouchend = (Button) findViewById(R.id.setTouchend);
        btnTouchend.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!touchendFlag){
                    mWebView.loadUrl("javascript:TMWA.setTouchend()");
                    btnTouchend.setText("removeTouchend");
                    touchendFlag = true;
                }else{
                    mWebView.loadUrl("javascript:TMWA.removeTouchend()");
                    btnTouchend.setText("setTouchend");
                    touchendFlag = false;
                }
            }
        });

        btnZoom = (Button) findViewById(R.id.setZoomend);
        btnZoom.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!zoomFlag){
                    mWebView.loadUrl("javascript:TMWA.setZoomend()");
                    btnZoom.setText("removeZoomend");
                    zoomFlag = true;
                }else{
                    mWebView.loadUrl("javascript:TMWA.removeZoomend()");
                    btnZoom.setText("setZoomend");
                    zoomFlag = false;
                }

            }
        });

        btnTouch = (Button) findViewById(R.id.setTouchEvent);
        btnTouch.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!touchFlag){
                    //longpress 이벤트 발생시간을 2초로 설정,  설정하지 않은 경우 1.5초
                    mWebView.loadUrl("javascript:THINKMAP.setLongPressTime(2)");
                    mWebView.loadUrl("javascript:TMWA.setTouchEvent('longpress')");
                    btnTouch.setText("removeTouchEvent");
                    touchFlag = true;
                }else{
                    mWebView.loadUrl("javascript:TMWA.removeTouchEvent('longpress')");
                    btnTouch.setText("setTouchEvent");
                    touchFlag = false;
                }
            }
        });

    }

    // 웹뷰 이벤트 감지
    private class WebViewClientClass extends WebViewClient {

        @Override
        public void onPageFinished(WebView view, String url) { // 페이지 로딩이 끝나면
            // 지도를 초기화 한다
            mWebView.loadUrl("javascript:TMWA.initMap('div_map', 163670, 526934, 11, 2, 'i')");
            super.onPageFinished(view, url);
        }

    }

    // Android Bridge
    private class AndroidBridge {

        // setMoveend 콜백함수
        @JavascriptInterface
        public void setMoveendCB(String result){
            String msg = "moveend Event \n twX|twY|level : " + result;
            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();
        }

        // setTouchend 콜백함수
        @JavascriptInterface
        public void setTouchendCB(String result){
            String msg = "touchend Event \n twX|twY : " + result;
            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();
        }

        // setZoomend 콜백함수
        @JavascriptInterface
        public void setZoomendCB(String result){
            String msg = "zoomend Event \n twX|twY|level : " + result;
            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();
        }

        //setTouchEvent 콜백함수
        @JavascriptInterface
        public void setTouchEventCB(String result){
            String msg = "event_name|twX|twY :\n" + result;
            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();
        }

    }

}
```
<center>**MainActivity.java**</center>



지도 마커
<br>이 예제에서는 지도에 Marker를 추가하고 Marker에 이벤트를 등록하고 제거하는 방법에 대해 설명합니다.

```
public class MainActivity extends AppCompatActivity {
    private WebView mWebView;

    Button btnMarker;
    String marker_id = "";

    Button btnTouchend;

    Button btnRemoveTouchEnd;

    String imgUrl = "'http://dev.m.map.inavi.com/guide/img/img.png'";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // 공통 코드 생략 (지도 초기화 예제 참조)

        // 버튼 이벤트 연결
        btnMarker = (Button) findViewById(R.id.createMarker);
        btnMarker.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View arg0) {
                if(marker_id.equals("")){
                    String imgUrl = "'http://dev.m.map.inavi.com/guide/img/img.png'";
                    mWebView.loadUrl("javascript:TMWA.createAndAddMarker(163670, 526934, 47, 46, " + imgUrl + ", 'Marker')");
                }

            }
        });


        btnTouchend = (Button) findViewById(R.id.setTouchEnd);
        btnTouchend.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!marker_id.equals("")){
                    mWebView.loadUrl("javascript:TMWA.setTouchendMarkerCB(" + marker_id + ")");
                    Log.d("setEvent", "Marker");
                }
            }
        });

        btnRemoveTouchEnd = (Button) findViewById(R.id.removeTouchEnd);
        btnRemoveTouchEnd.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!marker_id.equals("")){
                    mWebView.loadUrl("javascript:TMWA.removeTouchendMarker(" + marker_id + ")");
                    Log.d("removeEvent", "Marker");
                }
            }
        });

    }

    // 웹뷰 이벤트 감지
    private class WebViewClientClass extends WebViewClient {

        @Override
        public void onPageFinished(WebView view, String url) { // 페이지 로딩이 끝나면
            // 지도를 초기화 한다
            mWebView.loadUrl("javascript:TMWA.initMap('div_map', 163670, 526934, 11, 2, 'i')");
            super.onPageFinished(view, url);
        }

    }

    // Android Bridge
    private class AndroidBridge {

        @JavascriptInterface
        public void createMarkerCB(String result){
            StringTokenizer st = new StringTokenizer(result, "|");

            if(st.hasMoreTokens())
                marker_id = st.nextToken();

            String msg = "Create Marker \n marker_id|param : " + result;
            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();

            Log.d("marker_id", marker_id);
        }

        @JavascriptInterface
        public void touchendMarkerCB(String result){
            String msg = "Touch End \n marker_id|twX|twY|param : " + result;
            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();
        }

    }

}

```
<center>**MainActivity.java**</center>

기타
<br>이 예제에서는 주소 검색, 경로 탐색과 좌표 변환, 계산하는 방법에 대해 설명합니다.

```
public class MainActivity extends AppCompatActivity {
    private WebView mWebView;

    Button btnTwFromWgs84, btnWgs84FromTw;

    String lon = "37.573264";
    String lat = "126.979594";
    String twX = "163670";
    String twY = "526934";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // 공통 코드 생략 (지도 초기화 예제 참조)

        // 버튼 이벤트 연결
        btnTwFromWgs84 = (Button) findViewById(R.id.twFromWgs84);
        btnTwFromWgs84.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                mWebView.loadUrl("javascript:TMWA.getTwFromWgs84(" + lon + "," +  lat + ")");
            }
        });

        btnWgs84FromTw = (Button) findViewById(R.id.wgs84FromTw);
        btnWgs84FromTw.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                mWebView.loadUrl("javascript:TMWA.getWgs84FromTw(" + twX + "," +  twY + ")");
            }
        });

    }

    // 웹뷰 이벤트 감지
    private class WebViewClientClass extends WebViewClient {

        @Override
        public void onPageFinished(WebView view, String url) { // 페이지 로딩이 끝나면
            // 지도를 초기화 한다
            mWebView.loadUrl("javascript:TMWA.initMap('div_map', 163670, 526934, 11, 2, 'i')");
            super.onPageFinished(view, url);
        }

    }
    // Android Bridge
    private class AndroidBridge {
        // WGS84 -> TW 콜백
        @JavascriptInterface
        public void getTwFromWgs84CB(String result){
            String msg ="twX, twY -> " + result;
            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();
        }
        // WGS84 -> TW 콜백
        @JavascriptInterface
        public void getWgs84FromTwCB(String result){
            String msg ="lon, lat -> " + result;
            Toast toast = Toast.makeText(mWebView.getContext(), msg, Toast.LENGTH_SHORT);
            toast.show();
        }
    }

}
```
<center>**MainActivity.java**</center>
