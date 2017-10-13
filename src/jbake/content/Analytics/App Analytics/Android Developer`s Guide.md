title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > App Analytics > Android Developer\`s Guide

# 시작하기

이 문서는 Android에서 Analytics SDK를 연동하기 위한 방법에 대해 설명합니다. Analytics SDK를 사용하기 위해서는 먼저 앱을 등록해야 합니다. 앱 등록 방법은 [링크](/Analytics/App%20Analytics/Getting%20Started/#_4)를 참고하세요.


# 프로젝트 설정


## SDK 다운로드

1. Analytics SDK 다운로드
    <http://docs.cloud.toast.com/ko/Download/>에서 Android SDK 파일을 다운로드 합니다.
2. 구글 서비스 API 다운로드
    Analytics SDK에서는 Advertising ID를 사용하기 위해서 Google Player Serverice가 필요합니다.
    안드로이드 SDK Manager를 이용하여 구글 플레이 서비스 API(google-play-service.jar) 를 다운로드 받습니다.
    (<https://developer.android.com/sdk/installing/adding-packages.html>)


## 프로젝트설정

### 라이브러리 dependency 설정 (Eclipse)
다운로드 받은 GameAnalyticsSDK_Android_v1.xxx.zip 파일의 압축을 풀면 ToastAnalyticsSDK라는 Android 프로젝트가 생기고 해당 프로젝트를 워크스페이스에 추가한 후 dependency설정을 해주면 됩니다.

dependency 설정은 사용자 프로젝트 루트 폴더에서 우클릭 > Properties > Android 섹션의 Library에서 Add버튼을 통해 추가할 수 있으며 목록 중 ToastAnalyticsSDK를 선택하시면 됩니다.

다운로드 받은 구글 서비스 API 의 경우 jar 형태가 아닌 안드로이드 라이브러리 이므로, 해당 라이브러리를 이클립스로 import 해야 사용자 프로젝트에서 사용할 수 있습니다.
(<http://developer.android.com/google/play-services/setup.html>)
이클립스에 구글 서비스 API를 라이브러리로 import 한 후, 위에서 ToastAnalyticsSDK를 추가할때와 마찬가지로 Properties > Android > Library에서 Add버튼을 눌러 google-play-services를 선택하시면 됩니다.


### 라이브러리 dependency 설정 (Android Studio)
다운로드 받은 GameAnalyticsSDK_Android_v1.xxx.zip 파일의 압축을 풀면 ToastAnalyticsSDK라는 Android 프로젝트가 생기고 해당 프로젝트를 모듈로 추가한 후 dependency설정을 해주면 됩니다.

Android Studio에서 프로젝트 생성 후 File - New - Import Module 메뉴를 선택합니다.

![Import Module Step1](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_aos_003.png)

압축을 푼 ToastAnalyticsSDK Android 프로젝트 경로를 선택합니다.

![Import Module Step2](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_aos_004.png)

적절한 옵션을 체크하고 다음으로 진행합니다. 일반적으로는 기본값을 사용합니다.

![Import Module Step3](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_aos_005.png)


모듈을 추가한 후 dependency를 설정해야 합니다.

먼저 File 메뉴에서 Project Structure를 선택합니다.

![Project Setting 1](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_aos_006.png)

ToastAnalyticsSDK를 Module로 추가했기 때문에 Module dependency를 선택합니다.

![Project Setting 2](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_aos_007.png)

toastAnalyticsSDK를 선택하여 dependency를 추가합니다.

![Project Setting 3](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_aos_008.png)

google play service 라이브러리도 dependency를 추가해야 합니다.
이미 프로젝트에 google play service가 추가되어 있다면 이 단계는 건너뛸 수 있습니다.

![Project Setting 4](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_aos_009.png)

google play service 버전은 환경에따라 다를 수 있습니다. Toast Analytics SDK를 적용하기 위해서는 Google Play Services 7.5 이상 버전이 필요합니다.

![Project Setting 5](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_aos_010.png)

* ToastAnalytics SDK 라이브러리에 포함된 AndroidManifest.xml 파일의 'Application' 엘리먼트는 삭제할 수 있습니다.

### AndroidManifest 설정
Analytics SDK에서는 다음과 같은 Permission을 사용합니다.


```xml
<!-- 단말기 모뎀 상태(ex. 망 사업자명) 조회를 위해 사용합니다. -->
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
<uses-permission android:name="android.permission.INTERNET" />
```

**참고(사업담당자와 확인 필요):**
"READ_PHONE_STATE" 권한의 경우 Android 6.0 이상에서 Runtime permission에 해당합니다.
때문에, App 실행시마다 사용자에게 해당 권한 허가 여부를 묻는 팝업이 노출될 필요가 있습니다.
해당 Permission을 설정하지 않는 경우, "이용자 상세>통신사" 지표가 제공되지 않으며, 타 지표 영향도는 없습니다.
**해당 지표 필요 여부에 따라, READ_PHONE_STATE Permission 요청 부분은 삭제가 가능합니다.**

스토어 정보는 사용자가 앱을 다운로드한 마켓에 대한 정보를 추적하기 위한 설정입니다.
현재 사용할 수 있는 스토어는 아래와 같습니다.
(정의된 스토어 이외의 값을 사용하면 '기타'로 분류됩니다. 스토어 추가가 필요한 경우 관리자에게 문의하세요.)

스토어 | 입력문자열 (android:value=)
------------- | -------------
Google Play Store | Google
Apple App Store | Apple
Naver Store | Naver
T-Store | Tstore
One Store | onestore
China AOS-360 | CN_360
China AOS-Baidu | CN_Baidu
China AOS-Xiaomi | CN_Xiaomi
China AOS-UC | CN_UC
China AOS-Bilibili | CN_Bilibili
China AOS-Flyme | CN_Flyme
China AOS-37 | CN_37
China AOS-Otaku | CN_Otaku
China AOS-OPPO | CN_Oppo
China AOS-HUAWEI | CN_Huawei
China AOS-ANZHI | CN_Anzhi
China AOS-WANDOU | CN_Wandou
China AOS-OtakuChannel | CN_OtakuChannel
China AOS-Tencent | CN_Tencent
China AOS-Lenovo | CN_Lenovo
China AOS-XINDNG| CN_Xindong
China AOS-Site 직접 배포(*마켓을 거치지 않음) | CN_Direct

```xml
<manifest>
    ……
    <application>
        ……
        <!-- 스토어 정보 설정 -->
        <meta-data
            android:name="com.toast.android.analytics.appstore"
            android:value="Google" />
        ……
    </application>
