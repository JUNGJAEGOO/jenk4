title=About
date=2013-09-24
type=page
status=published
big=TCSecurity
summary=OTPDV's
~~~~~~
## Security > OTP > Developer's Guide

Console에서 OTP 서비스를 활성화 한 후 다음과 같은 API 호출을 통해 OTP 서비스를 이용할 수 있습니다.

|API|	설명|
|---|---|
|otp/v1.0/appkeys/{appkey}/keys|	OTP 인증 키 및 QR 코드 이미지 바이너리 값을 전송함|
|otp/v1.0/appkeys/{appkey}/codes/{code}/verification?userId={userId}&encodedKey={encodedKey}|	OTP 인증 키와 인증 코드의 유효성을 확인함|

## OTP 인증 키 및 QR코드 발급

[URL]

```
POST   https://api-otp.cloud.toast.com/otp/v1.0/appkeys/{appKey}/keys
Content-Type  application/json
```

[Path Parameter]

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	OTP AppKey|

[Request body Parameter]

|이름|	자료형|	설명|
|---|---|---|
|userId|	String|	사용자 아이디|
|serviceName|	String|	서비스 이름|

[Example Request]

```
URL      https://api-otp.cloud.toast.com/otp/v1/appkeys/ad89539d41c8363a987034b6c84c962cd8c813c9d6de35ec6b6afbee697aaa7a/keys
application/json  {“userId”: “test”, “serviceName”: “svc”}
```

[Example Response]

```
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
```

## OTP 인증 코드 확인

[URL]

```
GET        https://api-otp.cloud.toast.com/otp/v1.0/appkeys/{appKey}/codes/{code}/verification?userId={userId}&encodedKey={encodedKey}
```

[Path Parameter]

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	OTP AppKey|
|code|	String|	Mobile OTP 앱을 통해 얻은 OTP 인증 코드|

[Query Parameter]

|이름|	자료형|	설명|
|---|---|---|
|userId|	String|	사용자 아이디|
|encodedKey|	String|	API를 통해 발급 받은 OTP 인증 키|

[Example Request]

```
URL otp/v1.0/appkeys/ad89539d41c8363a987034b6c84c962cd8c813c9d6de35ec6b6afbee697aaa7a/codes/269935/verification?userId=test&encodedKey=YUI5RSM2QNNRNJ7C
```

[Example Response]

```
{
  "header": {
    "resultCode": 0,
    "resultMessage": "SUCCESS"
    "successful": true
  }
}
```

## 에러 코드

에러 코드는 다음과 같습니다.

|Code|	설명|
|---|---|
|0|	SUCCESS: 정상|
|-1|	FAIL: 실패|
|-2|	PARAMETER_ERROR : 파라미터 값이 유효하지 않을 때|
|-3|	HTTP_STATUS_ERROR : HTTP status error|
|-4|	APPKEY_ERROR : appkey 값이 유효하지 않을 때|
|-101|	DATA_INVALID_ERROR : 인증 코드가 일치하지 않을 때|
|-102|	DATA_DUPLICATE_ERROR : 기존에 사용된 OTP 인증 키인 경우|
