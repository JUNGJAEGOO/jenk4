title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > Unity Developer's Guide

Log & Crash Unity SDK는 Log & Crash Search 수집 서버에 로그를 보내는 기능을 제공합니다.  
Log & Crash Unity SDK 특·장점은 다음과 같습니다.

- 로그를 수집 서버로 보냅니다.
- 앱에서 발생한 크래시 로그를 수집 서버로 보냅니다.
- Log & Crash Search 에서 전송된 로그를 조회 및 검색이 가능합니다.

## 지원 환경

- 공통
	\- Unity3D v4.0 이상
- iOS
	\- An Intel-based Mac
	\- Mac OS X "Snow Leopard" 10.6 이상
	\- Xcode 6.0 or later
- Android
	\- Android API 2.3.1
	\- ARMv7 (Cortex family) CPU 단말

## 다운로드

Toast Cloud에서 Unity SDK를 받을 수 있습니다.

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [Unity SDK]
```

## 설치

![](http://static.toastoven.net/prod_logncrash/image019.png)

다운받은 Log & Crash Unity3D SDK.unitypackage을 더블클릭하여 해당 프로젝트에 Import합니다.

![](http://static.toastoven.net/prod_logncrash/image020.png)

Import에 성공하면 다음과 같은 폴더 트리가 생성됩니다.

![](http://static.toastoven.net/prod_logncrash/image021.png)

이후 메뉴바에서 LogNCrash> Edit Settings를 선택하여 AssetDatabase를 생성합니다.

### 샘플 설명

샘플의 실행은 Assets > LogNCrash > Sample > SampleScene을 더블클릭하여 실행합니다.  
샘플에는 초기화, 로그 전송, 에러 발생에 대한 예제가 기술되어 있습니다.

## 사용 예제

![](http://static.toastoven.net/prod_logncrash/image022.png)

AssetDatabase가 생성이 되면 로그 수집 서버의 Appkey, URL을 입력하고 해당 프로젝트의 식별의 위하여 version을 입력합니다.  
이후 SampleScript를 생성하여 Toast.LogNCrash 네임스페이스를 추가한 뒤, Start() 함수에서LogNCrash.Initialize() 함수를 호출합니다.  

```
using Toast.LogNCrash;
namespace Toast.LogNCrash
{
    public class SampleScript : MonoBehaviour
    {
        void Start ()
        {
            LogNCrash.Initialize ();
        }
    }
}
```

## 상세 API

### 초기화

```
public static Result Initialize();
public static void Destroy()
```

- 초기화에 필요한 값은 Toast>LogNCrash>Setting>Resources>LogNCrashSettings.asset 의 값을 참조합니다.
	- appkey: 사용자 앱키
	- url: 로그 수집 서버 주소
	- version: 프로젝트 버전 정보

### 커스텀 필드 지정하기

```
public static void AddCustomField(string key, string val)
public static void RemoveCustomField(string key)
public static void RemoveAllCustomFields()
```

- Parameters
	- key: string
		- [in] custom field의 key, custom key는 “A~Z, a~z, 0~9, - \_” 문자를 포함하며 반드시 알파벳이나 숫자로 시작해야 합니다.
	- value: string
		- [in] custom field의 값
- Note
	- 다음 keyword는 SDK에서 사용 중이므로 사용 할 수 없습니다.
		- projectName
        - projectVersion
        - host
        - body
        - logLevel
        - userID
        - Platform
        - DmpData
        - Unity3D
        - Locale
        - CountryCode
        - SessionID
        - ExceptionType
        - NeloSDK
        - NetworkType
        - DeviceModel
        - @logType
	- custom filed의 값이 NULL이나 비어있는 경우, SDKs 는 해당 필드를 server로 전송 하지 않습니다.

### 기본 설정 관리

```
public static void SetLogSource(string value)
public static string GetLogSource()
```

- 로그소스를 구하거나 새로 지정합니다.

```
public static void SetLogType(string value)
public static string GetLogType()
```

- 로그타입을 구하거나 새로 지정합니다.

### 로그 전송

```
//send info log message
public static void SendInfo(string strMsg)

//send debug log message
public static void SendDebug(string strMsg)

//send warn log message
public static void SendWarn(string strMsg)

//send fatal log message
public static void SendFatal(string strMsg)

//send error log message
public static void SendError(string strMsg)
```

- Parameters
	- strMsg: string
		- [in] 전송할 log 메세지

### Handled Exception

```
//send Handled info log message
public static void SendInfo(string strMsg, Exception e)

//send Handled debug log message
public static void SendDebug(string strMsg, Exception e)

//send Handled warn log message
public static void SendWarn(string strMsg, Exception e)

//send Handled fatal log message
public static void SendFatal(string strMsg, Exception e)

