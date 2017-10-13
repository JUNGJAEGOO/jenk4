title=About
date=2013-09-24
type=page
status=published
big=TCNotification
summary=PushDV's
~~~~~~
## Notification > Push > Developer's Guide > v2.0 API Reference
이전 버전보기: <select onchange="location.href=this.value">
<option selected value="../../../Notification/Push/ko/Developer`s Guide.html">API v2.0</option>
<option value="../../../Notification/Push/ko/Developer`s Guide v1.3.html">API v1.3</option></select>

## API 소개
### v2.0 API 소개

#### 추가
- 상세한 resultMessage를 응답한다. API 호출 실패시, 문제가 되는 필드나 값을 리턴한다.
    - e.g. 잘 못된 메시지 아이디로 조회했을 경우, 다음과 같이 messageId 필드와 값을 resultMessage에 포함 시켜준다.
```
{
    "header" : {
		"resultCode" : 40401,
		"resultMessage" : "Client Error. Not found. messageId<3496615188236841>",
		"isSuccessful" : false
    }
}
```
- v2.0 토큰 등록, 속성 통계 API가 추가되었다.
- v2.0 메시지 조회 API에서 기간(from, to)과 메시지 상태(messageStatus)로 조회할 수 있게되었다.
- v2.0 메시지 조회 API에서 등록일시(createdDateTime), 완료일시(completedDateTime) 필드가 추가되었다.
- v2.0 메시지 수신, 확인 통계 조회 API가 추가되었다.
- v2.0 유효하지 않는 토큰 API에서 페이징(PageIndex, PageSize), 기간(from, to), 메시지 아이로 조회할 수 있게되었다.

#### 수정
- v1.3 피드백 API의 URI가 '/push/v1.3/appkey/{appkey}/feedback'에서 '/push/v2.0/appkeys/{appkey}/invalid-tokens'으로 변경되었다.

#### 삭제
- v2.0 메시지 발송 API로 발송된 메시지는 발송 내역을 남기지 않는다. CONSOLE에서 발송하는 메시지는 내역을 남긴다.    
2017년 6월 추가 예정인 'Log&Crash Search' 연동 기능이 추가되면, 사용자의 'Log&Crash Search'에 메시지 발송 내역을 남길 수 있다.
- v2.0 API에서 채널(Channel)이 삭제되었다. 채널 기능은 토큰의 그룹핑을 담당했던 기능으로, 하나의 토큰은 하나의 채널에만 속할 수 있는 제한이 있었다.    
2017년 6월 추가 예정인 태그 기능으로 대체될 예정이다. 태그는 하나의 토큰에 여러 개 태그를 추가할 수 있다.
    - 토큰 등록 API, channel 필드 삭제
    - 메시지 발송 API, target.type에서 'CHANNEL' 타입 삭제
    - 채널 API 삭제
### 기본 정보
#### Endpoint
```
API Endpoint: https://api-push.cloud.toast.com
메시지 수신/확인 여부 수집 Endpoint: https://collector-push.cloud.toast.com
```

#### Secret Key
- 콘솔에서 확인 가능하다.
- Secret Key가 필요한 API를 호출할 때, 해더에 아래와 같이 설정해서 호출해야 한다.
```
Header
X-Secret-Key: [a-zA-Z0-9]{8}
```

[CONSOLE] > [Notification] > [Push] > [URL & AppKey] 에서 생성할 수 있다.

#### Response

##### Response HTTP Status Code
200 OK.  
모든 API 요청에 대해 200 OK로 응답한다.  
자세한 응답 결과는 Response Body의 Header를 통해 알 수 있다.  

##### Response Header

```
{
	"header" : {
		"isSuccessful" : true,
		"resultCode": 0,
		"resultMessage" : "SUCCESS"
	}
}
```
##### resultCode, resultMessage

| isSuccessful | resultCode | resultMessage |
| --- | --- | --- |
| true | 0 | SUCCESS |
| false | 40001 | Client Error. Parameter is invalid. |
| false | 40002 | Client Error. Parameter is invalid format. |
| false | 40003 | Client Error. Parameter is empty or null. |
| false | 40004 | Client Error. Duplicate certificate. |
| false | 40005 | Client Error. Expired certificate. |
| false | 40006 | Client Error. Already registered. |
| false | 40007 | Client Error. Maximum limit exceeded. |
| false | 40008 | Client Error. Already completed. |
| false | 40101 | Client Error. Access is not allowed. |
| false | 40102 | Client Error. Unavailable key. |
| false | 40401 | Client Error. Not found. |
| false | 50001 ~ 50501 | Internal Error. Please report this. 'http://cloud.toast.com/support/faq'. |
| false | 400 | Client Error. 태그 API에서 발생한 클라이언트 오류다  |
| false | 500 | Internal Error. 태그 API에서 발생한 내부 오류다 |

## 토큰
### 생성
- 클라이언트에서 조회 가능하다.

