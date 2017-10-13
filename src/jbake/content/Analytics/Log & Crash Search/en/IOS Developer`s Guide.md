title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > iOS Developer's Guide

Log & Crash iOS/Mac SDK는 Log & Crash Search 수집 서버에 로그를 보내는 기능을 제공합니다.  
Log & Crash iOS/Mac SDK 특·장점은 다음과 같습니다.  

- 로그를 수집 서버로 보냅니다.
- 앱에서 발생한 크래시 로그를 수집 서버로 보냅니다.
- Log & Crash Search 에서 전송된 로그를 조회 및 검색이 가능합니다.
- 멀티 쓰레딩 환경에서 동작합니다.

## 지원 환경

- iPhone 3GS, 4, 4S, 5, 5S, 6, 6 Plus (armv7, armv7s, arm64)
- iOS 5.1 이상 (arm64는 7.0.3 이상)
- Mac OS X 10.5 이상 (Intel 64 비트)

## 다운로드

[Toast Cloud](http://docs.cloud.toast.com/ko/Download/)에서 iOS-Unity-Mac SDK를 받을 수 있습니다.

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [iOS/Mac SDK] 클릭
```

## 설치

### 구성

iOS/Mac SDK는 다음와 같이 구성되어 있습니다.

```
docs/                       ; iOS/Mac SDK 문서
libs/iOS                    ; iOS SDK 라이브러리
libs/Mac OS X               ; Mac SDK 라이브러리
sample/LogNCrashiOSSample   ; iOS SDK 샘플
sample/LogNCrashMacSample   ; Mac SDK 샘플
```

### 샘플 설명

같이 제공되는 sample/ 에 대해 설명합니다.
- iOS

1. sample/LogNCrashiOSSample/LogNCrashiOSSample.xcodeproj를 XCode로 엽니다.
2. ViewController.m을 열어서 앱키, 수집서버 주소를 수정해 줍니다. 버전, 로그 소스, 로그 타입 등을 수정하면 검색에 도움이 됩니다.
3. 실행합니다.
4. TLCLog Init 버튼 눌러 시작합니다.
5. Send Info, Send Debug, Send Warn, Send Fatal, Send Error 버튼을 눌러 로그를 전송 합니다.
6. Send crash 버튼을 눌러 크래시 로그를 전송합니다.

- Mac OS X

1. sample/LogNCrashMacSample/LogNCrashMacSample.xcodeproj를 XCode로 엽니다.
2. AppDelegate.md을 열어서 앱키, 수집서버 주소를 수정해 줍니다.
3. 실행합니다.
4. init 로그가 전송 되었는지 확인 합니다.

## 사용 예

- iOS

1. “Frameworks”에 LogNCrashSDK.framework와 CrashReporter.framework를 추가합니다.
2. “Build Phases”의 “Link Binary With Libraries” 항목에 아래 시스템 프레임워크를 추가합니다.
	- UIKit.framework
	- SystemConfiguration.framework
	- CoreTelephony.framework
	- Foundation.framework

- Mac OS X

1. “Frameworks”에 LogNCrashSDK.framework와 CrashReporter.framework를 추가합니다.
2. “Build Phases”의 “Link Binary With Libraries” 항목에 아래 시스템 프레임워크를 추가합니다.
	- Cocoa.framework
	- SystemConfiguration.framework
3. /Library/Frameworks에 LogNCrashSDK.framework와 CrashReporter.framework를 복사합니다.

- 제공되는 TLCLog class를 사용하여 로그를 전송 합니다.
	- init:ofAppKey:withVersion:forUserId: 를 실행하여 초기화를 해줍니다.
	- info:withMessage:, -debug:withMessage: 등을 사용하여 해당 logLevel 로그를 수집서버로 보냅니다.
	- 앱 크래시가 발생하면 크래시 로그 수집 서버로 전송됩니다.

```
NSString* appKey = @"5b10bc2ba2b80d99ff00a5c8bff3b5050d48dd797fe7ed1c1a857066c1bdb8e4"; // Project AppKey
NSString* appVer= @"1.0";
NSString* serverAddr = @"http://api-logncrash.cloud.toast.com"; //Log & Crash 수집서버 주소
NSString* userID = @"tester"; //사용자 ID

//init 호출시 crash report 자동 전송
[TLCLog init:serverAddr ofAppKey:appKey withVersion:appVer forUserId:userID];

[TLCLog setCustomField:@"Test" forKey:@"DevelopmentStage" ];
[TLCLog info:self.errorCode.text withMessage:self.msg.text];
[TLCLog debug:self.errorCode.text withMessage:self.msg.text atLocation:@"test loc"];
```

## 자세한 API List

TLCLog class에서 제공하는 기능들을 설명합니다.

### 헤더 파일 추가

'TLCLog.h' 파일을 추가 합니다.

### 초기화

```
(bool) init:(NSString *)server ofAppKey:(NSString*)appName withVersion:(NSString*)appVersion;
(bool) init:(NSString *)server ofAppKey:(NSString*)appName withVersion:(NSString*)appVersion forUserId:(NSString*)userId;
(bool) init:(NSString *)server ofAppKey:(NSString*)appName withVersion:(NSString*)appVersion forUserId:(NSString*)userId enableSyncStart:(bool)flag;
```

