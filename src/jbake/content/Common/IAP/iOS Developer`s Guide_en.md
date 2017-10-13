title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Development environment
-----------------------

-   OSX is required

-   Xcode 6.0.1 and higher

-   IAP SDK Support for iOS 6.x and higher

To use IAP SDK , add Framework under application.

| Name                    | Description                                               |
|-------------------------|-----------------------------------------------------------|
| StoreKit.framework      | Framework to connect In App Purchase of App store         |
| libsqlite3.dylib        | TOAST Cloud IAP SDK uses sqlite for local data management |
| coreTelephony.framework | Used to obtain user’s country information                 |

> \[Note\]
> To test In App Purchase, pretend that application and product registration is completed in iTunes Connect.
> iTunes Connect : [&lt;http://itunesconnect.apple.com&gt;](http://itunesconnect.apple.com)

IAP Console
-----------

### 1. Register market – Obtain APP ID

    Select [Market] tap > Click [Add] button  
    Select AS(Apple Store) in [Market ID]  
    Enter information to connect market  
    \- Market APP ID : Bundle Id  
    [APP ID] Confirm

<img src="http://static.toastoven.net/prod_iap/iap_17.jpg" />

\[Figure 1 Obtain APP ID\]

### 2. Register items

    Select [Item] tap > Click on [Add] button 
    In [Market ID], select AS(Apple Store)  
    [Enter item information]  
    - Item Name : Item’s name  
    - Market Item ID : Application item’s Product ID registered in iTunes Connect  
    [ITEM I] Confirm

Set up Xcode project
--------------------

\[Table1 iOS SDK directory information\]

| Directory name | Description               |
|----------------|---------------------------|
| /docs          | IAP iOS SDK API Reference |
| /include       | Header File               |
| /lib           | Library                   |
| /samples       | Sample Application        |

### 1. Add IAP SDK and framework

    [Xcode] > [Project] > [Targets – Build Phases]  
    [Drag & Drop to add TIAPurchase.h file to project]  
    Add below framworks to [Link Bianry With Libraries]
    \- libTIAPurchase.a  
    \- StoreKit.framework  
    \- Libsqlite3.dylib
    \- coreTelephony.framework

<img src="http://static.toastoven.net/prod_iap/iap_42.png" />

\[Figure 2 Add library to connect IAP\]

### 2. Set up plist

    Create string value in [plist] where TOAST_IAP_APP_ID is KEY, and enter APP ID.  
    When completed, .plist will appear as below.

<img src="http://static.toastoven.net/prod_iap/iap_19.jpg" />

\[Figure 3 Set up APP ID in plist\]

> \[Note\]
> iOS9 ATS setting
> From iOS9 SDK, apply ATS(App Transport Security) related setting.
> If built in XCode7 or higher, set up exceptions for IAP certain domains as below.
> Refer to Apple document for details
> (<https://developer.apple.com/library/prerelease/ios/technotes/App-Transport-Security-Technote/>)

    <key>NSAppTransportSecurity</key>
        <dict>
            <key>NSExceptionDomains</key>
            <dict>
                <key>api-iap.cloud.toast.com</key>
                <dict>
                    <key>NSIncludesSubdomains</key>
                    <true/>
                    <key>NSExceptionAllowsInsecureHTTPLoads</key>
                    <true/>
                    <key>NSExceptionRequiresForwardSecrecy</key>
                    <false/>
                </dict>
            </dict>

        </dict>

API Reference
-------------

### 1. Import TIAPurchase.h

When it is ready to use SDK in the application, add Header File of IAP SDK as below.

    #import "TIAPurchase.h"

### 2. Activate log information

Activate exposure of log information for debug.

\[Example Code\]

    [TIAPurchase setDebugMode:YES];

### 3. Register users

After authenticating the user in the application, register the value to identify the user.

\[Example Code\]

    NSError *purchaseError = nil;
    BOOL result = {TIAPurchase registerUserId:@"user001" error:&purchaseError};
    If (!result) {
        // An error occurred, we need to handle the error.
        NSLog(@"errorInfo = %@", purchaseError);
    }
    // register user id succeccfully.

### 4. Request a purchase

Request an In-App purchase. When a purchase is successfully completed, purchase history will be sent through completionHandler.

\[Example Code\]

    [TIAPurchase startPurchaseWithViewController:self itemId:1000004 completionHandler:^(id result, NSError *error) {

      if (error)
      {
          // An error occurred, we need to handle the error
          NSLog(@"purchase error, %@ %d", [error domain], [error code]);
          return;
      }
      else
      {
          /**
           Success! Include your code to handle the results here

           JSON data to 'NSDicionary', This is nil if there was an error.
           [keys]
           - paymentSeq : generated payment id
           - itemSeq : item id
           - purchaseToken : represent to token for consume by
    server.
           - currency : represent to item currency
           - price : represent to item price.
           */

          NSDictionary *purchaseResult = result;
          NSLog(@"purchase success, purchase = %@", purchaseResult);
      }

    }];

### 5. Look up unconsumed purchase history

Look up purchase history.

\[Example Code\]

    [TIAPurchase purchasesWithCompletionHandler:^(id result, NSError *error) {
        if (error)
        {
            // An error occurred, we need to handle the error
            NSLog(@"purchasesWithCompletionHandler occured error, %@ %d", [error domain], [error code]);
            return;
        }

        /**
         Success! Include your code to handle the results here

         JSON data to 'NSArray', This is nil if there was an error.
         [keys]
         - paymentSeq : generated payment id
         - itemSeq : item id
         - purchaseToken : represent to token for consume by server.
         - currency : represent to item currency.
         - price : represent to item price.
         */

        NSArray *purchases = result;
        NSLog(@"purchasesWithCompletionHandler, size:%d npurchases:%@", [purchases count], purchases);

    }];

### 6. Look up list of items available for purchase

Look up list of all items available for purchase.

\[Example Code\]

    [TIAPurchase itemListWithCompletionHandler:^(id result, NSError *error) {
        if (error)
        {
            // An error occurred, we need to handle the error
            [_delegate onInAppPurchaseError:error];
            return;
        }

        /**
        Success! Include your code to handle the results here

        JSON data to 'NSArray', This is nil if there was an error.
        [keys]
        - itemSeq : item id
        - itemName : item name
        - usingStatus : item status on IAP server
        - regYmdt : item registration date on IAP server
        - appName : app name
        - marketId : market id (AS : APPLE STORE)
        - marketItemId : market item id (product id)
        - currency : represent to item currency
        - price : represent to item price
        */

        NSArray *itemList = result;
        NSLog(@"itemListWithCompletionHandler, size:%lu \nitemList:%@", [itemList count], itemList);


    }];
