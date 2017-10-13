title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > Linux Developer's Guide

Log & Crash C++ Linux SDK는 Log & Crash Search 수집 서버에 로그를 보내는 기능을 제공합니다.
Log & Crash C++ Linux SDK 특·장점은 다음과 같습니다.

- 로그를 수집 서버로 보냅니다.
- C++ Linux SDK는 크래서 로그를 수집하지 않습니다.
- Log & Crash Search 에서 전송된 로그를 조회 및 검색이 가능합니다.
- 멀티 쓰레딩 환경에서 동작합니다.

## 지원 환경

- Linux, glibc >= 2.0.0
- 32bit/64bit
- openssl >= 1.0.1e
- libcurl >= 7.19.7

## 다운로드

Toast Cloud에서 C++ Linux SDK를 받을 수 있습니다.

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [Linux SDK] 클릭
```

## 설치

### 구성

C++ Linux SDK는 다음과 같이 구성되어 있습니다.

```
...
docs/					; C++ Linux SDK 문서
include/toast/logncrash.h	; C++ 해더 파일
linux-sdk/lib32/			; C++ Linux 32bit 라이브러리
linux-sdk/lib64/			; C++ Linux 64bit 라이브러리
linux-sdk-sample/			; C++ Linux SDK 샘플
...
```

### SDK 샘플

같이 제공되는 linux-sdk-sample/에 대해서 설명합니다.

1. linux-sdk-sample/ 디렉토리로 이동합니다.
2. sample.cpp을 열어서 발급받은 앱키로 수정합니다.
3. make를 실행해서 sample-x86, sample-x86_64 실행 파일을 생성합니다.
	- 개별적으로 빌드하기 위해서는 make sample-x86, make sample-x86_64 명령어를 사용해 주세요.
	- x86, x86_64 빌드 환경에 대해서는 사용하시는 Linux 배포본 문서를 참고해 주세요.
4. 빌드된 실행 파일을 실행합니다.

## 사용 예

1. include/toast/를 인클루드 패쓰에 넣어줍니다.
2. 타겟에 따라 lib32/liblogncrash_linux.a 또는 lib64/liblogncrash_linux.a를 링크해 줍니다.
	- liblogncrash_linux.a는 내부적으로 pthread를 사용하고 있습니다. 따라서 -lpthread link option이 필요합니다.
3. toast/logncrash.h 를 인클루드해 주고 ToastLog class를 사용합니다.

```
...
 #include "toast/logncrash.h"
 ...

     ToastLog* log = GetToastLog();

     if (LOGNCRASH_LOG_OK != log->initialize(APP_KEY, VERSION, COLLECTOR_ADDR, COLLECTOR_PORT)) {
         fprintf(stderr, "ERROR in initialize()\n");
         return -1;
     }

     if (!log->info("info() TEST 1")) {
         fprintf(stderr, "ERROR in info()\n");
     }
     ...

     DestroyToastLog();
```

## API List

toast::logncrash::ToastLog class에서 제공하는 기능들을 설명합니다.

### ToastLog 인스턴스 할당/해제

```
toast::logncrash::ToastLog* GetToastLog();

void DestroyToastLog();
```

- ToastLog instance를 할당하고 해제합니다.
- 싱글톤 방식으로 하나의 인스턴스만 반환됩니다.
- 반환된 ToastLog instance에 대해서 delete를 하면 안됩니다. 제거하기 위해서는 반드시 DestroyToastLog()를 호출하셔야 합니다.

### 초기화/해제

```
#define LOGNCRASH_VERSION         "1.0.0"
#define LOGNCRASH_COLLECTOR_ADDR  "http://api-logncrash.cloud.toast.com"
#define LOGNCRASH_COLLECTOR_PORT  80
#ifdef WIN32
#define LOGNCRASH_LOGSOURCE       "logncrash-windows"
#else   //#ifdef WIN32
#define LOGNCRASH_LOGSOURCE       "logncrash-linux"
#endif  //#ifdef WIN32
#define LOGNCRASH_LOGTYPE         "logncrash-log"

#define LOGNCRASH_LOG_OK            0
#define LOGNCRASH_LOG_ERROR         -1
#define LOGNCRASH_LOG_ERROR_APPKEY  -2
#define LOGNCRASH_LOG_ERROR_VERSION -3
#define LOGNCRASH_LOG_ERROR_ADDRESS -4
#define LOGNCRASH_LOG_ERROR_PORT    -5

int32_t initialize(
    const char* appKey,
    const char* version = LOGNCRASH_VERSION,
    const char* collectorAddr = LOGNCRASH_COLLECTOR_ADDR,
    const uint16_t collectorPort = LOGNCRASH_COLLECTOR_PORT,
    const char* logSource = LOGNCRASH_LOGSOURCE,
    const char* logType = LOGNCRASH_LOGTYPE);

