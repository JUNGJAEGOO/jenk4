title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Common &gt; Launching &gt; Developer's Guide
--------------------------------------------

After activating Launching service in the Console, if you had set Launching information necessary for mobile app, you can look up the data as follows.

Look Up Launching Data
----------------------

A way to look up Launching information created using the Console.

\[URL\]

    GET https://api-lnc.cloud.toast.com/launching/v2/application/{appKey}/launching 
    Content-Type: application/json

\[URL Parameter\]

| Name   | Data type | Description           |
|--------|-----------|-----------------------|
| appkey | String    | User Launching AppKey |

\[Example Request\]

    GET https://api-lnc.cloud.toast.com/launching/v2/application/7bfa6111b2141c13a813b90e4b314ac7308ea00dc2584611c089518f2da5cb6a/launching
    Content-Type: application/json

\[Example Response\]

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

> \[Note\]
> The request result is JSON string. Parse the relevant string in the application for use.

Error Code
----------

Error code indicates HTTP Response Status result code value.

\[Table1 Error Code\]

| Result Code | Description                                                             |
|-------------|-------------------------------------------------------------------------|
| 200         | OK : Request successful                                                 |
| 400         | Bad Request : When it is a wrong request                                |
| 401         | Unauthorized : When it is an invalid App Key                            |
| 404         | Not Found : When requested resource cannot be found                     |
| 500         | Internal Server Error : Contact the operator for internal server error. |


