title=About
date=2013-09-24
type=page
status=published
big=TCUpcoming
summary=CSDV's
~~~~~~
## Upcoming Products > CS & BBS > Developer's Guide

> ※ 본 문서는 alpha 개발 단계의 문서입니다.
> 사용에 관심이 있으신 분은 **support@cloud.toast.com**으로 문의해 주시기 바랍니다.

## 서비스별 카테고리 전체 리스트 가져오기

#### Request

[URL]

```
GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/categories
```

[Path Parameter]

|값|	타입|	설명|
|---|---|---|
|serviceCode|	String|	서비스코드|

[Response]

```
{
    "header": {
        "isSuccessful": boolean,
        "resultCode": int,
        "resultMessage": String
    },
    "body": {
        "categoryList": [{
            "categoryCode": String,
            "categoryName": String,
            "categoryType": String,
            "parentCategoryCode": String,
            "serviceCode": String,
            "sort": String,
            "depth": String,
            "categoryFullPath": String,
            "categoryFullPathName": String,
            "register": String,
            "registYmdt": long,
            "modifier": String,
            "modifyYmdt": long,
            "status": String,
            "language": String
         }]
    }
}
```

## 카테고리 코드의 하위 카테고리 리스트 가져오기

#### Request

[URL]

```
GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/categories/{
```

[Path Parameter]

|값|	타입|	설명|
|---|---|---|
|serviceCode|	String|	서비스코드|
|categoryCode|	String|	카테고리코드|

[Response]

```
{
    "header": {
        "isSuccessful": boolean,
        "resultCode": int,
        "resultMessage": String
    },
    "body": {
        "categoryList": [{
            "categoryCode": String,
            "categoryName": String,
            "categoryType": String,
            "parentCategoryCode": String,
            "serviceCode": String,
            "sort": String,
            "depth": String,
            "categoryFullPath": String,
            "categoryFullPathName": String,
            "register": String,
            "registYmdt": long,
            "modifier": String,
            "modifyYmdt": long,
            "status": String,
            "language": String
         }]
    }
}
```

## FAQ 리스트 조회하기

#### Request

[URL]

```
GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/categories/{categoryCode}/faqs?language={language}&pageNum={pageNum}&pageSize={pageSize}
```

[Path Parameter]

|값|	타입|	설명|
|---|---|---|
|serviceCode|	String|	서비스코드|
|categoryCode|	String|	카테고리코드|
|language|	String|	언어셋(KR,EN,CN,JP)|
|pageNum|	Integer|	페이지|
|pageSize|	Integer|	표시숫자|

[Response]

```
{
    "header": {
        "isSuccessful": boolean
        "resultCode": int,
        "resultMessage": String
    },
    "body": {
        "pageNum": int,
        "pageSize": int,
        "totalCount": int,
        "list": [
            {
                "faqCode": String,
                "categoryCode": String,
                "serviceCode": String,
                "title": String,
                "content": String,
                "sort": int,
                "register": String,
                "registYmdt": long,
                "modifier": String,
                "modifyYmdt": long,
                "categoryFullPathName": String,
                "open": boolean,
                "delete": boolean,
                "language": String,
                "openYn": String,
                "deleteYn": String,
                "status": String
            }
        ]
    }
}
```

## FAQ 단일 조회하기

#### Request

[URL]

```
GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/categories/{categoryCode}/faqs/{faqCode}
```

[Path Parameter]

|값|	타입|	설명|
|---|---|---|
|serviceCode|	String|	서비스코드|
|categoryCode|	String|	카테고리코드|
|faqCode|	String|	FAQ|

[Response]

```
{
    "header": {
        "isSuccessful": boolean
        "resultCode": int,
        "resultMessage": String
    },
    "body": {
        "faq": {
            "faqCode": String,
                "categoryCode": String,
                "serviceCode": String,
                "title": String,
                "content": String,
                "sort": int,
                "register": String,
                "registYmdt": long,
                "modifier": String,
                "modifyYmdt": long,
                "categoryFullPathName": String,
                "open": boolean,
                "delete": boolean,
                "language": String,
                "openYn": String,
                "deleteYn": String,
                "status": String
        }
    }
}
```

## FAQ 공지사항 리스트 조회하기

#### Request

[URL]

```
GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/notices?language={language}&pageNum={pageNum}&pageSize={pageSize}
```

[Path Parameter]

|값|	타입|	설명|
|---|---|---|
|serviceCode|	String|	서비스코드|
|categoryCode|	String|	카테고리코드|
|pageNum|	Integer|	페이지|
|pageSize|	Integer|	표시 수|

[Response]

```
{
    "header": {
        "isSuccessful": boolean,
        "resultCode": int,
        "resultMessage": String
    },
    "body": {
        "pageNum": int,
        "pageSize": int,
        "totalCount": int,
        "list": [
            {
                "noticeCode": String,
                "categoryCode": String,
                "serviceCode": String,
                "title": String,
                "content": String,
                "sort": int,
                "prioritySort": int,
                "register": String,
                "registYmdt": long,
                "modifier": String,
                "modifyYmdt": long,
                "status": String,
                "language": String,
                "deleteYn": boolean,
                "openYn": boolean
            }
        ]
    }
}
```

## 공지사항 단일 조회하기

#### Request

[URL]

```
GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/notices/{noticeCode}
```

[Path Parameter]

|값|	타입|	설명|
|---|---|---|
|serviceCode|	String|	서비스코드|
|noticeCode|	String|	공지사항 코드|

[Response]

```
{
    "header": {
        "isSuccessful": boolean,
        "resultCode": int,
        "resultMessage": String
    },
    "body": {
       "notice": {
                "noticeCode": String,
                "categoryCode": String,
                "serviceCode": String,
                "title": String,
                "content": String,
                "sort": int,
                "prioritySort": int,
                "register": String,
                "registYmdt": long,
                "modifier": String,
                "modifyYmdt": long,
                "status": String,
                "language": String,
                "deleteYn": boolean,
                "openYn": boolean
        }
    }
}
```

## 문의 등록하기

#### Request

[URL]

```
GET http://toastchannel.cloud.toast.comsimplecs.cloud.toast.com/api/v1/services/{serviceCode}/categories/{categoryCode}/inquiry
```

[Path Parameter]

|값|	타입|	설명|
|---|---|---|
|serviceCode|	String|	서비스코드|
|categoryCode|	String|	카테고리 코드|

[Response]

```
{"inquiryList":
 [
  {
    "inquiryTitle":String,
    "inquiryContent":String,
    "customerEmail":String
    "customerIp":String
  }
 ]
}
```

|값|	타입|	설명|
|---|---|---|
|inquiryTitle|	String|	문의 제목|
|inquiryContent|	String|	문의 내용|
|customerEmail|	String|	문의자 이메일|
|customerIp|	String|	문의자 아이피|

[Response]

```
{
    "header": {
        "isSuccessful": boolean,
        "resultCode": int,
        "resultMessage": String
    },
    "body": ""
}
```

## 안내문구 가져오기

#### Request

[URL]

```
GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/categories/{categoryCode}/inquiry/guideContent
```

[Path Parameter]

|값|	타입|	설명|
|---|---|---|
|serviceCode|	String|	서비스코드|
|categoryCode|	String|	카테고리코드|

[Response]

```
{
    "header": {
        "isSuccessful": boolean,
        "resultCode": int,
        "resultMessage": String
    },
    "body": {
        "guideContent": {
            "categoryCode": String,
            "content": String,
            "clearYN": String,
            "displayYN": String
        }
    }
}
```
