title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > C# Developer's Guide

Log & Crash C# Windows SDK는 Log & Crash Search 수집 서버에 로그를 보내는 기능을 제공합니다.
Log & Crash C# Windows SDK 특·장점은 다음과 같습니다.

- C# Windows SDK는 C++ Windows SDK를 기반으로 작성되었습니다.
- 로그를 수집 서버로 보냅니다.
- 앱에서 발생한 크래시 로그를 수집 서버로 보냅니다.
- Log & Crash Search 에서 전송된 로그를 조회 및 검색이 가능합니다.
- 멀티 쓰레딩 환경에서 동작합니다.

## 지원 환경

- .NET Framework 4 이상
- 32bit/64bit

## 다운로드

Toast Cloud에서 C# Windows SDK를 받을 수 있습니다.

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [C# SDK] 클릭
```

## 설치

### 구성

C# Windows SDK는 다음과 같이 구성되어 있습니다.

```
docs\                                   ; C# Windows SDK 문서
csharp-sdk\lib\liblogncrash_csharp.dll  ; C# Windows 라이브러리
csharp-sdk\lib32\*                      ; C++ Windows 32bit 라이브러리
csharp-sdk\lib64\*                      ; C++ Windows 64bit 라이브러리
csharp-sdk-sample\                      ; VS 2010용 샘플 프로젝트
```

### SDK 샘플

같이 제공되는 csharp-sdk-sample/에 대해 설명합니다.

1. csharp-sdk\lib32\* 파일들을 csharp-sdk-sample\Sample\bin\Debug, csharp-sdk-sample\Sample\bin\Release에 복사해 줍니다.
2. csharp-sdk\lib64\* 파일들을 csharp-sdk-sample\Sample\bin\x64\Debug, csharp-sdk-sample\Sample\bin\x64\Release에 복사해 줍니다.
3. Microsoft Visual Studio 2010을 실행해서 csharp-sdk-sample\ 에 들어있는 Sample.sln을 불러 옵니다.
4. Program.cs를 열고 발급받은 앱키로 수정합니다.
5. References에 liblogncrash_csharp이 들어 있는지 확인합니다. 없으면 csharp-sdk\lib\liblogncrash_csharp.dll을 추가해 주세요.
6. 상황에 따라 Debug/Release와 x86/x64를 조절하고 실행해 줍니다.

## 사용 예

1. C# 프로젝트에 References에 csharp-sdk/lib/logncrash_csharp.dll을 추가합니다.
2. C# 프로젝트 32bit/64bit 설정에 따라 lib32/lib64 내용을 실행파일 디렉토리로 복사합니다.
3. using Toast.LogNCrash;를 추가해 주고, 다음과 같이 ToastLog class를 사용합니다.

```
...
 using Toast.LogNCrash;

 ...
     if (ToastLog.LOG_OK != ToastLog.Initialize(APP_KEY, VERSION))
     {
         Console.WriteLine("FAIL TO initialize()");
         return;
     }

     if (!ToastLog.SendInfo("info() test 1 without host and platform field"))
     {
         Console.WriteLine("fail to info() test 1");
     }

     ToastLog.Destroy();
 ...
```

## API List

Toast.LogNCrash.ToastLog class에서 제공하는 기능들을 설명합니다.

### 초기화/해제

```
public const string VERSION = "1.0.0";
public const string COLLECTOR_ADDR = "api-logncrash.cloud.toast.com";
public const UInt16 COLLECTOR_PORT = 80;
public const string LOGSOURCE = "logncrash-csharp";
public const string LOGTYPE = "logncrash-log";

public const int LOG_OK = 0;
public const int LOG_ERROR = -1;
public const int LOG_ERROR_APPKEY = -2;
public const int LOG_ERROR_VERSION = -3;
public const int LOG_ERROR_ADDRESS = -4;
public const int LOG_ERROR_PORT = -5;

public static int Initialize(string appKey,
    string version = VERSION,
    string collectorAddr = COLLECTOR_ADDR,
    UInt16 collectorPort = COLLECTOR_PORT,
    string logSource = LOGSOURCE,
    string logType = LOGTYPE);

public static void Destroy();
```

- 초기화 및 해제를 수행합니다.
- 처음 사용시 반드시 ToastLog.Initialize()를 호출해 주고, 종료시 ToastLog.Destroy()를 호출해 주어야 합니다.
- ToastLog.Initialize() 파라미터
	- appKey : 앱키
	- version : 앱 버전. 기본값으로 VERSION이 사용됩니다.
	- collectorAddr : 수집 서버 주소. 기본값으로 COLLECTOR_ADDR가 사용됩니다.
	- collectorPort : 수집 서버 포트. 기본값으로 COLLECTOR_PORT가 사용됩니다.
	- logSource : 로그 소스. 기본값으로 LOGSOURCE가 사용됩니다.
	- logType : 로그 타입. 기본값으로 LOGTYPE이 사용됩니다.
- ToastLog.Initialize() 반환값
	- LOG_OK : 0, 초기화 성공
	- LOG_ERROR : -1, 내부 에러 코드
	- LOG_ERROR_APPKEY : -2, 앱키가 잘못된 경우
	- LOG_ERROR_VERSION : -3, 버전이 잘못된 경우
	- LOG_ERROR_ADDRESS : -4, 수집 서버 주소가 잘못된 경우
	- LOG_ERROR_PORT : -5, 수집 서버 포트가 잘못된 경우

### 로그 보내기

```
public static bool SendLog(LogLevel logLevel,
    string message,
    string errorCode = null,
    string location = null);
```

- 지정된 logLevel로 로그를 보냅니다.
- 파라미터
	- logLevel : 전송할 logLevel. SetLogLevel()로 지정된 logLevel보다 큰 logLevel은 전송이 안됩니다.
	- message : 전송할 메시지
    - errorCode : 에러 코드. null이나 ""을 쓰면 전송되지 않습니다.
	- location : 에러 위치. null이나 ""을 쓰면 전송되지 않습니다.
- 반환값
	- 성공시 true
	- logLevel이 크거나, message가 비어있는 경우 false
- 참고
	- SetLogLevel(), GetLogLevel();

```
public static bool SendDebug(string message, string errorCode = null, string location = null);

public static bool SendInfo(string message, string errorCode = null, string location = null);

public static bool SendWarn(string message, string errorCode = null, string location = null);

public static bool SendError(string message, string errorCode = null, string location = null);

public static bool SendFatal(string message, string errorCode = null, string location = null);
```

- 정해진 DEBUG, INFO, WARN, ERROR, FATAL 로그를 보냅니다.
- logLevel이 고정되어 있다는 점 이외에는 SendLog()와 같습니다.
- 반환값
	- 성공시 true
	- logLevel이 크거나, message가 비어있는 경우 false

### 로그 레벨 지정하기

```
public enum LogLevel
{
    FATAL = 0,
    ERROR = 3,
    WARN = 4,
    INFO = 5,
    DEBUG = 7,
    TRACE = DEBUG,
};

public static LogLevel GetLogLevel();

public static void SetLogLevel(LogLevel logLevel);
```

- ToastLog의 logLevel을 구하거나 지정합니다.
- ToastLog 기본값은 INFO입니다. 따라서 SendDebug() 함수를 사용하시려면 SetLogLevel(DEBUG)로 설정해주셔야 합니다.

### 커스텀 키 지정하기

```
public static bool AddCustomKey(string key, string value)

public static void RemoveCustomKey(string key)

public static void ClearCustomKeys()
```

- 커스텀 키를 추가, 삭제, 전부 삭제 기능을 제공합니다.
- 커스텀 키 형태는 대소문자로 시작해서 대소문자, 숫자, '-', '_' 만 사용할 수 있습니다. ( [A-Za-z][A-Za-z0-9-_]* )
- 커스텀 키의 최대 길이는 64 문자입니다.
- 커스텀 키에 대소문자 관계없이 다음 이름은 사용하실 수 없습니다.
	- projectname, projectversion, host, body, logsource, logtype
	- logType, sendTime, logLevel, userId, platform
	- dmpdata, dmpreport
- AddCustomKey() 반환값
	- 성공시 true
	- key 형식이 맞지 않으면 추가 실패시 false

### 크래시 처리하기

```
public enum LangType
{
    LANG_DEFAULT = 0,
    LANG_ENGLISH = 1,
    LANG_KOREAN = 2,
    LANG_JAPANESE = 3,
    LANG_CHINESE = 4,
    LANG_CHINESE_TRADITIONAL = 5,
    LANG_CHINESE_SIMPLIFIED = LANG_CHINESE,
};

public static bool OpenCrashCatcher(bool bBackground, LangType langType)

public static void CloseCrashCatcher()
```

- 크래시 처리를 시작하거나 종료합니다.

### 중복 제거 모드 설정
중복 로그 기능이 켜져있는 경우 body와 logLevel의 내용이 같은 로그가 발생하면 전송하지 않습니다.

```
	public static void setDuplicate(bool enable)
```

true :  중복 제거 로직 활성화 (Default 값 )

false : 중복 제거 로직 비활성화

### 기타 설정

```
public static string GetUserId()

public static void SetUserId(string userId)
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