</manifest>
```


설치 유입경로 분석을 위해서는 Install Receiver 설정이 필요합니다. (Google Play를 통해서 앱을 설치하는 경우에만 동작합니다.)

```xml
<manifest>
    ……
    <application>
        ……
        <receiver
            android:name="com.toast.android.analytics.InstallReferrerReceiver"
            android:exported="true">
            <intent-filter>
                <action android:name="com.android.vending.INSTALL_REFERRER"/>
            </intent-filter>
        </receiver>
        ……
    </application>
</manifest>
```


동일한 Action을 처리하는 Broadcast Receiver는 앱 내에서 하나만 등록할 수 있습니다. 여러곳에서 Install Referrer를 사용하는 경우 반드시 아래 가이드를 따라서 설정해야 합니다.

Receiver는 하나만 등록하고 meta-data를 이용하여 다른 Receiver들을 추가합니다.

Install Receiver 설정이 잘못된 경우 신규 사용자 집계가 잘못될 수 있습니다.

다른 리시버를 추가로 등록하기 위해서는 아래 설정과 같이 meta-data로 주가합니다. 이때 android:value는 해당 리시버의 Class명을 적어줍니다.

```xml
<receiver
    android:name="com.toast.android.analytics.InstallReferrerReceiver"
    android:exported="true">
    <intent-filter>
        <action android:name="com.android.vending.INSTALL_REFERRER"/>
    </intent-filter>

    <meta-data android:name="forward1" android:value="Receiver-Class-Name" />
    <meta-data android:name="forward2" android:value=" Receiver-Class-Name" />