##### Method, URL
```
POST /push/v2.0/appkeys/{appkey}/tokens
Content-Type: application/json;charset=UTF-8
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |

##### Request Body

```
{
  "oldToken": "oldToken",
  "token": "token",
  "isNotificationAgreement": true,
  "isAdAgreement": true,
  "isNightAdAgreement": true,
  "pushType": "GCM",
  "timezoneId": "Asia/Seoul",
  "uid": "uid",
  "country": "KR",
  "language": "ko"
}
```

|Field|	Usage | Description |
|---|---|---|
|token|	Required, String|	토큰, 최대 255 글자|
|oldToken|	Optional, String|	기존 토큰, 최대 255 글자 |
|pushType|	Required, String|	GCN, APNS, APNS_SANDBOX, TENCENT|
|isNotificationAgreement|	Required, Boolean|	true or false|
|isAdAgreement|	Required, Boolean|	true or false|
|isNightAdAgreement| Required, Boolean|	true or false|
|timezoneId|	Required, String|	Area/Name. IANA time zone database.|
|country|	Required, String|	ISO 3166-1 alpha-2, ISO 3166-1 alpha-3, 3 글자|
|language|	Required, String|	ISO 639-1, ISO 639-2, iOS(language code + script code), 8 글자|
|uid|	Required, String|	사용자 아이디, emoji 허용 안함, 최대 64 글자|


##### Response Body

```
{
	"header" : {
		"isSuccessful" : true,
		"resultCode": 0,
		"resultMessage" : "SUCCESS"
	}
}
```
##### Description

- 토큰 등록시 이미 토큰이 등록되어 있다면, 토큰 기준으로 다른 정보들이 업데이트 된다.
- 만약, 토큰이 변경된다면 oldToken에 기존 토큰을, token에 새로운 토큰을 설정하고 등록하면 새로운 토큰으로 업데이트 된다.
- 토큰 등록시 Channel을 등록하면, 메시지 발송시 특정 Channel로 발송할 수 있다. 필수는 아니며, 정의하지 않으면 "default"로 등록된다.
- 토큰은 하나의 Channel에만 속할 수 있다.
- "isNotificationAgreement" 푸시 메시지 수신 동의 여부, "isAdAgreement" 광고성 푸시 메시지 수신 여부, "isNightAdAgreement" 야간 광고성 푸시 메시지 수신 여부를 나타낸다.
- 예로, 모든 푸시 메시지 수신을 원할 경우, 필드 3개 모두 true로 설정하면 된다. 푸시 메시지만 수신할 경우, "isNotificationAgreement"만 true로 설정하면 된다.
- 수신 동의 여부는 정보통신망법 규정(제50조부터 제50조의 8)을 따른다.  
    - [KISA 가이드 바로 가기](https://spam.kisa.or.kr/spam/sub62.do)    
    - [법령 바로 가기](http://www.law.go.kr/lsEfInfoP.do?lsiSeq=123210#)  
- 네트워크 상태가 좋지 않거나 여러 이유로 인한 응답 지연이 발생할 수 있다. 모바일 어플리케이션 구동에 영향을 최소화 하기위해 Timeout을 짧게 설정하고, 구동될 때 마다 토큰을 등록하는 것이 좋다.
- 토큰은 보안적인 이슈, 앱 업데이트, 삭제 등 여러가지 이유로 재발급될 수 있다. 자주 변경되는 것은 아니지만, 수신율을 높이기 위해 구동될 때 마다 최신 토큰을 등록하는 것이 좋다.
- 앱 삭제 등으로 토큰이 만료되어도 바로 GCM, APNS 서버에 적용되지 않아, 앱 삭제 후 푸시 메시지를 발송했을 때 발송이 성공할 수 있다.

### 조회
#### 토큰과 푸시타입으로 토큰 조회
- 클라이언트에서 조회 가능하다.
##### Method, URL

```
GET /push/v2.0/appkeys/{appkey}/tokens/{token}?&pushType={pushType}
Content-Type: application/json;charset=UTF-8
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| pushType | Required, String | 'GCM', 'APNS', 'APNS_SANDBOX', 'TENCENT' |

##### Response Body

```
{
	"token" : {
		"pushType" : "GCM",
		"isNotificationAgreement": true,
		"isAdAgreement": true,
		"isNightAdAgreement": true,
		"timezoneId" : "Asia/Seoul",
		"country": "KR",
		"language": "ko",
		"uid" : "User ID",
		"token" : "Token",
        	"updateDateTime": "2017-08-12T01:04:18.000+09:00",
        	"adAgreementDateTime": "2017-08-12T01:04:19.000+09:00",
        	"nightAdAgreementDateTime": "2017-08-12T01:04:19.000+09:00"        
	},
	"header" : {
		"isSuccessful" : true,
		"resultCode": 0,
		"resultMessage" : "SUCCESS"
	}
}
```

| Field | Usage | Description |
| - | - | - |
| updateDateTime | -, DateTime String | 토큰 업데이트 일시 |
| adAgreementDateTime | -, DateTime String | 홍보성 푸시 메시지 수신 동의 일시 |
| nightAdAgreementDateTime | -, DateTime String | 야간 홍보성 푸시 메시지 수신 동의 일시 |

#### 사용자 아이디로 토큰 조회
- Secret Key가 필요한 API이며, 서버에서 호출되어야 한다.
##### Method, URL

