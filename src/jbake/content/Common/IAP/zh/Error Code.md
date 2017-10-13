title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > IAP > Error Code Guide

## Client API 错误类型

| 错误 代码  | 类型 |                             说明|
|----------- |  --------------------------------- | ----------------------------------------------------|
|100       |  NETWORK_TIMEOUT                |  网络错误|
|101       |  AUTHORIZATION_ERROR            |  平台认证错误|
|102       |  UNSUPPORTED_DEVICE             |  不支持的设备|
|103       |  UNSUPPORTED_MARKET             |  不支持的Store|
|104       |  USER_CANCEL                    |  用户在结算途中取消的情况|
|105       |  IAP_INITIALIZED_ERROR         |  IAP初始化错误的情况，确认初始化信息。|
|106       |  IAP_SERVER_UNKNOWN_ERROR     |  IAP 服务器不是HTTP Response 20x而是HTTP Status时|
|107       |  IAP_RESPONSE_ON_FAILED       |  IAP API的response失败|
|108       |  INAPP_INITIALIZED_ERROR       |  Store结算库初始化错误|
|109       |  INAPP_PURCHASE_ERROR          |  Store结算错误 – 请求购买时|
|110       |  INAPP_VERIFY_SIGNATURE_ERROR |  Store结算错误 – 检验签名时|
|111       |  INAPP_CONSUME_ERROR           |  Store结算错误 – 消耗结算明细时|
|112       |  INAPP_VERIFY_CONSUME_ERROR   |  Store结算检验错误 – 检验收据时|
|113       |  SERVER_NETWORK_FAIL           |  IAP 服务器 NETWORK 错误|
|116       |  APP_STORE_REMAINS_PAYMENT    |  以前的结算未进行处理（需向用户显示再次购买诱导信息|

## Server API 错误类型

|错误代码  |  类型  |                                说明|
|---------- | ------------------------------------- | ------------|
|1100  |     INVALID_PARAMETERS                  | 参数信息错误|
|2111  |     HTTP_CONTENT_TYPE_NOT_SUPPORT    | Content-Type 错误 – 请求Request 时，Content-Type不是 application/json的情况|
|2112  |     HTTP_REQUEST_METHOD_NOT_SUPPORT  | HTTP Method 错误 – 请求Request 时，用错误的HTTP Method进行请求时|
|5000  |     CONSUME_FAILED                      | Consume 失败|

## Web Console 错误类型

|错误代码  | 类型                             |  说明|
|---------- | ---------------------------------- | ---------------------|
|1100  |     INVALID_PARAMETERS                |参数信息错误|
|5003  |     INVALID_AUTHENTICATED             |Store验证信息错误|
|5013  |     MARKET_GOOGLE_INVALID_REQUEST   |Google 关联信息错误|

## touble Shooting

|错误代码  |   说明|
|-|-|
|1100      |   参数信息错误|
|2111, 2112  | 在IAP Server上请求Request时，确认 Content-type, HTTP Method。[链接](./Server Developer`s Guide)|
|5003, 5013  | 确认一下，用以下步骤是否能获得Store关联信息。<br> [链接](./Store interlocking information)|
|5000       |  - 确认PurchaseToken的正确与否。<br>- 确认一下，先前通过客户端进行的结算是否进行的不错。|
