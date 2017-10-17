title=About
date=2013-09-24
type=page
status=published
big=TCAnalytics
summary=Developer`s GuideIosDV's
~~~~~~
## Analytics > App Analytics > iOS Developer\`s Guide

# 시작하기

이 문서는 iOS에서 Analytics SDK를 연동하기 위한 방법에 대해 설명합니다. Analytics SDK를 사용하기 위해서는 먼저 앱을 등록해야 합니다. 앱 등록 방법은 [링크](/Analytics/App%20Analytics/Getting%20Started/#_4)를 참고하세요.

# 프로젝트 설정

## SDK 다운로드

<http://docs.cloud.toast.com/ko/Download/> 에서 Android SDK 파일을 다운로드 합니다.

## 프로젝트설정

### 라이브러리 dependency 설정
다운로드 받은TAGAnalytics.h 파일을 프로젝트에 포함시키고, libTAGAnalytics.a 파일을 "Linked Frameworks and Libraries"에 추가합니다. "AdSuppert.framework", "libsqlite3.dylib", "CoreTelephony.framework"도 추가합니다.
![라이브러리링크](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_ios_001.png)

## iOS9 ATS 설정
iOS9부터 ATS(App Transport Security)기능이 추가되었습니다.
앱에서 http,https 로 접근하는 도메인에 대한 설정이 필요합니다.
XCode7 이상에서 빌드하는 경우만 해당됩니다. 자세한 내용은 Apple 문서를 참고하세요.
(<https://developer.apple.com/library/prerelease/ios/technotes/App-Transport-Security-Technote/>)

Toast Analytics에서는 아래 2개의 도메인에 접근합니다.
- *.toast.com : 로그 수집 서버
- *.toastoven.net : Campaign에서 사용하는 이미지 서버

앱의 Info.plist 파일에 아래 내용을 추가해야 합니다.

```xml
<key>NSAppTransportSecurity</key>
<dict>
	<key>NSExceptionDomains</key>
	<dict>
		<key>toastoven.net</key>
		<dict>
			<key>NSExceptionRequiresForwardSecrecy</key>
			<false/>
			<key>NSExceptionAllowsInsecureHTTPLoads</key>
			<true/>
			<key>NSIncludesSubdomains</key>
			<true/>
		</dict>
		<key>toast.com</key>
		<dict>
			<key>NSExceptionRequiresForwardSecrecy</key>
			<false/>
			<key>NSExceptionAllowsInsecureHTTPLoads</key>
			<true/>
			<key>NSIncludesSubdomains</key>
			<true/>
		</dict>
	</dict>
</dict>
```

특정 도메인이 아닌 모든 도메인에 접근을 허용하려면 위의 내용 대신 아래 내용을 추가합니다.

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

# API 연동

Toast Analytics는 연동된 API 에 따라 다양한 지표를 제공 하고 있습니다.  
필수 연동 API 만 연동해도  이용자 유입/유출 및 이탈과 관련한 모든 지표가 제공되며, 컨텐츠 및  추적이 필요한 지표 유형에 맞춰 적절한 API 추가 연동이 필요합니다.

Toast Analytics 로그인 후, “상단 Menu>고객센터>데모보기” 를 참고하여, API 연동 범위를 확정 하기를 권장 드립니다.

|필수 연동 여부|구분|API|상세|관련 지표|   
|---|---|---|---|---|
|필수 연동|초기화|initializeSDK|클라이언트 SDK 모듈을 초기화합니다.|모니터링/글로벌모니터링/마케팅/유입&방문/이탈/이용자상세|
|필수 연동|세션추적|traceActivation, traceDeactivation|앱이 foreground로 활성화 or background로 활성화 될 때 호출합니다.|모니터링/글로벌모니터링/마케팅/유입&방문/이탈/이용자상세|
|필수 연동|이용자구분|setUserId|로그인 시, 사용자 ID를 입력할 경우 사용합니다. initializeSdk(..., YES)인 경우에만 setUserId(userId, YES) 형태로 사용합니다.|모니터링/글로벌모니터링/마케팅/유입&방문/이탈/이용자상세|
|선택적 연동|구매|tracePurchase|앱내에서 아이템을 구매했을 때 호출합니다. (In App Purchase)|매출/첫구매/LTV|
|선택적 연동|재화획득/사용|traceMoneyAcquisition, traceMoneyConsumption|앱내에서 머니를 획득하거나 소비 했을때 호출합니다.|밸런싱|
|선택적 연동|레벨업|traceLevelUp|레벨업이 되었을 때 호출합니다.|밸런싱|
|선택적 연동|친구수|traceFriendCount|친구수를 추적할때 호출합니다.|밸런싱|
|선택적 연동|Custom Event|traceEvent|사용자 정의 이벤트가 발생했을 때 호출합니다.|커스텀이벤트|

## 초기화

SDK를 사용하기 위해서는 앱 등록 후 발행되는 "앱 인증Key"와 "컴퍼니 아이디"가 필요합니다. 앱 등록 방법은 링크(<http://docs.cloud.toast.com/ko/Analytics/App%20Analytics/Getting%20Started/#_4>)를 참고하세요.
![AppKey](https://raw.githubusercontent.com/ToastAnalytics/ToastAnalytics/master/docs/Developer/images/pg_ios_002.png)

GameAnalytics SDK를 사용하기 위해서는 SDK 초기화를 먼저 수행해야 합니다.<br>
GameAnalytics 클래스의 initializeSDK 함수는 SDK 초기화를 수행하는 함수입니다. 이 함수는 내부적으로 필요한 데이터(디바이스 정보, 앱 설정 정보)를 확인하고, 로그 전송을 위한 환경을 설정하는 작업을 수행합니다.

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  ……
  [TAGAnalytics initializeSdk:@"AppKey"
			        companyId:@"CompanyID"
			       appVersion:@"AppVersion"
		     useLoggingUserId:NO];
  ……
}
```

