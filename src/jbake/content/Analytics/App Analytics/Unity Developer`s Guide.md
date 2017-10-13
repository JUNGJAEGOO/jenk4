title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > App Analytics > Unity Developer\`s Guide

# 시작하기

이 문서는 Unity에서 Analytics SDK를 연동하기 위한 방법에 대해 설명합니다. Analytics SDK를 사용하기 위해서는 먼저 앱을 등록해야 합니다. 앱 등록 방법은 [링크](/Analytics/App%20Analytics/Getting%20Started/#_4)를 참고하세요.
- 이 문서는 Unity4 기준으로 작성되었습니다.
- Unity 플러그인 기능은 Pro 버전에서만 지원합니다. 따라서 SDK Plugin을 사용하기 위해서는 Unity Pro 버전을 사용하여 어플리케이션을 개발해야 합니다.
- Android Manifest 설정, iOS Build 설정등은 각 OS별로 제공되는 Programming Guide에서 설명합니다.



# 프로젝트 설정

## SDK 다운로드

SDK는 <http://docs.cloud.toast.com/ko/Download/> 에서 다운로드 할 수 있습니다.

## SDK 구성

다운로드 후 압축을 풀면 Unity Package 패키지 파일과 변경 내용을 기록한 README.txt 파일이 있습니다.

```
	Analytics-SDK-Unity /
  - GameAnalyticsUnityPlugin.unitypackage 	// Analytics SDK Unity Package
  - README.txt                     // Release History
```

## 프로젝트 설정

#### 1. 프로젝트 생성
Unity3D를 실행하여 새로운 프로젝트를 생성합니다. 이미 생성된 프로젝트가 있으면 이 단계는 생략합니다.

![그림 1 프로젝트 생성](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_unity_001.png)

[그림 1 프로젝트 생성]

#### 2. 라이브러리 추가
Unity3D의 Menu에서 Assets > Import Package > Custom Package를 선택하여 다운로드 받은 유니티 패키지 파일을 Import 합니다.

(google-play-services.jar, AndroidManifest.xml 파일은 게임에서 사용하는 버전이나 타 라이브러리에 포함된 경우 추가하지 않아도 됩니다. “res” 폴더 하위에 있는 내용도 google-play-services.jar화 함께 제거 가능 합니다.)

![그림 2 라이브러리 추가](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_unity_002.png)

[그림 2 라이브러리 추가]

#### 3. Game Object 생성
빈 게임 오브젝트를 생성하고 GameAnalyticsUnityPluginController를 게임 오브젝트의 컴포넌트로 추가합니다.

![그림 3 Game Object 생성](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_unity_003.png)

[그림 3 Game Object 생성]

#### 4. SDK 사용하기
이후 게임에서 적절한 시점에 액션 추적 API를 호출하면 됩니다.<br />
액션 추적 API는 GameAnalytics.cs에 정의되어 있습니다.

#### 5. OS 추가 설정
OS(Android, iOS)별로 프로젝트 설정 및 Manifest에 추가로 설정해야 하는 항목들이 있습니다.<br / >
자세한 내용은 각 OS별로 제공되는 Programming Guide의 프로젝트 설정 항목을 참고하세요.


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

SDK를 사용하기 위해서는 앱 등록 후 발행되는 “앱 인증key”와 “컴퍼니 아이디”가 필요합니다. 앱 등록 방법은 링크(<http://docs.cloud.toast.com/ko/Analytics/App%20Analytics/Getting%20Started/#_4>)를 참고하세요.

![그림 4 인증키 정보](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_unity_004.png)

[그림 4 인증키 정보]

GameAnalytics SDK를 사용하기 위해서는 SDK 초기화를 먼저 수행해야 합니다.<br />
GameAnalytics 클래스의 initializeSDK 함수는 SDK 초기화를 수행하는 함수입니다. 이 함수는 내부적으로 필요한 데이터(디바이스 정보, 앱 설정 정보)를 확인하고, 로그 전송을 위한 환경을 설정하는 작업을 수행합니다.

```cs
using UnityEngine;
using System;
using System.Collections.Generic;
using Toast.Analytics;

public class Sample : MonoBehaviour {