</receiver>
```

# API 연동

Toast Analytics는 연동된 API 에 따라 다양한 지표를 제공 하고 있습니다.  
필수 연동 API 만 연동해도  이용자 유입/유출 및 이탈과 관련한 모든 지표가 제공되며, 컨텐츠 및  추적이 필요한 지표 유형에 맞춰 적절한 API 추가 연동이 필요합니다.

Toast Analytics 로그인 후, “상단 Menu>고객센터>데모보기” 를 참고하여, API 연동 범위를 확정 하기를 권장 드립니다.

|필수 연동 여부|구분|API|상세|관련 지표|   
|---|---|---|---|---|
|필수 연동|초기화|initializeSDK|클라이언트 SDK 모듈을 초기화합니다.|모니터링/글로벌모니터링/마케팅/유입&방문/이탈/이용자상세|
|필수 연동|세션추적|traceActivation, traceDeactivation|앱이 foreground로 활성화 or background로 활성화 될 때 호출합니다.|모니터링/글로벌모니터링/마케팅/유입&방문/이탈/이용자상세|
|필수 연동|이용자구분|setUserId|로그인 시, 사용자 ID를 입력할 경우 사용합니다. initializeSdk(..., true)인 경우에만 setUserId(userId, true) 형태로 사용합니다.|모니터링/글로벌모니터링/마케팅/유입&방문/이탈/이용자상세|
|선택적 연동|구매|tracePurchase|앱내에서 아이템을 구매했을 때 호출합니다. (In App Purchase)|매출/첫구매/LTV|
|선택적 연동|재화획득/사용|traceMoneyAcquisition, traceMoneyConsumption|앱내에서 머니를 획득하거나 소비 했을때 호출합니다.|밸런싱|
|선택적 연동|레벨업|traceLevelUp|레벨업이 되었을 때 호출합니다.|밸런싱|
|선택적 연동|친구수|traceFriendCount|친구수를 추적할때 호출합니다.|밸런싱|
|선택적 연동|Custom Event|traceEvent|사용자 정의 이벤트가 발생했을 때 호출합니다.|커스텀이벤트|


## 초기화

SDK를 사용하기 위해서는 앱 등록 후 발행되는 “앱 아이디”와 “컴퍼니 아이디”가 필요합니다. 앱 등록 방법은 링크(<http://docs.cloud.toast.com/ko/Analytics/App%20Analytics/Getting%20Started/#_4>)를 참고하세요.

initializeSDK 함수의 AppID는 앱 정보의 “AppKey”를, CompanyID는 “컴퍼니 아이디” 를 사용합니다.

![App Key](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_aos_002.png)

GameAnalytics SDK를 사용하기 위해서는 SDK 초기화를 먼저 수행해야 합니다.

GameAnalytics 클래스의 initializeSDK 함수는 SDK 초기화를 수행하는 함수입니다. 이 함수는 내부적으로 필요한 데이터(디바이스 정보, 앱 설정 정보)를 확인하고, 로그 전송을 위한 환경을 설정하는 작업을 수행합니다.


```java
import com.toast.android.analytics.GameAnalytics;

public class TestActivty extends Activity {

  @Override
  protected void onCreate(Bundle savedInstanceState)
  {
    super.onCreate();
    ……
    int result = GameAnalytics.initializeSdk(getApplicationContext(), “AppKey”, “CompanyID”, “AppVersion”, false);

    if (result != GameAnalytics.S_SUCCESS) {
        Log.d(TAG, "initialize error " + GameAnalytics.getResultMessage(result));
    }

}
```

## 사용자 구분 기준 설정

<span style="color:red;">운영중에 사용자 구분 기준을 변경하면 변경 전/후 데이터의 연관 관계가 끊어지기 때문에 게임 오픈 이후에는 기준을 바꾸지 않아야 합니다.</span>

Analytics는 사용자를 구분하는 기준으로 Advertise ID 또는 User ID를 사용합니다. 두가지를 모두 사용할 수는 없고, 게임 정책에 따라 한가지를 선택하여야 합니다.

일반적으로 Advertise ID를 기준으로 사용합니다. 하지만 게임에서 특별한 요구사항이 있는 경우 User ID를 기준으로도 사용할 수 있습니다.

예를들어 Advertise ID를 사용하는 경우 하나의 디바이스에서 탈퇴->재가입 하는 경우에도 기존과 동일한 사용자로 집계됩니다. 반면 User ID를 사용하는 경우에는 신규 사용자로 집계됩니다.

또는 한명의 사용자가 두개의 디바이스를 사용하는 경우 Advertise ID를 사용하면 각각 다른 사용자로 집계되는 반면 User ID를 사용하는 경우 한명의 사용자로 집계됩니다.

이런 부분을 고려하여 게임에서 기준을 결정하여 사용합니다.

초기화 함수(initializeSDK)의 마지막 인자(use logging userid flag)로 이 값을 설정할 수 있습니다. Flag가 true 인 경우 User ID를 사용자 구분 기준으로 사용합니다. False로 설정하면 Advertise ID를 구분 기준으로 사용합니다.

아래 코드는 User ID를 사용자 구분 기준으로 사용하는 경우입니다.

```java
import com.toast.android.analytics.GameAnalytics;

public class TestActivty extends Activity {

