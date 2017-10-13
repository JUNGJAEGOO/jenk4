title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Common &gt; IAP &gt; Android Developer's Guide
----------------------------------------------

Development Environment
-----------------------

-   Windows

-   Eclipse in Android Development Tools / Android Studio IDE 1.2

-   Android 5.0.1 (API Level 21)

-   For Android SDK Version, **2.3.3 (API Level 10)** or higher

Open source information in use as follows.

| Name   | Reference                              | Version | License            |
|--------|----------------------------------------|---------|--------------------|
| okhttp | http://square.github.io/okhttp/        | 1.5.4   | Apache License 2.0 |
| gson   | https://code.google.com/p/google-gson/ | 2.2.4   | Apache License 2.0 |

Use in Android Studio & Gradle Environment
------------------------------------------

IAP’s Android SDK provides a development environment for Android Studio IDE based on Gradle. Download as Remote from jCenter Maven Repository. As shown below, define repository and dependency in project’s build.gradle file.

### Gradle Repository

    buildscript {
        repositories {
            jcenter()
        }
    }

    dependencies {
        compile group: 'com.toast.iap', name: 'iap', version: project.TOAST_IAP_SDK_VERSION
    }

> \[Note\]
> Specify the version of SDK in project.TOAST\_IAP\_SDK\_VERSION. Gradle recommends using Gradle Project of 1.1.0 Version or higher.

&gt; \[Note\]
&gt; Release History
&gt; Please refer to RELEASE-NOTES.md in the package for modification history of SDK’s Version.

### Run a Sample Application

IAP’s Android SDK provides a development environment for Android Studio IDE based on Gradle. Download as Remote from jCenter Maven Repository. As shown below, define repository and dependency in project’s build.gradle file.

#### Import Project

Add /toast-iap-android-sdk-studio of SDK package by importing project in Android Studio.

> \[Note\]
> Edit local.properties
> Change sdk.dir value of internal local.properties to Android SDK path set in the local. If the sample application is built with release build type, keystore information must be entered for APK signing. Flavor and buildType can be selected in Android Studio’s Build Variants menu.

&gt; \[Note\]
&gt; Workspace Encoding Type
&gt; Check to see if Workspace File Encoding of imported project is UTF-8, If not, change to UTF-8.

#### Set market information in AndroidManifest.xml

Set appId / market through market information registered in IAP Web Console.

> \[Note\]
> Set appId / market
> For setup method, refer to AndroidManifest.xml in the sample application’s each market Flavor.

To Use in Eclipse Environment
-----------------------------

IAP Android SDK distributes in Android library project format.

| Directory name                            | Description                 |
|-------------------------------------------|-----------------------------|
| /docs                                     | API Reference               |
| /toast-iap-android-sdk-eclipse/iap        | IAP Android library project |
| /toast-iap-android-sdk-eclipse/iap-sample | Sample application          |

\[Table 1 Android SDK directory information\]

### Import Method

    [Eclipse] > [File] > Select [Import]
    [Android] – Select [Existing Android Code into Workspace]
    <Import Projects> window > [Browse] button > select [IAP SDK] folder
    When IAP SDK and the sample application’s project are indicated in the Import list, select [Finish] along with all projects selected

> \[Note\]
> After Import, if an error occurs in Project, do the following.
> - \[project\] &gt; Select \[clean\]
> - Right click on \[IAP\] &gt; \[Properties\] &gt; \[Resource\] &gt; Set \[Text File Encoding\] as UTF-8

### Add IAP Android SDK

    Right click on [project] > [Properties] > [Android] > [Add] > Add IAP

<img src="http://static.toastoven.net/prod_iap/iap_5.jpg" />

\[Figure 1 Add IAP SDK\]

Android Project Settings
------------------------

### Add AndroidManifest.xml

Contents made up based on Google Play.

    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
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

Setting information of AndroidManifest.xml as follows.

| Property Name               | Description                                                                         |
|-----------------------------|-------------------------------------------------------------------------------------|
| android.permission          | Common Android authority to use IAP \* Omission of duplicate permission is possible |
| com.android.vending.BILLING | Authority for Google Play. \* Names or inclusions will vary depending on the market |
| activity                    | Register activities provided by IAP                                                 |
| com.toast.iap.config.appId  | Unique number of app issued from IAP Web Console                                    |
| com.toast.iap.config.market | Market information GG : Google Play TS : T Store NA : NAVER App Store TEST : Test   |

