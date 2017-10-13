title=About
date=2013-09-24
type=page
status=published
big=TCSecurity
summary=CAPTCHADV's
~~~~~~
## Security > CAPTCHA > Developer's Guide

Console에서 CAPTCHA 서비스를 활성화 한 후 [표 1]의 API 호출을 통해 CAPTCHA 서비스를 이용할 수 있습니다.

[표 1] CAPTCHA API 목록

|API|	설명|
|---|---|
|captcha/v1.0/appkeys/{appkey}/keys|	CAPTCHA 인증 키 발급|
|captcha/v1.0/keys/{key}/img|	이미지 CAPTCHA를 출력|
|captcha/v1.0/keys/{key}/sound|	음성 CAPTCHA를 출력|
|captcha/v1.0/appkeys/{appkey}/keys/{key}/verification?answer={answer}|	CAPTCHA 인증 키와 CAPTCHA에 표시된 단어를 검증함|
|captcha/v1.0/appkeys/{appkey}?key={key}|	CAPTCHA 인증 키 expire|

## CAPTCHA 인증 키 발급

[URL]

```
POST   https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/{appKey}/keys
Content-Type  application/json
```

[표 2] CAPTCHA 인증키 발급 Path Parameter

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	CAPTCHA AppKey|

[Example Request]

```
URL    https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/ 2b847e2a0afd82e8ff45434f32e8e6e62bf56bcf83ca1befb3739ed9460eb685/keys
```

[Example Response]

```
{
  "header": {
    "resultCode": 0,
    "resultMessage": "SUCCESS"
    "successful": true
  },
  "Key": "a9859757-5b5a-42d1-bc85-c560b0141ec1"
}
```

## 이미지 CAPTCHA

[URL]

```
GET    https://api-captcha.cloud.toast.com/captcha/v1.0/keys/{key}/img
```

[표 3] 이미지 CAPTCHA Path Parameter

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	CAPTCHA AppKey|
|key|	String|	API를 통해 발급 받은 CAPTCHA 인증 키|

[Example Request]

```
URL    https://api-captcha.cloud.toast.com/captcha/v1.0/keys/a9859757-5b5a-42d1-bc85-c560b0141ec1/img
```

[Example Response]

![](http://static.toastoven.net/prod_captcha/img_01.gif)

## CAPTCHA 확인

[URL]

```
GET    https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/{appKey}/keys/{key}/verification?answer={answer}
```

[표 4] CAPTCHA 확인 Path Parameter

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	CAPTCHA AppKey|
|key|	String|	API를 통해 발급 받은 CAPTCHA 인증 키|

[표 5]

CAPTCHA  
확인 Query Parameter

|이름|	자료형|	설명|
|---|---|---|
|answer|	String|	CAPTCHA 문자|

[Example Request]

```
URL    https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/ 2b847e2a0afd82e8ff45434f32e8e6e62bf56bcf83ca1befb3739ed9460eb685/keys/a9859757-5b5a-42d1-bc85-c560b0141ec1/verification?answer=EAKJH
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

## CAPTCHA 인증 키 expire

[URL]

```
DELETE   https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/{appKey}?key={key}
```

[표 6] CAPTCHA 인증키 expire Path Parameter

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	CAPTCHA AppKey|

[표 7] CAPTCHA 인증키 expire Query Parameter

|이름|	자료형|	설명|
|---|---|---|
|key|	String|	API를 통해 발급 받은 CAPTCHA 인증 키|

[Example Request]

```
URL    https://api-captcha.cloud.toast.com/captcha/v1.0/appkeys/ 2b847e2a0afd82e8ff45434f32e8e6e62bf56bcf83ca1befb3739ed9460eb685?keys=a9859757-5b5a-42d1-bc85-c560b0141ec1
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

API가 반환하는 resultCode의 에러 코드는 [표 8]과 같습니다.  

[표 8] CAPTCHA API 에러코드

|Code|	설명|
|---|---|
|0|	SUCCESS: 정상|
|-1|	FAIL: 실패|
|-2|	PARAMETER_ERROR : 파라미터 값이 유효하지 않을 때|
|-3|	HTTP_STATUS_ERROR : HTTP status error|
|-4|	APPKEY_ERROR : appkey 값이 유효하지 않을 때|
|-5|	EXPIRED_KEY_ERROR : expire된 Captcha 인증 키를 사용했을 때|
|-6|	WRONG_ANSWER_ERROR : Captcha 문자가 일치하지 않을 때|
|-7|	INVALID_KEY_ERROR : Captcha 인증 키 오류|
|-8|	EMPTY_ANSWER : answer 값이 없을 때|