  @Override
  protected void onCreate(Bundle savedInstanceState)
  {
    super.onCreate();
    ……
    int result = GameAnalytics.initializeSdk(getApplicationContext(), “AppID”, “CompanyID”, “AppVersion”, true);

    if (result != GameAnalytics.S_SUCCESS) {
        Log.d(TAG, "initialize error " + GameAnalytics.getResultMessage(result));
    }
    ……
    // 게임에서 로그인 처리 완료
    ……
    // User ID를 사용자 구분 기준으로 사용하는 경우 User ID를 등록하는 함수.
    GameAnalytics.setUserId(“user_id”, false);
    ……
}
```

만약 초기화 함수의 마지막 인자(use logging userid flag)를 true로 설정한 경우 setUserId를 호출하여 User ID를 등록해야 합니다. Flag를 true로 설정하고 setUserId를 호출하지 않으면 이후에 호출하는 모든 API가 실패(E_LOGGING_USER_ID_EMPTY)를 Return 합니다.

setUserId의 두번째 인자는 false 입니다.

setUserId 함수는 initializeSDK 호출 이후에 게임에서 로그인 성공한 후 게임에서 사용하는 userID를 획득한 직후에 호출하면 됩니다. userID는 게임에서 사용자를 구분하기 위해 사용하는 값을 사용하면 됩니다.


Advertise ID 관련 내용은 아래 링크를 참고하세요.
- Android : <https://developer.android.com/google/play-services/id.html>


## 세션 추적

DAU(Daily Active User)와 게임 체류 시간을 추적하기 위한 연동입니다.

App 시작/종료, Background/Foreground 이동시 해당 액션에 맞는 API를 호출하여 측정할 수 있습니다.

App이 처음 실행될때(initializeSDK 이후) 또는 background에서 foreground로 이동시 traceActivation을 호출하여 세션 추적을 시작합니다. 이후 App이 background로 들어가는 시점에 traceDeactivation을 호출하여 세션 추적을 멈춥니다.

traceDeactivation을 호출하면 traceActivation과 traceDeactivation 사이의 시간을 계산하여 게임 이용 시간을 측정합니다. 또한 SDK 내부적으로 수행하던 작업도 traceDeactivation에서 중단합니다.

App 종료시(단말기 Back버튼을 통한 종료시에도 처리필요)나 Background/Foreground 이동시 위 함수를 호출하지 않으면 정확한 게임 이용 시간을 측정할 수 없기 때문에 이 API는 반드시 호출해야 합니다.

DAU는 하루동안 traceActivation을 호출한 사용자(Advertise ID 또는 User ID 기준)의 중복을 제거한 숫자로 계산합니다.

```java
import com.toast.android.analytics.GameAnalytics;

public class TestActivty extends Activity {

  @Override
  protected void onResume()
  {
    // foreground 상태로 전환된 것을 서버에게 알림
    GameAnalytics.traceActivation(this);
  }

