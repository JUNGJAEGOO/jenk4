title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > Launching > Developer's Guide

Console에서 Launching 서비스를 활성화 한 후, 모바일 앱에 필요한 Launching 정보를 설정하였다면 다음과 같이 해당 데이터를 조회 할 수 있습니다.

## Launching 데이터 조회

Console을 사용하여 설정한 Launching 정보를 조회할 수 있는 방법입니다.

[URL]

```http
GET https://api-lnc.cloud.toast.com/launching/v2/application/{appKey}/launching  
Content-Type: application/json
```

[URL 파라미터]

| 이름     | 자료형    | 설명                   |
| ------ | ------ | -------------------- |
| appkey | String | 사용자 Launching AppKey |

[Example Request]

```http
GET https://api-lnc.cloud.toast.com/launching/v2/application/7bfa6111b2141c13a813b90e4b314ac7308ea00dc2584611c089518f2da5cb6a/launching
Content-Type: application/json
```

[Example Response]

```http
HTTP/1.1 200 OK
Content-Type: application/json;charset=UTF-8

{
    "header":{
        "resultCode":0,
        "resultMessage":"ok",
        "isSuccessful":true,
        "serviceCode":900021
    },
    "launching":{
        "state":"",
        "server":{
            "ip":"",
            "cds":""
        },
        "client":{
            "currentVersion":"",
            "downloadUrl":"",
            "noticeUrl":"",
            "privacyUrl":"",
            "termsUrl":"",
            "eventUrl":"",
            "bannerUrl":""
        },
        "maintenance":{
            "message":{
                "ko":"",
                "en":"",
                "jp":""
            }
        }
    }
}
```

> [참고]  
> 요청 결과는 JSON 문자열입니다. 애플리케이션에서는 해당 문자열을 파싱하여 사용하면 됩니다.  

## 에러 코드

에러 코드는 HTTP Response Status 결과코드 값을 의미합니다.

[표1 에러 코드]

| Result Code | 설명                                                |
| ----------- | ------------------------------------------------- |
| 200         | OK : 요청 성공                                        |
| 400         | Bad Request : 잘못된 요청일 경우                          |
| 401         | Unauthorized : 유효하지 않은 App Key일 경우                |
| 404         | Not Found : 요청한 리소스를 찾을 수 없을 경우                   |
| 500         | Internal Server Error : 서버 내부적인 오류로, 관리자에게 문의 바람. |
