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
Create project in Unity Editor
```

![[Figure. 1 Project Creation]](http://static.toastoven.net/prod_iap/iap_11.png)
<center>[Figure. 1 Project Creation]</center>

```
In Unity Editor, Select [Assets] > [Import Package] > [Custom Package] 
select [In App Purchase Unity SDK]
```

![[Figure. 2 Select Custom Package]](http://static.toastoven.net/prod_iap/iap_12.png)
<center>[Figure. 2 Select Custom Package]</center>

```
Step3 : Import all assets
```

![[Figure 3 Importing package]](http://static.toastoven.net/prod_iap/iap_13.png)
<center>[Figure. 3 Importing package]</center>

### Android Configuration and Build

```
1. Select [File - Build Settings] in Unity Editor
2. Select [Platform]- Android and  [Switch Platform]  
3. Change setting  of [Android - Others Setting] according to below.
4. [Minimum API Level] IAP Unity Plugin supports Android API Level 10 and beyond
```

![[Figure 4 Setting for Android]](http://static.toastoven.net/prod_iap/iap_14.png)
<center>[Figure. 4 Setting for Android]</center>

```
Modify your AndroidManifest.xml according to AndroidManifest-iap-template.xml.
```

![[Figure 5 AndroidManifest-iap-template.xml]](http://static.toastoven.net/prod_iap/iap_15.png)
<center>[Figure. 5 AndroidManifest-iap-template.xml]</center>

> [Reference]  
> Refer to Android project setting for Android Build Environment Setting.

### iOS Environment Setting and Build

```
1. Select [File] - Build Settings] in Unity Editor
2. Select [Platform]- iOS and click [Switch Platform] 
```

![[Figure 6 Select Platform IOS]](http://static.toastoven.net/prod_iap/iap_20.jpg)
<center>[Figure. 6 Select Platform IOS]</center>

```
Register [Player Settings] > [Settings for iOS] > Bundle identifier 
```

![[Figure 7 Settings for iOS]](http://static.toastoven.net/prod_iap/iap_21.jpg)
<center>[Figure. 7 Settings for iOS]</center>

```
1. Create Xcode Project in random folder
2. Implement Xcode through [iPhone.xcodeproj].
```

![[Figure. 8 Creation XCode Project]](http://static.toastoven.net/prod_iap/iap_22.jpg)
<center>[Figure. 8 Creation XCode Project]</center>

```
Implement created Xcode project.   
1. [Xcode] > [Project] > [Targets – Build Phases]  
2. Add frameworks under [Link Bianry With Libraries]  
    - StoreKit.framework  
    - libsqlite3.dylib  
    - CoreTelephony.framework (beyond TOAST-IAP-UnityPlugin-1.3.0 version)
