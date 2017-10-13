title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > IAP > Store interlocking information

You need to enter application key that store issues to IAP web console to implement in-app purchase. 
Refer to below table for application key value that each store issues. 

## Google Play

### Google Play Store

| Field | Description                                             |
| ---------------------------------- | ---------------------------------------------- |
| Market ID                          | GG in store list                                |
| Market App ID                      | application package name in Google Play                |
| Google In App Purchase License Key | Public KEY(RSA)  in Google Play       |
| Google API Client ID               | OAuth Client ID in Google API Project           |
| Google API Client Secret           | OAuth Client Secret in Google API Project         |
| Refresh Token For Google OAuth     | Refresh Token getting by Google API Client ID, Google API Client Secret |

<center>[Table. 1] Field for registering app for synchronizing with Google Play Store </center>

| Field | Description                                             |
| -------------- | ------------------------------- |
| Item Name      | item name                |
| Market Item ID | in app item ID registered in Google Play Developer Console |

<center>[Table. 2] Field for registering item for synchronizing with Google Play Store</center>

### Check application public key in Google Play developer console

```
select [Application - Service and API] in Google Play Developer Console
```

![](http://static.toastoven.net/prod_iap/iap_8.jpg)

> [Reference]  
> [Android Developers - Management In App Payment](http://developer.android.com/google/play/billing/billing_admin.html)

### Check OAuth Client in Google API developer console

```
Create project in Google API console with the same account as Google Play developer console. 
Create below information required for OAuth verification in reference to below link. 
  
1) Client ID  
2) Client Secret  
3) Refresh Token  
```

> [Reference]  
> [Android Developers - Authorization](https://developers.google.com/identity/protocols/OAuth2WebServer)

<br/>

```
1. Create authorization credentials
  
  1) Go to https://console.developers.google.com
  
  2) Click Create credentials > OAuth client ID
  
  3) Complete the form.
      - application type : Web application
      - name : as you want
      - redirect URIs : http://localhost:8080
  
```
![Figure. 1 Create authorization credentials](http://static.toastoven.net/prod_iap/iap_47.png)
<center>[Figure. 1 Create authorization credentials] </center>

![Figure. 2 Create authorization credentials](http://static.toastoven.net/prod_iap/iap_48.png)
<center>[Figure. 2 Create authorization credentials] </center>

```
2. Obtaining OAuth2.0 access tokens
  
  1) Redirect to Google's OAuth 2.0 server
    sample url is shown below. you should change {client_id} to your real Client ID obtained before.

    https://accounts.google.com/o/oauth2/v2/auth?scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fandroidpublisher&access_type=offline&include_granted_scopes=true&state=state_parameter_passthrough_value&redirect_uri=http://localhost&response_type=code&client_id={client_id}
  
  
  2) Handle the OAuth 2.0 server response
    above url produces respose as following, 4/P7q7W91a-oMsCeLvIaQm6bTrgtp7 value is your code.
  
    https://oauth2.example.com/auth?code=4/P7q7W91a-oMsCeLvIaQm6bTrgtp7 
  
  4) Exchange authorization code for refresh and access tokens
  
      - URL : https://www.googleapis.com/oauth2/v4/token
      - Method : POST     
      - Headers : Content-Type = application/x-www-form-urlencoded
      - Body Sample :
            code=4/P7q7W91a-oMsCeLvIaQm6bTrgtp7&
            client_id=your_client_id&
            client_secret=your_client_secret&
            redirect_uri=https://oauth2.example.com/code&
            grant_type=authorization_code
            
            
      - sample response : you can get refresh_token
        {
          "access_token":"1/fFAGRNJru1FTz70BzhT3Zg",
          "expires_in":3920,
          "token_type":"Bearer",
          "refresh_token":"1/xEoDL4iW3cxlI7yDbSRFYNG01kVKM2C-259HOF2aQbI"
        }                    
```

![Figure. 3 Creation Refresh Token](http://static.toastoven.net/prod_iap/iap_49.jpg)
<center>[Figure. 3 Creation Refresh Token]</center>

![Figure. 4 Creation Refresh Token](http://static.toastoven.net/prod_iap/iap_50.jpg)
<center>[Figure. 4 Creation Refresh Token]</center>

### AndroidManifest.xml Setting Example

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<!-- google iab permission -->
<uses-permission android:name="com.android.vending.BILLING" />

<application>
        <activity android:name="com.nhnent.mobill.api.core.IAPActivity"
	        android:configChanges="keyboardHidden|orientation|screenSize|locale|layoutDirection"
	        android:theme="@android:style/Theme.Translucent.NoTitleBar"
	        android:windowSoftInputMode="adjustResize|stateHidden" />
        <meta-data android:name="com.toast.iap.config.appId" android:value="1000000" />
        <meta-data android:name="com.toast.iap.config.market" android:value="GG" />
</application>
```

```
* Android : Refer to  /AndroidManifest-google-example.xml of sample application  
* Unity : Refer to  /Plugins/Android/AndroidManifest-iap-template.xml of Unity Plugin
```

### Google Play Prerequisites

Registering app/ item via web console may not be available if you don’t follow below instructions when setting in Google Play.

```
1. Any application that calls Google APIs needs to enable those APIs in the API Console. To enable the appropriate APIs for your project:
    - Open the Library page in the API Console.
    - Select the project associated with your application. Create a project if you do not have one already.
    - Use the Library page to find each API that your application will use. Click on each API and enable it for your project.


```

![Figure. 5 Google Play Developer API](http://static.toastoven.net/prod_iap/iap_36_1.png)
<center>[Figure. 5 Google Play Developer API]</center>

![Figure. 6 Google Play Developer API Enable](http://static.toastoven.net/prod_iap/iap_37.png)
<center>[Figure. 6 Google Play Developer API Enable]</center>

```
2. 'Check if the API is connected with project ID in 'Google Play Developer Console' by visiting [API Access menu]  
  - Go to https://play.google.com/apps/publish
  - Go to [Settings] > [API Access] menu on left     
  - Check if project is successfully connected
```

![Figure 7 Google Play Developer API Enable](http://static.toastoven.net/prod_iap/iap_38.png)
<center>[Figure 7 Google Play Developer API Enable]</center>

```
3. The account holder of 'Google Play Developer Console' needs to be the user who has the authority over project in Google Developers Console.  

```

![Figure 8 Check in app product ID](http://static.toastoven.net/prod_iap/iap_39.jpg)
<center>[Figure 8 Check in app product ID]</center>

```
4. In-app item in ‘Google Play Developer Console’ should match with item in Store Item ID.  
```

## One Store Developer Center (ex TStore)

### Guide for integrated developer center (3 telecoms)

T-store developer center is one-store integrated developer center for Olleh store, U+ store and T-store. 
Synchronizing systems for in-app purchase is the same as before; publishing for all three stores is possible using T-store sync information.

> [Reference]
> Naver App store will be transferred to One Store from June 01, 2016.
> [Naver App Store Developer Center](http://cafe.naver.com/naverappdev/10658)

### One Store 

[Table. 3] App Form for One Store

| Field | Description                               |
| ------------- | ------------------------------ |
| Market ID     | select TS in store list                 |
| Market App ID | AID (Application ID) |

[Table. 4] Item Form for One Store

| Field | Description                        |
| -------------- | ----------------------- |
| Item Name      | Item Name        |
| Market Item ID | Product Id registered in One Store|

### Obtaining AID and In-App ID in One Store

```
You should check following information in One Store. 
1) AID : Application Id created in One Store 
2) In-App ID : In-App Product Id created in One Store
```

### Add One Store library 

In order to download IAP Android SDK and sync with T-store, you first need to add below library to project. 
Copy files from /libs/tstore folder in downloaded SDK package and paste them to /libs in application project.


![Figure. 9 Add One Store Library](http://static.toastoven.net/prod_iap/iap_41.png)
<center>[Figure. 9 Add One Store Library]</center>

> [Reference]  
> Adding Library in Unity Project   
> Copy files from /libs/tstore folder in downloaded SDK package and paste them to /Plugins/Android/iap/libs  

### AndroidManifest.xml Example

Add AndroidManifest.xml setting information as shown below to sync with One store.

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<!-- Tstore configurations -->
<uses-permission android:name="android.permission.RECEIVE_SMS " />
<application>
....
        <!-- TStore configrations -->
        <activity android:name="com.skplanet.dodo.IapWeb" android:configChanges="orientation|screenSize|keyboardHidden|locale|layoutDirection" android:excludeFromRecents="true" android:windowSoftInputMode="stateHidden" />
<meta-data android:name="iap:api_version" android:value="3" />
<meta-data android:name="iap:plugin_mode" android:value="development" />
        <activity android:name="com.nhnent.mobill.api.core.IAPActivity"/>
        <meta-data android:name="com.toast.iap.config.appId" android:value="1000000" />
        <meta-data android:name="com.toast.iap.config.market" android:value="TS" />
</application>
```

```
- Android: Refer to /AndroidManifest-tstore-example.xml of sample application  
- Unity: Refer to /Plugins/Android/AndroidManifest-iap-tstore-template.xml of Unity Plugin  
- One Store sets development environment in AndroidManifest.xml during purchase.  
  * iap:plugin_mode: development (test), release (production)
```

> [참고]  
> [One Store Developer Tools](http://dev.onestore.co.kr/devpoc/reference/view/Tools)

<br/>
> [Reference]  
> One Store IAP SDK Update
> As Android 6.0 is published, One Store highly recommends applying the newest in-app SDK (v.15.01.00). 
You need to apply the latest in-app SDK in order to register app via One Store developer center 
> [One Store Reference](http://dev.onestore.co.kr/devpoc/support/news/noticeView.omp?noticeId=26472)

<br/>
> [Reference]  
> [Naver App Store Transfer](http://cafe.naver.com/naverappdev/10658)

## Apple App Store

### Apple App Store Form

| Field         | Description                          |
| ------------- | --------------------------- |
| Market ID     | select AS in Store list              |
| Market App ID | application Bundle Id in iTunes Connect |

| Web Console <br/> item field        | Description               |
| -------------- | ---------------- |
| Item Name      | item name |
| Market Item ID | product Id in iTunes Connect  |

### Check Bundle Id and in-app item ID in App Store developer center

```
Check below information in iTunes Connect  
1) Bundle Id  
2) Product ID
```

> [Reference]  
> Suppose you have completed application and item registration to iTunes Connect in order to test in-app purchase.    
> [iTunes Connect](http://itunesconnect.apple.com)  
