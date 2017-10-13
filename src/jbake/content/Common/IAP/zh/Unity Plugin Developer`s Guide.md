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
在Unity Editor上生成项目
```

![[图 1 生成项目]](http://static.toastoven.net/prod_iap/iap_11.png)
<center>[图 1 生成项目]</center>

```
在Unity Editor上选择[Assets] > [Import Package] > [Custom Package] 
选择[In App Purchase Unity SDK]
```

![[图 2 选择Custom Package]](http://static.toastoven.net/prod_iap/iap_12.png)
<center>[图 2 选择Custom Package]</center>

```
Step3 : Import所有Assets。
```


![[图 3 Importing package]](http://static.toastoven.net/prod_iap/iap_13.png)
<center>[图 3 Importing package]</center>

### Android 环境设置及创建

```
1. 选择Unity Editor的[File - Build Settings] 
2. 选择[Platform]- Android，[Switch Platform]  
3. 在[Player Setting]上，参考以下内容修改[Android - Others Setting]信息。
4. [Minimum API Level] IAP Unity插件支持Android API Level 10以上。
```

![[图 4 Setting for Android]](http://static.toastoven.net/prod_iap/iap_14.png)
<center>[图 4 Setting for Android]</center>

```
参照AndroidManifest-iap-template.xml信息来修改App的AndroidManifest.xml信息 
```

![[图 5 AndroidManifest-iap-template.xml]](http://static.toastoven.net/prod_iap/iap_15.png)
<center>[图 5 AndroidManifest-iap-template.xml]</center>

> [参考]<br>
> 详细的 Android创建环境设置参照Android 项目设置。

### iOS 环境设置及创建

```
1. 选择Unity Editor的[File] - Build Settings] 
2. 选择[Platform]- iOS，[Switch Platform]
```

![[图 6 选择Platform iOS]](http://static.toastoven.net/prod_iap/iap_20.jpg)
<center>[图 6 选择Platform iOS]</center>

```
[Player Settings] > [Settings for iOS] > 输入Bundle identifier
```

![[图 7 Settings for iOS]](http://static.toastoven.net/prod_iap/iap_21.jpg)
<center>[图 7 Settings for iOS]</center>

```
1. 选择[Build]按钮，生成Xcode项目。
2. 在和[unity_ios]一样的任意的文件夹中生成项目
3. 通过[iPhone.xcodeproj]来运行Xcode。
```

![[图 8 用iOS Platform进行创建，并生成Xcode项目]](http://static.toastoven.net/prod_iap/iap_22.jpg)
<center>[图 8 用iOS Platform进行创建，并生成Xcode项目]</center>

```
运行生成的Xcode项目。
1. [Xcode] > [Project] > [Targets – Build Phases]  
2. 在[Link Bianry With Libraries]上添加下面的framworks 
    - StoreKit.framework  
    - libsqlite3.dylib  
    - CoreTelephony.framework (TOAST-IAP-UnityPlugin-1.3.0以后版本)
4. 在[plist]上，TOAST_IAP_APP_ID生成了KEY的string value，并输入了APP ID。
```

> [参考]<br>
> 详细的 iOS 创建环境设置参照iOS Developer's Guide即可。

### Unity插件初始化

为了使用IAP Unity 插件，需要进行如下初始化过程。

[Example Response]

```java
using Toast.IAP;
...
void Start()
{
   InAppPurchase.Init();
}
```

### 样品App

在Unity Editor上，提供如下的测试InAppPurchase<br>
API的样品Console。(参照Sample文件夹) 在Unity Editor上，传达Mock形态的<br>
API应答，为了测试实际结算，通过Android设备创建后进行测试。

![[图 9 样品控制台]](http://static.toastoven.net/prod_iap/iap_43.png)
<center>[图 9 样品控制台]</center>

* RegisterUserId : 注册用户ID
* Request Purchase : 请求结算
* Query Purchase List : 查询未消费结算明细
* Query Item List : 查询可购买的商品
* Processes Incomplete Purchases : 重新处理未结算项

## API Reference

# namespace Toast.IAP

### public class InAppPurchase

提供In App结算的Method。

[Method Summary]

|名称 |                               Return Value  | 参数|
| --------------------------------- | ------------ | ---------------------------------------- |
|Init |                               Result      |   | |
|SetDebugMode  |                      void       |    bool isDebuggable|
|RegisterUserId  |                    Result    |     String userId|
|AsyncRequestPuchase |                void     |      long itemId, OnResponsePurchase callback|
|AsyncQueryPurchases  |               void    |       OnResponsePurchase callback|
|AsyncQueryItems       |              void   |        OnResponsePurchase callback|
|AsyncProcessesIncompletePurchases |  void  |         OnResponsePurchase callback|

[Init]

|用语 |          说明|
| ----- | ----- |
|Description |   初始化Unity插件。|
|Syntax       |  public static Result Init();|
|Return Value  | 归还Result初始化是否成功。|

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

|用语 |         说明|
| ----- | ----- |
|Description |  设置IAP Unity插件的iOS/Android Level的日志活性化与否。|
|Syntax |       public static void SetDebugMode(bool isDebuggable);|

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

|用语          | 说明|
| -------------- | ----------------------------------------------|
|Description   | 在App上注册定义的用户识别Key。|
|Syntax        | public Result RegisterUserId(String userId);|
|Parameters    | userId 用户ID|
|Return Value  | 归还有关Result API请求的结果。|

[Example Code]

```
InAppPurchase.RegisterUserId("guest001");
```

[AsyncRequestPurchase]

|用语         |  说明|
| ----- | ----- |
|Description  |  请求In App结算。有关结算请求的应答通过delegate来接收。|
|Syntax       |  public static void AsyncRequestPurchase(long itemId, OnResponsePurchase callback)|
|Parameters   |  在itemId [in] Console上发行的项目编号|
|Parameters   |  callback [in] 传达API请求结果的 delegate|
|Return Value |  void|

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

|Attribute      | Value   | Description|
|--------------- | -------- | -------------------------------------------|
|paymentSeq     | String  | 已完成付款的结算编号|
|itemSeq        | Long    | 项目编号|
|purchaseToken  | String  | 统计应用版本和IAP版本间的结算时所需的令牌|
|currency       | String  | 商品的货币单位|
|price          | Float  |  商品的价格|

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

| 用语          | 说明|
| -------------- | ---------------------------------------------------------------------|
| Description   | 查询未消费(Consume)的结算明细。|
|Syntax        | public static void AsyncQueryPurchases(OnResponsePurchase callback)|
|Parameters    | callback [in] 传达API请求结果的delegate|
|Return Value  | void|

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

\[Response(JSON)\]

|Attribute      | Value  |  Description|
| ------------- | ------ | -------------------------------- |
|paymentSeq    |  String  | 结算编号|
|purchaseToken  | String  | 统计应用版本和IAP版本间的结算时所需的令牌|
|itemSeq        | Long    | 项目编号|
|currency       | String |  商品的货币单位|
|price          | Float |   商品的价格|
                           

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

|用语          | 说明|
| ----- | ----- |
|Description   | 查询可购买的所有项目明细。|
|Syntax         |public static void AsyncQueryItems(OnResponsePurchase callback)|
|Parameters    | callback [in] 传达API请求结果的delegate|
|Return Value  | void|

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

| Attribute     | Value    |Description|
|-------------- | -------- | ----------------|
|itemSeq       | Long   |  项目编号|
|itemName      | String |  项目名|
|marketItemId  | Long   |  各Store商品ID|
|currency      | String |  商品的货币单位|
|price         | Float  |  商品的价格|

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

|用语 |          说明|
| ----- | ----- |
|Description |   对未处理的结算项(IAP 服务器验证失败)进行批量处理。|
|Syntax       |  public static void AsyncProcessesIncompletePurchases(OnResponsePurchase callback)|
|Parameters    | 向callback [in] API传达请求结果的delegate|
|Return Value  | void|

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

|Attribute |     Value   | Description|
| ------------- | ------ | -------------------------------- |
|itemSeq    |    Long    | 项目编号|
|itemName    |   String  | 项目名|
|marketItemId |  Long     |各Store商品ID|
|currency     |  String  | 商品的货币单位|
|price        |  Float  |  商品的价格|

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

出现了API的应答结果。

[IsSuccessful]

|用语 |          说明|
| ----- | ---- |
|Description   | 归还API是否成功。|
|Syntax        | public bool IsSuccessful;|
|Return Value  | 若是bool true的话，请求API 即为成功|

[ResultCode]

|用语  |         说明|
| ----- | ---- |
|Description  |  归还错误代码。|
|Syntax        | public int ResultCode;|
|Return Value  | 归还Int 错误代码|

[ResultString]

|用语         |  说明|
| ----- | ---- |
|Description  |  传达错误的详细信息。|
|Syntax       |  public int ResultString;|
|Return Value |  归还Int 错误的详细信息|

### public class PluginVersion

管理插件的Version信息。

[VersionInt]

|用语         | 说明|
| ----- | ---- |
|Description |  插件的Version信息|
|Syntax |       public const int VersionInt|

[VersionString]

|用语 |         说明|
| ----- | ---- |
|Description |  插件的Version信息|
|Syntax |       public const String VersionString|
