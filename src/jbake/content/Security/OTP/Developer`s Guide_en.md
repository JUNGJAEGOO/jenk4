title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Security &gt; OTP &gt; Developer's Guide
----------------------------------------

After activating OTP service in the Console, you can use OTP service through the API call as follows.

| API                                                                                         | Description                                                    |
|---------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| otp/v1.0/appkeys/{appkey}/keys                                                              | Send OTP verified key and QR code image binary value           |
| otp/v1.0/appkeys/{appkey}/codes/{code}/verification?userId={userId}&encodedKey={encodedKey} | Confirm OTP verification key and validity of verification code |

Issue OTP Authentication Key and QR Code
----------------------------------------

\[URL\]

    POST   https://api-otp.cloud.toast.com/otp/v1.0/appkeys/{appKey}/keys
    Content-Type application/json

\[Path Parameter\]

| Name   | Data type | Description |
|--------|-----------|-------------|
| appkey | String    | OTP AppKey  |

\[Request body Parameter\]

| Name        | Data type | Description  |
|-------------|-----------|--------------|
| userId      | String    | User ID      |
| serviceName | String    | Service name |

\[Example Request\]

    URL      https://api-otp.cloud.toast.com/otp/v1/appkeys/ad89539d41c8363a987034b6c84c962cd8c813c9d6de35ec6b6afbee697aaa7a/keys
    application/json {“userId”: “test”, “serviceName”: “svc”}

\[Example Response\]

    {
      "header": {
        "resultCode": 0,
        "resultMessage": "SUCCESS"
        "successful": true
      },
      "Key": {
        "encodedKey": "YUI5RSM2QNNRNJ7C",
        "qrCodeEncodedString": "iVBORw0KGgoAAAANSUhEUgAAASwAAAEsAQAAAABRBrPYAAAB80lEQVR42u2aMXLDMAwEoVGh0k/wU/g08ml8ip7g0oVGCHEA5TiKZlKk8pFFEhnrBmMcjueI/uU8ZGADG9jABqZV7NxVp01uWrPM+mhPeFUyI4Y/7zVP+rSKGt3e9KrRYSKLdUq3xZ5lfkYX5c6MVUFBi1r70sCsbqdYvY0UM+aTJbssuh71qwEkwFx7W2FbHq9fFxJNgPVTbAu1wu6r6WqJfz5mfVtaXfbZNKaoK057uq2JETNngi0UdmWfVddUfFdnQsy3kKmtvSLS6s2uoH3y1l4WDCMFmd3gWna3K8SYhpNF+1LZ8aa2muBrGbHuUzT2sTcMvvbbdibC0JumtiHB1kUzL7aakhJikBoTlyjsblT6gBFicPh9pLCWcfPxGyEpJuZMYjv7ZBVz+KtkQsxufdY3l+DUZ01+DiANVvFzFTn8W3Oy3rD3AWTB7Lh33aC9cPgV+dqaGLHaGxa5wHQxgDxYuwYjF0Bs0icL2vvWNyJMwsJ6Kt9TAnysMifmSaPRa/gURAenncWBxYksGlfBMPo3rYxYTxpF4yroSjydtJcGOxaxFeTIXE+TxYPF1zcopAhRrgaQCMsxYJESWGzCjR2dgtRE4KiUWHwnHtu5KU7TmCKnlIAG69ob2xkfJI+kf5Xoj8fGfxANbGADG9j/YF9P1zK9rCNOGQAAAABJRU5ErkJggg=="
      }
    }

Verify OTP Authentication Code
------------------------------

\[URL\]

    GET        https://api-otp.cloud.toast.com/otp/v1.0/appkeys/{appKey}/codes/{code}/verification?userId={userId}&encodedKey={encodedKey}

\[Path Parameter\]

| Name   | Data type | Description                                           |
|--------|-----------|-------------------------------------------------------|
| appkey | String    | OTP AppKey                                            |
| code   | String    | OTP verification code obtained through Mobile OTP app |

\[Query Parameter\]

| Name       | Data type | Description                             |
|------------|-----------|-----------------------------------------|
| userId     | String    | User ID                                 |
| encodedKey | String    | OTP verification key issued through API |

\[Example Request\]

    URL otp/v1.0/appkeys/ad89539d41c8363a987034b6c84c962cd8c813c9d6de35ec6b6afbee697aaa7a/codes/269935/verification?userId=test&encodedKey=YUI5RSM2QNNRNJ7C

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

Error codes as follows.

| Code | Description                                                            |
|------|------------------------------------------------------------------------|
| 0    | SUCCESS: Normal                                                        |
| -1   | FAIL: Fail                                                             |
| -2   | PARAMETER\_ERROR : When the parameter value is not valid               |
| -3   | HTTP\_STATUS\_ERROR : HTTP status error                                |
| -4   | APPKEY\_ERROR : When the appkey value is not valid                     |
| -101 | DATA\_INVALID\_ERROR : When the verification code does not match       |
| -102 | DATA\_DUPLICATE\_ERROR : When the OTP verification key was used before |