```
GET /push/v2.0/appkeys/{appkey}/tokens?uid={uid}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| uid | Required, String | 조회할 사용자 아이디 |

##### Response Body

```
{
	"tokens": [{
		"pushType" : "GCM",
		"isNotificationAgreement": true,
		"isAdAgreement": true,
		"isNightAdAgreement": true,
		"timezoneId" : "Asia/Seoul",
		"country": "KR",
		"language": "ko",
		"uid" : "User ID",
		"token" : "Token",
        	"updateDateTime": "2017-08-12T01:04:18.000+09:00",
        	"adAgreementDateTime": "2017-08-12T01:04:19.000+09:00",
        	"nightAdAgreementDateTime": "2017-08-12T01:04:19.000+09:00"
	}],
	"header" : {
		"isSuccessful" : true,
		"resultCode": 0,
		"resultMessage" : "SUCCESS"
	}
}
```

#### 유효하지 않는 토큰 조회
##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/invalid-tokens?pageIndex={pageIndex}&pageSize={pageSize}&from={from}&to={to}&messageId={messageId}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| pageIndex | Optional, Number | 기본 값 0 |
| pageSize | Optional, Number | 기본 값 25, 최대 값 100 |
| from | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| to | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| messageId | Optional, Number | 유효하지 않는 토큰이 발생한 메시지 아이디 |

##### Request Body
```
없음
```
##### Response Body
```json
{
	"header" : {
		"resultCode" : 0,
		"resultMessage" : "SUCCESS",
		"isSuccessful" : true
	},
	"invalidTokens" : [{
			"messageId" : 0,
			"uid" : "uid",
			"token" : "invalid-token",
			"pushType" : "GCM",
			"createdDateTime" : "2017-02-08T19:39:04.000+09:00"
		}
	]
}
```


#### 토큰 속성 통계 조회 API
##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/statistics/token-properties?from={from}&to={to}&tokenProperties={tokenProperties}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| from | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| to | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| tokenProperties | Optional, String Array | 'agreement', 'country', 'language', 'timezoneId'<br/>','로 구분, e.g. tokenProperties=country,language |

##### Request Body
```
없음
```

##### Response Body
```json
{
	"tokenPropertyStatistics" : [{
			"dateTime" : "2016-07-11 17:50:00.00+9:00",
			"countries" : {
				"KR" : 100,
				"JP" : 60,
				"CN" : 100
			},
			"languages" : {
				"ko" : 90,
				"ja" : 60,
				"zh" : 100
			},
			"timezoneIds": {
				"Asia/Seoul": 260
			}
		}, {
			"dateTime" : "2016-07-11 17:51:00.00+9:00",
			"countries" : {
				"KR" : 100,
				"JP" : 60,
				"CN" : 100
			},
			"languages" : {
				"ko" : 90,
				"ja" : 60,
				"zh" : 100
			},
			"timezoneIds": {
				"Asia/Seoul": 260
			}
		}
	],
	"header" : {
		"isSuccessful" : true,
		"resultCode" : 0,
		"resultMessage" : "SUCCESS"
	}
}
```

| Field | Usage | Description |
| - | - | - |
| dateTime | String | 데이터가 수집된 일시 |
| agreements | String | 'ON'(모두 수신), 'NIGHT_AD_OFF'(야간 광고 수신 거부), 'AD_OFF'(광고 수신 거부), 'OFF'(모두 수신 거부) |
| countries.XX | String | ISO 3166-1 alpha-2, ISO 3166-1 alpha-3, 3 글자 |
| languages.XX | String | ISO 639-1, ISO 639-2, iOS(language code + script code), 8 글자 |
| timezoneIds.XX | String | Area/Name. IANA time zone database |

#### 토큰 등록 통계 조회
##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/statistics/token-registration?from={from}&to={to}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| from | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| to | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |

##### Request Body
```
없음
```

##### Response Body
```json
{
	"tokenRegistrationStatistics" : [{
			"dateTime" : "2016-07-11 17:50:00.00+9:00",
			"registeredToken" : 90,
			"deletedToken" : 20
		}, {
			"dateTime" : "2016-07-11 17:51:00.00+9:00",
			"registeredToken" : 45,
			"deletedToken" : 10
		}
	],
	"header" : {
		"isSuccessful" : true,
		"resultCode" : 0,
		"resultMessage" : "SUCCESS"
	}
}
```

| Field | Usage | Description |
| - | - | - |
| dateTime | String | 데이터가 수집된 일시 |
| registeredToken | Number | 등록된 토큰 수 |
| deletedToken | Number | 삭제된 토큰 수 |

## 메시지
### 발송
##### Method, URL, Headers
```
POST /push/v2.0/appkeys/{appkey}/messages
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```
##### Request Body
```json
{
    "target" : {
        "type" : "UID",
        "to": ["uid-1", "uid-2"]
    },
    "content" : {
        "default" : {
            "title": "title",
            "body": "body"
        }
    },
    "messageType" : "AD",
    "contact": "1588-1588",
    "removeGuide": "매뉴 > 설정",
    "timeToLiveMinute": 1,
	"provisionedResourceId": "id"
}
```

##### Response Body
```json
{
    "message" : {
        "messageId" : 0,
        "messageIdString": "0"
    },
    "header" : {
        "isSuccessful" : true,
        "resultCode": 0,
        "resultMessage" : "SUCCESS"
    }
}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| target.type | Required, String | 'ALL', 'UID', 'TAG' 수신 타겟 타입 |
| target.to | Optional, String Array | target.type이 수신자 UID 목록(최대 10,000 개) 또는 TAG 조건 |
| target.pushTypes | Optional, String Array | 'GCM', 'APNS', 'APNS_SANDBOX', 'TENCENT' |
| target.countries | Optional, String Array | ISO 3166-1 alpha-2, ISO 3166-1 alpha-3 (최대 3 글자) |
| content | Required, Map | 수신자에게 전달될 내용 (최대 8,192 글자) |
| content.default | Required, Map | '자세한 내용은 아래 공통 메시지 형식' 참고 |
| content.default.title | Optional, String |  |
| content.default.body | Optional, String |  |
| messageType | Required, String | NOTIFICATION, AD |
| contact | Optional, String | messageType이 AD이면 경우 필수, 숫자(0-9)와 하이픈(Hypen, -)만 가능하다. |
| removeGuide | Optional, String | messageType이 AD이면 경우 필수 |
| timeToLiveMinute | Optional, Number | 단위는 분이다. 범위는 1에서 60까지다. 기본 값은 10 이다. |
| provisionedResourceId | Optional, String | 할당 받은 전용 리소스(provisioned Resource) 아이디다. 사용 문의 support@cloud.toast.com |

##### Description
- "target.type"에 'UID'로 설정시 "target.to"에 최대 10,000 개까지 UID를 설정할 수 있다.
- "target.type"에 'TAG'로 설정시 "target.to"에 태그 아이디와 3 개의 조건과 1 개의 괄호('()')를 넣은 조건을 설정할 수 있다.
    - 예, 남자, 30대 태그가 붙었거나 여자 태그가 붙은 대상에게 메시지를 발송한다면,    
    "target.to=(,남자_ID,AND,30대_ID,),OR,여자_ID"로 설정할 수 있다.
- "target.pushTypes" 필드로 특정 푸시 타입으로만 메시지를 발송할 수 있다.
만약, 정의하지 않으면 모든 푸시 타입, GCM, APNS, APNS_SANDBOX, TENCENT로 발송한다.
- "target.countries" 필드가 "['KR', 'JP']"면 토큰 국가 코드가 "KR" 또는 "JP"인 Token에 발송한다.
- "content.default" 필드는 필수이며, "content" 필드에 대한 자세한 내용은 아래 [공통 메시지 포맷]을 참고 바란다.
- 메시지를 광고 타입, "messageType": "AD", 으로 보낼 경우, "contact", "removeGuide" 필드를 반드시 포함해야 한다.
"contact" 필드에 연락처를 입력해야 하며, "removeGuide" 필드에 수신 철회 방법에 대해 입력해야 한다.
- timeToLive 필드를 설정하면, 설정한 시간 이상 발송이 지연되는 경우 자동으로 실패 처리된다.

#### 공통 메시지
"content"에 아래 표대로 메시지를 작성하면, 각 푸시 타입에 맞게 메시지가 생성되어 발송된다.

