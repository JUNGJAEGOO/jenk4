title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Notification > Push > Release Notes

### 2017.09.21
#### 버그 수정
* [CONSOLE] Tag 조회시 정렬 기준이 없는 오류 수정
    * Tag 조회시 생성 일자 기준 내림 차순으로 정렬되도록 수정했습니다.
* [CONSOLE] 예약 메시지 등록시 요일이 3개 이상 선택안되는 오류 수정
    * 예약 타입을 'EVERY_WEEK'으로 설정했을 때, 요일이 3 개 이상 선택안되는 오류를 수정했습니다.

#### 기능 개선
* [API] Tag 등록시 이름에 빈칸 허용하지 않도록 수정

### 2017.08.24
#### 기능 추가
* [CONSOLE] Tag 메시지 발송 추가
    * 메시지 발송, 예약 메시지 발송 탭에서 Tag를 선택해 메시지를 발송할 수 있습니다.
    * Target에 Type을 'TAG'로 설정하면, 등록된 Tag들을 선택할 수 있습니다.
    * 선택된 Tag들을 'OR' 또는 'AND' 조건으로 질의해 메시지를 보낼 수 있습니다.
    * 예로, '서울', '30대', '남자' Tag를 선택 후, 'AND' 조건으로 메시지를 발송하면,   
    서울에 사는 30대 남자에게 메시지가 발송 됩니다.
* [CONSOLE] Token 탭 추가
    * 웹콘솔에서 Uid, Token으로 등록된 Token을 검색할 수 있습니다.
    * Uid 검색의 경우 전체 일치뿐만 아니라 부분 일치 검색도 가능합니다.
    * 새로운 토큰을 추가하거나, 검색된 토큰을 삭제할 수 있습니다.
* [CONSOLE] Tag 탭 추가
    * Tag를 관리할 수 있습니다.
    * Tag가 붙은 Uid들을 조회할 수 있습니다.
    * Uid에 Tag를 붙이거나 제거할 수 있습니다.

#### 버그 수정
* [API] 예약 메시지 상태 변경이 안되는 버그 수정
    * 예약 메시지 발송이 완료되었지만, v2.0 예약 API에서 추가된 reservationStatus가 COMPLETED(완료)로 업데이트되지 않는 오류를 수정했습니다.
* [API] 토큰 등록시 oldToken, token 필드에 같은 값이 설정될 경우, 삭제되는 버그 수정
    * 2017년 08월 03일 핫픽스로 수정되었습니다.
    * oldToken은 토큰 변경이 발생하거나, 서버에 저장된 토큰을 새로운 토큰으로 변경하기 위해 사용하는 필드입니다.
    * oldToken에 token과 같은 값을 설정해 토큰 등록 API를 호출할 경우, 삭제 후 등록이 생략되는 버그를 수정했습니다.
    * 패치 후, oldToken과 token이 같으면 삭제 없이 토큰을 업데이트 합니다.
* [SDK] v1.4.2 릴리즈
    * [Android,iOS] 토큰 등록시 잘못된 요청으로 인해 토큰이 삭제될 수 있는 로직에 대한 방어 로직이 추가되었습니다.
    * [Android] PushAnaytics의 초기화 여부를 확인하는 **PushAnalytics.isInitialize** 메소드가 추가되었습니다.