### 사용자 구분 기준 설정
<span style="color:red;">운영중에 사용자 구분 기준을 변경하면 변경 전/후 데이터의 연관 관계가 끊어지기 때문에 게임 오픈 이후에는 기준을 바꾸지 않아야 합니다.</span><br>
Analytics는 사용자를 구분하는 기준으로 Advertise ID 또는 User ID를 사용합니다. 두가지를 모두 사용할 수는 없고, 게임 정책에 따라 한가지를 선택하여야 합니다.<br>
일반적으로 Advertise ID를 기준으로 사용합니다. 하지만 게임에서 특별한 요구사항이 있는 경우 User ID를 기준으로도 사용할 수 있습니다.<br>
예를들어 Advertise ID를 사용하는 경우 하나의 디바이스에서 탈퇴->재가입 하는 경우에도 기존과 동일한 사용자로 집계됩니다. 반면 User ID를 사용하는 경우에는 신규 사용자로 집계됩니다.<br>
또는 한명의 사용자가 두개의 디바이스를 사용하는 경우 Advertise ID를 사용하면 각각 다른 사용자로 집계되는 반면 User ID를 사용하는 경우 한명의 사용자로 집계됩니다.<br>
이런 부분을 고려하여 게임에서 기준을 결정하여 사용합니다.<br>
초기화 함수(initializeSDK)의 마지막 인자(use logging userid flag)로 이 값을 설정할 수 있습니다. Flag가 true 인 경우 User ID를 사용자 구분 기준으로 사용합니다. False로 설정하면 Advertise ID를 구분 기준으로 사용합니다.<br>
아래 코드는 User ID를 사용자 구분 기준으로 사용하는 경우입니다.<br>

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  ……
  int result = [TAGAnalytics initializeSdk:@"AppKey"
		            			 companyId:@"CompanyID"
					            appVersion:@"AppVersion"
				          useLoggingUserId:YES];
  if (result != 0) {
	 // Initialize Fail
  }

  // 게임에서 로그인 처리 완료
  ……
  // User ID를 사용자 구분 기준으로 사용하는 경우 User ID를 등록하는 함수.
  [TAGAnalytics setUserId:@"user id" useCampaignOrPromotion:YES];
