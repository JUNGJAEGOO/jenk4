title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > IAP > Android Developer's Guide

## 开发环境

```
- Windows
- Eclipse in Android Development Tools / Android Studio IDE 1.2
- Android 5.0.1 (API Level 21)
- Android SDK Version为 **2.3.3 (API Level 10)** 以上
```

## 使用的开源信息如下。

| 名称  | 参照 | 版本 | 授权 |
|---|---|---|---|
| okhttp |  http://square.github.io/okhttp/         | 1.5.4 |  Apache License 2.0|
| gson |    https://code.google.com/p/google-gson/  | 2.2.4 |  Apache License 2.0|
                                                          

## 在Android Studio & Gradle 环境中使用

IAP的Android SDK提供的是有关以Gradle为基础的Android Studio<br>
IDE的开发环境。从jCenter Maven Repository<br>
开始就用Remote进行下载。在如下所示的项目build.gradle文件上，对repository和dependency下定义即可。

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

> [参考]<br>
> 在project.TOAST_IAP_SDK_VERSION 上 明确SDK的version。Gradle<br>
> 推荐使用1.1.0 Version以上的Gradle Project。<br>

<br>
> [参考]
> Release History<br>
> SDK的Version的更改历史请参考Package内的RELEASE-NOTES.md。

### 执行样品应用

IAP的Android SDK提供的是有关以Gradle为基础的Android Studio<br>
IDE的开发环境。从jCenter Maven Repository<br>
开始就用Remote进行下载。在如下所示的项目build.gradle文件上，对repository和dependency下定义即可。

#### Import Project

在Android Studio上Import Project ，添加SDK<br>
Package的/toast-iap-android-sdk-studio。

<br>
> [参考]<br>
> 修改local.properties<br>
> local.properties内部的sdk.dir的值更改为安装于本机上的 Android<br>
> SDK的路径。如果用 release 创建样式来创建样品应用的话，需输入APK<br>
> signing的keystore信息。Flavor 及 buildType可在Android Studio的Build<br>
> Variants 菜单中进行选择。

> [参考]<br>
> Workspace Encoding Type<br>
> Import 的 Project的Workspace File<br>
> Encoding确认为UTF-8。若不是的话，将其更为UTF-8。

#### 在AndroidManifest.xml上设置Store信息 

通过IAP Web Console注册的市场信息设置appId / Store 。

> [参考]<br>
> 设置appId / Store<br>
> 设置方法请参考样品应用的各Store Flavor的AndroidManifest.xml。

## 在Eclipse环境中使用
IAP Android SDK用Android Library项目形态进行部署。

| 目录名  | 说明 | 
|-|-|
| /docs                                    |  API 参考|
| /toast-iap-android-sdk-eclipse/iap       | IAP Android Library项目|
| /toast-iap-android-sdk-eclipse/iap-sample | 样品应用|

[表1 Android SDK 目录信息]

### Import 方法

```
[Eclipse] > [File] > 选择[Import]   
[Android] – 选择[Existing Android Code into Workspace]   
<Import Projects> 窗口 > [Browse] 按钮> 选择[IAP SDK]文件夹
IAP SDK和样品应用的项目标识于Import ，在将项目全选的情况下选择[Finish]。
```

> [参考]<br>
> Import 后， Project出现错误时，进行如下操作。<br>
> - [project] > 选择 [clean]<br>
> - 右击 [IAP] > [Properties] > [Resource] > [Text File Encoding]用UTF-8进行设置

### 添加IAP Android SDK 

```
[project]右击> [Properties] > [Android] > [Add] > 添加IAP 
```