|Reserved Word|	Platform|	Usage|	GCM|	APNS|	TENCENT|
|---|---|---|---|---|---|
|title|	Android, <br/> iOS Watch, <br/> Tencent|	Optional, String|	data.title|	aps.alert.title|	title|
|body|	Android, <br/> iOS, <br/> Tencent|	Optional, String|	data.body|	aps.alert.body|	body|
|title-loc-key|	iOS|	Optional, String| - | aps.alert.title-loc-key| - |
|title-loc-args|	iOS|	Optional, Array of Strings| - | aps.alert.title-loc-args	| - |
|action-loc-key|	iOS|	Optional, String| - |aps.alert.action-loc-key	| - |
|loc-key|	iOS|	Optional, String| - |aps.alert.loc-key	| - |
|loc-args|	iOS|	Optional, Array of String	| - | aps.alert.loc-args	| - |
|launch-image|	iOS|	Optional, String	| - | aps.alert.launch-image	| - |
|badge|	iOS|	Optional, Number| - | aps.badge	| - |
|sound|	Android, <br/> iOS, <br/> Tencent|	Optional, String|	data.sound|	aps.sound|	custom_content.sound|
|content-available|	iOS|	Optional, String	| - | aps.content-available	| - |
|category|	iOS|	Optional, String	| - | aps.category	| - |
|mutable-content| iOS | Optional, String | - | aps.mutable-content | - |
| messageDeliveryReceipt | Android, <br/>iOS, <br/> Tencent | Unnecessary | - | - | - |
| messageDeliveryReceiptData | Android, <br/>iOS, <br/> Tencent | Unnecessary | - | - | - |

Reserved Word는 메시지 생성시 Platform 별로 알맞는 위치에 설정된다. 사용자가 임의로 데이터 타입과 위치등을 변경할 수 없다.
그 외 사용자가 정의한 Word는 다음과 같이 Custom Key/Value 필드에 들어간다.

|Word|	Platform|	Usage|	GCM|	APNS|	TENCENT|
|---|---|---|---|---|---|
|customKey|	Android, <br/> iOS, <br/> Tencent|	Optional, <br/> Object, <br/> Array, <br/> String, <br/> Number|	data.customKey|	customKey|	custom_content.customKey|

##### "content" Example

```
"content.default"는 필수다. 아래 "content.ko", "content.ja"는 토큰의 언어 코드 값이다.
해당 토큰의 언어 코드에 맞게 메시지가 발송된다.
Request Body
{
	"target" : {
		"type" : "ALL"
	},
	"content" : {
        "default" : {
            "title": "title",
            "body": "body",
            "badge": 1,
            "customKey": "value"
        },
        "ko" : {
            "title": "제목",
            "body": "내용"
            "customKey": "값"
        },
        "ja" : {
            "title": "タイトル",
            "body": "プッシュ・メッセージ"
        }
	},
	"messageType" : "NOTIFICATION"
}
"ko" GCM 메시지
 {
    "data": {
        "title": "제목",
        "body": "내용",
        "customKey": "값"
    }
}
"ja" GCM 메시지
 {
    "data": {
        "title": "タイトル",
        "body": "プッシュ・メッセージ",
        "customKey": "value"
    }
}
"ko" APNS 메시지
{
    "aps": {
        "alert": {
            "title": "제목",
            "body": "내용"
        },
        "badge": 1
    },
    "customKey": "값"

}
"ja" APNS 메시지
{
    "aps": {
        "alert": {
            "title": "タイトル",
            "body": "プッシュ・メッセージ"
        },
        "badge": 1
    },
    "customKey": "value"
}
"ko" TENCENT 메시지
 {
	"title": "제목",
	"body": "내용",
	"custom_content": {
		"customKey": "값"
	}
}
"ja" TENCENT 메시지
 {
	"title": "タイトル",
	"body": "プッシュ・メッセージ",
	"custom_content": {
		"customKey": "value"
	}
}
```
### 조회
#### 목록 조회
##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/messages?pageIndex={pageIndex}&pageSize={pageSize}&from={from}&to={to}&messageStatus={messageStatus}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| pageIndex | Optional, Number | 기본 값 0 |
| pageSize | Optional, Number | 기본 값 25, 최대 값 100 |
| from | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| to | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| messageStatus | Optional, String | 'READY', 'PROCESSING', 'COMPLETE', 'CANCEL_NO_TARGET', 'CANCEL_INVALID_CERTIFICATE', 'CANCEL_INVALID_MESSAGE', 'CANCEL_UNSUPPORTED_MESSAGE_TYPE', 'CANCEL_UNAUTHORIZED', 'CANCEL_UNKNOWN' |

##### Request Body
```
없음
```
##### Response Body
```json
{
    "header" : {
        "isSuccessful" : true,
        "resultCode": 0,
        "resultMessage" : "SUCCESS"
    },
    "messages" : [{
        "messageId" : 0,
        "messageIdString": "0",
        "target" : {
        "type" : "ALL"
        },
        "content" : {
            "default" : {
                "title": "title",
                "body": "body"
            }
        },
        "messageType" : "AD",
        "contact": "1588-1588",
        "removeGuide": "매뉴 > 설정",
        "timeToLive": 60,
        "createdDateTime": "2017-02-13T09:30:00.000+09:00",
        "completedDateTime": "2017-02-13T09:30:00.000+09:00",
        "targetCount": 1000,
		"sentCount": 1000,
        "messageStatus": "COMPLETE",
        "provisionedResourceId": "[a-zA-Z0-9]{16}"
    }],
    "toatalCount": 1
}
```

| Field | Usage | Description |
| - | - | - |
| createdDateTime | - | 메시지가 생성된 일시 (ISO 8601) |
| completedDateTime | - | 메시지 발송이 완료된 일시 (ISO 8601) |
| targetCount | - | 발송될 타겟 토큰 수 |
| sentCount | - | 실제 발송된 토큰 수 |
| provisionedResourceId | - | 메시지가 발송된 전용 리소스 아이디 |
| totalCount | - | 필터링된 전체 메시지  수 |

- "messageStatus" 필드는 메시지 상태를 나타낸다. 다음과 같은 상태가 있다.
    - READY: 메시지 발송 요청이 등록된 상태다.
    - PROCESSING: 메시지 생성이 끝나고, 대기 또는 발송 중이다.
    - COMPLETE: 메시지 발송이 완료된 상태다.
    - CANCEL_NO_TARGET: 메시지 발송 대상이 없어서 취소된 상태다. 다음과 같은 이유로 발송이 취소될 수 있다.  
 등록된 토큰이 없을 때  
 해당 Channel 또는 Uid가 없을 때  
 광고 푸시 메시지의 경우, 수신 동의한 사용자가 없을 때  
 야간 광고 푸시 메시지(21시 ~ 8시)의 경우, 야간 광고 수신 동의한 사용자가 없을 때  
 기존 등록된 토큰들이 삭제되어 토큰이 없을 때    
    - CANCEL_INVALID_CERTIFICATE: 인증서가 잘 못되어 취소된 상태다. 인증서 상태를 확인해야 한다.
    - CANCEL_INVALID_MESSAGE: 메시지 형식이 맞지않아 취소된 상태다.
    - CANCEL_UNSUPPORTED_MESSAGE_TYPE: 메시지 형식이 맞지않아 취소된 상태다.
    - CANCEL_UNAUTHORIZED: 인증서 인증 과정에서 실패한 상태다. 인증서 상태를 확인해야 한다.
    - CANCEL_UNKNOWN: 내부 오류가 발생한 상태다.

