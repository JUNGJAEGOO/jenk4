title=About
date=2013-09-24
type=page
status=published
big=TCGame
summary=TCGamebaseOpPurchase
nation=ko
~~~~~~
## Game > Gamebase > Operator Guide > Purchase

인앱 결제관련 정보를 등록 및 내역 조회 기능을 제공합니다.
Gamebase 내부적으로 TOAST Cloud IAP 상품을 사용하고 있습니다.

## App

게임 내에서 상품 판매를 위한 스토어를 등록합니다.

![image alt](http://static.toastoven.net/prod_gamebase/Operators_Guide/Console_IAP_App1_1.0.png)

*   스토어 : 앱에서 결제 시스템을 사용하기 위해 등록한 스토어 명.
*   앱 ID : 스토어에서 발급한 앱의 고유 ID.
*   앱 이름 : 스토어에 등록한 앱 이름 정보.
*   사용 여부 : 스토어 사용 여부.
*   등록일시 : 스토어 정보 등록 일시.

### Register

![image alt](http://static.toastoven.net/prod_gamebase/Operators_Guide/Console_IAP_App2_1.0.png)

*   스토어
    등록하고자 하는 외부 스토어를 선택합니다.
    등록하고자 하는 스토어가 없으실 경우, 담당자에게 연락주시면 새로운 스토어에 대한 추가가 가능합니다.

*   App 이름
    등록하고자 하는 게임의 이름을 입력합니다.

*   스토어 App ID
    스토어에서 발급 받은 정보를 입력합니다.

*   사용여부
    스토어 사용 여부를 선택합니다.

### Modify

![image alt](http://static.toastoven.net/prod_gamebase/Operators_Guide/Console_IAP_App3_1.0.png) - 조회 리스트에서 각 스토어를 선택하면 등록된 상세정보를 조회하실 수 있습니다.
- 수정버튼을 누르면 스토어 입력정보를 제외한 나머지 정보를 변경하실 수 있습니다.
- 삭제 버튼을 통해 미사용 스토어의 정보는 삭제하실 수 있습니다.

## Item

각 스토어에서 판매할 아이템을 등록할 수 있습니다.

![image alt](http://static.toastoven.net/prod_gamebase/Operators_Guide/Console_IAP_Item1_1.0.png) 기본적으로는 모든 스토어에 대한 아이템을 노출하며, 각 스토어별 필터링 기능도 제공합니다.

*   스토어 : 아이템을 등록한 스토어.
*   아이템 번호 : IAP에서 발급한 아이템 고유 번호.
*   아이템 이름 : 앱 내에서 노출되는 아이템 이름.
*   스토어 아이템 ID : 스토어에 등록한 아이템 ID
*   사용 여부 : 아이템 사용 여부.
*   등록 일시 : 아이템 등록 일시.

### Register

![image alt](http://static.toastoven.net/prod_gamebase/Operators_Guide/Console_IAP_Item2_1.0.png)

*   스토어
    등록하고자 하는 외부 스토어를 선택합니다.
    등록하시고자 하는 스토어가 없으실 경우 앱 메뉴에서 스토어 등록을 먼저 진행해 주셔야 합니다.

*   아이템 이름
    스토어 등록 후 발급받으신 아이템의 정보를 입력합니다.

*   스토어 아이템 ID
    등록하고자 하는 아이템의 이름을 입력합니다.

*   사용 여부
    해당 아이템의 판매 여부를 선택합니다.

### modify

![image alt](http://static.toastoven.net/prod_gamebase/Operators_Guide/Console_IAP_Item3_1.0.png) - 조회 리스트에서 각 아이템을 선택하면 등록된 아이템의 상세정보를 조회하실 수 있습니다.
- 수정버튼을 누르면 스토어 정보 및 아이템 Seq를 제외한 나머지 정보를 변경하실 수 있습니다.
- 삭제 버튼을 통해 판매하지 않을 아이템의 정보는 삭제하실 수 있습니다.

## Transactions

![image alt](http://static.toastoven.net/prod_gamebase/Operators_Guide/Console_IAP_Transaction1_1.1.png) 등록한 아이템들의 판매 정보를 조회할 수 있습니다.
**Store ID/날짜/Payment seq/Item No/User ID/Sort Order**별로 원하시는 정보를 입력하여 조회가 가능합니다.
아이템 미지급으로 인한 강제진행 기능은 추후 제공될 예정입니다.

*   결제 번호 : Gamebase내에서 결제를 구별할 수 있는 고유 번호
*   스토어 : 결제가 이루어진 스토어 정보
*   유저 ID : 결제를 진행한 유저 ID
*   아이템 이름 : 사용자가 앱에서 구입한 실제 아이템 이름
*   가격 : 사용자가 구입한 아이템의 가격
*   통화 : 사용자가 구입 시 사용한 통화 종류
*   consume : 결제한 아이템의 지급 여부
*   결제 상태 : 결제의 현재 진행 상태
*   Store Reference Key : 스토어에서 발급해주는 결제 고유 번호
*   등록일시 : 사용자가 구입을 시도 또는 완료한 시간
*   환불일시 : 사용자가 아이템을 환불했을 시 환불이 이루어진 시간