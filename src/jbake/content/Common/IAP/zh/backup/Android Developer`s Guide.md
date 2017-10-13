title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > IAP > Android Developer's Guide

## 개발환경

* Windows
* Eclipse in Android Development Tools / Android Studio IDE 1.2
* Android 5.0.1 (API Level 21)
* Android SDK Version은 **2.3.3 (API Level 10)** 이상

사용하는 오픈 소스 정보는 다음과 같습니다.

|이름|참조|버전|라이선스|
|---|---|---|---|
|okhttp|http://square.github.io/okhttp/|1.5.4|Apache License 2.0|
|gson|https://code.google.com/p/google-gson/|2.2.4|Apache License 2.0|

## Android Studio & Gradle 환경에서 사용하기

IAP의 Android SDK는 Gradle을 기반으로한 Android Studio IDE에 대한 개발환경을 제공합니다. jCenter Maven Repository 로부터 Remote로 다운로드 받을수 있습니다. 아래의 같이 프로젝트의 build.gradle 파일에 repository와 dependency에 대한 정의를 하시면 됩니다.

### Gradle Repository

```
buildscript {
    repositories {
        jcenter()
    }
}
```

```
dependencies {
    compile group: 'com.toast.iap', name: 'iap', version: project.TOAST_IAP_SDK_VERSION
}
```

> [참고]  
> project.TOAST_IAP_SDK_VERSION 에는 SDK의 version을 명시합니다. Gradle 은 1.1.0 Version 이상의 Gradle Project를 사용하는 것을 권장합니다.  

<br/>
> [참고]  
> Release History   
> SDK의 Version의 변경이력은 패키지내의 RELEASE-NOTES.md 를 참조해주세요.

### 샘플 애플리케이션 실행하기

IAP의 Android SDK는 Gradle을 기반으로한 Android Studio IDE에 대한 개발환경을 제공합니다. jCenter Maven Repository 로부터 Remote로 다운로드 받을수 있습니다. 아래의 같이 프로젝트의 build.gradle 파일에 repository와 dependency에 대한 정의를 하시면 됩니다.

#### Import Project

Android Studio에서 Import Project 하여 SDK 패키지의 /toast-iap-android-sdk-studio 를 추가합니다.

> [참고]  
> local.properties 수정   
> local.properties 내부의 sdk.dir 의 값을 로컬에 설정된 Android SDK의 경로로 변경합니다. 만약 샘플 애플리케이션을 빌드타입을 release 로 빌드한다면, APK signing을 위한 keystore 정보를 입력해야 합니다. Flavor 및 buildType은 Android Studio의 Build Variants 메뉴에서 선택가능합니다.  

<br/>
> [참고]  
> Workspace Encoding Type   
> Import 한 Project의 Workspace File Encoding이 UTF-8로 되어있는 확인합니다, 아닐경우 UTF-8로 변경합니다.  

#### AndroidManifest.xml 에 스토어 정보 설정

IAP Web Console에 등록한 마켓정보를 통해 appId / Store 을 설정합니다.

> [참고]  
> appId / Store 설정   
> 설정방법은 샘플애플리케이션의 각 스토어 Flavor의 AndroidManifest.xml 을 참조하시면 됩니다.

## 이클립스 환경에서 사용하기

IAP Android SDK는 안드로이드 라이브러리 프로젝트 형태로 배포합니다.

| 디렉토리명                                     | 설명                     |
| ----------------------------------------- | ---------------------- |
| /docs                                     | API 레퍼런스               |
| /toast-iap-android-sdk-eclipse/iap        | IAP Android 라이브러리 프로젝트 |
| /toast-iap-android-sdk-eclipse/iap-sample | 샘플 애플리케이션              |

[표1 Android SDK 디렉토리 정보]

### Import 방법

```
[Eclipse] > [File] > [Import] 선택  
[Android] - [Existing Android Code into Workspace] 선택  
<Import Projects> 창 > [Browse] 버튼 > [IAP SDK] 폴더 선택  
IAP SDK와 샘플 애플리케이션의 프로젝트가 Import 목록에 표시되면, 프로젝트를 모두 선택한 상태에서 [Finish] 선택
```

> [참고]  
> Import 후에 Project에 에러 발생시 다음과 같이 합니다.   
> \- [project] > [clean] 선택    
> \- [IAP] 우클릭 > [Properties] > [Resource] > [Text File Encoding]을 UTF-8로 설정

### IAP Android SDK 추가

```
[project] 우클릭 > [Properties] > [Android] > [Add] > IAP 추가
```

![[그림 1 IAP SDK 추가]](http://static.toastoven.net/prod_iap/iap_5.jpg)
<center>[그림 1 IAP SDK 추가]</center>

## Android 프로젝트 설정

### AndroidManifest.xml 추가

Google Play 기준으로 작성한 내용입니다.

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<!-- google iab permission -->
<uses-permission android:name="com.android.vending.BILLING" />

<application>
...
        <activity android:name="com.nhnent.mobill.api.core.IAPActivity"
	        android:configChanges="keyboardHidden|orientation|screenSize|locale|layoutDirection"
	        android:theme="@android:style/Theme.Translucent.NoTitleBar"
	        android:windowSoftInputMode="adjustResize|stateHidden" />
        <meta-data android:name="com.toast.iap.config.appId" android:value="1000000" />
        <meta-data android:name="com.toast.iap.config.market" android:value="GG" />
</application>
```

