title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Common &gt; IAP &gt; Server Developer's Guide
---------------------------------------------

Payment Consume API
-------------------

User application server must notify if the payment will be consumed to the IAP server before supplying the item. Only 1 payment consume is available for each payment, and if the payment status is not normal, it will not be consumed. Payment history that is not consumed can be retrieved through API of unconsumed payment history in SDK.

> \[Note\]
> Only 1 consume is available for 1 payment, and payments that are not payment consumed will be considered as items not supplied in IAP.
> Client can retrieve all payments that are not consumed.

### Request

\[URL\]

    POST https://api-iap.cloud.toast.com/inapp/v3/consume/{paymentSeq}/items/{itemSeq}

\[Request Header\]

| Property name | Value            |
|---------------|------------------|
| Http Method   | POST             |
| Content-Type  | application/json |

\[Path Parameter\]

| Name       | Data type | Description                           |
|------------|-----------|---------------------------------------|
| paymentSeq | String    | Payment number                        |
| itemSeq    | Long      | Item number registered in Web Console |

\[RequestBody\]

| Name          | Data type | Description                                |
|---------------|-----------|--------------------------------------------|
| purchaseToken | String    | Token information for payment verification |

\[Example\]

    POST https://api-iap.cloud.toast.com/inapp/v3/consume/2014090210002254/items/1032032

    RequestBody
    {
        "purchaseToken":"5PYSHgisiCU8BditHnDbPhmlS/0DSt4JDs2UMyg1/EY8oC6Q8qkuw5VBo7GNrBYLNUy656GCAh7h9e1BtXeoBA=="
    }

### Response

Send in JSON format to Response body

\[Example Response\]

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

\[Header\]

| Property name | Value   | Description                                                                                                  |
|---------------|---------|--------------------------------------------------------------------------------------------------------------|
| isSuccessful  | Boolean | Whether the payment consume is successful or not. When API is successfully requested true, when failed false |
| resultCode    | Integer | Detailed code for payment consume failure                                                                    |
| resultMessage | String  | Detailed message                                                                                             |

\[Result\]

| Property name | Value  | Description                           |
|---------------|--------|---------------------------------------|
| price         | long   | Price of completed payment consume    |
| currency      | String | Currency of completed payment consume |

\[ResultCode\]

| Value | Description                  |
|-------|------------------------------|
| 0     | Number of successful payment |

> \[Note\]
> For other Result Code
> Refer to Error Code page

&gt; \[Note\]
&gt; Old consume API v2 can be called but it will no longer be used.
