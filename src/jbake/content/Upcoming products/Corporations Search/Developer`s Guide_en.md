title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Upcoming Products &gt; Corporations Search &gt; Developer's Guide
-----------------------------------------------------------------

> ※ This document contains information on alpha development in process. For those interested in use, please contact **support@cloud.toast.com**.

You can use the temporary/permanently closed client service through the API call as follows.

Temporary/Permanently Closed Client Request
-------------------------------------------

\[URL\]

    POST   [Content-Type : application/x-www-form-urlencoded]
    https://api-toastbill.cloud.toast.com/scraping/v1.0/appkeys/{appkey}/requests?p={param}

\[Path Parameter\]

| Name   | Data type | Description                      |
|--------|-----------|----------------------------------|
| appkey | String    | AppKey                           |
| p      | String    | Encrypted Request body Parameter |

\[Request body Parameter\]

| Name    | Data type | Description                                              |
|---------|-----------|----------------------------------------------------------|
| custNo  | long      | Customer number                                          |
| cryKey  | String    | Customer authentication key                              |
| bnoList | String    | Business registration number (Multiple numbers possible) |

\[Example Request\]

    {"custNo":1
    ,"crtKey":"qaz!@wsx"
    ,"bnoList":["1234567890","0123456789","9012345678"]}

    After encrypting Json data as AES256, URLEncoder(UTF-8) processed data
    rteo7fjjhGlVznybl239YSngEb2Y3VHOSJaM12AGasdyI1Y0pclSFnPo8uD8eHLFJ41AigDRpsXW36aBQoJXkTFhVeTQ4CMJFg8qKUXj%2Bl%2BwxjdkDJxVdCkJlh4Nnvxm

\[Example Request url\]

    https://api-toastbill.cloud.toast.com/scraping/v1.0/appkeys/1sdaf3rs34d2/requests?p= rteo7fjjhGlVznybl239YSngEb2Y3VHOSJaM12AGasdyI1Y0pclSFnPo8uD8eHLFJ41AigDRpsXW36aBQoJXkTFhVeTQ4CMJFg8qKUXj%2Bl%2BwxjdkDJxVdCkJlh4Nnvxm

\[Example Response\]

    {
        "header": {
            "resultCode": 0,
            "resultMessage": "Request succeeded.",
            "successful": true
        },
        "data": {
            "reqNo": 68,
            "reqCnt": 8,
        “reqDate” : “2015-12-10 10:10:10”
    }
    }

\[Response\]

| Name      | Data type | Description                                      |
|-----------|-----------|--------------------------------------------------|
| reqNo     | long      | Request number                                   |
| resultCnt | int       | Number of requested business registration number |
| reqDate   | String    | Request date                                     |

Check the Status of Temporary/Permanently Closed Client Request
---------------------------------------------------------------

\[URL\]

    GET
    https://api-toastbill.cloud.toast.com/scraping/v1.0/appkeys/{appkey}/verification?p={param}

\[Path Parameter\]

| Name   | Data type | Description                      |
|--------|-----------|----------------------------------|
| appkey | String    | AppKey                           |
| p      | String    | Encrypted Request body Parameter |

\[Request body Parameter\]

| Name   | Data type | Description                 |
|--------|-----------|-----------------------------|
| custNo | long      | Customer number             |
| cryKey | String    | Customer authentication key |
| reqNo  | long      | Request number              |

\[Example Request\]

    {"custNo":1
    ,"crtKey":"qaz!@wsx"
    ,"reqNo":58}

    After encrypting Json data as AES256, URLEncoder(UTF-8) processed data
    TSNRsStai0hQUM5m40dyDxIJsW5TON7QqVYjjhCIjBUKbMFqmiM1xZ8ND5%2Buo5xd

\[Example Request url\]

    https://api-toastbill.cloud.toast.com/scraping/v1.0/appkeys/1sdaf3rs34d2/verification?p= TSNRsStai0hQUM5m40dyDxIJsW5TON7QqVYjjhCIjBUKbMFqmiM1xZ8ND5%2Buo5xd

\[Example Response\]

    {
        "header": {
            "resultCode": 0,
            "resultMessage": "Request succeeded.",
            "successful": true
        },
        "data": {
            "reqNo": 68,
            "resultDate": “2015-11-11 10:10:10”,
    }
    }

\[Response\]

| Name       | Data type | Description     |
|------------|-----------|-----------------|
| reqNo      | long      | Request number  |
| resultDate | String    | Completion date |

Receive Result Data on Temporary/Permanently Closed Client Request
------------------------------------------------------------------

\[URL\]

    GET
    https://api-toastbill.cloud.toast.com/scraping/v1.0/appkeys/{appkey}/results?p={param}

\[Path Parameter\]

| Name   | Data type | Description                      |
|--------|-----------|----------------------------------|
| appkey | String    | AppKey                           |
| p      | String    | Encrypted Request body Parameter |

\[Request body Parameter\]

| Name   | Data type | Description                 |
|--------|-----------|-----------------------------|
| custNo | long      | Customer number             |
| cryKey | String    | Customer authentication key |
| reqNo  | long      | Request number              |

\[Example Request\]

    {"custNo":1
    ,"crtKey":"qaz!@wsx"
    ,"reqNo":58}

    After encrypting Json data as AES256, URLEncoder(UTF-8) processed data
    TSNRsStai0hQUM5m40dyDxIJsW5TON7QqVYjjhCIjBUKbMFqmiM1xZ8ND5%2Buo5xd

\[Example Request url\]

    https://api-toastbill.cloud.toast.com/scraping/v1.0/appkeys/1sdaf3rs34d2/results?p= TSNRsStai0hQUM5m40dyDxIJsW5TON7QqVYjjhCIjBUKbMFqmiM1xZ8ND5%2Buo5xd

\[Example Response\]

    {
        "header": {
            "resultCode": 0,
            "resultMessage": "Retrieve request completed.",
            "successful": true
        },
        "data": {
            "reqNo": 58,
            "resultCnt": 8,
            "resultDate": "2015-11-11 10:10:10",
            "resultEncrytData": "8LAT2G8kMp1rFby+n0gWIDYhpnO/sDSU2zMyp0tLnb9Y901/+sw5agirJsWgpJm6s81R1uwOyC+zzBOG98H+WrC1zAMHX1U5tcpbgF+RSeQdx//8r6Af1NXQ3FZ/IsVJnhvttKEqnpFVzGt11zhNz1Tunj4d+N+MWYEr7BW2izaQXxRlZ0HX8X8lEiJp7JutKO9BKpZbAtR471SsDAtT6gS845CayO2ojA6ujpqtF/v/ZQei+0KEF10eBwutGTmn1i891E7K/NzdsQbu8qeau7Ksx+QrLSm0SaPHrK71XFjincB/xxXp12xc1zsZK3drQQ/U2xbiAY3CPqTXdNjWpj/iBRZaagQcC6VVvlIrMJ4t4O+cr7xsW5iMgmcpg75dPpsa4pkG8V0S9YKGg24TH+qfM7RZ9Xh7m+OSZMQRtbFT4fLLawB4E7mMKRPCBjmR3elQ0vVrNhWZ8kFt+a8C4D+EdWTIplvkS13tKkFFCF4=",
    }
    }

\[Response\]

| Name             | Data type | Description                        |
|------------------|-----------|------------------------------------|
| reqNo            | long      | Request number                     |
| resultCnt        | int       | Number of completed data           |
| resultDate       | String    | Completion date                    |
| resultEncrytData | String    | Encrypted closing information data |

After processing URLDecoder of resultEncrytData relevant data, decode AES256

    [{"bno":"1234567890","bnoCd":"01","bnoCont":"VAT general taxpayer.","bnoDate":"2015-11-11 10:10:10"}
    ,{"bno":"1234567890","bnoCd":"01","bnoCont":" VAT general taxpayer.","bnoDate":"2015-11-11 10:10:10"}
    ,{"bno":"1234567890","bnoCd":"01","bnoCont":" VAT general taxpayer.","bnoDate":"2015-11-10 10:10:10"}]

| Name    | Data type | Description                  |
|---------|-----------|------------------------------|
| bno     | String    | Business registration number |
| bnoCd   | String    | Result code                  |
| bnoCont | String    | Retrieved result             |
| bnoDate | String    | Retrieved date               |

Check Request Number of Temporary/Permanently Closed Clients Recently Requested
-------------------------------------------------------------------------------

\[URL\]

    GET
    https://api-toastbill.cloud.toast.com/scraping/v1.0/appkeys/{appkey}/recent?p={param}

\[Path Parameter\]

| Name   | Data type | Description                      |
|--------|-----------|----------------------------------|
| appkey | String    | AppKey                           |
| p      | String    | Encrypted Request body Parameter |

\[Request body Parameter\]

| Name   | Data type | Description                 |
|--------|-----------|-----------------------------|
| custNo | long      | Customer number             |
| cryKey | String    | Customer authentication key |

\[Example Request\]

    {"custNo":1
    ,"crtKey":"qaz!@wsx"}

    After encrypting Json data as AES256, URLEncoder(UTF-8) processed data
    3Tm2TS3ynvXw3jcgh1SzQcMIBA2EIRp%2FheQSAsWSXHTP0TODL%2FYEL1Iml3Qn1CWn

\[Example Request url\]

    https://api-toastbill.cloud.toast.com/scraping/v1.0/appkeys/1sdaf3rs34d2/verification?p= 3Tm2TS3ynvXw3jcgh1SzQcMIBA2EIRp%2FheQSAsWSXHTP0TODL%2FYEL1Iml3Qn1CWn

\[Example Response\]

    {
        "header": {
            "resultCode": 0,
            "resultMessage": "Request succeeded.",
            "successful": true
        },
        "data": {
            "recentReqNo": 68,
            "recentReqDate": “2015-11-11 10:10:10”,
    }
    }

\[Response\]

| Name          | Data type | Description           |
|---------------|-----------|-----------------------|
| recentReqNo   | long      | Recent request number |
| recentReqDate | String    | Recent request date   |

Check Request History of Temporary/Permanently Closed Clients within a Week
---------------------------------------------------------------------------

\[URL\]

    GET
    https://api-toastbill.cloud.toast.com/scraping/v1.0/appkeys/{appkey}/reqlists?p={param}

\[Path Parameter\]

| Name   | Data type | Description                      |
|--------|-----------|----------------------------------|
| appkey | String    | AppKey                           |
| p      | String    | Encrypted Request body Parameter |

\[Request body Parameter\]

| Name   | Data type | Description                 |
|--------|-----------|-----------------------------|
| custNo | long      | Customer number             |
| cryKey | String    | Customer authentication key |

\[Example Request\]

    {"custNo":1
    ,"crtKey":"qaz!@wsx"}

    After encrypting Json data as AES256, URLEncoder(UTF-8) processed data
    3Tm2TS3ynvXw3jcgh1SzQcMIBA2EIRp%2FheQSAsWSXHTP0TODL%2FYEL1Iml3Qn1CWn

\[Example Request url\]

    https://api-toastbill.cloud.toast.com/scraping/v1.0/appkeys/1sdaf3rs34d2/reqlists?p= 3Tm2TS3ynvXw3jcgh1SzQcMIBA2EIRp%2FheQSAsWSXHTP0TODL%2FYEL1Iml3Qn1CWn

\[Example Response\]

    {
        "header": {
            "resultCode": 0,
            "resultMessage": "Request succeeded.",
            "successful": true
        },
        "data": {
            "reqList ": “[{“reqNo”:68,”reqStatCd”:”REQUEST”,”reqYmdt”:”2015-10-10 10:10:10”,”trtYmdt”:””,”reqCnt”:20}
    , [{“reqNo”:69,”reqStatCd”:”COMPLETE”,”reqYmdt”:”2015-10-10 10:10:10”,”trtYmdt”:” 2015-10-12 10:10:10”,”reqCnt”:20}]”
    }
    }

\[Response\]

| Name      | Data type | Description        |
|-----------|-----------|--------------------|
| reqNo     | long      | Request number     |
| reqStatCd | String    | Request status     |
| reqYmdt   | String    | Request date       |
| trtYmdt   | String    | Result date        |
| reqCnt    | int       | Number of requests |


