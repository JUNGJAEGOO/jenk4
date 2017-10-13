title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Common &gt; IAP &gt; Unity Plugin Developer's Guide
---------------------------------------------------

### Add In App Purchase SDK

    Create project in Unity Editor

<img src="http://static.toastoven.net/prod_iap/iap_11.png" />

\[Figure 1 Create project\]

    In Unity Editor, select [Assets] > [Import Package] > [Custom Package]
    Select [In App Purchase Unity SDK]

<img src="http://static.toastoven.net/prod_iap/iap_12.png" />

\[Figure 2 Select Custom Package\]

    Step3 : Import all Assets.

<img src="http://static.toastoven.net/prod_iap/iap_13.png" />

\[Figure 3 Importing package\]

### Android Settings And Build

    In Unity Editor, select [File - Build Settings] 
    Select [Platform] - Android then [Switch Platform] 
    In [Player Setting], modify [Android - Others Setting] information referring the content below.  
    [Minimum API Level] IAP unity plug-in supports Android API Level 10 or higher.

<img src=http://static.toastoven.net/prod_iap/iap_14.png" />

\[Figure 4 Setting For Android\]

    Modify information on AndroidManifest.xml of application referring AndroidManifest-iap-template.xml information  

<img src="http://static.toastoven.net/prod_iap/iap_15.png"/>

\[Figure 5 AndroidManifest-iap-template.xml\]

> \[Notee\]
> For details on Android build setting, refer to Android project setting.

### iOS Setting And Build

    In Unity Editor, select [File] – Build Settings] 
    select [Platform] - iOS then [Switch Platform]

<img src="http://static.toastoven.net/prod_iap/iap_20.jpg" />

\[Figure 6 Select iOS In Platform\]

    Enter [Player Settings] > [Settings For iOS] > Bundle identifier

<img src="http://static.toastoven.net/prod_iap/iap_21.jpg"/>

\[Figure 7 Settings For iOS\]

    Select [Build] button and create Xcode project.  
    Create project in temporary folder like [unity_ios] 
    Run Xcode through [iPhone.xcodeproj].

<img src="http://static.toastoven.net/prod_iap/iap_22.jpg" />

\[Figure 8 Create Xcode project by building using iOS Platform\]

    Run created Xcode project.  
    [Xcode] > [Project] > [Targets – Build Phases]  
    Add below framworks in [Link Bianry With Libraries] 
    \- StoreKit.framework  
    \- libsqlite3.dylib  
    \- CoreTelephony.framework (versions after TOAST-IAP-UnityPlugin-1.3.0)
    Create string value in [plist] where TOAST_IAP_APP_ID is KEY, and enter APP ID.

> \[Note\]
> Refer to iOS SDK development guide for iOS build setting details.

### Initialize Unity Plug-in

To use IAP unity plug-in, initialization is necessary as below.

\[Example Response\]

    using Toast.IAP;
    ...
    void Start()
    {
       InAppPurchase.Init();
    }

### Sample Application

Unity Editor provides sample Console to test InAppPurchase API as below.
/refer to Sample folder
Unity Editor transmits API response in Mock format, and for actual purchase test, test after build on Android device.

<img src= "http://static.toastoven.net/prod_iap/iap_43.png" />

\[Figure 9 Sample Console\]

-   RegisterUserId : Register User ID

-   Request Purchase : Request purchase

-   Query Purchase List : Retrieve unconsumed purchase history

-   Query Item List : Look up products available for purchase

API Reference
-------------

namespace Toast.IAP
===================

### public class InAppPurchase

Provide Method for In-App purchase.

\[Method Summary\]

| Name                | Return Value | Parameter                                |
|---------------------|--------------|------------------------------------------|
| Init                | Result       |                                          |
| SetDebugMode        | void         | bool isDebuggable                        |
| RegisterUserId      | Result       | String userId                            |
| AsyncRequestPuchase | void         | long itemId, OnResponsePurchase callback |
| AsyncQueryPurchases | void         | OnResponsePurchase callback              |
| AsyncQueryItems     | void         | OnResponsePurchase callback              |

\[Init\]

| Term         | Description                                        |
|--------------|----------------------------------------------------|
| Description  | Initialize unity plug-in                           |
| Syntax       | public static Result Init();                       |
| Return Value | Return success or failure of Result initialization |

\[Example Code\]

    using Toast.IAP;
    ….
    void start()
    {
       InAppPurchase.Init();
    }

\[SetDebugMode\]

| Term        | Description                                               |
|-------------|-----------------------------------------------------------|
| Description | Set up iOS/Android Level log activation in unity plug-in. |
| Syntax      | public static void SetDebugMode(bool isDebuggable);       |

\[Example Code\]

    using Toast.IAP;
    ….
    void start()
    {
       InAppPurchase.SetDebugMode(true);
    }

\[RegisterUserId\]

