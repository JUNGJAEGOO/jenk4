title=About
date=2013-09-24
type=page
status=published
big=TCGame
summary=TCGameLeaderboardDV's
~~~~~~
## Game > Leaderboard > Developer's Guide

Leaderboard API 는 REST API 형태로 다음 3가지 종류를 제공합니다.

#### Leaderboard 조회

- Factor 에 등록된 사용자 수
- 단일/다수 사용자 점수, 순위 조회
- 일정 범위의 전체 점수, 순위 조회

#### Leaderboard 등록

- 단일/다수 사용자 점수 등록

#### Leaderboard 삭제

- 단일/모든 사용자 Leaderboard 정보 삭제

> [주의]  
> API 사용을 하기 위해서는 반드시 팩터를 등록해야 합니다.  

## Leaderboard 조회


### Factor 에 등록된 사용자 수 조회

원하는 한개의 Factor 에 등록된 사용자의 수 를 조회하는 방법입니다.

[URL]

```
GET https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/user-count
```

[표 1] 단일 사용자 점수/순위 조회 URL 파라미터

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	Leaderboard AppKey|
|factor|	Int|	Leaderboard 팩터|

[표 2] 단일 사용자 점수/순위 조회 Query 파라미터

|이름|	자료형|	설명|
|---|---|---|
|transactionid|	Int64|	트랜잭션 ID|
|ispast|	Bool|	이전 Leaderboard 포함 여부 (입력하지 않을 시, 기본값은 False)|

[Example Request]

```
GET https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/user-count?transactionid=12345&ispast=false
```

[Example Response]

```
HTTP/1.1 200 OK
Content-Type: application/json

{
	"header": {
		"resultCode": 0,
		"resultMessage": "LEADERBOARD_OK",
		"isSuccessful": true
	},
	"transactionId": 0,
	"resultInfo": {
		"resultCode": 0,
		"totalCount": 7
	}
}
```

### 단일 사용자 점수/순위 조회

원하는 한 명의 사용자의 Leaderboard 정보를 조회할 수 있는 방법입니다.

[URL]

```
GET https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/users
```

[표 1] 단일 사용자 점수/순위 조회 URL 파라미터

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	Leaderboard AppKey|
|factor|	Int|	Leaderboard 팩터|

[표 2] 단일 사용자 점수/순위 조회 Query 파라미터

|이름|	자료형|	설명|
|---|---|---|
|userId|	String|	사용자 ID|
|transactionid|	Int64|	트랜잭션 ID|
|ispast|	Bool|	이전 Leaderboard 포함 여부 (입력하지 않을 시, 기본값은 False)|

[Example Request]

```
GET https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/users?userId={userId}&transactionid=12345&ispast=false
```

[Example Response]

```
HTTP/1.1 200 OK
Content-Type: application/json

{
	"header": {
		"resultCode": 0,
		"resultMessage": "LEADERBOARD_OK",
		"isSuccessful": true
	},
	"transactionId": 0,
	"userInfo": {
		"resultCode": 0,
		"userId": "user1",
		"score": 1000,
		"rank": 2,
		"preRank": 0,
		"extra": "extra Data1",
		"date": "2017-01-02T16:28:51+09:00"
	}
}
```

### 다수 사용자 점수/순위 조회

여러 사용자 Leaderboard 정보를 조회할 수 있는 방법입니다.

[URL]

```
POST https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/get-users
```

[표 3] 다수 사용자 점수/순위 조회 Body 파라미터

|이름|	자료형|	설명|
|---|---|---|
|transactionId|	Int64|	트랜잭션 ID|
|isPast|	Bool|	이전 Leaderboard 포함 여부 (입력하지 않을 시, 기본값은 False)|
|userIDsWithFactor|	List|	조회를 원하는 유저 리스트와 팩터의 리스트 |
|factor|	Int|	조희를 원하는 팩터 |
|userIds|	List|	조회를 원하는 유저 리스트 |

[Example Request]

```
POST https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/get-users
Content-Type: application/json
{
	"isPast": false,
	"transactionId": 12345,
	"userIDsWithFactor": [
		{
			"factor": 1,
			"userIds": ["user1", "user2", "user3" ]
		},
		{
			"factor": 2,
			"userIds": ["user4", "user5", "user6" ]
		}
	]
}

```

[Example Response]