AndroidManifest.xml의 설정 정보는 다음과 같습니다.

| Property Name               | Description                  |
| --------------------------- | ---------------------------- |
| android.permission          | IAP 사용을 위한 공통 Android 권한 <br/> * 중복 permission 생략가능          |
| com.android.vending.BILLING | Google Play를 위한 권한. <br/> * 스토어별로 이름이 다르거나 포함여부가 달라짐     |
| activity                    | IAP에서 제공하는 액티비티 등록           |
| com.toast.iap.config.appId  | IAP 웹콘솔에서 발급된 앱고유번호          |
| com.toast.iap.config.market | 스토어 정보 <br/>GG : 구글플레이<br/> TS : 티스토어<br/> NA : 네이버앱스토어<br/>TEST : 테스트 |

[표2 AndroidManifest.xml 설정 정보]

> [참고]  
> 스토어 정보를 TEST로 설정시 별도의 스토어 연동 정보없이 IAP의 API를 손쉽게 테스트 해볼 수 있습니다.    
> 자세한 내용은 Sample Application 을 참고 해주세요.  

## IAP 결제 흐름도

인앱 결제는 결제요청과 결제소비 2단계로 진행됩니다.  
결제소비까지 완료한 이후에는 사용자의 애플리케이션에서 아이템을 지급하면 됩니다.

