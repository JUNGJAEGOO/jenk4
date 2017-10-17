title=About
date=2013-09-24
type=page
status=published
big=TCAnalytics
summary=L&CWindowDV's
~~~~~~
## Analytics > Log&Crash Search > Windows Developer's Guide

Log & Crash C++ Windows SDK는 Log & Crash Search 수집 서버에 로그를 보내는 기능을 제공합니다.  
Log & Crash C++ Windows SDK 특·장점은 다음과 같습니다.

- 로그를 수집 서버로 보냅니다.
- 앱에서 발생한 크래시 로그를 수집 서버로 보냅니다.
- Log & Crash Search 에서 전송된 로그를 조회 및 검색이 가능합니다.
- 멀티 쓰레딩 환경에서 동작합니다.

## 지원 환경

- Windows 2000, Windows Vista, Windows XP, Windows 2003, Windows 2008, Windows 7, Windows 8
- 32bit/64bit

## 다운로드

Toast Cloud에서 C++ Windows SDK를 받을 수 있습니다.

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [Windows SDK] 클릭
```

## 설치

### 구성

C++ Windows SDK는 다음과 같이 구성되어 있습니다.

```
docs/						; C++ Windows SDK 문서
include/					; C++ Windows SDK 사용 예
include/toast/logncrash.h	; C++ 해더 파일
windows-sdk/lib32/			; C++ Windows 32bit 라이브러리
windows-sdk/lib64/			; C++ Windows 64bit 라이브러리
windows-sdk-sample/			; VS 2010용 샘플 프로젝트
```

### SDK 샘플

같이 제공되는 windows-sdk-sample/에 대해 설명합니다.

1. Microsoft Visual Studio 2010을 실행하여 windows-sdk-sample/Sample.sln을 열어 줍니다.
2. Sample.cpp을 열어서 발급받은 앱키로 수정합니다.
3. 32bit/64bit와 Debug/Release에 따라 앱 실행에 필요한 \*.dll을 실행파일 디렉토리로 복사합니다
4. 실행합니다.

## 사용 예


1. include/toast/를 인클루드 패쓰에 넣어줍니다.
2. 32bit/64bit와 Debug/Release에 따라 다음과 같이 Import 라이브러리를 지정해 줍니다.
	- 32bit, Debug   ; lib32/liblogncrashD.lib
	- 32bit, Release ; lib32/liblogncrash.lib
	- 64bit, Debug   ; lib64/liblogncrashD.lib
	- 64bit, Release ; lib64/liblogncrash.lib
3. 앱 실행을 위해서 \*.dll을 실행 파일 디렉토리로 복사해 줍니다.
4. toast/logncrash.h 를 인클루드해 주고 ToastLog class를 사용합니다.

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
#define LOGNCRASH_COLLECTOR_ADDR  "api-logncrash.cloud.toast.com"
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
		- Log&Crash 수집서버 : api-logncrash.cloud.toast.com
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
- 커스텀 키는 대소문자로 시작하고 대소문자, 숫자, '-', '_'만 사용하실수 있습니다. ( [A-Za-z][A-Za-z0-9-_]* )
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

bool openCrashCatcher();
void closeCrashCatcher();

void setCrashCallback(const LogNCrashCallbackType cb, void* cbData = NULL);
```

- 크래시 처리를 시작하거나 종료합니다.

### 중복 제거 모드 설정

- 중복 로그 기능이 켜져 있는 경우 body 와 LogLevel 의 내용이 같은 로그가 발생하면 전송하지 않습니다.

```
public static void setDuplicate(bool enable)
```
- true : 중복 제거 로직 활성화 (Default 값)
- false : 중복 제거 로직 비활성화

### 기타 설정

```
const char* getUserId();

void setUserId(const char* userId);
```

- 사용자 ID를 구하거나 지정합니다.

## 심볼 파일 생성 가이드

### 개요
- Log&Crash Windows SDK 에서 발생한 Crash 를 해석하기 위해서는 심볼 파일을 생성하여 웹 콘솔에 업로드 해야 합니다.

### 필요 도구
- VS에 맞는 dump_syms을 사용합니다 ( VC_1500 = 2008, VC_1600 = 2010 )
- [VS 2008 이하 다운로드](https://github.com/zpao/v8monkey/blob/master/toolkit/crashreporter/tools/win32/dump_syms_vc1500.exe)
- [VS 2010 이상 다운로드](http://hg.mozilla.org/mozilla-central/file/tip/toolkit/crashreporter/tools/win32)
- [minidump_stackwalk.exe](http://hg.mozilla.org/build/tools/raw-file/755e58ebc9d4/breakpad/win32/minidump_stackwalk.exe)

### 심볼 파일 생성
- windows crash dumps 는 .pdb 파일을 .sym 심볼로 변환시켜 디버깅 정보를 얻을 수 있습니다.
- .pdb 파일을 .sym 파일로 변환 시키기 :
    - .pdb 파일을 생성합니다. ( 프로젝트 빌드 시 생성 )

    - dump_syms.exe를 다운로드 합니다.

    - 아래 예제와 같이 dump_syms을 실행하여 심볼 파일을 생성합니다.
    ( 에러가 발생하지 않았다면, 심볼 파일 생성에 성공한 것입니다. )
        - CoCreateInstance CLSID_DiaSource failed (msdia*.dll unregistered?)에러가 발생하였다면 c:\Program Files\Common Files\Microsoft Shared\VC\. 에 해당 dll을 복사 합니다.
        - regsvr32 명령을 통해 dll을 등록합니다.
        ```
        regsvr32 c:\Program Files\Common Files\Microsoft Shared\VC\msdia80.dll.
        ```

        - 0x80004005가 발생하였다면, 관리자 권한으로 재시도 합니다.
        ```
        'dump_syms {.pdb 파일} > {출력 파일}'
        'dump_syms Sample.pdb > Sample.sym'
        ```
        
        - 생성한 심볼 파일을 웹 콘솔에 업로드 합니다.
