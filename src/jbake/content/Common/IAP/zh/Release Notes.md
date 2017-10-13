title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > IAP > Release Notes

### 2017.09.21

### 기능 개선/변경

* [SDK][[AOS-1.3.5](/Download/#common-iap)][[IOS-1.4.6](/Download/#common-iap)][[Unity-1.5.5](/Download/#common-iap)] 릴리스
    * 미소비 결제내역 조회 API 내부 로직 중 과거 결제가 있는 경우에만 서버를 통해 내역을 가져오고 그렇지 않을 경우 빈 리스트 반환하도록 개선

### 2017.08.24

### 버그 수정

* [SDK][[AOS-1.3.4](/Download/#common-iap)][[Unity-1.5.4](/Download/#common-iap)] 릴리스
    * 미처리 결제건 일괄 재처리 API 호출 시 간헐적으로 발생하는 앱 크래시 현상 수정
* [SDK][[IOS-1.4.5](/Download/#common-iap)][[Unity-1.5.4](/Download/#common-iap)] 릴리스
    * 결제시도시 잔존하는 결제건들 처리중 발생하는 앱 크래시 현상 수정 

### 기능 개선/변경

* [SDK][[AOS-1.3.4](/Download/#common-iap)][[IOS-1.4.5](/Download/#common-iap)][[Unity-1.5.4](/Download/#common-iap)] 릴리스
    * 해외 네트워크 이슈로인한 가속 URL 적용

### 2017.07.20

#### 버그 수정

* [SDK][[iOS-1.4.4](/Download/#common-iap)][[Unity-1.5.3](/Download/#common-iap)] 릴리스
    * 간헐적 '해당 항목은 무료로 복구됩니다.' 네이티브 얼럿 현상 수정
    * 신규 에러코드 116 추가

#### 기능 개선/변경

* [SDK][[iOS-1.4.4](/Download/#common-iap)][[Unity-1.5.3](/Download/#common-iap)] 릴리스
    * 결제 종료시점 변경

### 2017.06.29

#### 버그 수정

* [SDK][[Android-1.3.3.1](/Download/#common-iap)][[Unity-1.5.2](/Download/#common-iap)] 릴리스
    * 미처리 결제건 일괄 재처리 API가 connection timeout 과 관련된 항목만 처리하도록 수정
    * 원스토어 응답실패 시 발생하는 앱 크래시 현상 수정
    * 미처리 결제건 일괄 재처리 API 호출 시 간헐적으로 발생하는 앱 크래시 현상 수정
    * 소수점 금액을 포함할 경우 발생하는 앱 크래시 현상 수정
    * 간헐적 'IAB helper is not set up' 예외 발생으로 인한 앱 크래시 현상 수정

#### 기능 개선/변경

* [SDK][[Android-1.3.3.1](/Download/#common-iap)][[Unity-1.5.2](/Download/#common-iap)] 릴리스
    * mobill-core 모듈에 물리적으로 포함되던 okhttp.jar 및 gson.jar 파일을 제거하고, gradle 의존성 설정으로 변경

### 2017.04.20

#### 버그 수정
* TEST 마켓 사용시 영수증 검증 처리가 안되는 문제 수정

### 2017.04.04

#### 기능 개선/변경

* [API] 아이템 조회, 미소비내역 조회 API 추가


### 2017.02.23

#### 기능 개선/변경

* [Console] 명칭 변경(Market > Store)
* [Console] 결제내역 조회시 결제번호(ID 컬럼)  정렬 기능 추가

#### 버그 수정
* [SDK][[Android-1.3.2](/Download/#common-iap)][[Unity-1.5.1](/Download/#common-iap)] 릴리스
    * [미처리 결제건 일괄 재처리](/Common/IAP/zh/Android%20Developer%60s%20Guide/#_9)시 앱 크래시 현상 수정
    * [구매 가능한 아이템 조회](/Common/IAP/zh/Android%20Developer%60s%20Guide/#_5)시 잘못된 응답값이 반환되는 문제 수정
	```
	변경 전: itmeSeq
	변경 후: itemSeq
	```

### 2017.01.19

#### 기능 개선/변경

* [Console] 결제상태 변경 기능 추가
* [Console] 앱 / 아이템 수정시 필수 입력값 검증처리 추가
* [SDK][[Android-1.3.1](/Download/#common-iap)][[Unity-1.5.0](/Download/#common-iap)] 릴리스
    * 불필요한 권한 제거(WRITE_EXTERNAL_STORAGE, READ_EXTERNAL_STORAGE)
    * <a href="/ko/Common/IAP/zh/Error%20Code/" target="_blank">Error Code Guide</a> 와 상이한 오류 코드 수정
* [SDK][[iOS-1.4.3](/Download/#common-iap)] 릴리스
    * <a href="/ko/Common/IAP/zh/Error%20Code/" target="_blank">Error Code Guide</a> 와 상이한 오류 코드 수정

### 2016.12.22

#### 기능 개선/변경

* [SDK][[Android-1.3.0](/Download/#common-iap)][[Unity-1.4.9](/Download/#common-iap)] 릴리스
    * ONE Store SDK 버전 릴리스(16.02.00 -> 16.03.00)


### 2016.11.29

#### 기능 개선/변경

* [SDK][[Android-1.2.9](/Download/#common-iap)][[Unity-1.4.8](/Download/#common-iap)] 릴리스
    * ONE Store SDK 버전 릴리스(15.01.00 -> 16.02.00)

### 2016.11.24

#### 버그 수정

* [SDK][[iOS-1.4.1](/Download/#common-iap)][[Unity-1.4.7](/Download/#common-iap)] 릴리스
    * 일부 iOS(10.0.1 이상)버전에서 결제 검증 로직 실패하던 문제 수정


### 2016.11.02

#### 기능 추가

* [SDK][[Android-1.2.8](/Download/#common-iap)][[iOS-1.4.0](/Download/#common-iap)][[Unity-1.4.6](/Download/#common-iap)] 릴리스
    * 미처리된 결제에 대한 재처리 Client API 추가
        * 미처리된 결제건(IAP 서버 검증 실패)들에 대해 일괄로 재처리 작업을 진행합니다.
        * 참고 : Android Developer's Guide > IAP 결제 흐름도 > 미처리 결제건 일괄 재처리 & iOS Developer's Guide > API Reference > 7. 미처리 결제건 일괄 재처리

#### 기능 삭제

* [SDK][Android] 네이버 라이브러리 삭제

### 2016.10.12

#### 버그 수정

* [SDK][[Android-1.2.7](/Download/#common-iap)][[Unity-1.4.5](/Download/#common-iap)] 릴리스
    * AndroidManifest.xml 필수 permission 거부 시 앱 크래쉬 현상 수정

### 2016.09.29

#### 기능 개선/변경

* [SDK][[iOS-1.3.3](/Download/#common-iap)][[Unity-1.4.4](/Download/#common-iap)] 릴리스
    * iOS에서 구매가능 상품 조회 API 호출 시 유저등록 API 호출 없이 가능하도록 수정

### 2016.09.22

#### 버그 수정

* [SDK][[Unity-1.4.3.1](/Download/#common-iap)] 릴리스
    * 구 서버 API 조회 수정 및 유니티 커스텀 패키지내의 안드로이드 모듈 수정

### 2016.08.24

#### 기능 추가

* [SDK][[Android-1.2.6](/Download/#common-iap)][[iOS-1.3.2](/Download/#common-iap)][[Unity-1.4.3](/Download/#common-iap)] 릴리스
    * 구매가능한 상품 조회 Client API 추가
        * Web Console에서 상태값이 USE 인 아이템을 가격 및 통화값을 포함하여 조회할 수 있습니다.
        * 참고 : Android Developer's Guide > IAP 결제 흐름도 > 구매 가능한 아이템 내역 조회 & iOS Developer's Guide > API Reference > 6.구매 가능한 아이템 내역 조회


### 2016.08.04

#### 기능 개선/변경

* [SDK][[Android-1.2.5](/Download/#common-iap)] 릴리스
    * AndroidManifest.xml 필수 permission 거부시 callback 에러코드 리턴 수정