```
HTTP/1.1 200 OK
Content-Type: application/json
{
	"header": {
		"resultCode": 0,
		"resultMessage": "LEADERBOARD_OK",
		"isSuccessful": true
	},
	"transactionId": 12345,
	"userInfosWithFactor": [
	{
		"resultCode": 0,
		"factor": 1,
		"userInfos": [
		{
			"resultCode": 0,
			"userId": "user1",
			"score": 1000,
			"rank": 2,
			"preRank": 0,
			"extra": "extra Data1",
			"date": "2017-01-02T16:42:31+09:00"
		},
		{
			"resultCode": 0,
			"userId": "user2",
			"score": 1100,
			"rank": 1,
			"preRank": 0,
			"extra": "extra Data2",
			"date": "2017-01-02T16:42:31+09:00"
		},
		{
			"resultCode": 462850,
			"userId": "user3",
			"score": 1100,
			"rank": 0,
			"preRank": 0,
			"extra": "",
			"date": "2017-01-02T16:42:31+09:00"
		}]
	},
	{
		"resultCode": 0,
		"factor": 2,
		"userInfos": [
		{
			"resultCode": 0,
			"userId": "user4",
			"score": 1200,
			"rank": 3,
			"preRank": 0,
			"extra": "extra Data4",
			"date": "2017-01-02T16:42:28+09:00"
		},
		{
			"resultCode": 0,
			"userId": "user5",
			"score": 1300,
			"rank": 2,
			"preRank": 0,
			"extra": "extra Data5",
			"date": "2017-01-02T16:42:28+09:00"
		},
		{
			"resultCode": 462850,
			"userId": "user6",
			"score": 1300,
			"rank": 0,
			"preRank": 0,
			"extra": "",
			"date": "2017-01-02T16:42:28+09:00"
		}]
	}]
}
```

### 일정 범위의 전체 점수/순위 조회

전체 순위 중에서 원하는 범위의 순위 정보를 조회할 수 있는 방법입니다.

[URL]

```
GET https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/users
```

[표 4] 일정 범위의 전체 점수/순위 조회 URL 파라미터

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	Leaderboard AppKey|
|factor|	Int|	팩터|

[표 5] 일정 범위의 전체 점수/순위 조회 Query 파라미터

|이름|	자료형|	설명|
|---|---|---|
|transactionid|	Int64|	트랜잭션 ID|
|ispast|	Bool|	이전 Leaderboard 포함 여부 (입력하지 않을 시, 기본값은 False)|
|start|	Int|	시작 순위|
|size|	Int|	가져올 Leaderboard 정보의 개수|

[Example Request]

```
GET https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/users?transactionid=12345&ispast=false&start=1&size=3
```

[Example Response]

```
HTTP/1.1 200 OK
Content-Type: application/json
{
	"header": {
		"resultCode": 0,
		"resultMessage": "LEADERBOARD_OK",
		"isSuccessful": true
	},
	"transactionId": 0,
	"userInfosByRange": {
		"resultCode": 0,
		"factor": 1,
		"userInfos": [
		{
			"resultCode": 0,
			"userId": "user2",
			"score": 1100,
			"rank": 1,
			"preRank": 0,
			"extra": "extra Data2",
			"date": "2017-01-02T16:42:28+09:00"
		},
		{
			"resultCode": 0,
			"userId": "user1",
			"score": 1000,
			"rank": 2,
			"preRank": 0,
			"extra": "extra Data1",
			"date": "2017-01-02T16:42:28+09:00"
		},
		{
			"resultCode": 0,
			"userId": "test4",
			"score": 200,
			"rank": 3,
			"preRank": 0,
			"extra": "extraData",
			"date": "2017-01-02T16:42:28+09:00"
		}]
}
```

## Leaderboard 등록

### 단일 사용자 점수 등록

원하는 한 명의 사용자 점수를 등록할 수 있는 방법입니다.

[URL]

```
POST https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/users/{userId}/score
```

[표 6] 단일 사용자 점수 등록 URL 파라미터

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	Leaderboard AppKey|
|factor|	Int|	팩터|
|userId|	String|	사용자 ID|

[표 7] 단일 사용자 점수 등록 Body 파라미터

|이름|	자료형|	설명|
|---|---|---|
|transactionId|	Int64|	트랜잭션 ID|
|score|	Int64|	사용자 점수|

[Example Request]

```
POST https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/users/{userId}/score
Content-Type: application/json

{
	"score": 10,
	"transactionId": 1234
}
```

[Example Response]

```
HTTP/1.1 200 OK
Content-Type: application/json

{
	"header": {
		"resultCode": 0,
		"resultMessage": "LEADERBOARD_OK",
		"isSuccessful": true
  	},
  	"transactionId": 1234,
  	"resultInfo": {
		"resultCode": 0,
		"userId": "test1"
  	}
}
```


### 단일 사용자 점수/ExtraData 등록

원하는 한 명의 사용자 점수와 Extra Data를 등록할 수 있는 방법입니다.