![[图1添加 IAP SDK]](http://static.toastoven.net/prod_iap/iap_5.jpg)

<center>[图1添加 IAP SDK]</center>

## 设置Android 项目

### 添加AndroidManifest.xml 

以Google Play为准制作的内容。

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


AndroidManifest.xml的设置信息如下。

|  Property Name |                 Description| 
| --------------------------- | ---------------------------- |
|  android.permission    |         使用IAP的共同Android 权限 <br/>* 可重复省略permission| 
|  com.android.vending.BILLING|    为Google Play设置的权限。 <br/>* 各Store名有所不同或是否包含也不同| 
|  Activity                     |  在IAP上注册提供的Activity| 
|  com.toast.iap.config.appId  |   IAP Web控制台上发行的App序列号| 
|  com.toast.iap.config.market  |  Store信息 <br/>GG : Google Play <br/>TS : T Store <br/>NA : Naver App Store <br/>TEST : 测试| 

[表2 AndroidManifest.xml 设置信息]

> [参考]<br>
> 用TEST设置Store信息时，没有另外的Store关联信息，可轻松体验 IAP的API。<br>
> 详细内容请参考Sample Application 。

## IAP 结算流程图

In App结算分结算请求和结算消费2个阶段进行。<br>
到结算消费为止全部完成以后，在用户的应用上支付项目即可。

> [参考]<br>
> (#iap-结算流程图)(/Common/IAP/ko/Overview/\#iap)

### 注册用户标识符

注册完成认证的用户ID。.<br>
是开发公司定义的用户识别Key，是支付项目的对象。

[Request Example]

```java
InAppPurchases.InAppPurchase.registerUserId(userId); // userId : String value
```

### 查询可购买的项目明细

查询可购买的所有项目明细。

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

|  用语  |         说明|
| ----- | --- |
|  Syntax    |     public void queryItems(Activity activity, ItemListCallback callback)|
|  Parameters |    activity [in] App的当前活动|
|  Parameter   |   callback [in] 传达API请求结果的回调函数|
|  Return Value |  void|
                 
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
    }
]
```

### 结算请求

在客户端上请求购买项目。有关结算请求的应答，结算成功的话，结果值传至服务器，(Consume) 结算明细。

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

|  用语  |         说明|
| ----- |  --- |
|  Syntax |        public void requestPurchase(Activity activity, long itemId, String currency, float price, PurchaseCallback callback)|
|  Parameters    | activity [in] App的当前活动|
|  Parameters    | itemId [in] Web Console [Item]上发行的ID|
|  Parameters    | callback [in] 传达API请求结果的回调函数|
|  Return Value  | void|

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

> [参考]<br>
> IAP Android SDK结算确认窗<br>
> toast-iap-android-sdk-1.2.3开始，没有现存的如下的结算确认窗，直接用Store结算。

![[图 2 现存结算确认窗]](http://static.toastoven.net/prod_iap/iap_40.jpg)

<center>[图 2 现存结算确认窗]</center>

### 结算消费

用户应用服务器在支付项目前，要向IAP服务器告知要消费的结算。此时，利用结算购买令牌<br>
(Payment Purchase Token)，可确保用户服务器和IAP服务器间的有效性结算安全。

> [参考]<br>
> [Server Payment Consume API](/Common/IAP/ko/Server%20Developer%60s%20Guide/#payment-consume-api)  


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

### 查询未消费结算明细

查询用户未消费(Consume)的结算明细。

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

|用语 |          说明|
|--------|--------|
|Syntax         |public void queryPurchases(Activity activity, PurchaseListCallback callback)|
|Parameters     |activity [in] App的当前活动|
|Parameter     | callback [in] 传达API请求结果的回调函数|
|Return Value |  void|

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

### 未处理的结算项作批量再处理

对于未处理的结算项(IAP服务器验证失败)，将进行批量再处理。

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

|用语 |          说明|
|--------|--------|
|Syntax         |public void processesIncompletePurchases(Activity activity, IncompletePurchasesCallback callback)|
|Parameters    | activity [in] 应用的当前活动|
|Parameter    |  callback [in] 传达API请求结果的回调函数|
|Return Value|   void|

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

### 呼叫API以后，对于错误信息的处理 

InAppPurchaseException Class传达有关呼叫API的错误信息。

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

* errorCode - 错误代码
* errorMessage - 有关错误的详细信息

> [参考]
> [Error Code Guide](/Common/IAP/ko/Error%20Code/)    

## Android Sample Application

在Eclipse + ADT的开发环境中，可参照下面import样品应用。

```
[Eclipse] > [File] > 选择[Import] 
选择[Android - Existing Android Code into Workspace]> 选择[Next]  
<Import Projects> 窗口 > 点击[Browse]按钮> 选择[IAP Android SDK]的文件夹
[IAP Android SDK]和样品应用的项目标识于[Import]上
核对要Import的项目 
核对[Copy Project into Workspace]   
选择[Finish]按钮，完成Import 
```

![[图 3 添加样品应用]](http://static.toastoven.net/prod_iap/iap_7.jpg)

<center>[图 3 添加样品应用]</center>

### 通过Test Store进行的测试

IAP Android SDK上提供的API实际上并无Store关联信息，为了测试，用TEST设置了Store。

```xml
<meta-data android:name="com.toast.iap.config.market" android:value="TEST" />
```

### 示例代码

参考com.nhnent.iap.sample Package的IAPServiceProvider Class。

## Android Reference

# Package: com.toast.android.iap

### public interface InAppPurchase

进行InApp结算请求的interface

[Method Summary]

|名称  |           Return Value |  参数|
| -------------- | ------------ | --------------------------------------------------------- |
|setDebugMode   |  void  |         boolean isDebuggable|
|registerUserId |  void  |         String userId|
|requestPuchase |  void  |         Activity activity, long itemId, PurchaseCallback callback|
|queryPurchases |  void  |         Activity activity, PurchaseListCallback callback|

[setDebugMode]

|用语          说明
| ----- | -- |
|Description |  是否设置IAP SDK的日志信息活性化。|
|Syntax      |  public void setDebugMode(boolean isDebuggable)|
|Parameters  |  isDebuggable \[in\] 日志是否活性化，当它true时，会泄露日志信息。|

[Example Code]

```java
InAppPurchases.InAppPurchase.setDebugMode(true);
```

[registerUserId]

|用语  |        说明|
| ----- |--|
|Description |  在应用上对用户进行认证后，注册可识别用户的值。并不是Store账户。.|
|Syntax      |  public void registerUserId(String userId)|
|Parameters   | userId [in] 使用用户标识符值userId，只能是不变固有的值。|
|Return Value  |     Void|
         


[Example Code]

```java
InAppPurchases.InAppPurchase.registerUserId("guest0001");
```

[requestPurchase]

|用语 |          说明|
| ----- | -- |
|Description   | 请求结算InApp。有关结算请求的应答通过PurchaseCallback interface来接收。 \* 有关项目的信息通过Web Console来进行注册。|
|Syntax        | public void requestPurchase(Activity activity, long itemId, PurchaseCallback callback)|
|Parameters    | activity \[in\] App的当前活动|
|Parameters    | itemId \[in\] Web Console上发行的项目编号|
|Parameters    | callback \[in\] 传达API请求结果的回调函数|
|Return Value  | void|
                 

[Response (JSON)]

|Attribute      | Value   | Description|
| ------------- | ------ | ------------------------------------------------- |
|paymentSeq     | String|   有关完成的结算的结算编号|
|itemSeq        | Long   |  项目编号|
|purchaseToken  | String |  应用服务器上IAP服务器的结算明细消费(Consume) 邀请时所需的令牌信息|
|currency       | String |  商品的货币单位|
|price          | Float  |  商品的价格|

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

|  用语          | 说明 |
| ----- | ----- |
|Description |   查询未消费(Consume)的结算明细。                                                |
|Syntax      |   public void queryPurchases(Activity activity, PurchaseListCallback callback) |  
|Parameters  |   activity [in] 应用的当前活动                                                 |
|Parameters  |   callback [in] 传达API请求结果的回调函数                                      |
|Return Value |  Void|
                                                                                                
                                                                                                

**[Response (JSON)]**

|Attribute |      Value |   Description|
| ------------- | ------ | -------------------------------- |
|paymentSeq     | String |  结算编号|
|purchaseToken  | String |  通知应用服务器和IAP服务间的结算时所需的令牌|
|itemSeq        | Long   |  项目编号|
|currency       | String |  商品的货币单位|
|price          | Float  |  商品的价格|

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

|用语  |         说明                                                                   |
| ----- | ----- | 
|Description |   查询可购买的所有项目明细。                                             |
|Syntax       |  public void queryItems(Activity activity, ItemListCallback callback)|   
|Parameters   |  activity \[in\] App的当前活动                                          |
|Parameters   |  callback \[in\]传达API请求结果的回调函数                               |
|Return Value |  void                                                               |    

**[Response (JSON)]**

|Attribute    |  Value |   Description|
| ----- | ----- | ----- |
|itemSeq      |  Long  |   项目编号|
|itemName     |  String  | 项目名|
|marketItemId |  String  | 各Store商品ID|
|currency  |     String  | 商品的货币单位|
|price   |       Float   | 商品的价格|

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

请求结算InApp后，接收结果的callback interface

[Method Summary]

|名称  |       Return Value  | 参数|
| ---------- | ------------ | --------------------------------------------------- |
|onCallback |  void          | JSONObject result, InAppPurchaseException exception|

[onCallback]

|用语  |         说明           |                                                                        
| ---------- | ------------ | 
|Description |   传达API请求结果。                                                                      
|Syntax       |  public abstract void onCallback(JSONObject result, InAppPurchaseException exception)   |
|Parameters   |  result [in] 传达有关应答的代码及添加信息。                                        |   
|Parameters   |  exception [in] 传达有关错误的信息。若为null的话，则表示请求成功。                    |
|Return Value |  void                                                                                   |
                                                                                                        

### public interface InAppPurchase.PurchaseListCallback

邀请结算明细后，为接受结果callback interface

[Method Summary]

|名称 |        Return Value  | 参数|
|------------ |-------------- | ---------------------------------------------------- |
|onCallback |  Void |          JSONArray result, InAppPurchaseException exception|

[onCallback]

| 用语 |           说明   |                                                                               | 
| ----- | ----- | ----- |
|Description  |  传达API请求结果。                                                                     |
|Syntax       |  public abstract void onCallback(JSONArray result, InAppPurchaseException exception)   |
|Parameters   |  result [in] 传达有关应答的代码及添加信息。                                       |   
|Parameters   |  exception [in] 传达有关错误的信息。若为null的话，则表示请求成功。                   |
|Return Value  | void                                                                                  |

> [参考]<br>
> 1. 异步的API在 UI Thread(主页 Thread) 上进行呼叫。<br>
> 2. 在呼叫异步的API 时，通过参数的回调接口传达应答结果。

### public final class InAppPurchases

提供进行InApp结算的接口的Entry Point。

[Field]

| Type|                                 Variable        |  Description| 
| ----- | ----- | ----- |
|public static final InAppPurchase  | InAppPurchases|   进行InApp结算的接口|
                                                       

[getSdkVersion\

|用语 |          说明|
| ----- | ----- |
|Description  |  归还SDK的Version。|
|Syntax       |  public static String getSdkVersion()|
|Return Value |  String SDK的Version信息|

[getAppId]

|用语         |  说明|
| ----- | ----- |
|Description   | 归还App ID。|
|Syntax        | public static long getAppId()|
|Return Value  | String SDK上设置的App ID信息|

# Package: com.toast.android.iap.exception

### public class InAppPurchaseException extends Exception

传达有关API请求的错误信息。

[getErrorCode]

|用语 |          说明|
| ----- | ----- |
|Description |   归还错误代码。|
|Syntax       |  public int getErrorCode()|
|Return Value  | int 错误代码|

[getMessage]

|用语  |         说明|
| ----- | ----- |
|Description |   归还错误的详细信息。|
|Syntax       |  public String getMessage()|
|Return Value  | String 错误的详细信息|