#### 단건 조회
##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/messages/{message-id}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| messageId | Required, Number | 메시지 아이디 |

##### Request Body
```
없음
```
##### Response Body
```json
{
    "message" : {
        "messageId" : 0,
        "messageIdString": "0",
        "target" : {
        "type" : "ALL"
        },
        "content" : {
            "default" : {
                "title": "title",
                "body": "body"
            }
        },
        "messageType" : "AD",
        "contact": "1588-1588",
        "removeGuide": "매뉴 > 설정",
        "timeToLive": 60,
        "createdDateTime": "2017-02-13T09:30:00.000+09:00",
        "completedDateTime": "2017-02-13T09:30:00.000+09:00",
        "targetCount": 1000,
        "messageStatus": "COMPLETE",
        "provisionedResourceId": "[a-zA-Z0-9]{16}"
    },
    "header" : {
        "isSuccessful" : true,
        "resultCode": 0,
        "resultMessage" : "SUCCESS"
    }
}
```

#### 실패한 메시지 목록 조회
발송에 실패한 메시지를 조회할 수 있다.
단, 토큰이 존재하지는 경우(INVALID_TOKEN)는 발송 실패로 판단하지 않는다.

##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/message-errors?messageId={messageId}&messageErrorType={messageErrorType}&messagErrorCause={messageErrorCause}&from={from}&to={to}
HEADER
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| messageId | Optional, Number | 메시지 아이디 |
| messageErrorType | Optional, String | 'CLIENT_ERROR', 'EXTERNAL_ERROR', 'INTERNAL_ERROR' |
| messageErrorCause | Optional, String | 'UNSUPPORTED_MESSAGE_TYPE', 'INVALID_MESSAGE', 'INVALID_CERTIFICATE', 'UNAUTHORIZED', 'EXPIRED_TIME_OUT', 'APNS_ERROR', 'GCM_ERROR', 'TENCENT_ERROR', 'AGENT_ERROR'  |
| from | Optional, DateTime String | 최근 30일 까지, 기본 값은 최근 7일 전 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| to | Optional, DateTime String | 최근 30일 까지, 기본 값은 현재 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |

##### Description
- messageErrorType와 messageErrorCause는 다음과 같은 뜻을 의미한다.
    - CLIENT_ERROR: 클라이언트의 잘못된 요청
        - UNSUPPORTED_MESSAGE_TYPE: 지원하지 않는 메시지 타입
        - INVALID_MESSAGE: 비정상적인 메시지
        - INVALID_CERTIFICATE: 인증서 만료 또는 인증서 정보가 옳바르지 않음
        - UNAUTHORIZED: 인증서 만료 또는 인증서 정보가 옳바르지 않음
    - EXTERNAL_ERROR: APNS, GCM, Tencent 등 푸시와 연결된 외부 서비스 오류
        - APNS_ERROR: APNS(iOS)로 발송실패
        - GCM_ERROR: GCM(Google)로 발송실패
        - TENCENT_ERROR: Tencent로 발송실패
    - INTERNAL_ERROR: 푸시 내부에서 발생한 오류
        - EXPIRED_TIME_OUT: 발송 지연으로 인한 메시지 유효 시간 만료
        - AGENT_ERROR: Agent 내부 오류로 인한 발송실패

##### Request Body
```
없음
```

##### Response Body
```
{
	"messageErrors" : [{
			"messageId" : 0,
			"messageIdString" : "0",
			"pushType" : "GCM",
			"messageErrorType" : "ClientError",
			"messageErrorCause" : "INVALID_CERTIFICATE",
			"payload" : {
				"data" : {
					"title" : "title",
					"body" : "body"
				}
			},
			"createdDateTime" : "2017-05-18T15:47:00.000+09:00",
			"tokens" : [{
					"uid" : "uid-1",
					"token" : "token-1"
				}
			]
		}
	],
	"header" : {
		"isSuccessful" : true,
		"resultCode" : 0,
		"resultMessage" : "Success."
	}
}
```
| Field | Usage | Description |
| - | - | - |
| messageId | - | 실패한 메시지 아이디 |
| messageIdString | - | 실패한 메시지 아이디 |
| pushType | - | 'GCM', 'APNS', 'TENCENT' |
| payload | - | 기기에 발송된 실제 메시지 내용 |
| tokens | - | 발송한 실패한 수신자의 uid와 token |

#### 메시지 수신, 확인 통계 조회
메시지 수신, 확인 수집(Message Delivery Receipt) 기능을 화성화 시키고, v1.4 이상 SDK를 적용하면 발송한 메시지에 대해 수신, 확인 정보를 확인할 수 있다.
수집된 정보를 통계 API로 조회할 수 있다. 기능은 [CONSOLE] > [Settings] 탭에서 활성화 시킬 수 있다.

##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/statistics/message-delivery-receipts?from={from}&to={to}&event={event}&messageId={messageId}
HEADER
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| from | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| to | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| event | Optional, String | 'sent', 'sentFailed', 'received', 'opened' |
| messageId | Optional, Number | 메시지 아이디 |

##### Request Body
```
없음
```

##### Response Body

```
{
	"messageDeliveryReceiptStatistics" : [{
			"dateTime" : "2016-07-11 17:50:00.00+9:00",
			"sent" : 13,
			"sentFailed": 0,
			"received" : 12,
			"opened" : 10
		}
	],
	"header" : {
		"isSuccessful" : true,
		"resultCode" : 0,
		"resultMessage" : "SUCCESS"
	}
}
```

| Field | Usage | Description |
| - | - | - |
| dateTime | Optional, DateTime String | ISO 8601 |
| sent | Optional, Number | 서버에서 발송한 수 |
| sentFailed | Optional, Number | 서버에서 발송 실패한 수 |
| received | Optional, Number | 기기에서 수신한 수 |
| opened | Optional, Number | 기기에서 사용자가 클릭해 오픈한 수 |

## 예약 메시지

