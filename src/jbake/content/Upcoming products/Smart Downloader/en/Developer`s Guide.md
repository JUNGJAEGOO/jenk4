title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Upcoming Products > Smart Downloader > Developer's Guide

## Smart Downloader Publisher

우선 Smart Downloader ClientSDK를 사용하기 전에 Smart Downloader ClientSDK가 다운로드를 수행할 원본 서버 및 CDN이 준비되어 있어야 한다. 그리고 해당 CDN에 DLCPublisher를 통해 생성된 게임데이터의 개별압축본과 메타파일이 존재해야 한다.
DLCPublisher는 하나의 실행파일(윈도우즈 용 exe)로 제공되며 게임데이터의 폴더 트리 구조 그대로 개별 압축파일을 같은 폴더 트리 구조로 만들어내며, 
해당 폴더 내에 파일이름, 파일 사이즈, 파일 압축사이즈, 파일 버전(추후 사용 예정), 파일 체크섬을 json 형태로 나열하는 메타파일을 만들어낸다.

## Smart DownloaderPublisher 사용방법

아래와 같은 게임 데이터를 다운로드 받을 폴더 구조라고 가정하자.

![](http://static.toastoven.net/prod_smartdownloader/img_06.png)

해당 폴더의 위치에서 윈도우 커맨드 라인 명령 프로그램을 수행한다. Smart Downloader Publisher는 총 네 가지 실행 옵션을 제공한다.

| 실행 옵션 | 설명 |
|--------|-------|
| --projectName(필수) | 현재 지정하려는 게임 프로젝트 이름을 지정하면 되나, 위의 그림에서 가장 상위 폴더 이름이랑 같아야 한다. |
| --inputDir(선택) | 위의 게임 데이터 폴더 위치를 지정할 수 있다. 지정되지 않으면 DLCPublisher.exe와 같은 레벨의 projectName을 지정해서 수행한다. |
| --outputFile(선택) | output으로 나오는 메타파일의 path & name을 지정할 수 있다. 지정하지 않으면 default는 metafile.json으로 DLCPublisher.exe와 같은 레벨에 위치하게 된다. |
| --threadCount(필수) | 실제 Smart Downloader ClientSDK가 몇 개의 스레드로 게임 데이터를 다운로드 받을지 지정한다. 1이상의 값을 반드시 지정해야 한다. |

예제에서는 DLCPublisher.exe와 게임데이터 폴더를 같은 레벨에 위치시키고 수행하도록 한다.

![](http://static.toastoven.net/prod_smartdownloader/img_07.png)

위와 같이 실행을 시키면 (--inputDir, --outputFile option지정 없이 수행)DLCPublisher.exe와 같은 레벨에 metafile.json이라는 메타파일이 생기게 되고,
같은 레벨에 OUTPUT 폴더 아래에 --projectName으로 지정했던 DLCTest 이름의 폴더가 생성되고, 그 폴더에 원본 폴더와 같은 트리구조대로 폴더가 생성되며,
각 폴더에는 원본 파일들이 zip 압축된 형태로 저장이 된다.

메타파일의 내용은 다음과 같이 저장된다. (위의 예제는 약 50개의 파일이지만, 필요한 부분만 보여주기 위해 일부 생략되었다. )
```
{
    // 메타파일의 헤더 영역
  "projectName":"DLCTest",          // projectName으로 지정되었던 이름
  "pubdate":"20161224111450",       // publisher를 실행한 시간 yyyyMMddhhmmss 포맷
  "checksum_algorithm":"CRC32",     // checksum alogorithm(현재는 CRC32로만 지원)
  "threadCount": 2,                 // publisher 수행시 지정한 threadCount
  "install":                        // 설치해야 하는 데이터들을 json list로 기술
  [
    {
      "rootpath":"/dlc_Data/Mono/etc/mono/1.0", // projectName/{rootpath} 폴더의 내용 파일 리스트
      "fileInfo":
      [
        
        {
          "filename":"DefaultWsdlHelpGenerator.aspx",   // projectName/{rootpath}/{filename}
          "filesize": 58196,                            // 해당 파일의 원본 사이즈
          "filecompsize": 13757,                        // 해당 파일의 압축 후 사이즈
          "fileversion":"1.0.0",                        // 해당 파일 버전(추후 사용 예정 필드)
          "filechecksum": 283645119                     // 해당 파일의 체크섬 값
        },
        
        {
          "filename":"machine.config",
          "filesize": 17259,
          "filecompsize": 3166,
          "fileversion":"1.0.0",
          "filechecksum": -2098090613
        }
      ]
    },
    
    ...
    {중간 생략}
    ...
    {
      "rootpath":"/dlc_Data/Mono/etc"                   // projectName/{rootpath} : 해당 path엔 파일이 없음을 알려줌
    },
    
    {
      "rootpath":"/",                                   // projectName/ 바로 root directory밑에 존재하는 파일 내용
      "fileInfo":
      [
        
        {
          "filename":"dlc.exe",
          "filesize": 3942664,
          "filecompsize": 3626646,
          "fileversion":"1.0.0",
          "filechecksum": 1341607661
        },
        
        {
          "filename":"upoker_version.dat",
          "filesize": 20,
          "filecompsize": 156,
          "fileversion":"1.0.0",
          "filechecksum": 1426730067
        }
      ]
    }
  ]
}