| Term         | Description                                              |
|--------------|----------------------------------------------------------|
| Description  | Register user identification key defined in application. |
| Syntax       | public Result RegisterUserId(String userId);             |
| Parameters   | userId UserID                                            |
| Return Value | Return result on Result API request                      |

\[Example Code\]

    InAppPurchase.RegisterUserId("guest001");

\[AsyncRequestPurchase\]

| Term         | Description                                                                       |
|--------------|-----------------------------------------------------------------------------------|
| Description  | Request In-App purchase. Receive response on purchase request through delegate.   |
| Syntax       | public static void AsyncRequestPurchase(long itemId, OnResponsePurchase callback) |
| Parameters   | Item number issued from itemId \[in\] Console                                     |
| Parameters   | Delegate which transfers callback \[in\] API request result                       |
| Return Value | void                                                                              |

\[Example Code\]

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

\[Response (JSON)\]

| Attribute     | Value  | Description                                                                        |
|---------------|--------|------------------------------------------------------------------------------------|
| paymentSeq    | String | Payment number for completed payment                                               |
| itemSeq       | Long   | Item number                                                                        |
| purchaseToken | String | Token necessary for restricting purchase between application server and IAP server |
| currency      | String | Currency of the product                                                            |
| price         | Float  | Price of the product                                                               |

\[Response Example\]

    {
        "paymentSeq": "2014082210002092",
        "purchaseToken": "5PYSHgisiCU8BditHnDbPhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
        "itemSeq": 1000001,
        "currency": "KRW",
        "price":1000.0
    }

\[AsyncQueryPurchases\]

| Term         | Description                                                         |
|--------------|---------------------------------------------------------------------|
| Description  | Look up purchase history that is not consumed.                      |
| Syntax       | public static void AsyncQueryPurchases(OnResponsePurchase callback) |
| Parameters   | Delegate which transfers callback \[in\] API request result         |
| Return Value | void                                                                |

\[Example Code\]

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

\[Response(JSON)\]

| Attribute     | Value  | Description                                                                        |
|---------------|--------|------------------------------------------------------------------------------------|
| paymentSeq    | String | Payment number                                                                     |
| purchaseToken | String | Token necessary for restricting purchase between application server and IAP server |
| itemSeq       | Long   | Item number                                                                        |
| currency      | String | Currency of the product                                                            |
| price         | Float  | Price of the product                                                               |

\[Response Example\]

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

\[AsyncQueryItems\]

| Term         | Description                                                     |
|--------------|-----------------------------------------------------------------|
| Description  | Look up all items available for purchase.                       |
| Syntax       | public static void AsyncQueryItems(OnResponsePurchase callback) |
| Parameters   | Delegate which transfers callback \[in\] API request result     |
| Return Value | void                                                            |

\[Example Code\]

    InAppPurchase.AsyncQueryItems((Result result, object data) => {
        if (!result.IsSuccessful)
        {
            PrintLog ("QueryItemsCallback.OnCallback() -> Failed! -> " + result.ResultCode + ":" + result.ResultString);
            return;
        }

        /// Examples)    * 
        /// [{
        /// "itemSeq": 1000208,
        /// "itemName": "Test item 01",
        /// "marketItemId": "item01",
        /// "price": 1000,
        /// "currency": "KRW",
        /// },
        /// {
        /// "itemSeq": 1000209,
        /// "itemName": "Test item 02",
        /// "marketItemId": "item02",
        /// "price": 7.99,
        /// "currency": "USD"
        /// }]

        string json = System.Convert.ToString (data);
        PrintLog ("QueryItemsCallback.OnCallback():" + json);

        // TODO : Go through process required for look up product history results

    });

\[Response(JSON)\]

| Attribute    | Value  | Description                |
|--------------|--------|----------------------------|
| itemSeq      | Long   | Item number                |
| itemName     | String | Item name                  |
| marketItemId | Long   | Product ID for each market |
| currency     | String | Currency of the product    |
| price        | Float  | Price of the product       |

\[Response Example\]


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

### public class Result

Show response result of API.

\[IsSuccessful\]

| Term         | Description                          |
|--------------|--------------------------------------|
| Description  | Return success or failure of API     |
| Syntax       | public bool IsSuccessful;            |
| Return Value | If bool true, API request successful |

\[ResultCode\]

| Term         | Description            |
|--------------|------------------------|
| Description  | Return error code.     |
| Syntax       | public int ResultCode; |
| Return Value | Return Int error code  |

\[ResultString\]

| Term         | Description                              |
|--------------|------------------------------------------|
| Description  | Transfer details on error.               |
| Syntax       | public int ResultString;                 |
| Return Value | Return detailed information on Int error |

### public class PluginVersion

Manage Version information of plugin.

\[VersionInt\]

| Term        | Description                 |
|-------------|-----------------------------|
| Description | Plugin Version information  |
| Syntax      | public const int VersionInt |

\[VersionString\]

| Term        | Description                       |
|-------------|-----------------------------------|
| Description | Plugin Version information        |
| Syntax      | public const String VersionString |


