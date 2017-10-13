title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Upcoming Products &gt; CS & BBS &gt; Developer's Guide
------------------------------------------------------

> ※ This document contains the process of alpha development. For those who are interested in use, please contact **support@cloud.toast.com**.

Retrieve All Category List for Services
---------------------------------------

#### Request

\[URL\]

    GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/categories

\[Path Parameter\]

| Value       | Type   | Description  |
|-------------|--------|--------------|
| serviceCode | String | Service code |

\[Response\]

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

Retrieve Subordinate Category List of Category Code
---------------------------------------------------

#### Request

\[URL\]

    GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/categories/{

\[Path Parameter\]

| Value        | Type   | Description   |
|--------------|--------|---------------|
| serviceCode  | String | Service code  |
| categoryCode | String | Category code |

\[Response\]

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

Look up FAQ List
----------------

#### Request

\[URL\]

    GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/categories/{categoryCode}/faqs?language={language}&pageNum={pageNum}&pageSize={pageSize}

\[Path Parameter\]

| Value        | Type    | Description                |
|--------------|---------|----------------------------|
| serviceCode  | String  | Service code               |
| categoryCode | String  | Category code              |
| language     | String  | Language set (KR,EN,CN,JP) |
| pageNum      | Integer | Page                       |
| pageSize     | Integer | Indicated number           |

\[Response\]

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

Look up FAQ Only
----------------

#### Request

\[URL\]

    GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/categories/{categoryCode}/faqs/{faqCode}

\[Path Parameter\]

| Value        | Type   | Description   |
|--------------|--------|---------------|
| serviceCode  | String | Service code  |
| categoryCode | String | Category code |
| faqCode      | String | FAQ           |

\[Response\]

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

Look up FAQ Notice List
-----------------------

#### Request

\[URL\]

    GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/notices?language={language}&pageNum={pageNum}&pageSize={pageSize}

\[Path Parameter\]

| Value        | Type    | Description       |
|--------------|---------|-------------------|
| serviceCode  | String  | Service code      |
| categoryCode | String  | Category code     |
| pageNum      | Integer | Page              |
| pageSize     | Integer | Indication number |

\[Response\]

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

Look up Notice Only
-------------------

#### Request

\[URL\]

    GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/notices/{noticeCode}

\[Path Parameter\]

| Value       | Type   | Description  |
|-------------|--------|--------------|
| serviceCode | String | Service code |
| noticeCode  | String | Notice code  |

\[Response\]

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

Register Inquires
-----------------

#### Request

\[URL\]

    GET http://toastchannel.cloud.toast.comsimplecs.cloud.toast.com/api/v1/services/{serviceCode}/categories/{categoryCode}/inquiry

\[Path Parameter\]

| Value        | Type   | Description   |
|--------------|--------|---------------|
| serviceCode  | String | Service code  |
| categoryCode | String | Category code |

\[Response\]

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

| Value          | Type   | Description     |
|----------------|--------|-----------------|
| inquiryTitle   | String | Inquiry title   |
| inquiryContent | String | Inquiry content |
| customerEmail  | String | Customer email  |
| customerIp     | String | Customer IP     |

\[Response\]

    {
        "header": {
            "isSuccessful": boolean,
            "resultCode": int,
            "resultMessage": String
        },
        "body": ""
    }

Retrieve Words of Guidance
--------------------------

#### Request

\[URL\]

    GET http://toastchannel.cloud.toast.com/api/v1/services/{serviceCode}/categories/{categoryCode}/inquiry/guideContent

\[Path Parameter\]

| Value        | Type   | Description   |
|--------------|--------|---------------|
| serviceCode  | String | Service code  |
| categoryCode | String | Category code |

\[Response\]

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