//send Handled error log message
public static void SendError(string strMsg, Exception e)
```

```
 try{
    // Exception code
}catch(Exception e){
    LogNCrash.SendInfo("handled exception message", e)
}
```

- try&catch에서 발생한 Exception을 전송합니다.

### 유저 아이디 설정

```
public static void SetUserId(string userID)
public static string GetUserID()
```

- Parameter
	- userID: string
		- [in] 각 사용자를 구분할 user id

### 중복 제거 모드 설정

2.4.0 이상 SDK 부터 일반 로그에 중복 제거 로직이 적용되었습니다. 초기화 시 중복 제거 로직이 활성화됩니다.

일반 로그의 경우 body와 logLevel이 같은 로그가 발생한 경우 전송하지 않습니다.

크래시 로그의 경우 stackTrace와 condition 값이 같은 로그가 발생한 경우 전송하지 않습니다.

원하지 않는 경우 초기화 이후, 아래 함수를 통해 기능을 비활성화시킬 수 있습니다.

```
public static void SetDeduplicate(bool flag)
```

true :(Default 값) 중복 제거 로직 활성화<br>
false :  중복 제거 로직 비활성화

## iOS build 하기

1.File->Build Settings 클릭.

![](http://static.toastoven.net/prod_logncrash/image023.png)

![](http://static.toastoven.net/prod_logncrash/image024.png)

- iOS Platform를 선택 한 뒤 Player Settings 클릭합니다.

![](http://static.toastoven.net/prod_logncrash/image025.png)

- Target iOS Version를 설정하고, Simulator를 사용하는 경우 SDK Version에서 Simulator SDK를, device를 사용하는 경우 Device SDK를 선택하고 Build settings의 Build 버튼을 클릭합니다.

2.Build된 프로젝트가 저장될 경로를 선택 하고 Save를 선택하면 Unity에서 Xcode project를 생성합니다.

![](http://static.toastoven.net/prod_logncrash/image026.png)

![](http://static.toastoven.net/prod_logncrash/image027.png)

3.생성된 Xcode project를 Xcode에서 엽니다.

## Android Build 하기

1.File->Build Settings 클릭합니다.

![](http://static.toastoven.net/prod_logncrash/image023.png)

![](http://static.toastoven.net/prod_logncrash/image028.png)

- Android Platform 선택 한 뒤 Player Settings 클릭합니다.

![](http://static.toastoven.net/prod_logncrash/image029.png)

- Internet Access는 Require, Write Access는 External(SDCard)로 설정합니다.

2.Build settings에서 Build And Run 클릭합니다.

## iOS에서 ATS(App transport Security)추가 하기
- ATS는 iOS9,OS X 10.11에서 도입된 앱과 네트워크 간의 안전한 통신을 보장하기 위한 기능으로 안전하게 암호화된 https통신만 허용하고 안전하지 않는 수준의 https/http  통신을 차단하는 기능로, Log&Crash Search 에서는 http 프로토콜을 사용하여 통신을 시도중으로 info.plist에 아래와 같은 설정을 추가하셔야 합니다.

자세한 설정은 아래 링크를 참고하세요

- https://developer.apple.com/library/ios/releasenotes/General/WhatsNewIniOS/Articles/iOS9.html

1. 전체 http를 허용하는 방법
```
<key> NSAppTransportSecurity </key>
<dict>
    <key> NSAllowsArbitraryLoads </key>
   <true />
</dict>
```

2. 특정 도메인을 허용하는 방법
```
<key> NSAppTransportSecurity </key>
<dict>
    <key> NSExceptionDomains </key>
    <dict>
           <key> api-logncrash.cloud.toast.com </key>
            <dict>
		 <key>NSTemporaryExceptionAllowsInsecureHttpLoads </key>
		 <true />
	    </dict>

	   <key> setting-logncrash.cloud.toast.com </key>
            <dict>
		 <key>NSTemporaryExceptionAllowsInsecureHttpLoads </key>
		 <true />
	    </dict>

    </dict>
</dict>
```

## iOS Native Crash 해석 하기
- Unity iOS의 Crash 는 Unity Engine에서 발생하는 Crash와 iOS native 에서 발생하는 Crash로 구분됩니다.
- Native Crash를 해석하기 위해서는 output 파일의 .DSYM을 .zip으로 압축하여 웹 콘솔 > Analytic > Log & Crash Search > Settings > 심볼 파일탭에 등록 해야 합니다.

## Android Proguard 적용
- Unity iOS의 Crash는 Unity Engine에서 발생하는 Crash와 Android Naitve에서 발생하는 Crash, 외부 라이브러리에서 발생한 Crash로 구분됩니다.
- Android Proguard가 적용된 프로젝트의 경우, Native 레벨의 Crash 해석를 위하기 위해서는 mapping.txt 파일을 웹 콘솔 > Analytic > Log & Crash Search > Settings > 심볼 파일 탭에 등록해야 합니다.