\[Table 2 AndroidManifest.xml setting information\]

> \[Note\]
> If market information is set as TEST, you can easily test IAP’s API without any particular market connection information.
> For details, please refer to Sample Application.

IAP Payment Flow Chart
----------------------

In App purchase will proceed in 2 steps of a purchase request and purchase consume.
Once purchase consume is completed, provide the item from the user’s application.

> \[Note\]
> IAP payment flow chart
> <http://docs.cloud.toast.com/ko/Common/IAP/Overview/#iap>

### Register User Identifiers

Register user ID which completed verification.
It is a user identification key defined by the developer, and it is a target which will be provided with items.

\[Request Example\]

    InAppPurchases.InAppPurchase.registerUserId(userId); // userId : String value

### Look Up a List of Items Available for Purchase

Look up a list of all items available for purchase.

\[Request Example\]

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

\[Method\]

| Term         | Description                                                          |
|--------------|----------------------------------------------------------------------|
| Syntax       | public void queryItems(Activity activity, ItemListCallback callback) |
| Parameters   | activity \[in\] Application’s current activity                       |
| Parameter    | callback \[in\] Callback which transfers the API request result      |
| Return Value | void                                                                 |

\[Response Example\]

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

### Payment Request

Request an item purchase from a client. Receive the response for payment request through PurchaseCallback, and once the payment is successfully completed, send the result value to the server to consume the payment history.

\[Request Example\]

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

\[Method\]

| Term         | Description                                                                                                          |
|--------------|----------------------------------------------------------------------------------------------------------------------|
| Syntax       | public void requestPurchase(Activity activity, long itemId, String currency, float price, PurchaseCallback callback) |
| Parameters   | activity \[in\] Application’s current activity                                                                       |
| Parameters   | itemId \[in\] ID issued from Web Console \[Item\]                                                                    |
| Parameters   | callback \[in\] Callback which transfers the API request result                                                      |
| Return Value | void                                                                                                                 |

\[Response Example\]

    {
        "paymentSeq": "2014082210002092",
        "purchaseToken": "5PYSHgisiCU8BditHnDbPhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
        "itemSeq": 1000001,
        "currency": "KRW",
        "price": 1000.0
    }

> \[Note\]
> IAP Android SDK Confirm payment window
> Starting from toast-iap-android-sdk-1.2.3, proceed directly to market purchase without the below previous confirm payment window.

<img src="http://static.toastoven.net/prod_iap/iap_40.jpg"/>

\[Table 2 Previous confirm payment window\]

### Payment Consume

User’s application server must notify IAP server to consume the payment before supplying the item. At this point, use Payment Purchase Token to check security on payment validity between the user server and IAP.

> \[Note\]
> Server Payment Consume API
> <http://docs.cloud.toast.com/ko/Common/IAP/Server%20Developer%60s%20Guide/>

\[HTTP Request Example\]

    POST
    https://api-iap.cloud.toast.com/inapp/v3/consume/{paymentSeq}/items/{itemSeq}

    RequestBody
    {
     "purchaseToken":string
    }

\[Response Example\]

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

### Look Up Unconsumed Purchase History

Look up the user’s purchase history which is not consumed.

