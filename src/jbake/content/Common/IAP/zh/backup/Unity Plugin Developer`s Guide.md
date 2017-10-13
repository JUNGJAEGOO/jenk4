title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > IAP > Unity Plugin Developer's Guide

### Add In App Purchase SDK

```
Unity Editor에서 프로젝트 생성
```

![[그림 1 프로젝트 생성]](http://static.toastoven.net/prod_iap/iap_11.png)
<center>[그림 1 프로젝트 생성]</center>

```
Unity Editor 에서 [Assets] > [Import Package] > [Custom Package] 를 선택
[In App Purchase Unity SDK]를 선택
```

![[그림 2 Custom Package 선택]](http://static.toastoven.net/prod_iap/iap_12.png)
<center>[그림 2 Custom Package 선택]</center>

```
Step3 : 모든 Assets을 Import 합니다.
```

![[그림 3 Importing package]](http://static.toastoven.net/prod_iap/iap_13.png)
<center>[그림 3 Importing package]</center>

### Android 환경 설정 및 빌드

```
1. Unity Editor 의 [File - Build Settings] 선택  
2. [Platform]- Android 선택하고 [Switch Platform]  
3. [Player Setting] 에서 [Android - Others Setting] 정보를 아래의 내용을 참조하여 수정 합니다.  
4. [Minimum API Level] IAP 유니티플러그인은 Android API Level 10 이상을 지원합니다.
```

![[그림 4 Setting for Android]](http://static.toastoven.net/prod_iap/iap_14.png)
<center>[그림 4 Setting for Android]</center>

```
어플리케이션의 AndroidManifest.xml 정보를 AndroidManifest-iap-template.xml 정보를 참조하여 수정  
```

![[그림 5 AndroidManifest-iap-template.xml]](http://static.toastoven.net/prod_iap/iap_15.png)
<center>[그림 5 AndroidManifest-iap-template.xml]</center>

> [참고]  
> 자세한 Android 빌드 환경설정은 Android 프로젝트 설정을 참조합니다.

### iOS 환경 설정 및 빌드

```
1. Unity Editor 의 [File] - Build Settings] 선택  
2. [Platform]- iOS 선택하고 [Switch Platform]
```

![[그림 6 Platform을 iOS를 선택]](http://static.toastoven.net/prod_iap/iap_20.jpg)
<center>[그림 6 Platform을 iOS를 선택]</center>

```
[Player Settings] > [Settings for iOS] > Bundle identifier 를 입력합니다
```

![[그림 7 Settings for iOS]](http://static.toastoven.net/prod_iap/iap_21.jpg)
<center>[그림 7 Settings for iOS]</center>

```
1. [Build] 버튼을 선택하여 Xcode 프로젝트를 생성 합니다.  
2. [unity_ios]와 같은 임의의 폴더에 프로젝트 생성  
3. [iPhone.xcodeproj] 를 통해 Xcode를 실행 합니다.
```

![[그림 8 iOS Platform으로 빌드하여 Xcode 프로젝트 생성]](http://static.toastoven.net/prod_iap/iap_22.jpg)
<center>[그림 8 iOS Platform으로 빌드하여 Xcode 프로젝트 생성]</center>

```
생성된 Xcode 프로젝트를 실행 합니다.  
1. [Xcode] > [Project] > [Targets – Build Phases]  
2. [Link Bianry With Libraries] 에 아래의 framworks 추가  
    - StoreKit.framework  
    - libsqlite3.dylib  
    - CoreTelephony.framework (TOAST-IAP-UnityPlugin-1.3.0 이후버전)