### 생성
#### 예약 메시지 발송 스케줄 생성
##### Method, URL, Headers
```
POST /push/v2.0/appkeys/{appkey}/schedules
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |


##### Request Body

```json
{
	"type" : "EVERY_MONTH",
	"fromDate" : "2016-12-30",
	"toDate" : "2017-01-02",
	"times" : [
		"12:00",
		"17:00"
	],
	"days" : [
		1,
		15
    	],
 	"daysOfWeek": [
 		"SUNDAY",
 		"MONDAY"
  	]
}
```

| Field | Usage | Description |
| - | - | - |
| type | Required, String | 'EVERY_DAY' (매일), 'EVERY_WEEK' (매주), 'EVERY_MONTH' (매월) |
| fromDate | Required, Date String | 예약 메시지 시작 년월일 (YYYY-MM-DD) |
| toDate | Required, Date String | 예약 메시지 종료 년월일 (YYYY-MM-DD) |
| times | Required, Time String | 예약 메시지 발송 시분 (hh:mm) |
| days | Optional, Number Array | type이 'EVERY_MONTH'일 때 설정한다. (1, 2, ..., 31: 1일, 2일, ..., 31일) |
| daysOfWeek | Optional, String Array | type이 'EVERY_WEEK'일 때 설정한다. ('SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY') |

##### Response Body
```json
{
	"header" : {
		"resultCode" : 0,
		"resultMessage" : "SUCCESS",
		"isSuccessful" : true
	},
	"schedules" : [
		"2016-12-01T12:00",
		"2016-12-01T17:00",
		"2016-12-15T12:00",
		"2016-12-15T17:00",
		"2017-01-01T12:00",
		"2017-01-01T17:00",
		"2017-01-15T12:00",
		"2017-01-15T17:00",
		"2017-02-01T12:00",
		"2017-02-01T17:00",
		"2017-02-15T12:00",
		"2017-02-15T17:00"
	]
}
```

| Field | Usage | Description |
| - | - | - |
| schedules | - | 일시 (ISO 8601, e.g. YYYY-MM-DDThh:mm) |

#### 예약 메시지 생성
##### Method, URL, Headers
```
POST /push/v2.0/appkeys/{appkey}/reservations
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |

##### Request Body
```json
{
	"schedules" : [
		"2016-12-30T12:40",
		"2016-12-31T12:40"
	],
	"isLocalTime" : false,
	"target" : {
        "type" : "UID",
        "to": ["uid-1", "uid-2"]
    },
    "content" : {
        "default" : {
            "title": "title",
            "body": "body"
        }
    },
    "messageType" : "AD",
    "contact": "1588-1588",
    "removeGuide": "매뉴 > 설정",
    "timeToLiveMinute": 1,
	"provisionedResourceId": "id"
}
```

| Field | Usage | Description |
| - | - | - |
| schedules | Required, DateTime String Array | 예약 메시지 발송 스케줄 목록 |
| isLocalTime | Required, Boolean | 현지 시간 발송 여부 |

##### Response Body

```json
{
	"header" : {
		"resultCode" : 0,
		"resultMessage" : "SUCCESS",
		"isSuccessful" : true
	},
	"reservation" : {
		"reservationId": 666810348995587,
		"reservationIdString": "666810348995587"
	}
}
```

| Field | Usage | Description |
| - | - | - |
| reservationId | Number | 예약 메시지 아이디 |
| reservationIdString | String | 예약 메시지 아이디 문자열 |

### 조회
#### 목록 조회
##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/reservations?pageIndex={pageIndex}&pageSize={pageSize}&reservationStatus={reservationsStatus}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| pageIndex | Optional, Number | 기본 값 0 |
| pageSize | Optional, Number | 기본 값 25, 최대 값 100 |
| from | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| to | Optional, DateTime String | 최근 30일 까지 (ISO 8601, e.g. YYYY-MM-DDThh:mm:ss.SSSTZD) |
| reservationStatus | Optional, String | 'RESERVED', 'COMPLETE' |

##### Request Body
```
없음
```

##### Response Body

```json
{
	"header" : {
		"resultCode" : 0,
		"resultMessage" : "SUCCESS",
		"isSuccessful" : true
	},
	"reservations" : [{
			"reservationId" : 666810348995587,
			"reservationIdString" : "666810348995587",
			"schedules" : [{
					"scheduleId" : 2455708,
                    "scheduleIdString" : "2455708",
                    "reservationId" : 666810348995587,
                    "reservationIdString" : "666810348995587",
					"deliveryDateTime" : "2016-12-30T12:40:00.000+09:00",
					"timezoneOffset" : 0,
					"scheduleStatus" : "READY"
				}
			],
			"isLocalTime" : false,
			"target" : {
				"type" : "UID",
				"to" : [
					"uid"
				]
			},
			"content" : {
				"default" : {
					"title" : "default title",
					"body" : "default body"
				},
				"ko" : {
					"title" : "한국어 제목",
					"body" : "한국어 내용"
				}
			},
			"messageType" : "NOTIFICATION",
			"timeToLiveMinute" : 60,
			"createdDateTime" : "2016-12-30T10:34:40.000+09:00",
			"updatedDateTime" : "2016-12-30T10:34:40.000+09:00",
			"completedDateTime" : "2016-12-30T10:34:40.000+09:00",
			"reservationStatus" : "RESERVED"
		}
	],
    "totalCount" : 1
}

```

| Field | Usage | Description |
| - | - | - |
| reservationIdString | - | 예약 메시지 아이디 문자열 |
| createdDateTime | - | 예약 메시지 등록 일시 (ISO 8601) |
| updatedDateTime | - | 예약 메시지 수정 일시 (ISO 8601) |
| completedDateTime | - | 예약 메시지 발송 완료 일시, 완료가 안되었다면 현재 시간 표시 (ISO 8601) |
| reservationStatus | - | 'RESERVED', 'COMPLETED' |
| schedules.scheduleId | - | 예약 메시지 발송 스케줄 아이디 |
| schedules.scheduleIdString | - | 예약 메시지 발송 스케줄 아이디 문자열 |
| schedules.reservationIdString | - | 예약 메시지 발송 스케줄이 속한 예약 메시지 아이디 문자열 |
| schedules.deliveryDateTime | - | 예약 메시지 발송 일시 |
| schedules.timezoneOffset | - | 예약 메시지 발송 타임존, 현지 시간 발송시 설정 |
| schedules.scheduleStatus | - | 'READY', 'SENDING', 'CANCELED', 'DONE' 예약 메시지 발송 스케줄 상태 |
| totalCount | - | 등록된 전체 예약 메시지 수 |

