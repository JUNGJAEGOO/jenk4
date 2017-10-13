title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > IAP > Error Code Guide

## Client API Errors

| Error Code | Type | Description |
| ---------- | ----- | ----- |
| 100 |  NETWORK_TIMEOUT |  Network timeout |
| 101 |  AUTHORIZATION_ERROR |  store authorization error|
| 102 |  UNSUPPORTED_DEVICE |  not supported device|
| 103 |  UNSUPPORTED_MARKET |  not supported store|
| 104 |  USER_CANCEL |  user cancels during payment process|
| 105 |  IAP_INITIALIZED_ERROR | When IAP initialization is not valid, check initialization information. |
| 106 |  IAP_SERVER_UNKNOWN_ERROR |   When iap server returns others, not HTTP 200 status |
| 107 |  IAP_RESPONSE_ON_FAILED |  IAP server response fail |
| 108 |  INAPP_INITIALIZED_ERROR |  store iap library initialization error |
| 109 |  INAPP_PURCHASE_ERROR |  store fail when requesting payment |
| 110 |  INAPP_VERIFY_SIGNATURE_ERROR |  fail when verifying store receipt signature |
| 111 |  INAPP_CONSUME_ERROR |  store fail when consuming|
| 112 |  INAPP_VERIFY_CONSUME_ERROR |  fail when verifying store receipt signature |
| 113 |	 SERVER_NETWORK_FAIL | IAP server Network error |
| 116 |	 APP_STORE_REMAINS_PAYMENT | clear remained payments (you should show repurchase message to user.) |
| 117 |  IAP_IN_PROGRESS_ERROR | When an IAP API is still in process, an error may occur when a new request comes in, and the client can ignore or re-request as needed. |

## Server API Errors

| Error Code | Type | Description |
|---|---|---|
|1100|	INVALID_PARAMETERS|	invalid parameter|
|2111|	HTTP_CONTENT_TYPE_NOT_SUPPORT|	 HTTP Request Content-Type is not application/json.|
|2112|	HTTP_REQUEST_METHOD_NOT_SUPPORT| not supported HTTP METHOD|
|5000|	CONSUME_FAILED|	Consume fail|

## Web Console Errors

| Error Code | Type | Description |
|---|---|---|
|1100|	INVALID_PARAMETERS|	invalid parameter|
|5003|	INVALID_AUTHENTICATED|	Store authentication error|
|5013|	MARKET_GOOGLE_INVALID_REQUEST|	Google Registeration error|

## Trouble Shooting

|Error Code|	Description|
|---|---|
|1100|	invalid parameter|
|2111, 2112|	When sending request to IAP server, check Content-type and HTTP Method.<br/> [Link](./Server Developer`s Guide) |
|5003, 5013|	Check if store sync information is issued in following steps. <br/> [Link](./Store interlocking information) |
|5000| - Check if PurchaseToken is valid. <br/> - Check if payment via client was well processed|