> [참고]  
> [IAP 결제 흐름도](/Common/IAP/zh/Overview/#iap)

### 사용자 식별자 등록

인증을 완료한 사용자 ID를 등록합니다.  
개발사에서 정의한 사용자 식별키이며, 아이템이 지급되는 대상입니다.

[Request Example]

```java
InAppPurchases.InAppPurchase.registerUserId(userId); // userId : String value
```

### 구매 가능한 아이템 내역 조회

구매 가능한 모든 아이템 내역을 조회합니다.

[Request Example]

```java
InAppPurchases.InAppPurchase.queryItems(activity, new InAppPurchase.ItemListCallback() {
    @Override
    public void onCallback(JSONArray result, InAppPurchaseException exception) {
        if (exception != null) {
            // An error occurred, we need to handle the error
            return;
        }
        // Success! Include your code to handle the results here
    }
});
```

[Method]

|용어|설명|
| ----- | --- |
| Syntax | public void queryItems(Activity activity, ItemListCallback callback) |
| Parameters | activity [in] 어플리케이션의 현재 액티비티 |
| Parameter | callback [in] API 요청 결과를 전달 하는 콜백 |
| Return Value | void |

[Response Example]
```json
[
    {
        "itemSeq" : 1000208,
        "itemName" : "Test item 01",
        "marketItemId": "item01",
        "price": 1000,
        "currency": "KRW"
    },
    {
        "itemSeq" : 1000209,
        "itemName" : "Test item 02",
        "marketItemId": "item02",
        "price": 7.99,
        "currency": "USD"
}]
```

### 결제 요청

클라이언트에서 아이템 구매를 요청합니다. 결제 요청에 대한 응답은 PurchaseCallback 을 통해 전달 받게 되고, 결제가 성공적으로 완료되면 결과값을 서버에 전달하여 결제내역을 (Consume) 해야 합니다.

[Request Example]

```java
InAppPurchases.InAppPurchase.requestPurchase(this, 1000001, new PurchaseCallback() {

    @Override
    public void onCallback(JSONObject result, InAppPurchaseException exception) {
           if (!result.isSuccess()) {
              // An error occurred, we need to handle the error
              return;
           }
           // Success! Include your code to handle the results here
       }
});
```

[Method]

|용어|설명|
| ----- |  --- |
| Syntax | public void requestPurchase(Activity activity, long itemId, String currency, float price, PurchaseCallback callback) ||
| Parameters |  activity [in] 어플리케이션의 현재 액티비티 |
| Parameters | itemId [in] Web Console [Item]에서 발급된 ID |
| Parameters | callback [in] API 요청 결과를 전달 하는 콜백 |
| Return Value |  void |

[Response Example]

```json
{
    "paymentSeq": "2014082210002092",
    "purchaseToken": "5PYSHgisiCU8BditHnDbPhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
    "itemSeq": 1000001,
    "currency": "KRW",
    "price": 1000.0
}
```

> [참고]  
> IAP Android SDK 결제확인창   
> toast-iap-android-sdk-1.2.3 부터 기존 아래의 결제확인창 없이 스토어결제로 바로 진행됩니다.

![[그림 2 기존 결제확인창]](http://static.toastoven.net/prod_iap/iap_40.jpg)
<center>[그림 2 기존 결제확인창]</center>

### 결제 소비

사용자 애플리케이션 서버는 아이템을 지급하기 전 IAP 서버에게 결제를 소비할 것을 알려야 합니다. 이 때 결제 구매 토큰(Payment Purchase Token)을 이용하여 사용자 서버와 IAP서버간의 결제 유효성에 대한 보안을 체크합니다.

> [참고]  
> [Server Payment Consume API](/Common/IAP/zh/Server%20Developer%60s%20Guide/#payment-consume-api)  

[HTTP Request Example]

```http
POST
https://api-iap.cloud.toast.com/inapp/v3/consume/{paymentSeq}/items/{itemSeq}

RequestBody
{
 "purchaseToken":string
}
```

[Response Example]

```json
{
    "header": {
        "resultCode": 0,
        "resultMessage": "request is successful",
        "isSuccessful": true
    },
    "result": {
        "price":1000.0,
        "currency":"KRW"
    }
}
```

### 미소비 결제내역 조회

유저의 소비(Consume) 되지 않은 결제내역을 조회합니다.

[Request Example]

```java
InAppPurchases.InAppPurchase.queryPurchases(this, new PurchaseListCallback() {

    @Override
    public void onCallback(JSONArray result, InAppPurchaseException exception) {
           if (!result.isSuccess()) {
              // An error occurred, we need to handle the error
              return;
           }
           // Success! Include your code to handle the results here }
});
```

[Method]

|용어|설명|
|--------|--------|
| Syntax |public void queryPurchases(Activity activity, PurchaseListCallback callback)|
| Parameters | activity [in] 어플리케이션의 현재 액티비티 |
| Parameter | callback [in] API 요청 결과를 전달 하는 콜백 |
| Return Value | void |

[Response Example]

```json
[{
    "paymentSeq": "2014082210002092",
    "purchaseToken": "5PYSHgisiCU8BditHnDbPhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
    "itemSeq": 1000208,
    "currency": "KRW",
    "price": 1000.0
}, {
    "paymentSeq": "2014082210002093",
    "purchaseToken": "Q+os4dDsYaGiEEqkLeXQfhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
    "itemSeq": 1000208,
    "currency": "KRW",
    "price": 1000.0
}, {
    "paymentSeq": "2014082210002094",
    "purchaseToken": "GMBcODtMnX306wVlFGIcDRmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
    "itemSeq": 1000208,
    "currency": "KRW",
    "price": 1000.0
}]
```

### 미처리 결제건 일괄 재처리

미처리된 결제건(IAP 서버 검증 실패)들에 대해 일괄로 재처리 작업을 진행합니다.

[Request Example]

```java
InAppPurchases.InAppPurchase.processesIncompletePurchases(activity, new InAppPurchase.IncompletePurchasesCallback() {

    @Override
    public void onCallback(JSONObject result, InAppPurchaseException exception) {
           if (exception != null) {
              // An error occurred, we need to handle the error
              return;
           }
           // Success! Include your code to handle the results here }
});
```

[Method]

|용어|설명|
|--------|--------|
| Syntax |public void processesIncompletePurchases(Activity activity, IncompletePurchasesCallback callback)|
| Parameters | activity [in] 어플리케이션의 현재 액티비티 |
| Parameter | callback [in] API 요청 결과를 전달 하는 콜백 |
| Return Value | void |

[Response Example]

```json
{
    "successList": [
    	{
    		"paymentSeq" : "2014082510002163",
    		"purchaseToken" : "8nkx3SzHKlI74vmgQLzHExmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoB-AB",
    		"itemSeq" : 1000208,
    		"marketItemId"	: "item01",
    		"currency" : "KRW",
    		"price" : 1000.0
    	},
    	{
    		"paymentSeq" : "2014082510002164",
    		"purchaseToken" : "8nkx3SzATKlI74vmgQLzHExmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBaAC",
    		"itemSeq" : 1000209,
    	    "marketItemId"	: "item02",
    		"currency" : "KRW",
    		"price" : 1000.0
    	}
    ],
    "failList": [
    	{
    		"paymentSeq" : "2014082510002165",
    		"purchaseToken" : null,
    		"itemSeq" : 1000210,
    		"marketItemId"	: "item03",
    		"currency" : "KRW",
    		"price" : 1000.0
    	}
    ]
}
```

### API 호출 이후 에러 정보에 대한 처리

InAppPurchaseException 클래스는 API 호출에 대한 에러 정보를 전달 합니다.

```java
InAppPurchases.InAppPurchase.queryPurchases(activity, new PurchaseListCallback() {

    @Override
    public void onCallback(JSONArray result, InAppPurchaseException exception) {
           if (exception != null) {
              int errorCode = exception.getErrorCode();
              String errorMessage = exception.getMessage();
              // TODO : 에러 발생시에 대한 처리를 정의 합니다.
              ....
              return;
           }
     }
});
```

* errorCode - 에러코드
* errorMessage - 에러에 대한 상세 정보

> [참고]  
> [Error Code Guide](/Common/IAP/zh/Error%20Code/)    

## Android Sample Application

Eclipse + ADT 개발환경에서 샘플 애플리케이션을 다음과 같이 import하여 참고할 수 있습니다.

```
[Eclipse] > [File] > [Import] 선택  
[Android - Existing Android Code into Workspace] 선택 > [Next] 선택  
<Import Projects> 창 > [Browse] 버튼 클릭 > [IAP Android SDK]의 폴더 선택  
[IAP Android SDK]와 샘플 애플리케이션의 프로젝트가 [Import] 목록에 표시  
Import 할 프로젝트 체크  
[Copy Project into Workspace] 체크  
[Finish] 버튼을 선택하여 Import 완료
```

![[그림 3 샘플 애플리케이션 추가]](http://static.toastoven.net/prod_iap/iap_7.jpg)
<center>[그림 3 샘플 애플리케이션 추가]</center>

### 테스트 스토어를 통한 테스트

IAP Android SDK에서 제공하는 API를 실제 스토어 연동 정보 없이 테스트 하기 위해 스토어 코드를 TEST로 설정합니다.

```xml
<meta-data android:name="com.toast.iap.config.market" android:value="TEST" />
```

### 예제 코드

com.nhnent.iap.sample 패키지의 IAPServiceProvider 클래스 참고.

## Android Reference

# Package: com.toast.android.iap

### public interface InAppPurchase

인앱 결제 요청을 위한 interface

[Method Summary]

| 이름             | Return Value | 파라미터                                                      |
| -------------- | ------------ | --------------------------------------------------------- |
| setDebugMode   | void         | boolean isDebuggable                                      |
| registerUserId | void         | String userId                                             |
| requestPuchase | void         | Activity activity, long itemId, PurchaseCallback callback |
| queryPurchases | void         | Activity activity, PurchaseListCallback callback          |

[setDebugMode]

|용어|설명|
| ----- | -- |
| Description |  IAP SDK의 로그 정보 활성화 여부를 설정합니다. |
| Syntax | public void setDebugMode(boolean isDebuggable)  |
| Parameters |  isDebuggable [in] 로그 활성화 여부, true 일때 로그정보를 노출 합니다. |

[Example Code]

```java
InAppPurchases.InAppPurchase.setDebugMode(true);
```

[registerUserId]

|용어|설명|
| ----- |--|
| Description |  애플리케이션에서 사용자에 대한 인증 이후에 사용자 식별이 가능한 값을 등록합니다. 스토어 계정이 아닙니다. |
| Syntax |public void registerUserId(String userId) |
| Parameters |  userId [in] 사용자 식별자 값으로 userId는 변하지 않는 고유한 값이어야만 합니다. |
| Return Value |  void |

[Example Code]

```java
InAppPurchases.InAppPurchase.registerUserId("guest0001");
```

[requestPurchase]

|용어 |설명|
| ----- | -- |
| Description | 인앱 결제 요청을 합니다. 결제 요청에 대한 응답은 PurchaseCallback 인터페이스를 통해 전달 받습니다. <br/>* 아이템에 대한 정보는 Web Console을 통해 등록합니다. |
| Syntax | public void requestPurchase(Activity activity, long itemId, PurchaseCallback callback) |
| Parameters |  activity  [in] 어플리케이션의 현재 액티비티 |
| Parameters |itemId [in] Web Console에서 발급된 아이템 번호 |
| Parameters |callback [in] API 요청 결과를 전달 하는 콜백 |
| Return Value |  void |

[Response (JSON)]

| Attribute     | Value  | Description                                       |
| ------------- | ------ | ------------------------------------------------- |
| paymentSeq    | String | 완료한 결제에 대한 결제번호                                   |
| itemSeq       | Long   | 아이템번호                                             |
| purchaseToken | String | 애플리케이션 서버에서 IAP 서버에 결제내역 소비(Consume) 요청시 필요한 토큰정보 |
| currency      | String | 상품의 화폐 단위                                         |
| price         | Float  | 상품의 가격                                            |

[Response Example]

```json
{
    "paymentSeq": "2014082210002092",
    "purchaseToken": "5PYSHgisiCU8BditHnDbPhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
    "itemSeq": 1000001,
    "currency": "KRW",
    "price" : 1000.0
}
```

[queryPurchases]

|용어|설명|
| ----- | ----- | ----- |
| Description |  소비(Consume) 되지 않은 결제내역을 조회합니다. |
| Syntax | public void queryPurchases(Activity activity, PurchaseListCallback callback) |
| Parameters |  activity [in] 어플리케이션의 현재 액티비티 |
| Parameters | callback [in] API 요청 결과를 전달 하는 콜백 |
| Return Value |  void |

**[Response (JSON)]**

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
    "price" : 1000.0

}, {
    "paymentSeq": "2014082210002093",
    "purchaseToken": "Q+os4dDsYaGiEEqkLeXQfhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
    "itemSeq": 1000208,
    "currency": "KRW",
    "price" : 1000.0

}, {
    "paymentSeq": "2014082210002094",
    "purchaseToken": "GMBcODtMnX306wVlFGIcDRmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
    "itemSeq": 1000208,
    "currency": "KRW",
    "price" : 1000.0

}]
```


[queryItems]

|용어|설명|
| ----- | ----- | ----- |
| Description |  구매 가능한 모든 아이템 내역을 조회합니다. |
| Syntax | public void queryItems(Activity activity, ItemListCallback callback) |
| Parameters |  activity [in] 어플리케이션의 현재 액티비티 |
| Parameters | callback [in] API 요청 결과를 전달 하는 콜백 |
| Return Value |  void |

**[Response (JSON)]**

| Attribute     | Value  | Description                      |
| ------------- | ------ | -------------------------------- |
| itemSeq       | Long   | 아이템 번호                             |
| itemName      | String | 아이템명 |
| marketItemId  | String | 스토어별 상품 ID                           |
| currency      | String | 상품의 화폐 단위                        |
| price         | Float  | 상품의 가격                           |

[Response Example]

```json
[{
    "itemSeq" : 1000208,
    "itemName" : "Test item 01",
    "marketItemId": "item01",
    "price": 1000,
    "currency": "KRW"
}, {
    "itemSeq" : 1000209,
    "itemName" : "Test item 02",
    "marketItemId": "item02",
    "price": 7.99,
    "currency": "USD"
}]
```


### public interface InAppPurchase.PurchaseCallback

인앱 결제 요청 후에 결과를 전달받기 위한 callback interface

[Method Summary]

| 이름         | Return Value | 파라미터                                                |
| ---------- | ------------ | --------------------------------------------------- |
| onCallback | void         | JSONObject result, InAppPurchaseException exception |

[onCallback]

|용어|설명|
| ----- | ----- | ----- |
| Description |  API 요청 결과를 전달합니다. |
| Syntax | public abstract void onCallback(JSONObject result, InAppPurchaseException exception) |
| Parameters |  result [in] 응답 결과에 대한 코드 및 추가 정보를 전달 |
| Parameters | exception [in] 에러에 대한 정보를 전달한다. null이면 요청 성공 |
| Return Value |  void |

### public interface InAppPurchase.PurchaseListCallback

결제 내역 요청 후에 결과를 전달받기 위한 callback interface

[Method Summary]

| 이름         | Return Value | 파라미터                                               |
| ---------- | ------------ | -------------------------------------------------- |
| onCallback | void         | JSONArray result, InAppPurchaseException exception |

[onCallback]

|용어|설명|
| ----- | ----- | ----- |
| Description |  API 요청 결과를 전달합니다. |
| Syntax | public abstract void onCallback(JSONArray result, InAppPurchaseException exception) |
| Parameters |  result [in] 응답 결과에 대한 코드 및 추가 정보를 전달 |
| Parameters | exception [in] 에러에 대한 정보를 전달한다. null이면 요청 성공 |
| Return Value |  void |

> [참고]  
> 1\. 비동기 API는 UI Thread(메인 Thread) 에서 호출하도록 합니다.    
> 2\. 비동기 API 호출시에는 응답결과를 파라미터의 콜백 인터페이스를 통해 전달 합니다.

### public final class InAppPurchases

인앱 결제를 위한 인터페이스를 제공하는 Entry Point

[Field]

| Type                              | Variable       | Description     |
| --------------------------------- | -------------- | --------------- |
| public static final InAppPurchase | InAppPurchases | 인앱 결제를 위한 인터페이스 |

[getSdkVersion]

|용어|설명|
| ----- | ----- |
| Description |  SDK의 Version을 반환합니다 |
| Syntax | public static String getSdkVersion() |
| Return Value |  String SDK의 Version 정보 |

[getAppId]

|용어|설명|
| ----- | ----- |
| Description |  앱ID를 반환 합니다 |
| Syntax | public static long getAppId() |
| Return Value |  String SDK에 설정한 앱ID 정보 |

# Package: com.toast.android.iap.exception

### public class InAppPurchaseException extends Exception

API 요청에 대한 에러정보를 전달한다.

[getErrorCode]

|용어|설명|
| ----- | ----- |
| Description |  에러 코드를 반환 합니다. |
| Syntax | public int getErrorCode() |
| Return Value |  int 에러코드 |

[getMessage]

|용어|설명|
| ----- | ----- |
| Description |  에러의 상세정보를 반환 합니다. |
| Syntax | public String getMessage() |
| Return Value |  String 에러의 상세정보 |
