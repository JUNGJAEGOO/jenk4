title=About
date=2013-09-24
type=page
status=published
big=TCCommon
summary=IAPOverview
~~~~~~
## Common > IAP > Overview

In-App Purchase (이하 IAP) 서비스는 통합 인앱 결제 서비스 입니다.

## 주요 기능

IAP는 다음과 같은 기능을 제공합니다.

* 결제를 쉽게 연동할 수 있는 환경을 제공합니다.  
SDK에서 2~3번의 API 호출 만으로도 결제 처리를 완료할 수 있습니다.  
* 다양한 스토어의 인앱 결제를 단일 인터페이스로 제공합니다.  
Google Play, Apple AppStore 등과 같은 다양한 인앱 결제를 단일 인터페이스로 연동했습니다. 
IAP SDK 사용자는 제공하는 결제 API만 사용하면 됩니다. 스토어별 세부 결제 연동방식은 몰라도 됩니다.  
* 강력한 결제 보안 기능을 제공합니다.  
IAP에서 제공하는 결제 검증 서버를 통해 결제 안정성을 높일 수 있습니다.  
* 고객 지원을 위한 결제 조회 기능을 제공합니다.  
웹콘솔에서 결제내역 조회기능을 제공합니다  

## 지원 스토어

IAP 서비스에서는 다음과 같은 스토어의 연동을 지원 합니다.  

[표1 IAP 지원 스토어 리스트]

| 플랫폼 | 스토어 |
| --- | --- |
| Android | 구글 플레이 |
| Android | 원스토어(티스토어 + 올레마켓 + U+스토어 + 네이버 앱스토어)<br>[http://dev.onestore.co.kr](http://dev.onestore.co.kr) |
| iOS | 앱스토어 |

## 서비스 용어

IAP 서비스에서는 다음 용어를 내부적으로 사용합니다.

[표2 IAP 서비스 용어]

| 용어 | 설명 |
| --- | --- |
| AppKey | TOAST Cloud 사용자 프로젝트와 상품간 1:1 매칭키. 프로젝트당 하나의 IAP용 AppKey를 발급함 |
| 스토어(Store) | App Store, Google Play같은 스토어를 의미함 |
| 결제내역(Payment) | 사용자가 결제한 내역 |
| 결제요청(Purchase) | 앱 내에서 아이템을 구매함 |
| 결제소비(Consume) | 사용자에게 아이템을 생성하기 전 결제를 소비하는 것 |
| Payment Purchase Token | 사용자 애플리케이션 서버가 결제를 소비할 때 사용하는 인증토큰 |

## 서비스 구조

IAP 서비스는 다음 그림과 같이 IAP SDK, User Application Server, IAP Server, Store 4가지로 구성됩니다.

![[그림 1 IAP 서비스 구조 - Server To Server Model]](http://static.toastoven.net/prod_iap/iap_n_1.png)
<center>[그림 1 IAP 서비스 구조 - Server To Server Model]</center>

![[그림 2 IAP 서비스 구조 - Build-in Model]](http://static.toastoven.net/prod_iap/iap_n_23.png)
<center>[그림 2 IAP 서비스 구조 - Build-in Model]</center>

| 컴포넌트명 | 설명 |
| ----- | --- |
| IAP SDK | IAP Android SDK입니다. 인앱 결제를 위하여 사용자ID 등록, 결제요청을 수행합니다. 결제 수행시 스토어(Android의 경우 Google Store)의 인앱 결제 화면으로 이동합니다. |
| User Application Server | 사용자 애플리케이션 서버입니다. IAP 서버를 통하여 클라이언트가 요청한 결제내역을 확인한 후 결제소비를 진행하고 아이템 전달을 수행합니다. |
| User Application Client | 사용자 애플리케이션에 서버가 존재하지 않는다면, 애플리케이션의 클라이언트에서 결제소비를 진행하고 아이템에 대한 권한을 부여하게 됩니다. |
| IAP Server | TOAST Cloud에서 제공하는 인앱 결제 서버입니다. |
| Store | Google Store, Apple App Store 등의 다양한 스토어입니다. 플랫폼별 스토어는 IAP 서버와 연동되어 있습니다. |
<center>[표 3 IAP 컴포넌트]</center>

## IAP 결제 흐름도

인앱 결제에서는 IAP SDK와 IAP 서버 API를 제공하고 있습니다. 다음 그림은 결제 흐름도 입니다.

![[그림 3 Server To Server Model 결제 흐름도]](http://static.toastoven.net/prod_iap/iap_n_28.png)
<center>[그림 3 Server To Server Model 결제 흐름도]</center>

![[그림 4 Build-in model 결제 흐름도]](http://static.toastoven.net/prod_iap/iap_n_29.png)
<center>[그림 4 Build-in model 결제 흐름도]</center>

[표4 IAP 결제 흐름도]

| Step | Description |
| ---------- | ----------- |
| [1] | 결제 사용자 ID를 등록합니다. 결제 사용자는 개발사에서 사용자를 식별하고 아이템을 지급하는 대상이며<br>Google play나 App Store 계정이 아닙니다.<br>**[참조]** <br>API Step<br>Android : InternalInAppPurchase.InAppPurchase.registerUserId<br>iOS : TIAPurchase registerUserId: error: |
| [2] | 클라이언트에서 결제를 요청합니다.<br>**[참조]** <br>API Step<br>Android : InternalInAppPurchase..InAppPurchases.requestPurchase<br>iOS : TIAPurchase startPurchaseWithViewController: itemId: completionHandler |
| [3]<br>[3-1] | 스토어에서 결제를 진행합니다. |
| [4] | 스토어에서 결제를 마치고 결제결과를 전달받습니다.<br>전달받은 결과를 이용해 User Application Server에서 item consume 진행을 합니다.<br>**[주의]** <br>Build in model 인 경우User Application Server가 없는 경우<br>애플리케이션 서버가 존재 하지 않는 모델은 결제소비를 클라이언트에서 직접 검증 할 수 있으나, <br/> 보안 상의 이슈로 인해 Server To Server로 결제소비후 아이템에 대한 권한을 부여하는 것을 강력 권장 합니다. |
| [4-1]<br>[4-2] | 스토어에서 전달받은 결과를 통해 IAP Server에 Consume 요청을 합니다. |
| [5] | Consume을 성공하면 사용자에게 item을 전달합니다. |
| [6] | 결제를 완료합니다. |