    // Use this for initialization
    void Start () {

     ……

     int result = GameAnalytics.initializeSdk ("APPKEY", "COMPANYID", "VERSION", false);

     if (result != 0) {
        // SDK 초기화 실패
     }
     ……

     // 초기화 이후 세션 추적을 시작한다.
     GameAnalytics.traceActivation()
}
```



# 사용자 구분 기준 설정
<span style="color:red;">운영중에 사용자 구분 기준을 변경하면 변경 전/후 데이터의 연관 관계가 끊어지기 때문에 게임 오픈 이후에는 기준을 바꾸지 않아야 합니다.</span>

Analytics는 사용자를 구분하는 기준으로 Advertise ID 또는 User ID를 사용합니다. 두가지를 모두 사용할 수는 없고, 게임 정책에 따라 한가지를 선택하여야 합니다. <br />
일반적으로 Advertise ID를 기준으로 사용합니다. 하지만 게임에서 특별한 요구사항이 있는 경우 User ID를 기준으로도 사용할 수 있습니다.<br />
예를들어 Advertise ID를 사용하는 경우 하나의 디바이스에서 탈퇴->재가입 하는 경우에도 기존과 동일한 사용자로 집계됩니다. 반면 User ID를 사용하는 경우에는 신규 사용자로 집계됩니다.<br />
또는 한명의 사용자가 두개의 디바이스를 사용하는 경우 Advertise ID를 사용하면 각각 다른 사용자로 집계되는 반면 User ID를 사용하는 경우 한명의 사용자로 집계됩니다.<br />
이런 부분을 고려하여 게임에서 기준을 결정하여 사용합니다.<br />
초기화 함수(initializeSDK)의 마지막 인자(use logging userid flag)로 이 값을 설정할 수 있습니다. Flag가 true 인 경우 User ID를 사용자 구분 기준으로 사용합니다. False로 설정하면 Advertise ID를 구분 기준으로 사용합니다.

아래 코드는 User ID를 사용자 구분 기준으로 사용하는 경우입니다.

```cs
using UnityEngine;
using System;
using System.Collections.Generic;
using Toast.Analytics;

public class Sample : MonoBehaviour {

