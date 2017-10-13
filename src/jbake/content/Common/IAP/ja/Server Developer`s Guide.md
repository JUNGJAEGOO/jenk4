title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > IAP > Server Developer's Guide

## Payment Consume API

사용자 애플리케이션 서버는 아이템을 지급하기 전에 IAP 서버에게 결제를 소비 할 것을 알려야 합니다. <br/>결제 1건당 1번만 결제소비 가능하며, 결제의 상태가 정상이 아니면 소비되지 않습니다. <br/>소비 (Consume) 하지 않은 결제내역은 SDK의 미소비 결제 내역조회 API를 통해 조회가능 합니다.

> [참고]  
> 결제 1건당 1번 소비 가능하며, 결제소비 하지 않은 결제는 IAP에서 아이템을 지급하지 않은 것으로 간주합니다.    
> 클라이언트는 소비 되지 않은 결제건을 일괄 조회할 수 있습니다.

### Request

[URL]

```http
POST https://api-iap.cloud.toast.com/inapp/v3/consume/{paymentSeq}/items/{itemSeq}
```

[Request Header]

| Property name | Value            |
| ------------- | ---------------- |
| Http Method   | POST             |
| Content-Type  | application/json |

[Path Parameter]

| 이름         | 자료형    | 설명                     |
| ---------- | ------ | ---------------------- |
| paymentSeq | String | 결제 번호                  |
| itemSeq    | Long   | Web Console에 등록된 아이템번호 |

[RequestBody]

| 이름            | 자료형    | 설명              |
| ------------- | ------ | --------------- |
| purchaseToken | String | 결제 검증을 위한 토큰 정보 |

[Example]

```http
POST https://api-iap.cloud.toast.com/inapp/v3/consume/2014090210002254/items/1032032

RequestBody
{
	"purchaseToken":"5PYSHgisiCU8BditHnDbPhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA=="
}
```

### Response

Response body에 JSON형태로 전달

[Example Response]

```json
{
    "header": {
        "resultCode": 0,
        "resultMessage": "request is successful",
        "isSuccessful": true
    },
    "result": {
        "price":1000.0,
        "currency":"KRW"
    }
}
```

[Header]

| Property name | Value   | Description             |
| ------------- | ------- | ----------------------- |
| isSuccessful  | Boolean | 결제소비가 정상적으로 됐는지 여부. <br/> API 가 성공적으로 요청 되었을 때 true <br/> 실패 했을 때 false |
| resultCode |  Integer |  결제소비 실패시 상세코드 |
| resultMessage |  String |  상세 메시지 |

[Result]

| Property name | Value  | Description       |
| ------------- | ------ | ----------------- |
| price         | long   | 결제소비가 완료된 결제건의 가격 |
| currency      | String | 결제소비가 완료된 결제건의 통화 |

[ResultCode]

| 값 | 설명             |
| - | -------------- |
| 0 | 성공적으로 완료한 결제 건 |

> [참고]  
> 그 외의 Result Code    
> Error Code 페이지 참조  

<br/>
> [참고]  
> 기존의 consume API v2는 호출은 가능하나 더 이상 사용되지 않을 예정입니다.


## Payment Consumable API

결제가 완료되었으나 소비 (consume) 되지 않은 결제내역을 SERVER API로 조회할 수 있습니다. <br/>해당 API로 미소비내역을 조회하여 소비되지 않은 내역들을 소비 (consume) 할 수 있습니다.

### Request

[URL]

```http
POST https://api-iap.cloud.toast.com/standard/inapp/v1/consumable/list
```

[Request Header]

| Property name | Value            |
| ------------- | ---------------- |
| Http Method   | POST             |
| Content-Type  | application/json |


[RequestBody]

| 이름            | 자료형    | 설명              |
| ------------- | ------ | --------------- |
| appSeq | Long | 웹콘솔에 등록된 APP ID |
| userChannel | String | 유저채널 <br/>(디폴트 : "GF") |
| userKey | String | 결제한 유저키 |

[Example]

```http
POST https://api-iap.cloud.toast.com/standard/inapp/v1/consumable/list