  @Override
  protected void onPause()
  {
    // background 상태로 전환된 것을 서버에게  알림
    GameAnalytics.traceDeactivation(this);
  }
}
```


## 액션 추적

In-App Purchase, 머니 획득/사용, 레벨업, 친구 수 변경등 사용자의 Action에 대해 추적할 수 있습니다.

### In-App Purchase

In-App Purchase가 발생한 후 tracePurchase를 호출하여 매출 정보를 전송합니다.

Currency는 ISO-4217(<http://en.wikipedia.org/wiki/ISO_4217>)에서 정의한 코드를 사용합니다.

$0.99의 보석을 구매하는 경우 아래와 같이 사용합니다.

(여기에서 “GEM_10”은 게임에서 정의한 Item의 Code입니다. UnitCost에는 Payment와 같은 값을 입력하고 Level은 구매한 사용자의 Level을 입력합니다.)

```java
GameAnalytics.tracePurchase("GEM_10", 0.99f, 0.99f, "USD", 10);
```
Global Service를 하는 경우 상품 가격 정보는 주의해서 사용해야 합니다. 국가별로 통화 포맷이 다를 수 있기 때문에 가능하다면 Google Play에서 제공하는 가격정보를 사용하는것이 좋습니다.
getSkuDetails의 'price_amount_micros ' property를 사용합니다. 자세한 내용은 Google 제공하는 In-app Billing Reference를 참고하세요. (<http://developer.android.com/intl/ko/google/play/billing/billing_reference.html#getSkuDetails>)


### 재화 획득/사용

게임내에서 재화의 획득/사용시 호출합니다. 1차 재화, 2차 재화의 변동량을 추적합니다. 일반적으로 1차 재화는 In-App Purchase를 통해서 구매하는 재화(ex. 보석, 루비등) 입니다. 2차 재화는 1차 재화를 이용하여 구매하는 재화(ex. 체리, 하트등) 입니다.

IAP를 통해서 보석 10개를 구매한 경우 아래와 같이 사용합니다.

(“CODE_IAP”는 게임에서 정의한 Code입니다. 1차 재화인 경우 Type은 0, 2차 재화인 경우 1을 사용합니다)

```java
GameAnalytics.traceMoneyAcquisition("CODE_IAP", "0", 10, 10);
```

보석 10개를 이용하여 체리 100개를 구매한 경우는 아래와 같이 사용합니다.

```java
// 1차 재화 사용
GameAnalytics.traceMoneyConsumption("CODE_USE_GEM", "0", 10, 10);

// 2차 재화 획득
GameAnalytics.traceMoneyAcquisition("CODE_BUY_CHERRY", "1", 100, 10);
```

1차 재화를 사용하여 2차 재화를 구입한 경우 실제 ‘1차 재화 감소’->‘2차 재화 증가’가 발생합니다. 하지만 2차 재화를 구입하기 위해서 1차 재화를 사용하는 경우 별도의 재화 소모로 판정하지 않고 싶은 경우 ‘2차 재화 획득’ 로그만 전송하여도 됩니다.

### 레벨업

사용자 레벨이 변경되는 경우 traceLevelUp을 호출합니다. 참고로 대부분의 액션 추적 API는 레벨별 액션 추적을 위해서 사용자 Level을 같이 받습니다.

사용자 레벨이 10으로 변경되는 경우 아래와 같이 호출합니다. 한 사용자의 레벨은 반드시 증가해야만 합니다. 감소하는 경우 정확한 데이터 측정이 불가능합니다.

예를들어 “Candy Crush Sage”와 같이 스테이지로 진행 되는 게임에서 스테이지를 레벨로 사용하는 경우에는 해당 스테이지에 최초 진입할때만 레벨업 로그를 남겨야 합니다. 만약 이전 스테이지로 다시 돌아가서 플레이 하는 경우에는 레벨업 로그를 남기지 않습니다.

또한 다른 API에 전달되는 level 값도 현재 진행중인 스테이지가 아닌 사용자의 최고 스테이지를 레벨 값으로 사용해야 합니다.

```java
GameAnalytics.traceLevelUp(10);
```


### 친구

사용자의 친구 숫자를 등록합니다. 일반적으로 앱 실행 후 친구 정보 로딩이 완료된 시점에 호출하면 됩니다.

```java
GameAnalytics.traceFriendCount(100);
```

## 커스텀 이벤트 사용

App에서 기본지표 이외에 특정 이벤트를 정의&분석하고 싶은 경우 사용합니다.

### 1. API 적용

```java
GameAnalytics.traceEvent("eventType", "eventCode", "param1", "param2", value, level);
```

|이름|필수여부|자료형|참고|   
|---|---|---|---|
|eventType|M|string|한글가능|
|eventCode|M|string|한글가능|
|param1|O|string|한글가능|
|param2|O|string|한글가능|
|value|O|number||
|level|O|number||

traceEvent에 사용하는 String Type 파라미터(event type, event code, param1, param2)는 각각 50byte까지 사용할 수 있습니다. 그리고 event 하위에 발생 가능한 param1 은 300개까지, 또 param1 하위에 발생 가능한 param2는 200개까지 사용할 수 있습니다.  

### 2. 지표 활용

활용 목적에 따라 이벤트 설계 시 고려할 사항은 다음과 같습니다.

1. 지표 조회시의 가독성을 위해 EventCode 되도록 unique 한것이 좋습니다.
예를 들어, (<span style="color:red;">Push, click</span>, param1,param2, value, level) / (<span style="color:red;">popup, click</span>, param1, param2, value, level)로 적용하는것보다는
(<span style="color:red;">Push, push_click</span>, param1, param2, value, level) / (<span style="color:red;">popup, popup_click</span>, param1, param2, value, level)을 권장드립니다.

2. Value는 특정 이벤트의 발생 건수 이외의 기준으로 조회하고자 할 경우 다양하게 활용 할 수 있습니다.
예를 들어, E-Book App에서 특정 만화를 보기 위해 사용된 포인트를 value 에 남긴다면, 전체 이용자가 해당 만화를 보기 위해 사용한 포인트를 일별로 추적할 수 있습니다. 혹은 event 가 발생한 OS 별로 지표를 조회하고자 한다면, ios 인 경우 value = 1, aos 인 경우 value = 0 으로 남기고, 해당이벤트의 [건수 - value 조회 값] 이 aos 에서 발생한 건수로 추적됩니다.

3. level은 꼭 게임내의 level이 아니라도 서비스 특성에 맞춰 활용 가능합니다.
일반 서비스 App의 경우 "회원grade" 등 level과 유사한 의미의 기준으로 맵핑 할 수 있습니다.

적용사례)
게임에서 Fever Time Item을 사용하는 경우 아래와 같이 사용합니다.
사용된 모든 코드는 게임에서 정의해야 하며, 아래 예제는 특정 스테이지에서 아이템 변동 내용을 추적하기 위해 정의된 코드입니다.

```java
GameAnalytics.traceEvent("ITEM", "ITEM_USE", "FEVER", "STAGE_10", 1, 10);
```

특정 레벨에서 보스 배틀 결과를 추적할때도 사용할 수 있습니다.

```java
GameAnalytics.traceEvent("STAGE", "STAGE_BOSS_VICTORY", "DRAGON_VALLEY", "BOSS_MOB", 1, 10);
```

* traceEvent로 발생한 Log는 "ToastAnalytics > 커스텀이벤트"에서 아래와 같이 조회됩니다.

![](http://static.toastoven.net/prod_analytics/image015.png)

![](http://static.toastoven.net/prod_analytics/image016.png)


## 페이스북 설치 추적

페이스북 광고를 통한 앱 설치를 추적할 수 있습니다. 이 기능은 Facebook에서 제공하는 Deep Linking 기능을 이용합니다.
관련하여 상세한 내용 및 테스트 방법은 Facebook에서 제공하는 문서(<https://developers.facebook.com/docs/app-ads/deep-linking>)를 참고하세요. ApplinkData.fetchDeferredAppLinkData 는 Facebook SDK에서 제공하는 API입니다.
(<https://developers.facebook.com/docs/reference/android/current/class/AppLinkData/>)

```java
AppLinkData.fetchDeferredAppLinkData(this,
    new AppLinkData.CompletionHandler() {
        @Override
            public void onDeferredAppLinkDataFetched(AppLinkData appLinkData) {
                if (appLinkData != null) {
                    GameAnalytics.traceFacebookInstall(context, String.valueOf(appLinkData.getTargetUri()));
                }
            }
        }
);}
```

# SDK 설정

## 디버그 모드 활성화
개발중에 SDK 로그 확인을 위해서 로그 출력 여부를 설정할 수 있습니다.

이 함수는 initializeSDK 이전에 호출해야 모든 로그를 보실 수 있습니다. 기본 값은 setDebugMode(false)입니다.

Log tags는 “Analytics:”로 시작합니다. log cat filter를 “Analytics”로 지정하면 SDK에서 발생하는 로그를 확인할 수 있습니다.

```java
private void Start () {
     ……
     GameAnalytics.setDebugMode(true);
     ……

     int result = GameAnalytics.initializeSdk ("APPKEY", "COMPANYID", "VERSION", false);

     if (result != 0) {
        // SDK 초기화 실패
     }
     ……
}
```

디버그 모드가 활성화된 경우 로그 전송 내용을 확인할 수 있습니다. 로그를 전송하고 그에 대한 응답 로그를 확인하여 로그가 정상적으로 전송되었는지 확인할 수 있습니다. 아래와 같은 로그 스트링이 있으면 수집된 데이터가 정상적으로 서버로 전송된 것입니다. (***은 상황에 따라서 다른 값입니다)

```
Android : server response (***) : 200 OK
```


## 디바이스 정보 확인
SDK에서 수집하는 Device 정보를 확인할 수 있습니다.

현재 확인 가능한 값은 Device ID입니다. 

Device 정보를 확인하기 위해 사용하는 Key 값입니다.
- public static final String DEVICE_INFO_DEVICEID = “deviceId”;

```java
private void printDeviceInfo() {
     String deviceID = GameAnalytics.getDeviceInfo(GameAnalytics.DEVICE_INFO_DEVICEID);
     ……
}
```

## SDK 버전 확인
SDK 버전은 GameAnalytics.getVersion()” 함수를 통해 확인할 수 있습니다.

```java
public static String getVersion()
```