```

## Smart Downloader Client SDK

Smart Downloader ClientSDK는 현재 Unity Version으로 개발이 되어 있으며, iOS / Android / Windows / MacOS 플랫폼을 지원하고 있다.

### **Smart Downloader Client SDK API**

Smart Downloader Client SDK API는 모두 static version으로 호출할 수 있다. 그리고 Toast.SmartDL 이하의 namespace를 사용하므로 using으로 미리 선언해두는 것을 권장한다.

1. 우선, Smart Downloader의 초기화 과정을 수행하기 위한 Initialize API를 호출해주어야 한다. Awake나 Start 함수 내에서 사용해준다.

[Usage]

```
// Awake 또는 Start 함수내에서 사용해준다.
public void Awake()
{
    SmartDLUnitySkin.Initialize();
}
```

2. SmartDLSkin 초기화가 되었으면 **Getting Started**에서 상품이용시에 받은 AppKey를 setting해주는 단계가 필요하다. AppKey를 setting후에 API를 사용가능하다. 
AppKey setting이 완료되었으면 Download를 시작하는 API인 StartDownload를 사용할 수 있다. 이 API를 호출하면 Download가 시작이 되고, 네 번째 parameter로 넘긴 delegate 콜백함수로 결과가 리턴이 된다.
리턴되는 SmartDLResult 객체 값으로 결과 값, 메세지 등을 확인해서 결과 처리를 할 수 있다. 그리고, 다운로드가 시작된 이후에 다운로드 진행 정보를 가져와 직접 progress bar형태로 사용자에게 진행 상태를 보여줘야 한다.
이 때 사용할 수 있는 GetProgressInfo라는 API가 있다. GetProgressInfo API를 통해 SmartDLProgressInfo 객체를 리턴받고 이 객체의 정보들로 진행상태를 표시할 수 있다.

[Usage]

```
private void StartDownloadCallback(SmartDLResult result)
{
    // SmartDLResult 값으로 결과 값 출력 및 실패 시 에러코드 출력 가능
    var code = result.ResultCode;
    var message = result.ResultString;
}

public void StartDownload()
{
    SmartDLUnitySkin.SetAppKey("appKey");

    string cdnUrl = "http://example.com";
    string metafileName = "metafile.json";
    string targetPath = "D:\DLCDownloads";                 // 플랫폼별로 다르게 지정(예제에서는 윈도우 파일 시스템으로 지정)

    SmartDLUnitySkin.StartDownloadCallback callback = StartDownloadCallback;
    SmartDLUnitySkin.StartDownload(cdnUrl, metafileName, targetPath, callback);
    // GetProgressInfo는 API 호출 시점에 다운로드 진행 정보를 리턴하기 때문에 사용자가 지정한 타임 간격(매 프레임이나 매 초)마다 호출해주어야 한다.
    // 그러기 위해서 보통 Unity에서 사용하기 편하게 Coroutine을 제공해서 해당 함수를 사용해서 구현할 수 있다.
    StartCoroutine(UpdateDownloadInfo());
}