4. [plist] 에서 TOAST_IAP_APP_ID 가 KEY인 string value를 생성하고, APP ID를 입력 합니다.
```

> [참고]  
> 자세한 iOS 빌드 환경설정은 [iOS Developer's Guide](/Common/IAP/zh/iOS%20Developer%60s%20Guide/)를 참조

### 유니티 플러그인 초기화

IAP 유니티 플러그인을 사용하기 위해서는 아래와 같이 초기화 과정이 필요 합니다.

[Example Response]

```java
using Toast.IAP;
...
void Start()
{
   InAppPurchase.Init();
}
```

### 샘플 어플리케이션

Unity Editor에서 아래와 같이 InAppPurchase API를 테스트하기 위한 샘플 Console을 제공합니다.(Sample 폴더 참조)
Unity Editor에서는 Mock 형태의 API응답이 전달되고, 실제 결제 테스트를 위해서는 Android 디바이스를 통해 빌드 후 테스트 하도록 합니다.  

![[그림 9 샘플 콘솔]](http://static.toastoven.net/prod_iap/iap_43.png)
<center>[그림 9 샘플 콘솔]</center>

* RegisterUserId : 유저 ID 등록
* Request Purchase : 결제 요청
* Query Purchase List : 미소비 결제 내역 조회
* Query Item List : 구매가능 상품조회
* Processes Incomplete Purchases : 미결제건 재처리

## API Reference

# namespace Toast.IAP

### public class InAppPurchase

인앱 결제를 위한 Method를 제공합니다.

[Method Summary]

| 이름                              | Return Value | 파라미터                                 |
| --------------------------------- | ------------ | ---------------------------------------- |
| Init                              | Result       |                                          |
| SetDebugMode                      | void         | bool isDebuggable                        |
| RegisterUserId                    | Result       | String userId                            |
| AsyncRequestPuchase               | void         | long itemId, OnResponsePurchase callback |
| AsyncQueryPurchases               | void         | OnResponsePurchase callback              |
| AsyncQueryItems                   | void         | OnResponsePurchase callback              |
| AsyncProcessesIncompletePurchases | void         | OnResponsePurchase callback              |

[Init]

|용어|설명|
| ----- | ----- |
| Description |  유니티 플러그인을 초기화 한다 |
| Syntax | public static Result Init(); |
| Return Value |  Result 초기화 성공 여부를 반환 합니다 |

[Example Code]

```java
using Toast.IAP;
….
void start()
{
   InAppPurchase.Init();
}
```

[SetDebugMode]

|용어|설명|
| ----- | ----- |
| Description |  IAP 유니티 플러그인의 iOS/Android Level의 로그 활성화 여부를 설정한다. |
| Syntax | public static void SetDebugMode(bool isDebuggable); |

[Example Code]

```java
using Toast.IAP;
….
void start()
{
   InAppPurchase.SetDebugMode(true);
}
```

[RegisterUserId]

|용어|설명|
| ----- | ----- |
| Description |  어플리케이션에서 정의한 사용자 식별키를 등록한다. |
| Syntax | public Result RegisterUserId(String userId); |
| Parameters |  userId 유저ID |
| Return Value |  Result API 요청에 대한 결과를 반환한다 |

[Example Code]

```java
InAppPurchase.RegisterUserId("guest001");
```

[AsyncRequestPurchase]

|용어|설명|
| ----- | ----- |
| Description |  인앱 결제 요청을 한다. 결제 요청에 대한 응답은 delegate을 통해 전달 받는다. |
| Syntax | public static void AsyncRequestPurchase(long itemId, OnResponsePurchase callback) |
| Parameters |  itemId [in] Console에서 발급된 아이템 번호 |
| Parameters | callback [in] API 요청 결과를 전달 하는 delegate |
| Return Value |  void |

[Example Code]

```java
InAppPurchase.AsyncRequestPurchase(1000001, (Result result, object data) => {
      if (!result.IsSuccessful)
      {
         int errorCode = result.ResultCode;
         string errorMessage = result.ResultString;
         // TODO : handle exception
         return;
      }

      string purchaseJson = System.Convert.ToString (data);
      // TODO: handle api success...
});
```

[Response (JSON)]

| Attribute     | Value  | Description                      |
| ------------- | ------ | -------------------------------- |
| paymentSeq    | String | 완료한 결제에 대한 결제번호                  |
| itemSeq       | Long   | 아이템번호                            |
| purchaseToken | String | 애플리케이션 서버와 IAP 서버간 결제 통지시 필요한 토큰 |
| currency      | String | 상품의 화폐 단위                        |
| price         | Float  | 상품의 가격                           |

[Response Example]

```json
{
    "paymentSeq": "2014082210002092",
    "purchaseToken": "5PYSHgisiCU8BditHnDbPhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
    "itemSeq": 1000001,
    "currency": "KRW",
    "price":1000.0
}
```

[AsyncQueryPurchases]

|용어|설명|
| ----- | ----- |
| Description |  소비(Consume) 되지 않은 결제내역을 조회한다. |
| Syntax | public static void AsyncQueryPurchases(OnResponsePurchase callback) |
| Parameters |  callback  [in] API 요청 결과를 전달 하는 delegate |
| Return Value |  void |

[Example Code]

```java
InAppPurchase.AsyncQueryPurchases((Result result, object data) => {
      if (!result.IsSuccessful)
      {
          int errorCode = result.ResultCode;
          string errorMessage = result.ResultString;
          // TODO : handle exception....
          return;
      }

      string purchaseListJson = System.Convert.ToString(data);
      // TODO: handle api success...
});
```

[Response(JSON)]

| Attribute     | Value  | Description                      |
| ------------- | ------ | -------------------------------- |
| paymentSeq    | String | 결제번호                             |
| purchaseToken | String | 애플리케이션 서버와 IAP 서버간 결제 통지시 필요한 토큰 |
| itemSeq       | Long   | 아이템 번호                           |
| currency      | String | 상품의 화폐 단위                        |
| price         | Float  | 상품의 가격                           |

[Response Example]

```json
[{
    "paymentSeq": "2014082210002092",
    "purchaseToken": "5PYSHgisiCU8BditHnDbPhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
    "itemSeq": 1000208,
    "currency": "KRW",
    "price":1000.0
}, {
    "paymentSeq": "2014082210002093",
    "purchaseToken": "Q+os4dDsYaGiEEqkLeXQfhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
    "itemSeq": 1000208,
    "currency": "KRW",
    "price":1000.0
}, {
    "paymentSeq": "2014082210002094",
    "purchaseToken": "GMBcODtMnX306wVlFGIcDRmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
    "itemSeq": 1000208,
    "currency": "KRW",
    "price":1000.0
}]
```

[AsyncQueryItems]

|용어|설명|
| ----- | ----- |
| Description |  구매가능한 모든 아이템 내역을 조회합니다. |
| Syntax | public static void AsyncQueryItems(OnResponsePurchase callback) |
| Parameters |  callback  [in] API 요청 결과를 전달 하는 delegate |
| Return Value |  void |

[Example Code]

```java
InAppPurchase.AsyncQueryItems((Result result, object data) => {
    if (!result.IsSuccessful)
    {
        PrintLog ("QueryItemsCallback.OnCallback() -> Failed! -> " + result.ResultCode + ":" + result.ResultString);
        return;
    }

    /// Examples)	 *
    /// [{
    ///	"itemSeq": 1000208,
    ///	"itemName": "Test item 01",
    ///	"marketItemId": "item01",
    /// "price": 1000,
    /// "currency": "KRW",
    /// },
    /// {
    ///	"itemSeq": 1000209,
    ///	"itemName": "Test item 02",
    ///	"marketItemId": "item02",
    /// "price": 7.99,
    /// "currency": "USD"
    ///	}]

    string json = System.Convert.ToString (data);
    PrintLog ("QueryItemsCallback.OnCallback():" + json);

    // TODO : 상품내역 조회 결과로 필요한 처리를 한다.

});
```

[Response(JSON)]

| Attribute     | Value  | Description                      |
| ------------- | ------ | -------------------------------- |
| itemSeq    | Long | 아이템 번호                             |
| itemName | String | 아이템명 |
| marketItemId       | Long   | 스토어별 상품 ID                           |
| currency      | String | 상품의 화폐 단위                        |
| price         | Float  | 상품의 가격                           |

[Response Example]

```json

