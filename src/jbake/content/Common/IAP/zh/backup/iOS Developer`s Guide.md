title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## 개발 환경

* OSX is required
* Xcode 6.0.1 and higher
* IAP SDK Support for iOS 6.x and higher

IAP SDK 사용을 위해서는 어플리케이션에 아래의 Framework를 추가 해야 합니다.

| 이름                 | 설명                                             |
| ------------------ | ---------------------------------------------- |
| StoreKit.framework | 앱스토어의 In App Purchase연동을 위한 framework          |
| libsqlite3.dylib   | TOAST Cloud IAP SDK는 로컬데이터관리를 위해 sqlite를 사용합니다 |
| coreTelephony.framework   | 사용자의 국가정보를 획득하기 위해 사용합니다 |

> [참고]  
> In App Purchase 테스트를 하기 위해 iTunes Connect에 어플리케이션 및 상품등록을 완료했다고 가정합니다.    
> [iTunes Connect](http://itunesconnect.apple.com)

## IAP Console

### 1\. 스토어등록 - APP ID 획득

```
1. [App] 탭 선택 > [추가] 버튼 클릭  
2. [Store ID]에서 AS(Apple Store) 선택  
    - 마켓 연동을 위한 정보 입력(Market APP ID : Bundle Id)
3. [APP ID] 확인
```

![[그림 1 APP ID 획득]](http://static.toastoven.net/prod_iap/iap_n_32.png)
<center>[그림 1 APP ID 획득]</center>

### 2\. 아이템 등록

```
1. [Item] 탭 선택 > [추가] 버튼 클릭  
2. [Store ID]에서 AS(Apple Store) 선택  
3. [아이템 정보 입력]  
    - Item Name : 아이템의 이름  
    - Store Item ID : iTunes Connect에 등록한 어플리케이션의 아이템의 Product ID  
4. [ITEM] 확인
```

## Xcode 프로젝트 설정하기


| 디렉토리명    | 설명                        |
| -------- | ------------------------- |
| /docs    | IAP iOS SDK API Reference |
| /include | Header File               |
| /lib     | Library                   |
| /samples | Sample Application        |
<center>[표1 iOS SDK 디렉토리 정보]</center>

### 1\. IAP SDK 및 framework 추가

```
1. [Xcode] > [Project] > [Targets – Build Phases]  
2. [TIAPurchase.h 파일을 프로젝트에 Drag & Drop 하여 추가]  
3. [Link Bianry With Libraries] 에 아래의 framworks 추가  
    - libTIAPurchase.a  
    - StoreKit.framework  
    - Libsqlite3.dylib
    - coreTelephony.framework
```

![[그림 2 IAP 연동을 위한 라이브러리 추가]](http://static.toastoven.net/prod_iap/iap_42.png)
<center>[그림 2 IAP 연동을 위한 라이브러리 추가]</center>

### 2\. plist 설정하기

```
[plist] 에서 TOAST_IAP_APP_ID 가 KEY인 string value를 생성하고, APP ID를 입력 합니다.  
.plist 는 아래와 같은 형태일 것입니다.
```

![[그림 3 plist에 APP ID 설정]](http://static.toastoven.net/prod_iap/iap_19.jpg)
<center>[그림 3 plist에 APP ID 설정]</center>

> [참고-iOS9 ATS 설정]  
> iOS9 SDK부터 ATS(App Transport Security)관련 설정을 적용해야 합니다.  
> XCode7 이상에서 빌드할 경우 아래와 같이 IAP 특정 도메인에 대한 예외처리를 설정해야 합니다.  
> [Apple Document](https://developer.apple.com/library/prerelease/ios/technotes/App-Transport-Security-Technote/)

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

### 1\. Import TIAPurchase.h

어플리케이션에 SDK 사용을 위한 준비가 완료되면, IAP SDK의 Header File을 아래와 같이 추가합니다.

``` objc
#import "TIAPurchase.h"
```

### 2\. 로그정보 활성화

디버그를 위한 로그 정보에 대한 노출을 활성화 합니다.

[Example Code]

``` objc
[TIAPurchase setDebugMode:YES];
```

### 3\. 유저 등록

애플리케이션에서 사용자에 대한 인증 이후에 사용자 식별이 가능한 값을 등록합니다.

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

### 4\. 결제 요청

인앱 결제 요청을 합니다. 결제가 성공적으로 완료되면 completionHandler 를 통해 결제내역이 전달 됩니다.

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

### 5\. 미소비 결제 내역 조회

결제 내역을 조회 합니다.

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

### 6\. 구매 가능한 아이템 내역 조회

구매 가능한 모든 아이템 내역을 조회합니다.

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

### 7\. 미처리 결제건 일괄 재처리

미처리된 결제건(IAP 서버 검증 실패)들에 대해 일괄로 재처리 작업을 진행합니다.

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