\[Request Example\]

    InAppPurchases.InAppPurchase.queryPurchases(this, new PurchaseListCallback() {

        @Override
        public void onCallback(JSONArray result, InAppPurchaseException exception) {
               if (!result.isSuccess()) {
                  // An error occurred, we need to handle the error
                  return;
               }
               // Success! Include your code to handle the results here }
    });

\[Method\]

| Term         | Description                                                                  |
|--------------|------------------------------------------------------------------------------|
| Syntax       | public void queryPurchases(Activity activity, PurchaseListCallback callback) |
| Parameters   | activity \[in\] Application’s current activity                               |
| Parameter    | callback \[in\] API request Callback which transfer results                  |
| Return Value | void                                                                         |

\[Response Example\]

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

### Processing of Error Information After API Call

InAppPurchaseException class transfers error information on API calls.

    InAppPurchases.InAppPurchase.queryPurchases(activity, new PurchaseListCallback() {

        @Override
        public void onCallback(JSONArray result, InAppPurchaseException exception) {
               if (exception != null) {
                  int errorCode = exception.getErrorCode();
                  String errorMessage = exception.getMessage();
                  // TODO : Define processing of an error occurrence.
                  ....
                  return;
               }
         }
    });

-   errorCode – Error codes

-   errorMessage – Detailed information on the error

> \[Note\]
> Refer to error Code
> Refer to Error Code page

Android Sample Application
--------------------------

Refer to the sample application in Eclipse + ADT development environment by importing as follows.

    [Eclipse] > [File] > Select [Import]
    Select [Android - Existing Android Code into Workspace] > Select [Next]
    <Import Projects> window > Click [Browse] button > Select [IAP Android SDK] folder
    Indicate [IAP Android SDK] and projects of a sample application in [Import] list
    Check projects to Import  
    Check [Copy Project into Workspace]
    By selecting [Finish] button, Import is completed

<img src="http://static.toastoven.net/prod_iap/iap_7.jpg" />

\[Figure 3 Add sample applications\]

### Test Through a Test Market

To test API provided by IAP Android SDK without actual market connection information, set market code as TEST.

    <meta-data android:name="com.toast.iap.config.market" android:value="TEST" />

### Example Code

Refer to IAPServiceProvider class in com.nhnent.iap.sample package.

Android Reference
-----------------

Package: com.toast.android.iap
==============================

### public interface InAppPurchase

interface for In App purchase requests

\[Method Summary\]

| Name           | Return Value | Parameter                                                 |
|----------------|--------------|-----------------------------------------------------------|
| setDebugMode   | void         | boolean isDebuggable                                      |
| registerUserId | void         | String userId                                             |
| requestPuchase | void         | Activity activity, long itemId, PurchaseCallback callback |
| queryPurchases | void         | Activity activity, PurchaseListCallback callback          |

\[setDebugMode\]

| Term        | Description                                                                    |
|-------------|--------------------------------------------------------------------------------|
| Description | Set whether to activate log information of IAP SDK.                            |
| Syntax      | public void setDebugMode(boolean isDebuggable)                                 |
| Parameters  | isDebuggable \[in\] To activate log or not, When true, expose log information. |

\[Example Code\]

    InAppPurchases.InAppPurchase.setDebugMode(true);

\[registerUserId\]

| Term         | Description                                                                                                         |
|--------------|---------------------------------------------------------------------------------------------------------------------|
| Description  | After verifying the user in the application, register the value to identify the user. It is not the market account. |
| Syntax       | public void registerUserId(String userId)                                                                           |
| Parameters   | userId \[in\] As a user identifier value, userId must be a unique value which does not change.                      |
| Return Value | void                                                                                                                |

\[Example Code\]

    InAppPurchases.InAppPurchase.registerUserId("guest0001");

\[requestPurchase\]

| Term         | Description                                                                                                                                                       |
|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Description  | Request an In App purchase. Receive the response to the payment request through PurchaseCallback interface. \* Register information on items through Web Console. |
| Syntax       | public void requestPurchase(Activity activity, long itemId, PurchaseCallback callback)                                                                            |
| Parameters   | activity \[in\]                                                                                                                                                   
                                                                                                                                                                                   
                Application’s current activity                                                                                                                                     |
| Parameters   | itemId \[in\] Item number issued from Web Console                                                                                                                 |
| Parameters   | callback \[in\] Callback which transfers the API request result                                                                                                   |
| Return Value | void                                                                                                                                                              |

\[Response (JSON)\]

| Attribute     | Value  | Description                                                                                              |
|---------------|--------|----------------------------------------------------------------------------------------------------------|
| paymentSeq    | String | Payment number for completed purchase                                                                    |
| itemSeq       | Long   | Item number                                                                                              |
| purchaseToken | String | Required Token information when the application server requests consume of payment history to IAP server |
| currency      | String | Currency of the product                                                                                  |
| price         | Float  | Price of the product                                                                                     |

\[Response Example\]

    {
        "paymentSeq": "2014082210002092",
        "purchaseToken": "5PYSHgisiCU8BditHnDbPhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA==",
        "itemSeq": 1000001,
        "currency": "KRW",
        "price" : 1000.0
    }

\[queryPurchases\]

| Term         | Description                                                                  |     |
|--------------|------------------------------------------------------------------------------|-----|
| Description  | Look up unconsumed payment history.                                          |     |
| Syntax       | public void queryPurchases(Activity activity, PurchaseListCallback callback) |     |
| Parameters   | activity \[in\] Application’s current activity                               |     |
| Parameters   | callback \[in\] Callback which transfers API request result                  |     |
| Return Value | void                                                                         |     |

**\[Response (JSON)\]**

| Attribute     | Value  | Description                                                                         |
|---------------|--------|-------------------------------------------------------------------------------------|
| paymentSeq    | String | Payment number                                                                      |
| purchaseToken | String | Token required to inform the purchase between the application server and IAP server |
| itemSeq       | Long   | Item number                                                                         |
| currency      | String | Currency of the product                                                             |
| price         | Float  | Price of the product                                                                |

\[Response Example\]

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

\[queryItems\]

| Term         | Description                                                          |     |
|--------------|----------------------------------------------------------------------|-----|
| Description  | Look up list of all items available for purchase.                    |     |
| Syntax       | public void queryItems(Activity activity, ItemListCallback callback) |     |
| Parameters   | activity \[in\] Application’s current activity                       |     |
| Parameters   | callback \[in\] Callback which transfers the API request result      |     |
| Return Value | void                                                                 |     |

**\[Response (JSON)\]**

| Attribute    | Value  | Description                |
|--------------|--------|----------------------------|
| itemSeq      | Long   | Item number                |
| itemName     | String | Item name                  |
| marketItemId | String | Product ID for each market |
| currency     | String | Currency of the product    |
| price        | Float  | Price of the product       |

\[Response Example\]

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

### public interface InAppPurchase.PurchaseCallback

callback interface to receive results after requesting In App Purchase

\[Method Summary\]

| Name       | Return Value | Parameter                                           |
|------------|--------------|-----------------------------------------------------|
| onCallback | void         | JSONObject result, InAppPurchaseException exception |

\[onCallback\]

| Term         | Description                                                                          |     |
|--------------|--------------------------------------------------------------------------------------|-----|
| Description  | Send API request result.                                                             |     |
| Syntax       | public abstract void onCallback(JSONObject result, InAppPurchaseException exception) |     |
| Parameters   | result \[in\] Transfers codes for response results and additional information        |     |
| Parameters   | exception \[in\] Transfers information on errors. If null, request is successful     |     |
| Return Value | void                                                                                 |     |

### public interface InAppPurchase.PurchaseListCallback

callback interface to receive results after requesting payment history

\[Method Summary\]

| Name       | Return Value | Parameter                                          |
|------------|--------------|----------------------------------------------------|
| onCallback | void         | JSONArray result, InAppPurchaseException exception |

\[onCallback\]

| Term         | Description                                                                         |     |
|--------------|-------------------------------------------------------------------------------------|-----|
| Description  | Send API request result.                                                            |     |
| Syntax       | public abstract void onCallback(JSONArray result, InAppPurchaseException exception) |     |
| Parameters   | result \[in\] Transfers codes for response results and additional information       |     |
| Parameters   | exception \[in\] Transfers information on errors. If null, request is successful    |     |
| Return Value | void                                                                                |     |

> \[Note\]
> 1. Call desynched API in UI Thread (Main Thread).
> 2. When calling desynched API, transfer the response results through the parameter’s callback interface.

### public final class InAppPurchases

Entry Point which provides an interface for In App purchase

\[Field\]

| Type                              | Variable       | Description                   |
|-----------------------------------|----------------|-------------------------------|
| public static final InAppPurchase | InAppPurchases | Interface for In App purchase |

\[getSdkVersion\]

| Term         | Description                          |
|--------------|--------------------------------------|
| Description  | Return SDK’s Version                 |
| Syntax       | public static String getSdkVersion() |
| Return Value | String SDK’s Version information     |

\[getAppId\]

| Term         | Description                          |
|--------------|--------------------------------------|
| Description  | Return app ID                        |
| Syntax       | public static long getAppId()        |
| Return Value | App ID information set in String SDK |

Package: com.toast.android.iap.exception
========================================

### public class InAppPurchaseException extends Exception

Send error information on API request.

\[getErrorCode\]

| Term         | Description               |
|--------------|---------------------------|
| Description  | Return error codes.       |
| Syntax       | public int getErrorCode() |
| Return Value | int error code            |

\[getMessage\]

| Term         | Description                               |
|--------------|-------------------------------------------|
| Description  | Return detailed information on the error. |
| Syntax       | public String getMessage()                |
| Return Value | Detailed information on String error      |


