title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > Handled Exception Guide

Log & Crash - App Crash Search에서 제공하는 Handled exception에 대해서 설명합니다.
Handled Exception을 사용하기 위해서는 다음과 같은 SDK를 사용해야 합니다.

- Android SDK 1.2.1 이상
- Unity SDK 1.2.4 이상
- iOS/Mac은 지원하지 않습니다.

## 에러 타입

Log & Crash - App Crash Search는 다음과 같은 두가지 타입의 에러를 지원합니다.

- Crash  
	앱 구동 중 발생한 에러를 SDK가 자동으로 감지해 보내는 로그입니다.
- Handled Exception  
	Try & Catch로 수집된 로그입니다.  
	DEBUG/INFO/WARN/ERROR/FATAL 로그 레벨을 선택할 수 있습니다.  

## Handled Exception 사용법

### Android SDK

- 다음 ToastLog 메쏘드를 사용하여 발생한 에러를 전송합니다.

```
...
public static void fatal(String message, Throwable t)
public static void error(String message, Throwable t)
public static void warn(String message, Throwable t)
public static void info(String message, Throwable t)
public static void debug(String message, Throwable t)
...
```

- 다음 ToastLog 메쏘드를 사용하여 발생한 에러를 전송합니다.  
	DEBUG Handled 로그 전송하기

```
...
try {
...
} catch (Exception e) {
	ToastLog.debug(e.toString(), e);
}
...
```
첫번째 인자값인 message에는 임의의 String 을 입력할 수 있습니다. e.toString()로 지정하면 웹 환경에서 간략한 에러 메시지를 볼 수 있습니다.

### Unity3D SDK

- 다음 Toast.LogNCrash 메쏘드를 사용하여 발생한 에러를 전송합니다.

```
...
public static void SendFatal(string strMsg, Exception e)
public static void SendError(string strMsg, Exception e)
public static void SendWarn(string strMsg, Exception e)
public static void SendInfo(string strMsg, Exception e)
public static void SendDebug(string strMsg, Exception e)
...
```

- 사용법  
	INFO Handled 로그 전송하기

```
...
try {
	// Exception code
} catch(Exception e) {
	LogNCrash.SendInfo("handled exception message", e)
}
...
```

## 전송된 Handled Exception 확인

- <a href="https://console.cloud.toast.com" target="_blank">Toast Cloud - Console</a>에 접속합니다.
- 프로젝트를 선택하고, Analytics - Log & Crash Search - App Crash Search를 선택합니다.
- 현재 플랫폼을 Android로 확인하고, 에러 타입을 Handled로 선택합니다.