[{
    "itemSeq": 1000208,
    "itemName": "Test item 01",
    "marketItemId": "item01",
    "price": 1000,
    "currency": "KRW",
},
{
    "itemSeq": 1000209,
    "itemName": "Test item 02",
    "marketItemId": "item02",
    "price": 7.99,
    "currency": "USD"
}]
```

[AsyncProcessesIncompletePurchases]

|용어|설명|
| ----- | ----- |
| Description | 미처리된 결제건(IAP 서버 검증 실패)들에 대해 일괄로 재처리 작업을 진행합니다. |
| Syntax | public static void AsyncProcessesIncompletePurchases(OnResponsePurchase callback) |
| Parameters |  callback  [in] API 요청 결과를 전달 하는 delegate |
| Return Value |  void |

[Example Code]

```java
InAppPurchase.AsyncProcessesIncompletePurchases((Result result, object data) => {
    if (!result.IsSuccessful)
    {
        PrintLog ("IncompletePurchasesCallback.OnCallback() -> Failed! -> " + result.ResultCode + ":" + result.ResultString);
        return;
    }

    /// Examples)
    /// {
    /// 	"successList": [
    ///			{
    ///				"paymentSeq" : "2014082510002163",
    ///				"purchaseToken" : "8nkx3SzHKlI74vmgQLzHExmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoB-AB",
    ///				"itemSeq" : 1000208,
    ///				"marketItemId" : "item01",
    ///				"currency" : "KRW",
    ///				"price" : 1000.0
    ///			},
    ///			{
    ///				"paymentSeq" : "2014082510002164",
    ///				"purchaseToken" : "8nkx3SzATKlI74vmgQLzHExmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBaAC",
    ///				"itemSeq" : 1000209,
    ///				"marketItemId"	: "item02",
    ///				"currency" : "KRW",
    ///				"price" : 1000.0
    ///			}
    ///		],
    ///		"failList": [
    ///			{
    ///				"paymentSeq" : "2014082510002165",
    ///				"purchaseToken" : null,
    ///				"itemSeq" : 1000210,
    ///				"marketItemId" : "item03",
    ///				"currency" : "KRW",
    ///				"price" : 1000.0
    ///			}
    ///		]
    ///	}

    string json = System.Convert.ToString (data);
    PrintLog ("IncompletePurchasesCallback.OnCallback():" + json);

    // TODO : 상품내역 조회 결과로 필요한 처리를 한다.

});
```

[Response(JSON)]

| Attribute     | Value  | Description                      |
| ------------- | ------ | -------------------------------- |
| itemSeq    | Long | 아이템 번호                             |
| itemName | String | 아이템명 |
| marketItemId       | Long   | 스토어별 상품 ID                           |
| currency      | String | 상품의 화폐 단위                        |
| price         | Float  | 상품의 가격                           |

[Response Example]

```json