4. Create string value with TOAST_IAP_APP_ID key at [plist] and enter App ID
```

> [Reference]  
> Refer to iOS SDK Developer’s Guide for more detailed information on iOS build configuration. [iOS Developer's Guide](/Common/IAP/en/iOS%20Developer%60s%20Guide/)

### Unity Plugin Initialization

Follow below initialization instruction to use IAP Unity plugin. 

[Example Response]

```java
using Toast.IAP;
...
void Start()
{
   InAppPurchase.Init();
}
```

### Sample Application

Unity Editor offers sample console as below for InAppPurchase API test.(Refer to Sample directory)
In Unity Editor, API response will be delivered in mock format. For actual payment test, complete the build with Android device.  

![[Figure. 9 Sample Console]](http://static.toastoven.net/prod_iap/iap_43.png)
<center>[Figure. 9 Sample Console]</center>

* RegisterUserId : Registration of User ID
* Request Purchase : Request payment
* Query Purchase List : Inquiry unconsumed payments
* Query Item List : Inquiry purchasable items
* Processes Incomplete Purchases : Processes Incomplete Purchases

## API Reference

# namespace Toast.IAP

### public class InAppPurchase

Provide method for in-app purchase 

[Method Summary]

| Name                              | Return Value | Parameter                                 |
| --------------------------------- | ------------ | ---------------------------------------- |
| Init                              | Result       |                                          |
| SetDebugMode                      | void         | bool isDebuggable                        |
| RegisterUserId                    | Result       | String userId                            |
| AsyncRequestPuchase               | void         | long itemId, OnResponsePurchase callback |
| AsyncQueryPurchases               | void         | OnResponsePurchase callback              |
| AsyncQueryItems                   | void         | OnResponsePurchase callback              |
| AsyncProcessesIncompletePurchases | void         | OnResponsePurchase callback              |

[Init]

|Terms |Description|
| ----- | ----- |
| Description |  initialize unity plugin|
| Syntax | public static Result Init(); |
| Return Value |  Result return result of initialization|

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

|Terms |Description|
| ----- | ----- |
| Description |  Set whether to activate iOS/Android level log of IAP Unity plugin. |
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

|Terms |Description|
| ----- | ----- |
| Description |  Register user identifier defined in application. |
| Syntax | public Result RegisterUserId(String userId); |
| Parameters |  userId  |
| Return Value |  returns result of api |

[Example Code]

```java
InAppPurchase.RegisterUserId("guest001");
```

[AsyncRequestPurchase]

|Terms |Description|
| ----- | ----- |
| Description |  Send in-app purchase request. Receive response for payment request via delegate. |
| Syntax | public static void AsyncRequestPurchase(long itemId, OnResponsePurchase callback) |
| Parameters |  itemId [in] obtained in web console |
| Parameters | callback [in]  delegate which delivers result of API.|
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
| paymentSeq    | String | payment unique identifier                 |
| itemSeq       | Long   | item unique identifier                            |
| purchaseToken | String | token for verification and consume |
| currency      | String | currency                       |
| price         | Float  | price                           |

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

|Terms |Description|
| ----- | ----- |
| Description |  Inquire unconsumed payment history. |
| Syntax | public static void AsyncQueryPurchases(OnResponsePurchase callback) |
| Parameters |  callback  [in] delegate which delivers result of API. |
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
| paymentSeq    | String | payment unique identifier                 |
| itemSeq       | Long   | item unique identifier                            |
| purchaseToken | String | token for verification and consume |
| currency      | String | currency                       |
| price         | Float  | price                           |                        |

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

|Terms |Description|
| ----- | ----- |
| Description |  Inquire all purchasable items |
| Syntax | public static void AsyncQueryItems(OnResponsePurchase callback) |
| Parameters |  callback  [in] delegate which delivers result of API |
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

    // TODO : process your job after successful inquiry

});
```

[Response(JSON)]

| Attribute     | Value  | Description                      |
| ------------- | ------ | -------------------------------- |
| itemSeq    | Long | item unique identifier                            |
| itemName | String | item name |
| marketItemId       | Long   | product ID in store                          |
| currency      | String | currency                        |
| price         | Float  | price                           |

[Response Example]

```json

[{
    "itemSeq": 1000208,
    "itemName": "Test item 01",
    "marketItemId": "item01",
    "price": 1000,
    "currency": "KRW"
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

|Terms |Description|
| ----- | ----- |
| Description | batch processing of incomplete payment|
| Syntax | public static void AsyncProcessesIncompletePurchases(OnResponsePurchase callback) |
| Parameters |  callback  [in]  delegate which delivers result of API. |
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

    // TODO : process your job after successful process

});
```

[Response(JSON)]

| Attribute     | Value  | Description                      |
| ------------- | ------ | -------------------------------- |
| itemSeq    | Long | item unique identifier                            |
| itemName | String | item name |
| marketItemId       | Long   | product ID in store                          |
| currency      | String | currency                        |
| price         | Float  | price                           |

[Response Example]

```json

[{
    "itemSeq": 1000208,
    "itemName": "Test item 01",
    "marketItemId": "item01",
    "price": 1000,
    "currency": "KRW"
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

shows response of API.

[IsSuccessful]

|Terms |Description|
| ----- | ----- |
| Description |  API result is successful or not|
| Syntax | public bool IsSuccessful; |
| Return Value |  true/false|

[ResultCode]

|Terms |Description|
| ----- | ---- |
| Description |  returns error code |
| Syntax | public int ResultCode; |
| Return Value |  Int  |

[ResultString]

|Terms |Description|
| ----- | ----- |
| Description |  detail error message |
| Syntax | public int ResultString; |
| Return Value |  Int detail error message |

### public class PluginVersion

manage version of plugin.

[VersionInt]

|Terms |Description|
| ----- | ----- |
| Description |  Plugin version |
| Syntax | public const int VersionInt |

[VersionString]

|Terms |Description|
| ----- | ----- |
| Description |  Plugin version |
| Syntax | public const String VersionString |
