title=About
date=2013-09-24
type=page
status=published
big=TCGame
summary=TCGamebaseAosUI
nation=ko
~~~~~~
## Game > Gamebase > Android Developer's Guide > UI

## WebView

### Browser Style WebView

기본으로 설정된 브라우저 스타일의 WebView를 노출합니다.

    Gamebase.WebView.showWebBrowser(activity, "http://cloud.toast.com");

![Webview Example](http://static.toastoven.net/prod_gamebase/DevelopersGuide/aos-developers-guide-ui-001_1.0.0.png)

### Popup Style WebView (향후 지원예정)

기본으로 설정된 팝업 스타일의 WebView를 노출합니다.

    Gamebase.WebView.showWebPopup(activity, "http://cloud.toast.com");

### Custom WebView

Custom WebView를 노출합니다.  
GamebaseWebViewConfiguration 설정으로 WebView를 Customizing 할 수 있습니다.

```
    GamebaseWebViewConfiguration configuration
            = new GamebaseWebViewConfiguration.Builder()
                .setStyle(GamebaseWebViewStyle.BROWSER)
                .setTitleText("title")                              // 웹뷰 타이틀 설정
                .setScreenOrientation(ScreenOrientation.PORTRAIT)   // 웹뷰 스크린 방향 설정
                .setNavigationBarColor(Color.RED)                   // 네비게이션바 색상 설정
                .setNavigationBarHeight(40)                         // 네비게이션바 높이 설정
                .setBackButtonVisible(true)                         // 백 버튼 활성화 여부 설정
                .setBackButtonImageResource(R.id.back_button)       // 백 버튼 이미지 설정
                .setCloseButtonImageResource(R.id.close_button)     // 닫기 버튼 이미지 설정
                .build();
    GamebaseWebView.showWebView(MainActivity.this, "http://cloud.toast.com", configuration);
```
	
<table>

<thead>

<tr>

<th>Method</th>

<th>Values</th>

<th>Description</th>

</tr>

</thead>

<tbody>

<tr>

<td>setStyle(int style)</td>

<td>GamebaseWebViewStyle.BROWSER</td>

<td>브라우저 스타일의 웹뷰</td>

</tr>

<tr>

<td>GamebaseWebViewStyle.POPUP</td>

<td>팝업 스타일의 웹뷰</td>

</tr>

<tr>

<td>setTitleText(String title)</td>

<td>title</td>

<td>웹뷰의 타이틀</td>

</tr>

<tr>

<td>setScreenOrientation(int orientation)</td>

<td>ScreenOrientation.PORTRAIT</td>

<td>세로모드</td>

</tr>

<tr>

<td>ScreenOrientation.LANDSCAPE</td>

<td>가로모드</td>

</tr>

<tr>

<td>ScreenOrientation.LANDSCAPE_REVERSE</td>

<td>가로모드를 180도 회전</td>

</tr>

<tr>

<td>setNavigationBarColor(int color)</td>

<td>Color.argb(a, r, b, b)</td>

<td>네비게이션바 색상</td>

</tr>

<tr>

<td>setBackButtonVisible(boolean visible)</td>

<td>true or false</td>

<td>백 버튼 활성 or 비활성</td>

</tr>

<tr>

<td>setNavigationBarHeight(int height)</td>

<td>height</td>

<td>네비게이션바 높이</td>

</tr>

<tr>

<td>setBackButtonImageResource(int resourceId)</td>

<td>ID of resource</td>

<td>백 버튼 이미지</td>

</tr>

<tr>

<td>setCloseButtonImageResource(int resourceId)</td>

<td>ID of resource</td>

<td>닫기 버튼 이미지</td>

</tr>

</tbody>

</table>

## Alert

Android System Alert Dialog를 간단하게 노출 할 수 있는 API를 제공합니다.

### Simple Alert Dialog

타이틀과 메시지 입력만으로 간단하게 Alert Dialog를 노출할 수 있습니다.

    Gamebase.Util.showAlertDialog(activity, "title", "message");

![Alert Dialog Example](http://static.toastoven.net/prod_gamebase/DevelopersGuide/aos-developers-guide-ui-002_1.0.0.png)

### Alert Dialog with Listener

Alert Dialog 노출 후 처리 결과를 콜백 받고 싶을 경우 다음 API를 사용합니다.

```
    Gamebase.Util.showAlertDialog(activity,
                                "title",                        // 타이틀 텍스트.
                                "messsage",                     // 메시지 텍스트.
                                "OK",                           // 긍정 버튼 텍스트.
                                positiveButtonEventListener,    // 긍정 버튼이 눌러졌을 때 호출되는 Listener.
                                "Cancel",                       // 부정 버튼 텍스트.
                                negativeButtonEventListener,    // 부정 버튼이 눌러졌을 때 호출되는 Listener.
                                backKeyEventListener,           // Alert Dialog가 취소되면 호출되는 Listener.
                                true);                          // Alert Dialog를 취소할 수 있는지 여부를 설정.
```

## Toast

Android의 Toast를 간단하게 노출 할 수 있는 API를 제공합니다.

```
    Gamebase.Util.showToast(activity,
                            "message",              // 노출 할 메시지 텍스트
                            Toast.LENGTH_SHORT);    // 메시지를 표시하는 시간 (Toast.LENGTH_SHORT or Toast.LENGTH_LONG)
```

## Custom Maintenance Page

점검 상태에서 "자세히 보기" 클릭 시 노출되는 점검 페이지를 변경할 수 있습니다.

*   커스텀 지정 웹페이지로 점검 페이지 등록
    *   AndroidManifest.xml에 "com.gamebase.maintenance.detail.url" 를 키 값으로 하는 meta-data를 설정합니다.
    *   android:value의 값으로 .html 파일 또는 URL을 입력할 수 있습니다.

```	
    <meta-data
        android:name="com.gamebase.maintenance.detail.url"
        android:value="file:///android_asset/html/gamebase-maintenance.html"/>
```

## Error Handling

<table>

<thead>

<tr>

<th>Error</th>

<th>Error Code</th>

<th>Notes</th>

</tr>

</thead>

<tbody>

<tr>

<td>UI_UNKNOWN_ERROR</td>

<td>6999</td>

<td>알 수 없는 에러입니다. (정의되지 않은 에러입니다.)</td>

</tr>

</tbody>

</table>

*   전체 에러코드 참조 : [LINK [Entire Error Codes]](../error-codes#client-sdk)