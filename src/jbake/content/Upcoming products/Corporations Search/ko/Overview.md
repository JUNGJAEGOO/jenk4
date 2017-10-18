title=About
date=2013-09-24
type=page
status=published
big=TCUpcoming
summary=CorporationsOverview
nation=ko
~~~~~~
## Upcoming Products > Corporations Search > Overview 

> ※ 본 문서는 alpha 개발 단계의 문서입니다.
> 사용에 관심이 있으신 분은 **support@cloud.toast.com**으로 문의해 주시기 바랍니다.

국세청에서 관리하고 있는 사업자번호에 대하여 과세유형 및 신규등록, 휴.폐업 여부를 스크래핑 모듈을 통해 조회한 후 재무/세무/ERP시스템과 연동하는 서비스 입니다.  
본 조회서비스는 정확한 세무처리와 거래 상대방이 세금계산서를 교부할 수 없는 휴.폐업자 또는 간이과세자로 의심되는 경우, 납세자가 이를 확인하여 불의의 피해를 받지 않도록 하기 위한 서비스 입니다.

## 서비스 구성도

![image](http://static.toastoven.net/prod_toastbill/img_01.jpg)

## 제공 서비스

|서비스|	설명|
|---|---|
|과세정보|	사업자 과세유형(일반/간이/면세)|
|휴.폐업정보|	휴.폐업여부, 휴.폐업일자|

## 주요 기능

- 엑셀 파일을 통한, 사업자등록번호의 신규등록, 휴.폐업 여부 대량조회를 지원 합니다.
- REST API를 제공하고 있어, 다양한 플랫폼에서 손쉽게 사용 할 수 있습니다.
- REST API를 통한, 실시간 단 건 조회 및 복수 거래처 대량 조회를 지원 합니다.