[URL]

```
POST https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/users/{userId}/score-with-extra
```

[표 6] 단일 사용자 점수 등록 URL 파라미터

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	Leaderboard AppKey|
|factor|	Int|	팩터|
|userId|	String|	사용자 ID|

[표 7] 단일 사용자 점수 등록 Body 파라미터

|이름|	자료형|	설명|
|---|---|---|
|transactionId|	Int64|	트랜잭션 ID|
|score|	Double|	사용자 점수|
|extra|	String|	사용자 Extra Data (최대 16Byte)|

[Example Request]

```
POST https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/users/{userId}/score-with-extra
Content-Type: application/json

{
	"extra": "extraData",
	"score": 200,
	"transactionId": 1234
}
```

[Example Response]

```
HTTP/1.1 200 OK
Content-Type: application/json

{
	"header": {
		"resultCode": 0,
		"resultMessage": "LEADERBOARD_OK",
		"isSuccessful": true
	},
	"transactionId": 1234,
	"resultInfo": {
		"resultCode": 0,
		"userId": "test4"
	}
}
```

### 다수 사용자 점수 등록

원하는 사용자들 점수를 등록할 수 있는 방법입니다.

[URL]

```
POST https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/scores
```

[표 8] 다수 사용자 Leaderboard 등록 Body 파라미터

|이름|	자료형|	설명|
|---|---|---|
|transactionId|	Int64|	트랜잭션 ID|
|userScoresWithFactor|	List|	사용자 점수 리스트와 팩터의 리스트|
|factor | Int| 등록을 원하는 팩터|
|userScores| List| 등록을 원하는 사용자 ID/점수의 리스트|
|userId | String | 사용자 ID |
|score | Double | 사용자 점수 |

[Example Request]

```
POST https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/scores

Content-Type: application/json
{
	"transactionId": 12345,
  	"userScoresWithFactor": [
		{
			"factor": 1,
			"userScores": [
			{
				"score": 1000,
				"userId": "user1"
			},
			{
				"score": 1100,
				"userId": "user2"
			}]
		},
		{
			"factor": 2,
			"userScores": [
				{
				"score": 1200,
				"userId": "user4"
				},
				{
				"score": 1300,
				"userId": "user5"
				}]
		}
	]
}
```

[Example Response]

```
HTTP/1.1 200 OK
Content-Type: application/json

{
	"header": {
		"resultCode": 0,
		"resultMessage": "LEADERBOARD_OK",
		"isSuccessful": true
	},
	"transactionId": 12345,
	"resultInfosWithFactor": [
	{
		"resultCode": 0,
		"factor": 1,
		"resultInfos": [
			{
				"resultCode": 0,
				"userId": "user1"
			},
			{
				"resultCode": 0,
				"userId": "user2"
			}
		]
	},
	{
		"resultCode": 0,
		"factor": 2,
		"resultInfos": [
			{
				"resultCode": 0,
				"userId": "user4"
			},
			{
				"resultCode": 0,
				"userId": "user5"
			}
		]
	}]
}
```

### 다수 사용자 점수/ExtraData 등록

원하는 사용자들 점수와 Extra Data를 등록할 수 있는 방법입니다.

[URL]

```
POST https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/scores-with-extra
```

[표 8] 다수 사용자 Leaderboard 등록 Body 파라미터

|이름|	자료형|	설명|
|---|---|---|
|transactionId|	Int64|	트랜잭션 ID|
|userScoresWithFactor|	List|	사용자 점수 리스트와 팩터의 리스트|
|factor | Int| 등록을 원하는 팩터|
|userScores| List| 등록을 원하는 사용자 ID/점수의 리스트|
|userId | String | 사용자 ID |
|score | Double | 사용자 점수 |
|extra | String | 사용자 Extra Data (최대 16Byte) |

[Example Request]

```
POST https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/scores-with-extra

Content-Type: application/json
{
	"transactionId": 12345,
  	"userInfosWithFactor": [
	{
		"factor": 1,
		"userInfos": [
		{
			"score": 1000,
			"userId": "user1",
			"extra": "extra Data1"
		},
		{
			"score": 1100,
			"userId": "user2",
			"extra": "extra Data2"
		}]
	},
	{
		"factor": 2,
		"userInfos": [
		{
			"score": 1200,
			"userId": "user4",
			"extra": "extra Data4"
		},
		{
			"score": 1300,
			"userId": "user5",
			"extra": "extra Data5"
		}]
	}]
}
```

[Example Response]