#### 기능 개선
* [API] 알림/홍보성/야간홍보성 푸시 메시지 수신 대상 기준 개선
    * 정보통신망법 규정((제50조부터 제50조의 8)에 따라 대한민국 사용자들의 토큰들은 수신동의 여부에 따라 메시지 발송시 자동 필터링 됩니다.
    * 최근 iOS에서 다양한 언어 코드가 생성되면서 대한민국 사용자 토큰으로 분류되지 않을 수 있는 문제가 있었습니다.
    * 기존에 언어 코드가 'ko', 'ko-kr'만 대한민국 사용자 토큰으로 분류했지만,     
    'ko', 'kor' 또는 'ko-'를 포함하는 언어 코드를 대한민국 사용자 토큰으로 분류하도록 개선했습니다.
* [CONSOLE] Channel 메시지 발송 기능 제외
    * Tag 메시지 발송 기능이 추가되면서 CONSOLE에서 Channel 메시지 발송 기능이 제외되었습니다.
    * 기존 Channel 메시지 발송 기능은 v1.3 메시지 발송 API로 이용할 수 있습니다.

### 2017.07.20
#### 기능 추가
* [API] 태그(Tag) API 추가     
    * Uid에 태그를 붙여 관리할 수 있습니다.
    * Uid에 연락처(Contact)을 추가해 관리할 수 있습니다.
    * 메시지 발송시 태그와 조건을 설정해 메시지를 발송할 수 있습니다.    
예, 메시지 발송시 target.type을 'TAG', target.to를 '남자, AND, 30대'로 설정하면, '남자'와 '30대' 태그가 붙은 Uid를 대상으로 메시지가 발송됩니다.
    * API로 먼저 공개되며, 8월 정기 점검 후 CONSOLE에서 태그 기능을 사용하실 수 있습니다.      
    <a href="/zh/Notification/Push/zh/Developer%60s%20Guide/#_32" target="_blank">API Reference 바로 가기</a>
* [API] 실패 처리된 메시지 조회 API 추가
    * 메시지 발송시 실패된 메시지를 조회할 수 있는 API가 추가되었습니다.
    이 API를 이용해 발송이 실패 원인에 대한 내용을 확인할 수 있습니다.     
    <a href="/zh/Notification/Push/zh/Developer%60s%20Guide/#_15" target="_blank">API Reference 바로 가기</a>

#### 버그 수정
* [API] 토큰 수정시 새로운 토큰이 존재할 때, 기존 토큰은 삭제 안되는 오류 수정
    * 토큰 등록 API에서 oldToken을 token으로 변경할 때, token이 존재할 경우 oldToken이 삭제 안되던 오류를 수정했습니다.
* [API] 메시지 조회시 Internal Error 응답 오류 수정
    * 메시지 조회시 from, to에 잘 못된 형식의 DateTime(일시)를 입력할 경우 Internal Error로 응답하던 것을 Client Error로 응답하도록 수정했습니다.
* [API] 예약 메시지 수정시 createdDateTime이 잘못 설정되는 오류 수정
    * 예약 메시지 수정시 updatedDateTime(수정 일시)뿐만 아니라 createdDateTime(생성 일시)까지 updatedDateTime 값으로 업데이트되는 오류를 수정했습니다.

### 2017.05.25
#### 기능 추가
* [SDK] SDK 버전 확인을 위한 API 추가
    * SDK 버전 확인을 위한 API가 추가되었습니다.
* [Android SDK] 수신 및 오픈 확인 API 추가 및 Deprecated
    * 수신 및 오픈 확인 API 일부가 추가 및 Deprecated 되었습니다.
    * 해당 기능을 사용하기 위해서 반드시 **PushAnalytics.initialize** 메소드를 호출해줘야 합니다.


### 2017.04.25
#### 기능 추가
* [API] 메시지 수신, 확인 데이터 수집(Message Delivery Receipt), 통계 조회 기능 추가
    * 메시지 발송 후, 기기에 수신, 사용자의 메시지 확인 데이터를 수집해 통계로 조회할 수 있는 기능을 추가되었습니다.
    * [CONSOLE] > [Settings] 탭에서 활성화 시킬 수 있으며, v2.0 API Reference에서 통계 조회 API 설명을 확인할 수 있습니다.
    * 해당 기능은 v1.4이상 SDK가 적용된 곳에서만 사용할 수 있습니다.    
    <a href="/zh/Notification/Push/zh/Client%20SDK%20Guide/#_4" target="_blank">SDK 수신 및 오픈 여부 적용 가이드 바로 가기</a>
* [API] v2.0 API 추가
    * 토큰 통계 API가 추가되었습니다.
    * 예약 메시지 API가 추가되었습니다.
    * 메시지 수신, 확인 통계 조회 API가 추가되었습니다.
    * v1.3 피드백 API는 v2.0 유효하지 않은 토큰 API로 변경되었습니다.
    * 응답 메시지를 더 자세하게 출력합니다.    
    <a href="/zh/Notification/Push/zh/Developer%60s%20Guide" target="_blank">v2.0 API Reference 바로 가기</a>
* [CONSOLE] Dashboard, Setting 탭 추가
    * 메시지 수신, 확인 통계를 확인할 수 있는 [Dashboar]d 탭이 추가되었습니다.
    * 메시지 수신, 확인 데이터 수집 기능을 설정할 수 있는 [Settings] 탭이 추가되었습니다.
* [SDK] v1.4 SDK 추가
    * 메시지 수신, 확인 데이터 수집(Message Delivery Receipt) 기능이 추가되었습니다.
    * 현재 GCM, iOS만 지원하며, Tencent는 추후 지원 예정입니다.
    * iOS는 Notification Service Extension를 사용하기 때문에 iOS 10이상에서만 동작합니다.

### 2017.02.23
#### 버그 수정
* [API] 발송 기간이 한 달 이상인 예약 메시지 발송 안되는 오류 수정
    * 2017년 1월까지 등록된 예약 메시지 중, 발송 종료일이 2월 이상인 예약 메시지가 발송안되는 오류를 수정했습니다.
* [Android SDK] 빌드시 Warning Log 노출되지 않도록 수정
    * 기능상 문제가 없는 것으로, ProGuard 설정 변경을 통해 더 이상 Warning Log가 출력되지 않도록 수정했습니다.
* [iOS SDK] 토큰 리프레쉬 과정에서 크래시나는 현상 수정
    * 앱 알림 설정을 껐다가 다시 켰을 경우 발생하는 오류로 토큰을 재생성하는 코드를 수정했습니다.

#### 기능 개선
* [Android SDK] 안드로이드 Gradle의 play-services 의존을 play-services-gcm로 수정
    * SDK 빌드시 필요한 컴포넌트만 의존하도록 개선했습니다.

### 2017.01.19

#### 기능 개선/변경
* [API] 메시지 조회 API Response Body에 createdDateTime(메시지 생성 시간) 필드 추가
* [Etc] 인증서 만료 안내 메일 계정 변경 (support@cloud.toast.com -> noreply@cloud.toast.com)

### 2016.12.22
#### 버그 수정
* [API] 예약 메시지 등록이 한 달이 지났을 경우 발송 안되는 오류 수정
* [API] 매월 1일 발송될 예약 메시지가 발송 안되는 오류 수정
* [API] 새 버전 FCM API Key가 등록 안되던 오류 수정
* [API] 발송 결과가 'MismatchSenderId', 'NotRegistered'인 경우 토큰이 삭제되지 않던 오류 수정

#### 개발자 가이드 수정
* [Client SDK Developer's Guide] 본문 내 'GCM Push Credentials', 'GCM API Key'로 변경

### 2016.11.24
#### 기능 개선/변경
* [Android SDK] 지원하는 GCM 라이브러리 버전 업데이트(com.google.android.gms:play-services:9.6.0)
* [Android SDK] 오류 로그 세분화

#### 버그 수정
* [Android, iOS SDK] 채널 기본값 null로 변경
* [Android SDK] Appkey가 설정되지 않았을 때 동작안하는 버그 수정
* [Android SDK] AAR 패키징시 텐센트 푸시 설정 제거

#### 개발자 가이드 수정
* [Client SDK Developer's Guide] 토큰 등록시 채널 설정 설명 변경 (SDK v1.3 이하 채널 설정 필수)

### 2016.10.06
#### 기능 개선/변경
* [API, CONSOLE] MPS 단위 1,000개/초에서 100개/초로 변경

### 2016.09.30
#### 개발자 가이드 수정
* [Client SDK Developer's Guide] '토큰 등록 > Android, GCM' 부분, 채널 설정시 'Optional'에서 'Required'로 수정

### 2016.09.29
#### 정책 변경
* 데이터 보관 기간 정책 변경, 최근 30 일까지 저장 (메시지, 예약 메시지, 피드백)

#### 기능 개선/변경
* [CONSOLE] 인증서 삭제 없이 바로 교체할 수 있도록 수정

#### 버그 수정
* [API, CONSOLE] APNS Universal Certificate APNS_SANDBOX(Development)에 등록 안되는 오류 수정
* [API] UID 기준 토큰 조회 API에서 APNS_SANDBOX 토큰이 제외되는 오류 수정
* [API] 토큰 등록 API에서 Empty String("")이 등록 되는 오류 수정

### 2016.08.18
#### 버그 수정
* [CONSOLE] 예약 메시지 수정시 요일이 저장한 내용과 다르게 표시되는 오류 수정