private IEnumerator UpdateDownloadInfo()
{
    while (true)
    {
        SmartDLProgressInfo progressInfo = SmartDLUnitySkin.GetProgressInfo();

        var fileMapCount = progressInfo.fileMap.Count;
        for (int i = 0; i < fileMapCount; i++)
        {
            SmartDLFileStreamInfo info = progressInfo.FileMap[i];
            
            // 각 thread number
            var threadNum = i;                                                                  
            // 각 thread에서 다운로드 받고 있는 파일 이름
            var downloadFileName = info.FileName;                                               
            // 각 thread에서 다운로드 받은 진행율
            var threadPercentage = ((float)info.DownloadedBytes / info.TotalBytes) * 100.0f;    
            // 현재 다운로드 받는 파일의 seqNumber
            var fileNumber = info.FileNubmer;                                                   
        }

        // 전체 다운로드 진행율
        var percentage = progressInfo.Percentage;                   
        // 현재까지 다운로드 받은 용량(bytes)
        var totalReceivedBytes = progressInfo.TotalReceivedBytes;   
        // 전체 다운로드 받아야 할 용량(bytes)
        var totalFileBytes = progressInfo.TotalFileBytes;           
        // 현재까지 받은 다운로드 용량 대비 속도(bytes/sec로 계산해서 리턴)
        var downloadSpeed = progressInfo.Speed;                     
        // 전체 다운로드 받아야 할 총 파일 개수
        var totalFileNumber = progressInfo.TotalFileNumber;         

        yield return new WaitForEndOfFrame();
    }
}
```

GetProgressInfo API의 경우 위의 예제 코드에 나열된 모든 정보를 리턴하고 있다. 필요한 정보들을 골라서 사용할 수 있다.

3. 사용자의 요구나 모바일의 환경인 경우 백그라운드로 앱이 전환될 경우 Download를 잠시 멈추고 싶을때 사용하는 StopDownload API가 있다.

[Usage]

```
SmartDLUnitySkin.StopDownload();

```

### **Smart Downloader Error Code**

다음은 Smart Downloader Error Code에 대한 값 및 설명이다.

```
public enum DLCErrorCode
{
    DLC_ERR_OK = 0,
    DLC_ERR_CANCEL = 1,
    DLC_ERR_NO_DIFF = 2,
    DLC_ERR_APP_KEY_AUTH_FAILED = 3,
    DLC_ERR_METAFILE_PARSE_ERROR = 4,
    DLC_ERR_FILE_INITIALIZE = 5,
    DLC_ERR_FILE_READ = 6,
    DLC_ERR_FILE_WRITE = 7,
    DLC_ERR_UNZIP_FAILED = 8,
    DLC_ERR_THREAD_VANISHED = 9,
    DLC_ERR_INTERNET_CONNECT = 10,
    DLC_ERR_SOCKET_CLOSED = 11,
    DLC_ERR_SOCKET_CONNECT_FAILED = 12,
    DLC_ERR_SOCKET_TIMEOUT = 13
}
```

| 에러코드 | 설명 |
|--------|-------|
| DLC_ERR_OK | 다운로드가 성공적으로 끝난 후 리턴하는 값이다. |
| DLC_ERR_CANCEL | 추후 사용 예정 |
| DLC_ERR_NO_DIFF | 이미 리소스를 다운로드 받은 후에 다시 다운로드 시에 로컬 파일과 CDN의 파일들이 변한 것이 없을때 리턴하는 값이다. 이 값도 성공으로 간주하고 구현을 진행하면 된다.  |
| DLC_ERR_APP_KEY_AUTH_FAILED | DLC 상품 이용시에 할당 받은 appkey로 상품 인증을 하는데, 그 인증이 실패 했을 때 리턴하는 값이다. |
| DLC_ERR_METAFILE_PARSE_ERROR | CDN에서 메타파일 데이터를 읽어온 후에 파싱을 해야 하는데 해당 파싱이 실패 했을 때 리턴하는 값이다. |
| DLC_ERR_FILE_INITIALIZE | 추후 사용 예정 |
| DLC_ERR_FILE_READ | 추후 사용 예정 |
| DLC_ERR_FILE_WRITE | 추후 사용 예정 |
| DLC_ERR_UNZIP_FAILED | 파일 다운로드 이후에 압축 해제가 실패했을때 리턴하는 값이다. |
| DLC_ERR_THREAD_VANISHED | 멀티 스레드로 다운로드 할 경우 특정 스레드에서 다운로드 실패 했을때 리턴하는 값이다. |
| DLC_ERR_INTERNET_CONNECT | DLC를 사용하는 디바이스나 데스크탑 환경이 인터넷 연결이 되어 있지 않거나 실패 했을때 리턴하는 값이다. |
| DLC_ERR_SOCKET_CLOSED | 외부 요인(망 변경, 인터넷 끊김 등)에 의해서 Socket이 닫혔을때 리턴하는 값이다. |
| DLC_ERR_SOCKET_CONNECT_FAILED | Socket연결에 실패 했을떄 리턴하는 값이다. |
| DLC_ERR_SOCKET_TIMEOUT | Socket 연결 시도 후에 타임아웃이 발생 했을때 리턴하는 값이다. |