```
HTTP/1.1 200 OK
Content-Type: application/json
{
	"header": {
		"resultCode": 0,
		"resultMessage": "LEADERBOARD_OK",
		"isSuccessful": true
	},
	"transactionId": 12345,
	"resultInfosWithFactor": [
	{
		"resultCode": 0,
		"factor": 1,
		"resultInfos": [
			{
				"resultCode": 0,
				"userId": "user1"
			},
			{
				"resultCode": 0,
				"userId": "user2"
			}
		]
	},
	{
		"resultCode": 0,
		"factor": 2,
		"resultInfos": [
			{
				"resultCode": 0,
				"userId": "user4"
			},
			{
				"resultCode": 0,
				"userId": "user5"
			}
		]
	}]
}
```

## Leaderboard 삭제

### 단일 사용자 Leaderboard정보 삭제

원하는 한 명의 사용자 Leaderboard정보를 삭제하는 방법입니다. 입력한 사용자 Leaderboard 정보가 삭제됩니다. 

[URL]

```
DELETE https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/users
```

[표 9] 다수 사용자 Leaderboard 삭제 URL 파라미터

|이름|	자료형|	설명|
|---|---|---|
|appkey|	String|	Leaderboard Service AppKey|
|Factor|	Int|	팩터|

[표 10] 다수 사용자 Leaderboard 삭제 Query 파라미터

|이름|	자료형|	설명|
|---|---|---|
|userid|	String|	사용자 ID|
|transactionid|	Int64|	트랜잭션 ID|
|ispast|	Bool|	이전 Leaderboard 포함 여부 (입력하지 않을 시, 기본값은 False)|

[Example Request]

```
DELETE https://api-leaderboard.cloud.toast.com/leaderboard/v2.0/appkeys/{appkey}/factors/{factor}/users?userId={userid}?transactionid=12345&ispast=false
```

[Example Response]

```
HTTP/1.1 200 OK
Content-Type: application/json

{
		"header": {
			"transactionId": 12345,
			"isSuccessful": true,
			"resultCode": 200,
			"resultMessage": "OK",
			"serviceCode": 1
		}
}
```

## 시각

사용자의 업데이트 시간은 RFC 3339 정의를 따릅니다.

> https://tools.ietf.org/html/rfc3339

## 에러 코드

[표 11]의 에러 코드는 Response body의 header/body에 있는 resultCode와 resultMessage의 의미를 설명합니다.  
header 에 있는 resultCode 에서 아래의 에러코드가 아닌  HTTP 에러 코드가 보이는 경우는 아래 [참고] 링크를 참고 부탁드립니다.

[표 11] 에러 코드  

|Result Code| Result Code(Hex) | Result Message |설명|
|---|---|---|---|
|0|	0x00000000 |LEADERBOARD_SUCCESS | 요청 성공.|
|1|	0x00000001 |LEADERBOARD_SUCCESS_BUT_NOT_UPDATE | 요청은 성공 했지만, 기존과 동일한 데이터가 들어와서 업데이트 하지 않음.|
|459777|	0x00070401 |LEADERBOARD_ERROR_APPKEY_VERIFIER | 앱키 인증 실패. |
|462849|	0x00071001 |LEADERBOARD_AP_ERROR_INITIALTIZE | 초기화 실패. |
|462850|	0x00071002 |LEADERBOARD_AP_ERROR_NOT_EXIST_USER | 등록되지 않은 사용자. |
|462851|	0x00071003 |LEADERBOARD_AP_ERROR_NOT_EXIST_FACTOR | 등록되지 않은 팩터.|
|462852|	0x00071004 |LEADERBOARD_AP_ERROR_NOT_EXIST_APPKEY | 등록되지 않은 앱키. |
|462853|	0x00071005 |LEADERBOARD_AP_ERROR_TOO_BIG_EXTRA | Extra Data 제한 길이 초과. |
|462854|	0x00071006 |LEADERBOARD_AP_ERROR_WRONG_RANGE | 잘못된 범위. |
|462855|	0x00071007 |LEADERBOARD_AP_ERROR_WRONG_PARAM | 잘못된 파라메터. |
|463000|	0x00071098 |LEADERBOARD_AP_ERROR_SYSTEM | 시스템 에러.|
|463001|	0x00071099 |LEADERBOARD_AP_ERROR_UNKOWN | 미확인 에러.|


> [참고]  
> 그 외 일반적인 에러 코드에 대한 추가 정보는 다음 링크에서 확인하기 바랍니다.   
> http://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml  

## 주의 사항
- 모든 API 사용을 하기 위해서는 상품 활성화 후 팩터를 등록해야 합니다.  
- Leaderboard API 는 Server에서 호출 하는 것을 권장하고, Client 에서의 호출은 권장하고 있지 않습니다.