- TLCLog를 초기화 합니다.
- TLCLog 기능이 제대로 동작하기 위해서는 반드시 호출되어야 합니다.
- 사용자별 통계를 원하는 경우 userId는 반드시 입력해야 합니다.
- 파라미터
	- server: 수집서버 주소
	- appKey: 앱키
	- version: 앱 버전
	- userId: 사용자 아이디
	- enableSyncStart : true인 경우 발생한 로그들은 startSendThread가 호출되기 전까지 서버에 전송하지 않고, 큐에 저장합니다. 단 Crash가 발생한 경우 ThreadLock을 해제하고 로그를 전송합니다.
- 반환값
	- userId: 사용자 아이디
	- 실패시 false

### SendThread 잠금 해제

```
		(void) startSendThread;
```

- SendThread의 잠금 상태를 해제합니다.

### Host 잠금 설정

```
	(void) enableHost;
```

- true  : ip address를 구하여 host 필드에 저장합니다.
- false : ip address를 구하지 않습니다.

### 로그 보내기

```
(void) debug:(NSString*)errorCode withMessage:(NSString*)message;
(void) error:(NSString*)errorCode withMessage:(NSString*)message;
(void) fatal:(NSString*)errorCode withMessage:(NSString*)message;
(void) info:(NSString*)errorCode withMessage:(NSString*)message;
(void) warn:(NSString*)errorCode withMessage:(NSString*)message;



(void) debug:(NSString*)errorCode withMessage:(NSString*)message atLocation:(NSString*)location;
(void) error:(NSString*)errorCode withMessage:(NSString*)message atLocation:(NSString*)location;
(void) fatal:(NSString*)errorCode withMessage:(NSString*)message atLocation:(NSString*)location;
(void) info:(NSString*)errorCode withMessage:(NSString*)message atLocation:(NSString*)location;
(void) warn:(NSString*)errorCode withMessage:(NSString*)message atLocation:(NSString*)location;
```

- 지정된 로그레벨로 수집서버에 로그를 보냅니다.
- 파라미터
	- errorCode: 에러코드
	- message: 로그 메세지
	- location: 에러 위치

### 커스텀 키 지정하기

```
(void) setCustomField:(NSString*)value forKey:(NSString*)key;
(void) removeAllCustomFields;
(void) removeCustomFieldForKey:(NSString*)key;
```

- 커스텀 키를 추가, 삭제, 전부 삭제 기능을 제공합니다.
- 커스텀 키로 "nil"을 설정하면 설정 값을 무시하고, 값에 "nil"을 설정하면 "-"로 설정합니다.
- 커스텀 키는 대소문자로 시작하고 대소문자, 숫자, '-', '\_'만 사용하실수 있습니다. (^[a-zA-Z][a-zA-Z0-9-_]\*$)
- 커스텀 키는 대소문자 관계없이 다음 이름은 사용하실 수 없습니다.
	- projectName, projectVersion, host, logType, logSource, sendTime, logTime, logLevel, UserID
	- Platform, DeviceModel, NetworkType, Carrier, CountryCode, DmpData, errorCode, Location, body, SessionID

### 중복 제거 모드 설정

2.4.0 이상 SDK 부터 일반 로그에 중복 제거 로직이 적용되었습니다.

중복 로그 기능이 켜져있는 경우 body와 logLevel의 내용이 같은 로그가 발생하면 전송하지 않습니다.

```
public static void setLogDeduplicate(bool enable)
```

true : (Default 값) 중복 제거 로직 활성화<br>
false : 중복 제거 로직 비활성화

### 기본 설정 관리

```
(void) setUserId:(NSString*)userId;
```

- 사용자 아이디를 설정 합니다.

```
(void) setLogType:(NSString*)logType;
```

- 로그 타입을 설정 합니다.

```
(void) setLogSource:(NSString*) logSource;
```

- 로그 소스를 설정 합니다.

## 자동수집되는 정보들

아래 정보들은 Log & Crash SDK에 의해 자동으로 수집되며, Log & Crash Search 에서 확인할 수 있습니다. 로그전송 시점에 정보수집이 불가능한 경우 값을 볼 수 없는 경우가 발생할 수 있습니다.  

- iOS
	\- Platform: iOS 버전 정보
	\- DeviceModel: 아이폰 모델 정보
	\- Carrier: 사용자의 텔레콤 서비스 제공자
	\- CountryCode: 사용자의 텔레콤 서비스 제공자의 ISO 국가 코드
	\- NetworkType: Wi-Fi 또는 Cellular (로그 전송이벤트 발생 시점에 네트워크 사용이 불가한 경우 "No Connection")
- Mac OS X
	\- Platform: Mac OS X 버전 정보
	\- NetworkType: Wi-Fi 또는 Cellular (로그 전송이벤트 발생 시점에 네트워크 사용이 불가한 경우 "No Connection")

## iOS Crash 해석하기
- iOS에서 발생한 Crash의 경우 Crash 정보가 주소 값으로 수집되기 때문에 이를 해석하기 위한 Symbol 파일이 필요합니다.

- Xcode를 실행하고 Windows > Organizer를 클릭합니다.

- 빌드한 결과물을 클릭한 뒤, 오른쪽 버튼을 클릭하여 Show in Finder로 클릭합니다.
![](http://static.toastoven.net/prod_logncrash/13.png)

- 결과물을 클릭하고 오른쪽 버튼을 눌러 '패키지 내용보기'를 클릭합니다.
![](http://static.toastoven.net/prod_logncrash/14.png)

- .dSYM을 .zip으로 압축하여 웹 콘솔 > Analytic > Log & Crash Search > Settings > 심볼 파일 탭에 등록합니다.

## iOS Unity Crash 주의 사항

- 심볼이 없어 해석되지 않은 Crash 로그는 일반 로그로 취급됩니다.