#### 단건 조회
##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/reservations/{reservation-id}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

##### Request Body
```
없음
```

#### Response Body
```json
{
	"header" : {
		"resultCode" : 0,
		"resultMessage" : "SUCCESS",
		"isSuccessful" : true
	},
	"reservation" : {
		"reservationId" : 666810348995587,
		"reservationIdString" : "666810348995587",
		"schedules" : [{
                "scheduleId" : 2455708,
                "scheduleIdString" : "2455708",
                "reservationId" : 666810348995587,
                "reservationIdString" : "666810348995587",
				"deliveryDateTime" : "2016-12-30T12:40:00.000+09:00",
				"timezoneOffset" : 0,
				"scheduleStatus" : "READY"
			}
		],
		"isLocalTime" : false,
		"target" : {
			"type" : "UID",
			"to" : [
				"uid"
			]
		},
		"content" : {
			"default" : {
				"title" : "default title",
				"body" : "default body"
			},
			"ko" : {
				"title" : "한국어 제목",
				"body" : "한국어 내용"
			}
		},
		"messageType" : "NOTIFICATION",
		"timeToLiveMinute" : 60,
		"createdDateTime" : "2016-12-30T10:34:40.000+09:00",
		"updatedDateTime" : "2016-12-30T10:34:40.000+09:00",
		"completedDateTime" : "2016-12-30T10:34:40.000+09:00",
		"reservationStatus" : "RESERVED"
	}
}
```

| Field | Usage | Description |
| - | - | - |
| updatedDateTime | DateTime String | 예약 수정 일시(ISO 8601) |


#### 발송된 예약 메시지 조회
##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/reservations/{reservation-id}/messages?pageIndex={pageIndex}&pageSize={pageSize}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| reservationId | Required, Number | 예약 메시지 아이디 |
| pageIndex | Optional, Number | 기본 값 0 |
| pageSize | Optional, Number | 기본 값 25, 최대 값 100 |

##### Request Body
```
없음
```

##### Response Body
```
{
	"header" : {
		"resultCode" : 0,
		"resultMessage" : "success",
		"isSuccessful" : true
	},
	"messages" : [{
			"messageId" : 356125922591162,
			"messageIdString" : "356125922591162",
			"target" : {
				"type" : "ALL",
				"pushTypes" : ["GCM", "APNS", "APNS_SANDBOX", "TENCENT"]
			},
			"content" : {
				"default" : {
					"title" : "6시 55분 예약 메시지",
					"body" : "API v2"
				}
			},
			"messageType" : "NOTIFICATION",
			"createdDateTime" : "2017-04-05T18:55:00.000+09:00",
			"completedDateTime" : "2017-04-05T18:55:00.000+09:00",
			"targetCount" : 38,
			"sentCount" : 38,
			"messageStatus" : "COMPLETE"
		}
	],
	"totalCount" : 1
}
```

| Field | Usage | Description |
| - | - | - |
| totalCount | - | 발송된 전체 메시지  수 |


### 수정
#### 예약 메시지 수정
##### Method, URL, Headers
```
POST /push/v2.0/appkeys/{appkey}/reservations/{reservationId}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

##### Request Body
```json
{
	"schedules" : [
		"2016-12-30T10:05",
		"2016-12-31T12:40"
	],
	"target" : {
		"type" : "UID",
		"to" : [
			"uid"
		]
	},
	"content" : {
		"default" : {
			"title" : "default title",
			"body" : "default body"
		},
		"ko" : {
			"title" : "한국어 제목",
			"body" : "한국어 내용"
		}
	},
	"isLocalTime" : false,
	"messageType" : "NOTIFICATION"
}
```

##### Response Body
```json
{
	"header" : {
		"resultCode" : 0,
		"resultMessage" : "SUCCESS",
		"isSuccessful" : true
	}
}
```

### 삭제
#### 예약 메시지 삭제
##### Method, URL, Headers
```
DELETE /push/v2.0/appkeys/{appkey}/reservations?reservationIds={reservationId,}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| appkey | Required, String | Path Variable, 상품 이용시 발급 받은 앱키 |
| reservationIds | Required, Number Array | ','로 구분, e.g. reservationIds=1,2 |

##### Request Body
```
없음
```

##### Response Body
```json
{
	"header" : {
		"resultCode" : 0,
		"resultMessage" : "SUCCESS",
		"isSuccessful" : true
	}
}
```

## 태그

### 생성
#### 태그 생성
##### Method, URL, Headers
```
POST /push/v2.0/appkeys/{appkey}/tags
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```
##### Request Body

```json
{
    "tagName" :  "서른"
}
```

| Field | Usage | Description |
| - | - | - |
| tagName | Required, String | 태그 이름, 최대 길이 32 |

##### Response Body
```json
{
    "header" : {
        "isSuccessful" :  true,
        "resultCode" :  0,
        "resultMessage" :  "SUCCESS"
    },
    "tag" : {
        "tagId" :  "12345678"
    }
}
```

| Field | Usage | Description |
| - | - | - |
| tagId | Required, String | 생성된 태그 아이디, 길이 8 |


#### 태그에 Uid 추가 생성
- 태그에 Uid를 추가(Append)하는 것으로, 기존에 있던 Uid를 추가하면 Uid의 태그는 늘어난다.
- 한 Uid의 최대 태그 수는 16개다.
##### Method, URL, Headers
```
POST /push/v2.0/appkeys/{appkey}/tags/{tag-id}/uids
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```
##### Request Body
```json
{
    "uids" : [
         "uid-01",
         "uid-02"
    ]
}
```
| Field | Usage | Description |
| - | - | - |
| uids | Required, String Array | Uid 배열, 최대 길이 16, Uid 최대 길이 64 |

##### Response Body
```json
{
    "header" : {
        "isSuccessful" :  true,
        "resultCode" :  0,
        "resultMessage" :  "SUCCESS"
    }
}
```

#### Uid에 태그 목록 설정
- Uid의 태그를 교체(Replace)하는 것으로, 기존에 설정된 태그는 삭제되고 새로운 태그로 설정된다.
##### Method, URL, Headers
```
POST /push/v2.0/appkeys/{appkey}/uids
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```
##### Request Body
```json
{
    "uid" :  "uid-01",
    "tagIds" : [
         "12345678",
         "23456789"
    ]
}
```