void destroy();
```

- ToastLog를 초기화하고 해제합니다.
- ToastLog 기능이 제대로 동작하기 위해서는 반드시 initialize()가 호출되어야 합니다.
- 파라미터
	- appKey : 앱키
	- version : 앱 버전
	- collectorAddr : 수집서버 주소
		- Log&Crash 수집서버 : http://api-logncrash.cloud.toast.com
	- collectorPort : 수집서버 포트
	- logSource : 로그 소스
	- logType : 로그 타입
- initialize() 반환값
	- LOGNCRASH_LOG_OK : 0, 초기화 성공
	- LOGNCRASH_LOG_ERROR : -1, 내부 에러 코드
	- LOGNCRASH_LOG_ERROR_APPKEY : -2, 앱키가 잘못된 경우
	- LOGNCRASH_LOG_ERROR_VERSION : -3, 버전이 잘못된 경우
	- LOGNCRASH_LOG_ERROR_ADDRESS : -4, 수집 서버 주소가 잘못된 경우
	- LOGNCRASH_LOG_ERROR_PORT : -5, 수집 서버 포트가 잘못된 경우

### 로그 보내기

```
bool sendLog(
    const LogNCrashLogLevel logLevel,
    const char* message,
    const char* errorCode = NULL,
    const char* location = NULL);
```

- 지정된 logLevel로 로그를 보냅니다.
- 파라미터
	- logLevel : 전송할 logLevel. setLogLevel()로 지정된 logLevel보다 큰 logLevel은 전송이 안됩니다.
	- message : 전송할 메시지
	- errorCode : 에러 코드. NULL이나 ""을 쓰면 전송되지 않습니다.
	- location : 에러 위치. NULL이나 ""을 쓰면 전송되지 않습니다.
- 반환값
	- 성공시 true
	- logLevel이 크거나, message가 비어있는 경우 false
- 참고
	- setLogLevel(), getLogLevel();

```
bool debug(const char* message, const char* errorCode = NULL, const char* location = NULL);

bool info(const char* message, const char* errorCode = NULL, const char* location = NULL);

bool warn(const char* message, const char* errorCode = NULL, const char* location = NULL);

bool error(const char* message, const char* errorCode = NULL, const char* location = NULL);

bool fatal(const char* message, const char* errorCode = NULL, const char* location = NULL);
```

- 정해진 DEBUG, INFO, WARN, ERROR, FATAL 로그를 보냅니다.
- logLevel이 고정되어 있다는 점 이외에는 sendLog()와 같습니다.
- 반환값
	- 성공시 true
	- logLevel이 크거나, message가 비어있는 경우 false

### 로그 레벨 지정하기

```
typedef enum {
    LOGNCRASH_FATAL   = 0,
    LOGNCRASH_ERROR   = 3,
    LOGNCRASH_WARN    = 4,
    LOGNCRASH_INFO    = 5,
    LOGNCRASH_DEBUG   = 7,
    LOGNCRASH_TRACE   = LOGNCRASH_DEBUG,
} LogNCrashLogLevel;

LogNCrashLogLevel getLogLevel();

void setLogLevel(const LogNCrashLogLevel logLevel);
```

- ToastLog instance의 logLevel을 구하거나 지정합니다.
- ToastLog 기본값은 LOGNCRASH_INFO입니다. 따라서 debug() 함수를 사용하시려면 setLogLevel(LOGNCRASH_DEBUG)로 설정해주셔야 합니다.

### 커스텀 키 지정하기

```
bool addCustomKey(const char* key, const char* value);

void removeCustomKey(const char* key);

void clearCustomKeys();
```

- 커스텀 키를 추가, 삭제, 전부 삭제 기능을 제공합니다.
- 커스텀 키는 대소문자로 시작하고 대소문자, 숫자, '-', '\_'만 사용하실수 있습니다. ( [A-Za-z][A-Za-z0-9-_]* )
- 커스텀 키는 최대 64 문자입니다.
- 커스텀 키에 대소문자 관계없이 다음 이름은 사용하실 수 없습니다.
	- projectname, projectversion, host, body, logsource, logtype
	- logType, sendTime, logLevel, userId, platform
	- dmpdata, dmpreport
- addCustomKey() 반환값
	- 성공시 true
	- key 형식이 맞지 않으면 추가 실패시 false

### 크래시 처리하기

```
typedef enum {
    LOGNCRASH_LANG_DEFAULT     = 0,
    LOGNCRASH_LANG_ENGLISH     = 1,
    LOGNCRASH_LANG_KOREAN      = 2,
    LOGNCRASH_LANG_JAPANESE    = 3,
    LOGNCRASH_LANG_CHINESE     = 4,
    LOGNCRASH_LANG_CHINESE_TRADITIONAL = 5,
    LOGNCRASH_LANG_CHINESE_SIMPLIFIED  = LOGNCRASH_LANG_CHINESE,
} LogNCrashLangType;

#ifdef WIN32
typedef void (__cdecl *LogNCrashCallbackType)(void *data);
#else   //#ifdef WIN32
typedef void (*LogNCrashCallbackType)(void *data);
#endif  //#ifdef WIN32

bool openCrashCatcher(const bool bBackground = false, const LogNCrashLangType langType = LOGNCRASH_LANG_DEFAULT);
void closeCrashCatcher();

void setCrashCallback(const LogNCrashCallbackType cb, void* cbData = NULL);
```

- Linux SDK는 크래시 로그 수집을 하지 않습니다.
- openCrashCatcher 반환값
	- 항상 false

### 기타 설정

```
const char* getUserId();

void setUserId(const char* userId);
```

- 사용자 ID를 구하거나 지정합니다.

```
void enableHostField();

void disableHostField();
```

- Host 필드를 활성화하거나 비활성화합니다.

```
void enablePlatformField();

void disablePlatformField();
```

- Platform 필드를 활성화하거나 비활성화합니다.
