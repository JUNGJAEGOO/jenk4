title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > IAP > Server Developer's Guide

## Payment Consume API

用户应用服务器在支付项目前，向IAP服务器告知要消费的项目。每次只能进行1次结算消费，结算情况不正常的话将不能消费。未消费(Consume)的结算明细，可通过SDK的未消费结算明细查询API进行查询。

> [参考]<br>
> 结算 1次可消费 1次，未消费结算的结算被当作是在IAP上未支付项目。<br>
> 客户端可批量查询未消费的结算项。

### Request

[URL]

```
POST https://api-iap.cloud.toast.com/inapp/v3/consume/{paymentSeq}/items/{itemSeq}
```

[Request Header]

|Property name   |Value|
|--------------- | ------------------|
|Http Method    | POST|
|Content-Type   | application/json|

[Path Parameter]

|名称 |        资料类型  | 说明|
|------------ | ---------- | -----------------------------|
|paymentSeq |  String |    结算编号|
|itemSeq    |  Long  |     Web Console上注册的项目编号|

[RequestBody]

|名称           | 资料类型  | 说明|
|--------------- | ---------- | --------------------|
|purchaseToken |  String    | 检验结算的令牌信息|
                             

[Example]

```http
POST https://api-iap.cloud.toast.com/inapp/v3/consume/2014090210002254/items/1032032

RequestBody
{
	"purchaseToken":"5PYSHgisiCU8BditHnDbPhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA=="
}
```

### Response

在Response body上以JSON形态来传达

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

|Property name  | Value   |  Description|
| ------------- | ------- | ----------------------- |
|isSuccessful   | Boolean  | 结算消费是否正常，成功邀请API时为true，失败时为false|
|resultCode     | Integer  | 结算消费失败时的详细代码|
|resultMessage  | String  |  详细消息|

[Result]

|Property name |  Value |   Description|
| ------------- | ------- | ----------------------- |
|price  |         long   |  已完成消费的结算项的价格|
|currency  |      String  | 已完成消费的结算项的通货|
                           

[ResultCode]

|值  | 说明|
|---- | ------------------| 
|0   | 成功完成的结算项|

> [参考]<br>
> 其他的Result Code<br>
> 参照Error Code 页面。

<br>

> [参考]<br>
> 现存的consume API v2可进行呼叫，但将不再使用。

## Payment Consumable API

虽已完成结算，但是未消费(consume)的结算明细可用SERVER<br>
API进行查询。用该API查询未消费明细的话，可消费(consume)未消费的明细。

### Request

[URL]

```
POST https://api-iap.cloud.toast.com/standard/inapp/v1/consumable/list
```

[Request Header]

|Property name   |Value|
|--------------- | ------------------|
|Http Method     |POST|
|Content-Type    |application/json|
                  

[RequestBody]

|名称          | 资料类型 |   说明|
|------------- | ---------- | ---------------------------|
|appSeq     |   Long     |  Web控制台上注册的APP ID|
|userChannel |  String  |   用户频道 (Default : "GF")|
|userKey      | String |    结算的用户钥匙|
                           

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

在Response body上以JSON形态来传达

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

|Property name   |Value    | Description|
| ------------- | ------- | ----------------------- |
|isSuccessful   | Boolean  | 查询是否正常，成功邀请API时为true，失败时为false|
|resultCode     | Integer |  查询失败时的详细代码|
|resultMessage  | String |   详细消息|

[Result]

|Property name |  Value   | Description|
| ------------- | ------- | ----------------------- |
|paymentSeq    |  String   |结算编号(PAYMENT ID)|
|itemSeq       |  String  | Web控制台上注册的ITEM ID|
|currency      |  Long     |结算通货|
|price         |  String  | 结算价格|
|purchaseToken |  String |  为了消费(consume)而进行的令牌信息|

[ResultCode]

|值 |  说明|
|---- | ------------------|
|0 |   成功完成的结算项|

> [参考]<br>
> 其他的Result Code<br>
> 参照Error Code 页面。

## Item Search API

在Web控制台上查询注册于APP ID的ITEM。

### Request

[URL]

```
POST https://api-iap.cloud.toast.com/standard/item/list/{appSeq}
```

[Request Header]

| Property name   |Value|
|--------------- | -------|
|Http Method    | GET|

[Path Parameter]

|名称    | 资料类型  | 说明|
|-------- | ---------- | -----------------------------|
|appSeq |  Long      | 注册于Web Console的项目编号|

[Example]

```
POST https://api-iap.cloud.toast.com/standard/item/list/1000047
```

### Response

在Response body上以JSON形态来传达

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

|Property name  | Value     |Description|
| ------------- | ------- | ----------------------- |
|isSuccessful   | Boolean  | 确认查询是否正常，<br>成功邀请API时为true，<br>失败时为false|
|resultCode     | Integer  | 项目查询失败时的详细代码|
|resultMessage  | String   | 详细消息|

[Result]

|Property name    |Value    |Description|
| ------------- | ------- | ----------------------- |
|appUsingStatus|   String |  使用中 : "USE" , 未使用中 : "STOP"|
|itemList       |  List |    承载项目信息的目标清单|
|itemSeq        |  Long    | Web控制台上注册的ITEM ID|
|itemName       |  String |  Web控制台上注册的 ITEM 名称|
|marketItemId   |  String |  Web控制台上注册的Store Item ID|
|usingStatus    |  String |  使用中: "USE" , 未使用中 : "STOP"|
|regYmdt        |  String |  ITEM 注册日期|
|appName        |  String |  ITEM 的App名|
|marketId       |  String |  ITEM 的市场划分<br>Google : "GG" <br>苹果 : "AS" <br>ONE Store : "TS"|
|marketAppId   |   String |  Web控制台上注册的Store App ID|
|appSeq       |    Long   |  Web控制台上注册的App ID|

[ResultCode]

|值  | 说明|
|---- | ------------------|
|0|    成功完成的结算项|

> [参考]<br>
> 其他的Result Code<br>
> 参照Error Code 页面。