……
}
```

만약 초기화 함수의 마지막 인자(use logging userid flag)를 true로 설정한 경우 setUserId를 호출하여 User ID를 등록해야 합니다. Flag를 true로 설정하고 setUserId를 호출하지 않으면 이후에 호출하는 모든 API가 실패(E_LOGGING_USER_ID_EMPTY)를 Return 합니다.<br>
setUserId에서 "useCampaignOrPromotion"은 Promotion이나 Campaign을 사용하는 경우 YES입니다. 그렇지 않은 경에는 NO 입니다.<br>
setUserId 함수는 initializeSDK 호출 이후에 게임에서 로그인 성공한 후 게임에서 사용하는 userID를 획득한 직후에 호출하면 됩니다. userID는 게임에서 사용자를 구분하기 위해 사용하는 값을 사용하면 됩니다.<br>
Advertise ID 관련 내용은 아래 링크를 참고하세요.<br>
<https://developer.apple.com/LIBRARY/ios/documentation/AdSupport/Reference/ASIdentifierManager_Ref/index.html>

## 세션 추적

DAU(Daily Active User)와 게임 체류 시간을 추적하기 위한 연동입니다.<br>
App 시작/종료, Background/Foreground 이동시 해당 액션에 맞는 API를 호출하여 측정할 수 있습니다.<br>
App이 처음 실행될때(initializeSDK 이후) 또는 background에서 foreground로 이동시 traceActivation을 호출하여 세션 추적을 시작합니다. 이후 App이 background로 들어가는 시점에 traceDeactivation을 호출하여 세션 추적을 멈춥니다.<br>
traceDeactivation을 호출하면 traceActivation과 traceDeactivation 사이의 시간을 계산하여 게임 이용 시간을 측정합니다. 또한 SDK 내부적으로 수행하던 작업도 traceDeactivation에서 중단합니다.<br>
Background/Foreground 이동시 위 함수를 호출하지 않으면 정확한 게임 이용 시간을 측정할 수 없기 때문에 이 API는 반드시 호출해야 합니다.<br>
DAU는 하루동안 traceActivation을 호출한 사용자(Advertise ID 또는 User ID 기준)의 중복을 제거한 숫자로 계산합니다.

```objective-c
- (void)applicationWillResignActive:(UIApplication *)application
{
	[TAGAnalytics traceDeactivation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	[TAGAnalytics traceActivation];
}
```

## 액션 추적

In-App Purchase, 머니 획득/사용, 레벨업, 친구 수 변경등 사용자의 Action에 대해 추적할 수 있습니다.

### 1. In-App Purchase
In-App Purchase가 발생한 후 tracePurchase를 호출하여 매출 정보를 전송합니다.<br>
Currency는 ISO-4217(<http://en.wikipedia.org/wiki/ISO_4217>)에서 정의한 코드를 사용합니다.<br>
$0.99의 보석을 구매하는 경우 아래와 같이 사용합니다.<br>
(여기에서 “GEM_10”은 게임에서 정의한 Item의 Code입니다. UnitCost에는 Payment와 같은 값을 입력하고 Level은 구매한 사용자의 Level을 입력합니다.)

```objective-c
[TAGAnalytics tracePurchase:@"GEM_10"
                    payment:0.99
                   unitCost:0.99
                   currency:@"USD"
                      level:10];
```

Global Service를 하는 경우 상품 가격 정보는 주의해서 사용해야 합니다. 국가별로 통화 포맷이 다를 수 있기 때문에 가능하다면 Apple StoreKit의 SKProduct에서 제공하는 가격정보를 사용하는것이 좋습니다.
SKProductResponse의 'price' property를 사용합니다. 자세한 내용은 Apple에서 제공하는 StoreKit Reference를 참고하세요. (<https://developer.apple.com/library/ios/documentation/StoreKit/Reference/SKProduct_Reference/>)


### 2. 재화 획득/사용
게임내에서 재화의 획득/사용시 호출합니다. 1차 재화, 2차 재화의 변동량을 추적합니다. 일반적으로 1차 재화는 In-App Purchase를 통해서 구매하는 재화(ex. 보석, 루비등) 입니다. 2차 재화는 1차 재화를 이용하여 구매하는 재화(ex. 체리, 하트등) 입니다.<br>
IAP를 통해서 보석 10개를 구매한 경우 아래와 같이 사용합니다.<br>
("CODE_IAP"는 게임에서 정의한 Code입니다. 1차 재화인 경우 Type은 0, 2차 재화인 경우 1을 사용합니다)

```objective-c
[TAGAnalytics traceMoneyConsumption:@"CODE_IAP"
	                           type:@"0"
                  consumptionAmount:10
	                          level:10];
```

보석 10개를 이용하여 체리 100개를 구매한 경우는 아래와 같이 사용합니다.

```objective-c
// 1차 재화 사용
[TAGAnalytics traceMoneyConsumption:@"CODE_USE_GEM"
				               type:@"0"
		          consumptionAmount:10
				              level:10];

// 2차 재화 획득
[TAGAnalytics traceMoneyAcquisition:@"CODE_BUY_CHERRY"
				               type:@"1"
		          consumptionAmount:100
				              level:10];
```

1차 재화를 사용하여 2차 재화를 구입한 경우 실제 ‘1차 재화 감소’->‘2차 재화 증가’가 발생합니다. 하지만 2차 재화를 구입하기 위해서 1차 재화를 사용하는 경우 별도의 재화 소모로 판정하지 않고 싶은 경우 ‘2차 재화 획득’ 로그만 전송하여도 됩니다.

### 3. 레벨업
사용자 레벨이 변경되는 경우 traceLevelUp을 호출합니다. 참고로 대부분의 액션 추적 API는 레벨별 액션 추적을 위해서 사용자 Level을 같이 받습니다.<br>
사용자 레벨이 10으로 변경되는 경우 아래와 같이 호출합니다. 한 사용자의 레벨은 반드시 증가해야만 합니다. 감소하는 경우 정확한 데이터 측정이 불가능합니다.<br>
예를들어 "Candy Crush Sage"와 같이 스테이지로 진행 되는 게임에서 스테이지를 레벨로 사용하는 경우에는 해당 스테이지에 최초 진입할때만 레벨업 로그를 남겨야 합니다. 만약 이전 스테이지로 다시 돌아가서 플레이 하는 경우에는 레벨업 로그를 남기지 않습니다.<br>
또한 다른 API에 전달되는 level 값도 현재 진행중인 스테이지가 아닌 사용자의 최고 스테이지를 레벨 값으로 사용해야 합니다.

```objective-c
[TAGAnalytics traceLevelUp:10];
```

### 4. 친구
사용자의 친구 숫자를 등록합니다. 일반적으로 앱 실행 후 친구 정보 로딩이 완료된 시점에 호출하면 됩니다.

```objective-c
[TAGAnalytics traceFriendCount:100];
```


## 커스텀 이벤트 사용

App에서 기본지표 이외에 특정 이벤트를 정의&분석하고 싶은 경우 사용합니다.

### 1. API 적용

```
[TAGAnalytics traceEvent:@”eventType”
eventCode:@”eventCode”
param1:@”param1”
param2:@”param2”
value:1
level:10];
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
[TAGAnalytics traceEvent:@”ITEM”
eventCode:@”ITEM_USE”
param1:@”FEVER”
param2:@”STAGE_10”
value:1
level:10];
```

특정 레벨에서 보스 배틀 결과를 추적할때도 사용할 수 있습니다.

```
[TAGAnalytics traceEvent:@”STAGE”
eventCode:@”STAGE_BOSS_VICTORY”
param1:@”DRAGON_VALLEY”
param2:@”BOSS_MOB”
value:1
level:10];
```

* traceEvent로 발생한 Log는 "ToastAnalytics > 커스텀이벤트"에서 아래와 같이 조회됩니다.

![](http://static.toastoven.net/prod_analytics/image015.png)

![](http://static.toastoven.net/prod_analytics/image016.png)


## 페이스북 설치 추적

페이스북 광고를 통한 앱 설치를 추적할 수 있습니다. 이 기능은 Facebook에서 제공하는 Deep Linking 기능을 이용합니다.
관련하여 상세한 내용 및 테스트 방법은 Facebook에서 제공하는 문서(<https://developers.facebook.com/docs/app-ads/deep-linking>)를 참고하세요. fetchDeferredAppLink@FBSDKAppLinkUtility는 Facebook SDK에서 제공하는 API입니다.
(<https://developers.facebook.com/docs/reference/ios/current/class/FBSDKAppLinkUtility/>)

```objective-c
[FBSDKAppLinkUtility fetchDeferredAppLink:^(NSURL *url, NSError *error) {
    if (url) {
        [TAGAnalytics traceFacebookInstall:url.query];
    }
}];}
```

# SDK 설정

## 디버그 모드 활성화
개발중에 SDK 로그 확인을 위해서 로그 출력 여부를 설정할 수 있습니다.<br>
이 함수는 initializeSDK 이전에 호출해야 모든 로그를 보실 수 있습니다. 기본 값은 setDebugModeEnabled:NO입니다.

```objective-c
- (void) Start ()
{
  ……
 [TAGAnalytics setDebugModeEnabled:YES];
  ……
}
```

디버그 모드가 활성화된 경우 로그 전송 내용을 확인할 수 있습니다. 로그를 전송하고 그에 대한 응답 로그를 확인하여 로그가 정상적으로 전송되었는지 확인할 수 있습니다. 아래와 같은 로그 스트링이 있으면 수집된 데이터가 정상적으로 서버로 전송된 것입니다. (***은 상황에 따라서 다른 값입니다)

```
iOS : RequestWorkerThread::didReceiveResponse - <NSHTTPURLResponse: ***> { URL: *** } { status code: 200,
```

## 디바이스 정보 확인
SDK에서 수집하는 Device 정보를 확인할 수 있습니다.<br>
현재 확인 가능한 값은 Device ID, Push User ID, Campaign User ID입니다. 이 값들은 캠페인 연동 테스트시 필요합니다. 자세한 내용은 "캠페인 연동 가이드"를 참고하세요.

```objective-c
void printDeviceInfo()
{
  NSString *deviceID = [TAGAnalytics deviceInfoWithKey:DEVICE_INFO_DEVICEID];
  NSString *pushToken = [TAGAnalytics deviceInfoWithKey:DEVICE_INFO_PUSH_UESR_ID];
  NSString *cUserID = [TAGAnalytics deviceInfoWithKey:DEVICE_INFO_CAMPAIGN_USERID];
  ……
}
```

## SDK 버전 확인
SDK 버전은 "getVersion()" 함수를 통해 확인할 수 있습니다.

```objective-c
[TAGAnalytics version];
```
