title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > IAP > Getting Started

IAP는 Web Console에서 앱과 아이템을 등록한 후 SDK를 사용할 수 있습니다.

## IAP 상품 활성화 및 Appkey 발급

```
IAP 서비스를 사용하기 위해서는 Web Console (http://console.cloud.toast.com)에서
[Common] > [IAP] 을 선택한 후 [상품 이용] 버튼을 클릭하여 서비스를 활성화합니다.
```

![[그림 1 IAP 상품 활성화]](http://static.toastoven.net/prod_iap/iap_n_30.png)
<center>[그림 1 IAP 상품 활성화]</center>

```
[그림 2]의 상단 'URL & Appkey'를 클릭하여 AppKey를 확인하거나 클립보드에 복사합니다.
```

![[그림 2 AppKey 확인]](http://static.toastoven.net/prod_iap/iap_n_31.png)
<center>[그림 2 AppKey 확인]</center>

## 스토어 등록 – APP ID 획득

```
1. [App] 탭 선택 > [추가] 버튼 클릭  
2. [Store ID]에서 스토어 선택  
   스토어 연동을 위한 정보 입력 예시 (Google Play)  
    - Store APP ID : Google Play에 등록한 어플리케이션의 패키지명  
    - Google In App Purchase License Key : Google Play에 등록한 어플리케이션의 Public Key  
    - Google API Client ID : OAuth 인증을 위한 Google API 프로젝트의 Client ID  
    - Google API Client Secret : OAuth 인증을 위한 Google API 프로젝트의 Client Secret  
    - Refresh Token For Google OAuth : Google Play Developer 계정을 통해 획득한 Refresh Token  
3. [추가] 버튼 클릭  
4. [APP ID] 확인
```

> [참고]  
> APP ID 획득을 위한 [스토어 연동 정보](./Store interlocking information)    

![[그림 3 스토어 등록]](http://static.toastoven.net/prod_iap/iap_n_32.png)
<center>[그림 3 스토어 등록]</center>

## 아이템 등록

```
1. [Item] 탭을 선택합니다.  
2. [Store ID] 선택 > [+ Add] 버튼을 클릭합니다.  
3. [Item Name]란에 아이템 이름을 입력합니다.  
4. [Store Item ID]란에 Google Play와 같은 스토어에 등록한 아이템 ID를 입력합니다.  
5. [상태]를 선택합니다.  
6. [추가] 버튼을 클릭하고, 등록한 [ITEM ID]를 확인합니다.  
```

![[그림 4 아이템 등록]](http://static.toastoven.net/prod_iap/iap_n_33.png)
<center>[그림 4 아이템 등록]</center>

## 스토어 상품유형

```
각 스토어 개발자 센터에서 등록한 InAppProducts의 상품유형([표 1])을 참고하여 아이템을 등록합니다.
```

|Store|	상품유형|
|---|---|
|Google Play|	관리되는 제품|
|App Store|	소모품 (consumable)|
|T-Store (One store)|	소멸성 (consumable) 상품|

<center>[표 1] 스토어 상품 유형</center>

> [주의]  
> 명시되지 않은 상품유형으로 결제진행 시의 시스템 에러 및 재산상의 피해는 책임지지 않습니다.

## 결제 정보 조회

```
1. [Transaction] 탭을 클릭합니다.  
2. [Store ID]를 선택합니다.  
3. [Date]에서 시작일과 종료일 조건을 선택합니다.  
4. [정렬순서]에서 정렬 조건을 선택합니다.
5. [검색] 버튼을 클릭합니다.  
```

![[그림 5 결제 정보 조회]](http://static.toastoven.net/prod_iap/iap_n_44.png)
<center>[그림 5 결제 정보 조회]</center>

> [참고]
> 결제 상태   
>  - In Progress : 결제 진행중   
>  - Success : 결제 완료   
>  - Failure : 결제 검증 실패
>  - Refund : 환불 완료

> 결제 상태에 따른 상황  
>  - In Progress : 스토어를 통한 결제가 더 이상의 진행이 되지 않거나 결제검증까지 진행되지 않은 경우  
>  - Failure : 스토어에서 결제를 진행했으나 결제검증에서 오류가 난 경우  
>  - Success : 스토어 결제 성공
>  - Refund : 관리자가 수동으로 마켓에서 환불처리됬음을 업데이트한 경우


## 결제 상태 조회
```
아래와 같은 상황일 경우 결제상태를 변경할 수 있습니다.

1. 결제과금은 실제로 이루어졌으나 IAP 내부 이슈로 결제상태가 정확히 반영되지 않았을 경우 ('Success' 상태로 변경)
   1.1 'Success' 상태로 변경하기 위해선 그림 7과 같이 영수증 정보와 결제가 이뤄진 가격, 통화를 기입해야 합니다.

2. 결제과금 완료 후 consume처리를 하지 않아 유저가 아이템을 받지못하여 환불처리를 했을경우 ('Refunded' 상태로 변경)
   2.1 'Refunded' 상태로 변경되었을 경우 client의 미소비 결제내역 조회 API에서 조회되지 않습니다.

변경이 가능한 결제상태는 아래와 같이 상태 컬럼 우측에 [수정] 버튼이 노출됩니다.
```
![[그림 6 결제 상태 수정]](http://static.toastoven.net/prod_iap/iap_45.png)
<center>[그림 6 결제 상태 수정]</center>
 
![[그림 7 결제 상태 수정]](http://static.toastoven.net/prod_iap/iap_46.PNG)
<center>[그림 7 결제 성공 상태로 수정시 추가정보 기입]</center>




## 결제 통계 조회

```
1. [Statistics] 탭을 클릭합니다.  
2. [통화]를 선택합니다.  
3. [<][>] 버튼으로 스토어별 '이달의 총 수입', '일별 상세내역'을 월별로 조회할 수 있습니다.  
```

![[그림 6 결제 통계 조회]](http://static.toastoven.net/prod_iap/iap_n_35.png)
<center>[그림 6 결제 통계 조회]</center>
