title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Security &gt; CAPTCHA &gt; Developer's Guide
--------------------------------------------

After activating CAPTCHA service in the Console, CAPTCHA service is available with API call in \[Table 1\].

\[Table 1\] CAPTCHA API list

| API                                                                   | Description                                                      |
|-----------------------------------------------------------------------|------------------------------------------------------------------|
| captcha/v1.0/appkeys/{appkey}/keys                                    | Issue CAPTCHA authentication key                                 |
| captcha/v1.0/keys/{key}/img                                           | Print image CAPTCHA                                              |
| captcha/v1.0/keys/{key}/sound                                         | Print voice CAPTCHA                                              |
| captcha/v1.0/appkeys/{appkey}/keys/{key}/verification?answer={answer} | Verify CAPTCHA authentication key and words indicated in CAPTCHA |
| captcha/v1.0/appkeys/{appkey}?key={key}                               | CAPTCHA authentication key expire                                |

Issue CAPTCHA Authentication Key
--------------------------------

\[URL\]

    POST   https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/{appKey}/keys
    Content-Type  application/json

\[Table 2\] Issue CAPTCHA authentication key Path Parameter

| Name   | Data type | Description    |
|--------|-----------|----------------|
| appkey | String    | CAPTCHA AppKey |

\[Example Request\]

    URL    https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/ 2b847e2a0afd82e8ff45434f32e8e6e62bf56bcf83ca1befb3739ed9460eb685/keys

\[Example Response\]

    {
      "header": {
        "resultCode": 0,
        "resultMessage": "SUCCESS"
        "successful": true
      },
      "Key": "a9859757-5b5a-42d1-bc85-c560b0141ec1"
    }

Image CAPTCHA
-------------

\[URL\]

    GET    https://api-captcha.cloud.toast.com/captcha/v1.0/keys/{key}/img

\[Table 3\] Image CAPTCHA Path Parameter

| Name   | Data type | Description                                |
|--------|-----------|--------------------------------------------|
| appkey | String    | CAPTCHA AppKey                             |
| key    | String    | CAPTCHA authentication key issued from API |

\[Example Request\]

    URL    https://api-captcha.cloud.toast.com/captcha/v1.0/keys/a9859757-5b5a-42d1-bc85-c560b0141ec1/img

\[Example Response\]

<img src="http://static.toastoven.net/prod_captcha/img_01.gif" />

Confirm CAPTCHA
---------------

\[URL\]

    GET    https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/{appKey}/keys/{key}/verification?answer={answer}

\[Table 4\] Confirm CAPTCHA Path Parameter

| Name   | Data type | Description                                |
|--------|-----------|--------------------------------------------|
| appkey | String    | CAPTCHA AppKey                             |
| key    | String    | CAPTCHA authentication key issued from API |

\[Table 5\]

CAPTCHA
Confirm Query Parameter

| Name   | Data type | Description  |
|--------|-----------|--------------|
| answer | String    | CAPTCHA text |

\[Example Request\]

    URL    https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/ 2b847e2a0afd82e8ff45434f32e8e6e62bf56bcf83ca1befb3739ed9460eb685/keys/a9859757-5b5a-42d1-bc85-c560b0141ec1/verification?answer=EAKJH

\[Example Response\]

    {
      "header": {
        "resultCode": 0,
        "resultMessage": "SUCCESS"
        "successful": true
      }
    }

CAPTCHA Authentication Key Expire
---------------------------------

\[URL\]

    DELETE   https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/{appKey}?key={key}

\[Table 6\] CAPTCHA authentication key expire Path Parameter

| Name   | Data type | Description    |
|--------|-----------|----------------|
| appkey | String    | CAPTCHA AppKey |

\[Table 7\] CAPTCHA authentication key expire Query Parameter

| Name | Data type | Description                                |
|------|-----------|--------------------------------------------|
| key  | String    | CAPTCHA authentication key issued from API |

\[Example Request\]

    URL    https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/ 2b847e2a0afd82e8ff45434f32e8e6e62bf56bcf83ca1befb3739ed9460eb685?keys=a9859757-5b5a-42d1-bc85-c560b0141ec1

\[Example Response\]

    {
      "header": {
        "resultCode": 0,
        "resultMessage": "SUCCESS"
        "successful": true
      }
    }

Error Code
----------

Error codes of resultCode that API returns are as shown in \[Table 8\].

\[Table 8\] CAPTCHA API error codes

| Code | Description                                                           |
|------|-----------------------------------------------------------------------|
| 0    | SUCCESS: Normal                                                       |
| -1   | FAIL: Fail                                                            |
| -2   | PARAMETER\_ERROR : When parameter value is not valid                  |
| -3   | HTTP\_STATUS\_ERROR : HTTP status error                               |
| -4   | APPKEY\_ERROR : When appkey value is not valid                        |
| -5   | EXPIRED\_KEY\_ERROR : When expired Captcha authentication key is used |
| -6   | WRONG\_ANSWER\_ERROR : When Captcha text does not match               |
| -7   | INVALID\_KEY\_ERROR : Captcha authentication key error                |
| -8   | EMPTY\_ANSWER : When there is no answer value                         |