##### Response Body
```json
{
    "header" : {
        "isSuccessful" :  true,
        "resultCode" :  0,
        "resultMessage" :  "SUCCESS"
    }
}
```

### 조회
#### 태그 목록 조회
##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/tags
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```
##### Request Body
```
없음
```

##### Response Body
```json
{
    "header" : {
        "isSuccessful" :  true,
        "resultCode" :  0,
        "resultMessage" :  "SUCCESS"
    },
    "tags" : [
        {
            "tagId" :  "12345678",
            "tagName" :  "tagName",
            "createdDateTime" :  "2017-07-07T07:07:07.777+09:00",
            "updatedDateTime" :  "2017-07-07T07:07:07.777+09:00"
        }
    ]
}
```

| Field | Usage | Description |
| - | - | - |
| createdDateTime | Required, Date Time String | 생성 일시 (ISO 8601) |
| updatedDateTime | Required, Date Time String | 수정 일시 (ISO 8601) |

#### 태그 단건 조회
##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/tags/{tag-id}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```
##### Request Body
```
없음
```

##### Response Body
```json
{
    "header" : {
        "isSuccessful" :  true,
        "resultCode" :  0,
        "resultMessage" :  "SUCCESS"
    },
    "tag" : {
        "tagId" :  "12345678",
        "tagName" :  "서른",
        "createdDateTime" :  "2017-07-07T07:07:07.777+09:00",
        "updatedDateTime" :  "2017-07-07T07:07:07.777+09:00"
    }
}
```

#### 태그의 Uid 목록 조회
- 태그가 달린 Uid 목록을 조회한다.

##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/tags/{tag-id}/uids?offsetUid={uid}&limit={limit}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```

| Field | Usage | Description |
| - | - | - |
| offsetUid | Optional, String | 설정된 Uid 다음 부터 조회 |
| limit | Optional, Number | 조회할 Uid 수 |

##### Request Body
```
없음
```

##### Response Body
```json
{
    "header" : {
        "isSuccessful" :  true,
        "resultCode" :  0,
        "resultMessage" :  "SUCCESS"
    },
    "uids" : [
        {
            "uid" :  "uid-01",
            "tags" : [
                {
                    "tagId" :  "tag-id-01",
                    "tagName" :  "tag-name-01",
                    "createdDateTime" :  "2017-07-07T07:07:07.777+09:00",
                    "updatedDateTime" :  "2017-07-07T07:07:07.777+09:00"
                }
            ],
            "contacts" : [
                {   
                    "contactType" :  "TOKEN_GCM",
                    "contact" :  "token",
                    "createdDateTime" :  "2017-07-07T07:07:07.777+09:00"
                }
            ]
        }
    ]
}
```

| Field | Usage | Description |
| - | - | - |
| contacts | -, Object Array | Uid의 연락처, 토큰 정보 목록 |
| contactType | -, String | 토큰 타입, 'TOKEN_GCM', 'TOKEN_APNS', 'TOKEN_APNS_SANDBOX', 'TOKEN_TENCENT' |
| contact | -, String | 토큰 |
| createdDateTime | Required, Date Time String | 생성 일시 (ISO 8601) |

#### Uid 조회
- 태그에 등록된 Uid를 조회한다.
- 토큰 등록시 Contact(연락처)가 등록된다.
##### Method, URL, Headers
```
GET /push/v2.0/appkeys/{appkey}/uids/{uid}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```
##### Request Body
```
없음
```

##### Response Body
```json
{
"header" : {
"isSuccessful" :  true,
"resultCode" :  0,
"resultMessage" :  "SUCCESS"
},
"uid" : {
    "uid" :  "uid-01",
        "tags" : [
            {
                "tagId" :  "12345678",
                "tagName" :  "tag-name-01",
                "createdDateTime" :  "2017-07-07T07:07:07.777+09:00",
                "updatedDateTime" :  "2017-07-07T07:07:07.777+09:00"
            }
            ],
            "contacts" : [
            {
                "contactType" :  "TOKEN_GCM",
                "contact" :  "token",
                "createdDateTime" :  "2017-07-07T07:07:07.777+09:00"
            }
        ]
    }
}
```

### 수정
#### 태그 수정
##### Method, URL, Headers
```
PUT /push/v2.0/appkeys/{appkey}/tags/{tag-id}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```
##### Request Body
```json
{
    "tagName" :  "30대"
}
```

##### Response Body
```json
{
    "header" : {
        "isSuccessful" :  true,
        "resultCode" :  0,
        "resultMessage" :  "SUCCESS"
    }
}
```

### 삭제
#### 태그 삭제
##### Method, URL, Headers
```
DELETE /push/v2.0/appkeys/{appkey}/tags/{tag-id}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```
##### Request Body
```
없음
```

##### Response Body
```json
{
    "header" : {
        "isSuccessful" :  true,
        "resultCode" :  0,
        "resultMessage" :  "SUCCESS"
    }
}
```

#### Uid 삭제
- Uid 삭제시 Contact, Token도 같이 삭제된다.
##### Method, URL, Headers
```
DELETE /push/v2.0/appkeys/{appkey}/uids?uids={uid,}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```
##### Request Body
없음

##### Response Body
```json
{
    "header" : {
        "isSuccessful" :  true,
        "resultCode" :  0,
        "resultMessage" :  "SUCCESS"
    }
}
```

#### 태그의 Uid 삭제
- Tag와 Uid 관계만 삭제한다.
- Contact, Token이 삭제되진 않는다.
##### Method, URL, Headers
```
DELETE /push/v2.0/appkeys/{appkey}/tags/{tagId}/uids?uids={uid,}
Content-Type: application/json;charset=UTF-8
X-Secret-Key: [a-zA-Z0-9]{8}
```
##### Request Body
```
없음
```

##### Response Body
```json
{
    "header" : {
        "isSuccessful" :  true,
        "resultCode" :  0,
        "resultMessage" :  "SUCCESS"
    }
}
```

* *문서 수정 내역*
    * *(2017.08.24) v2.0 Token, Reservation API 설명 오류 수정*
    * *(2017.07.20) v2.0 Tag API Reference 추가*
    * *(2017.07.20) 실패한 메시지 조회 API 추가*
    * *(2017.04.25) v2.0 API Reference 추가*
    * *(2017.02.23) 토큰 조회 API 문서 보강*
