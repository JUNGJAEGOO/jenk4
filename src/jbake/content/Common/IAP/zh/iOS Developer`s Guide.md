title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## 开发环境

* OSX is required
* Xcode 6.0.1 and higher
* IAP SDK Support for iOS 6.x and higher

为了使用IAP SDK，需在App上添加下面的Framework。

| 名称                     | 说明|
|------------------------- | ---------------------------------------------------|
|StoreKit.framework      |  为了关联AppStore的In App Purchase的framework|
|libsqlite3.dylib        |  TOAST Cloud IAP SDK为了管理本地数据而使用sqlite。|
|coreTelephony.framework |  为获得用户的国家信息而使用。|

> [参考]<br>
> 为了测试In App Purchase ，假设在iTunes Connect上完成了App及商品注册。<br>
> [iTunes Connect](http://itunesconnect.apple.com)

## IAP Console

### 1. 注册Store – 获得APP ID 

```
1. 选择[App]标签 > 点击[添加]按钮 
2. 在[Store ID]上选择AS(Apple Store) 
    - 输入关联Market的信息(Market APP ID : Bundle Id)
3. 确认[APP ID] 
```

![[图 1 获得APP ID]](http://static.toastoven.net/prod_iap/iap_n_32.png)

<center>[图 1 获得APP ID]</center>

### 2. 注册Item

```
1. 选择[Item]标签 > 点击[添加]按钮
2. 在[Store ID]上选择AS(Apple Store)   
3. [输入项目信息]  
    - Item Name : 项目的名称
    - Store Item ID : 注册于iTunes Connect的App项目的Product ID  
4. 确认[ITEM] 
```


## 设置Xcode 项目

| 目录名    | 说明|
|---------- | ---------------------------|
| /docs    |  IAP iOS SDK API Reference|
| /include |  Header File|
| /lib     |  Library|
| /samples |  Sample Application|

[表1 iOS SDK目录信息]

### 1.添加 IAP SDK及framework 

```
1. [Xcode] > [Project] > [Targets – Build Phases]  
2. [将TIAPurchase.h文件添加至项目Drag & Drop中]  
3. 在[Link Bianry With Libraries]上添加下面的framworks   
    - libTIAPurchase.a  
    - StoreKit.framework  
    - Libsqlite3.dylib
    - coreTelephony.framework
```

![[图 2 添加关联IAP 的库]](http://static.toastoven.net/prod_iap/iap_42.png)

<center>[图 2 添加关联IAP 的库]</center>

### 2. 设置plist 

```
在[plist]上，TOAST_IAP_APP_ID生成了KEY的string value，输入APP ID。
.plist形式如下。
```

![[图 3 在plist设置APP ID]](http://static.toastoven.net/prod_iap/iap_19.jpg)

<center>[图 3 在plist设置APP ID]</center>

> [参考-iOS9 ATS 设置]<br>
> 从iOS9 SDK开始，适用 ATS(App Transport Security)相关设置。<br>
> 在XCode7 以上进行创建时，需设置如下的有关 IAP特定域名的例外处理。<br>
> Apple Document

```xml
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
```

## API Reference

### 1. Import TIAPurchase.h

在应用上完成使用SDK的准备的话，添加IAP SDK的Header File如下。

``` objc
#import "TIAPurchase.h"
```

### 2. 日志信息活性化

激活显示有关调试的日志信息。

[Example Code]

``` objc
[TIAPurchase setDebugMode:YES];
```

### 3. 注册用户

在应用上对用户进行认证后，注册可识别用户的值。

[Example Code]

``` objc
NSError *purchaseError = nil;
BOOL result = {TIAPurchase registerUserId:@"user001" error:&purchaseError};
If (!result) {
    // An error occurred, we need to handle the error.
    NSLog(@"errorInfo = %@", purchaseError);
}
// register user id succeccfully.
```

### 4. 结算请求

请求结算In App。成功结算的话，可通过completionHandler传达结算明细。

[Example Code]

```objc
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
```

### 5. 查询未消费结算明细

查询结算明细。

[Example Code]

```objc
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
```

### 6. 查询可购买的项目明细

查询可购买的所有项目明细。

[Example Code]

```objc
[TIAPurchase itemListWithCompletionHandler:^(id result, NSError *error) {
    if (error)
    {
        // An error occurred, we need to handle the error
	NSLog(@"itemListWithCompletionHandler occured error, %@ %d", [error domain], [error code]);
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
```

### 7. 对未处理的结算项进行批量再处理

对于未处理的结算项(IAP服务器验证失败)，进行批量再处理。

[Example Code]
```objc
[TIAPurchase processesIncompletePurchasesWithCompletionHandler:^(id result, NSError *error) {
        if (error)
        {
            // An error occurred, we need to handle the error
           NSLog(@"processesIncompletePurchasesWithCompletionHandler occured error, %@ %d", [error domain], [error code]);
            return;
        }

        /**
         Include your code to handle the results here
         
         JSON data to 'NSDictionany'.
         [keys]
         - successList : success data list (NSArray)
                 [keys]
                 - paymentSeq : generated payment id
                 - itemSeq : represent item id
                 - purchaseToken : represent token for validation
                 - marketItemId : market item id (product id)
                 - currency : represent to item currency
                 - price : represent to item price

         - failList : fail data list (NSArray)
                 [keys]
                 - paymentSeq : generated payment id
                 - itemSeq : represent item id
                 - purchaseToken : represent token for validation
                 - marketItemId : market item id (product id)
                 - currency : represent to item currency
                 - price : represent to item price
         */
        NSDictionary *data = result;
        NSLog(@"processesIncompletePurchasesWithCompletionHandler data:%@", data);
}];
```