RequestBody
{
  "appSeq" : "1000272",
  "userChannel" : "GF",
  "userKey" : "tester"
}
```

### Response

Response body에 JSON형태로 전달

[Example Response]

```json
{
    "header":{
        "isSuccessful": true,
        "resultCode": 0,
        "resultMessage": "success"
    },
    "result":[
        {
        "paymentSeq": "2016122110023124",
        "itemSeq": 1000292,
        "currency": "KRW",
        "price": 1000,
        "purchaseToken": "oJgM1EfDRjnQY7yqhWCUVgAXsSxLWq698t8QyTzk3NeeSoytKxtKGjldTc1wkSktgzjsfkVTKE50DoGihsAvGQ"
        },
 
        {
        "paymentSeq": "2016122110023125",
        "itemSeq": 1000292,
        "currency": "KRW",
        "price": 1000,
        "purchaseToken": "7_3zXyNJub0FNLed3m9XRAAXsSxLWq698t8QyTzk3NeeSoytKxtKGjldTc1wkSktgzjsfkVTKE50DoGihsAvGQ"
        }
    ]
}

```

[Header]

| Property name | Value   | Description             |
| ------------- | ------- | ----------------------- |
| isSuccessful  | Boolean | 조회가 정상적으로 됐는지 여부. <br/> API 가 성공적으로 요청 되었을 때 true <br/> 실패 했을 때 false |
| resultCode |  Integer |  조회 실패시 상세코드 |
| resultMessage |  String |  상세 메시지 |

[Result]

| Property name | Value  | Description       |
| ------------- | ------ | ----------------- |
| paymentSeq |  String | 결제번호(PAYMENT ID) |
| itemSeq |  String |  웹콘솔에 등록된 ITEM ID |
| currency | Long |  결제 통화 |
| price |  String |  결제 가격 |
| purchaseToken |  String | 소비(consume)하기 위한 토큰정보 |

[ResultCode]

| 값 | 설명             |
| - | -------------- |
| 0 | 성공적으로 완료한 결제 건 |

> [참고]  
> 그 외의 Result Code    
> Error Code 페이지 참조  


## Item Search API

웹콘솔에서 APP ID에 등록된 ITEM을 조회합니다.

### Request

[URL]

```http
POST https://api-iap.cloud.toast.com/standard/item/list/{appSeq}

```

[Request Header]

| Property name | Value            |
| ------------- | ---------------- |
| Http Method   | GET             |

[Path Parameter]

| 이름         | 자료형    | 설명                     |
| ---------- | ------ | ---------------------- |
| appSeq    | Long   | Web Console에 등록된 아이템번호 |


[Example]

```http
POST https://api-iap.cloud.toast.com/standard/item/list/1000047
```

### Response

Response body에 JSON형태로 전달

[Example Response]

```json
{
    "header": {
        "isSuccessful": true,
        "resultCode": 0,
        "resultMessage": "success"
    },
    "result": {
        "appUsingStatus": "USE",
        "itemList": [
            {
                "itemSeq": 1000059,
                "itemName": "가스",
                "marketItemId": "gas",
                "usingStatus": "USE",
                "regYmdt": "2014-12-05 07:02:34",
                "appName": "Google 유니티 빌드 테스트 어플리케이션",
                "marketId": "GG"
            }
        ],
        "marketAppId": "com.nhnent.rich.smuggler",
        "appSeq": "1000047"
    }
}



```

[Header]

| Property name | Value   | Description             |
| ------------- | ------- | ----------------------- |
| isSuccessful  | Boolean | 조회가 정상적으로 됐는지 여부. <br/> API 가 성공적으로 요청 되었을 때 true <br/> 실패 했을 때 false |
| resultCode |  Integer | 아이템조회 실패시 상세코드 |
| resultMessage |  String |  상세 메시지 |

[Result]

| Property name | Value  | Description       |
| ------------- | ------ | ----------------- |
| appUsingStatus | String | 사용중 : "USE" , 미사용중 : "STOP" |
| itemList | List | 아이템정보를 담은 오브젝트의 리스트 |
| itemSeq | Long | 웹콘솔에 등록된 ITEM ID |
| itemName | String | 웹콘솔에 등록된 ITEM 이름 |
| marketItemId | String | 웹콘솔에 등록된 Store Item ID |
| usingStatus | String | 사용중 : "USE" , 미사용중 : "STOP" |
| regYmdt | String | ITEM 등록 일자 |
| appName | String | ITEM 의 앱명 |
| marketId | String | ITEM 의 마켓구분 <br/>구글 : "GG"<br/> 애플 : "AS" <br/>원스토어 : "TS" |
| marketAppId | String | 웹콘솔에 등록된 Store App ID |
| appSeq | Long | 웹콘솔에 등록된 App ID |

[ResultCode]

| 값 | 설명             |
| - | -------------- |
| 0 | 성공적으로 완료한 결제 건 |

> [참고]  
> 그 외의 Result Code    
> Error Code 페이지 참조  