[{
    "itemSeq": 1000208,
    "itemName": "Test item 01",
    "marketItemId": "item01",
    "price": 1000,
    "currency": "KRW",
},
{
    "itemSeq": 1000209,
    "itemName": "Test item 02",
    "marketItemId": "item02",
    "price": 7.99,
    "currency": "USD"
}]
```

### public class Result

API의 응답 결과를 나타냅니다.

[IsSuccessful]

|용어|설명|
| ----- | ----- |
| Description |  API 성공 여부를 반환 합니다 |
| Syntax | public bool IsSuccessful; |
| Return Value |  bool true이면, API 요청 성공 |

[ResultCode]

|용어|설명|
| ----- | ---- |
| Description |  에러코드를 반환 합니다. |
| Syntax | public int ResultCode; |
| Return Value |  Int 에러코드를 반환 |

[ResultString]

|용어|설명|
| ----- | ----- |
| Description |  에러의 상세정보를 전달 합니다. |
| Syntax | public int ResultString; |
| Return Value |  Int 에러의 상세정보를 반환 |

### public class PluginVersion

플러그인의 Version 정보를 관리합니다.

[VersionInt]

|용어|설명|
| ----- | ----- |
| Description |  플러그인의 Version 정보 |
| Syntax | public const int VersionInt |

[VersionString]

|용어|설명|
| ----- | ----- |
| Description |  플러그인의 Version 정보 |
| Syntax | public const String VersionString |