    // Use this for initialization
    void Start () {

     ……
     // User ID를 사용자 구분 기준으로 사용하는 경우 초기화
     int result = GameAnalytics.initializeSdk ("APPKEY", "COMPANYID", "VERSION", true);

     if (result != 0) {
        // SDK 초기화 실패
     }
     ……
     // 게임에서 로그인 처리 완료
     ……
     // User ID를 사용자 구분 기준으로 사용하는 경우 User ID를 등록하는 함수.
     GameAnalytics.setUserId(“user_id”, false);
     ……

     // 세션 추적을 시작
     GameAnalytics.traceActivation()
}
```

만약 초기화 함수의 마지막 인자(use logging userid flag)를 true로 설정한 경우 setUserId를 호출하여 User ID를 등록해야 합니다. Flag를 true로 설정하고 setUserId를 호출하지 않으면 이후에 호출하는 모든 API가 실패(E_LOGGING_USER_ID_EMPTY)를 Return 합니다.

setUserId의 두번째 인자는 false 입니다.

setUserId 함수는 initializeSDK 호출 이후에 게임에서 로그인 성공한 후 게임에서 사용하는 userID를 획득한 직후에 호출하면 됩니다. userID는 게임에서 사용자를 구분하기 위해 사용하는 값을 사용하면 됩니다.

Advertise ID 관련 내용은 아래 링크를 참고하세요.

-Android : <https://developer.android.com/google/play-services/id.html>   
-iOS : <https://developer.apple.com/LIBRARY/ios/documentation/AdSupport/Reference/ASIdentifierManager_Ref/>


## 세션 추적

DAU(Daily Active User)와 게임 체류 시간을 추적하기 위한 연동입니다.<br />
App 시작/종료, Background/Foreground 이동시 해당 액션에 맞는 API를 호출하여 측정할 수 있습니다.<br />
App이 처음 실행될때(initializeSDK 이후) 또는 background에서 foreground로 이동시 traceActivation을 호출하여 세션 추적을 시작합니다. 이후 App이 background로 들어가는 시점에 traceDeactivation을 호출하여 세션 추적을 멈춥니다.<br />
traceDeactivation을 호출하면 traceActivation과 traceDeactivation 사이의 시간을 계산하여 게임 이용 시간을 측정합니다. 또한 SDK 내부적으로 수행하던 작업도 traceDeactivation에서 중단합니다.<br />
Background/Foreground 이동시 위 함수를 호출하지 않으면 정확한 게임 이용 시간을 측정할 수 없기 때문에 이 API는 반드시 호출해야 합니다.<br />
DAU는 하루동안 traceActivation을 호출한 사용자(Advertise ID 또는 User ID 기준)의 중복을 제거한 숫자로 계산합니다.

```cs
void OnApplicationPause(bool paused) {

    if (paused) {
        GameAnalytics.traceDeactivation();
    } else {
        GameAnalytics.traceActivation();
    }

}
```

## 액션 추적

In-App Purchase, 머니 획득/사용, 레벨업, 친구 수 변경등 사용자의 Action에 대해 추적할 수 있습니다.

#### 1. In-App Purchase
In-App Purchase가 발생한 후 tracePurchase를 호출하여 매출 정보를 전송합니다.<br />
Currency는 ISO-4217(<http://en.wikipedia.org/wiki/ISO_4217>)에서 정의한 코드를 사용합니다.<br />
$0.99의 보석을 구매하는 경우 아래와 같이 사용합니다.<br />
(여기에서 “GEM_10”은 게임에서 정의한 Item의 Code입니다. UnitCost에는 Payment와 같은 값을 입력하고 Level은 구매한 사용자의 Level을 입력합니다.)

```cs
GameAnalytics.tracePurchase("GEM_10", 0.99f, 0.99f, "USD", 10);
```
Global Service를 하는 경우 상품 가격 정보는 주의해서 사용해야 합니다. 국가별로 통화 포맷이 다를 수 있기 때문에 가능하다면 스토어(Apple, Google등)에서 제공하는 가격정보를 사용하는것이 좋습니다.
자세한 내용은 "iOS Developer's Guide"와 "Android Developer's Guide"의 "tracePurchase"를 참고하세요.

#### 2. 재화 획득/사용
게임내에서 재화의 획득/사용시 호출합니다. 1차 재화, 2차 재화의 변동량을 추적합니다. 일반적으로 1차 재화는 In-App Purchase를 통해서 구매하는 재화(ex. 보석, 루비등) 입니다. 2차 재화는 1차 재화를 이용하여 구매하는 재화(ex. 체리, 하트등) 입니다.<br />
IAP를 통해서 보석 10개를 구매한 경우 아래와 같이 사용합니다.<br />
(“CODE_IAP”는 게임에서 정의한 Code입니다. 1차 재화인 경우 Type은 0, 2차 재화인 경우 1을 사용합니다)<br />

```cs
GameAnalytics.traceMoneyAcquisition("CODE_IAP", "0", 10, 10);
```

보석 10개를 이용하여 체리 100개를 구매한 경우는 아래와 같이 사용합니다.

```cs
// 1차 재화 사용
GameAnalytics.traceMoneyConsumption("CODE_USE_GEM", "0", 10, 10);

// 2차 재화 획득
GameAnalytics.traceMoneyAcquisition("CODE_BUY_CHERRY", "1", 100, 10);
```

1차 재화를 사용하여 2차 재화를 구입한 경우 실제 ‘1차 재화 감소’->‘2차 재화 증가’가 발생합니다. 하지만 2차 재화를 구입하기 위해서 1차 재화를 사용하는 경우 별도의 재화 소모로 판정하지 않고 싶은 경우 ‘2차 재화 획득’ 로그만 전송하여도 됩니다.

#### 3. 레벨업
사용자 레벨이 변경되는 경우 traceLevelUp을 호출합니다. 참고로 대부분의 액션 추적 API는 레벨별 액션 추적을 위해서 사용자 Level을 같이 받습니다.<br />
사용자 레벨이 10으로 변경되는 경우 아래와 같이 호출합니다. 한 사용자의 레벨은 반드시 증가해야만 합니다. 감소하는 경우 정확한 데이터 측정이 불가능합니다.<br />
예를들어 “Candy Crush Sage”와 같이 스테이지로 진행 되는 게임에서 스테이지를 레벨로 사용하는 경우에는 해당 스테이지에 최초 진입할때만 레벨업 로그를 남겨야 합니다. 만약 이전 스테이지로 다시 돌아가서 플레이 하는 경우에는 레벨업 로그를 남기지 않습니다.<br />
또한 다른 API에 전달되는 level 값도 현재 진행중인 스테이지가 아닌 사용자의 최고 스테이지를 레벨 값으로 사용해야 합니다.

```cs
GameAnalytics.traceLevelUp(10);
```

#### 4. 친구
사용자의 친구 숫자를 등록합니다. 일반적으로 앱 실행 후 친구 정보 로딩이 완료된 시점에 호출하면 됩니다.

```cs
GameAnalytics.traceFriendCount(100);
```

## 커스텀 이벤트 사용

App에서 기본지표 이외에 특정 이벤트를 정의&분석하고 싶은 경우 사용합니다.

### 1. API 적용

```
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

```
GameAnalytics.traceEvent("ITEM", "ITEM_USE", "FEVER", "STAGE_10", 1, 10);
```

특정 레벨에서 보스 배틀 결과를 추적할때도 사용할 수 있습니다.

```
GameAnalytics.traceEvent("STAGE", "STAGE_BOSS_VICTORY", "DRAGON_VALLEY", "BOSS_MOB", 1, 10);
```

* traceEvent로 발생한 Log는 "ToastAnalytics > 커스텀이벤트"에서 아래와 같이 조회됩니다.

![](http://static.toastoven.net/prod_analytics/image015.png)

![](http://static.toastoven.net/prod_analytics/image016.png)


## 페이스북 설치 추적
페이스북 광고를 통한 앱 설치를 추적할 수 있습니다. 이 기능은 Facebook에서 제공하는 Deep Linking 기능을 이용합니다.
관련하여 상세한 내용 및 테스트 방법은 Facebook에서 제공하는 문서(https://developers.facebook.com/docs/app-ads/deep-linking)를 참고하세요. FB.Mobile.FetchDeferredAppLinkData는 Facebook SDK에서 제공하는 API입니다.
(https://developers.facebook.com/docs/unity/reference/current/FB.Mobile.FetchDeferredAppLinkData)

```cs
FB.Mobile.FetchDeferredAppLinkData(DeepLinkCallback);

void DeepLinkCallback(IAppLinkResult result) {
    if(!String.IsNullOrEmpty(result.Url)) {
        GameAnalytics.traceFacebookInstall(result.Url);
    }
}
```

# SDK 설정

## 디버그 모드 활성화
개발중에 SDK 로그 확인을 위해서 로그 출력 여부를 설정할 수 있습니다.

이 함수는 initializeSDK 이전에 호출해야 모든 로그를 보실 수 있습니다. 기본 값은 setDebugMode(false)입니다.

(안드로이드에서는 log tag가 “Analytics:”로 시작합니다. Eclipse에서 log cat filter를 “Analytics”로 지정하면 SDK에서 발생하는 로그를 확인할 수 있습니다.)

```cs
void Start () {
     … …
     GameAnalytics.setDebugMode(true);
     … …

     int result = GameAnalytics.initializeSdk("APPKEY", "COMPANYID", "VERSION", false);

     if (result != 0) {
        // SDK 초기화 실패
     }
     … …
}
```

디버그 모드가 활성화된 경우 로그 전송 내용을 확인할 수 있습니다. 로그를 전송하고 그에 대한 응답 로그를 확인하여 로그가 정상적으로 전송되었는지 확인할 수 있습니다. 아래와 같은 로그 스트링이 있으면 수집된 데이터가 정상적으로 서버로 전송된 것입니다. (XXX은 상황에 따라서 다른 값입니다)

```
Android : server response (XXX) : 200 OK
iOS : RequestWorkerThread::didReceiveResponse - <NSHTTPURLResponse: XXX> { URL: XXX } { status code: 200002C
```


## 디바이스 정보 확인
SDK에서 수집하는 Device 정보를 확인할 수 있습니다.

현재 확인 가능한 값은 Device ID입니다.

Device 정보를 확인하기 위해 사용하는 Key 값입니다.

- public static final String DEVICE_INFO_DEVICEID = “deviceId”;

```cs
void printDeviceInfo() {
     string deviceID = GameAnalytics.getDeviceInfo(GameAnalytics.DEVICE_INFO_DEVICEID);
     … …
}
```

## SDK 버전 확인
SDK 버전은 “PluginVersion” class에서 확인할 수 있습니다.

```cs
namespace Toast.Analytics
{
    public class PluginVersion
    {
        public const int VersionInt = 0x0100;
        public const string VersionString = "0.1.00";
    }
}
```
