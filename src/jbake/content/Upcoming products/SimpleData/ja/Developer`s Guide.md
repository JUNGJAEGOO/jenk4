title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Upcoming Products > SimpleData > Developer's Guide

> ※ 본 문서는 alpha 개발 단계의 문서입니다.
> 사용에 관심이 있으신 분은 \*\*support@cloud.toast.com**으로 문의해 주시기 바랍니다.

## 사용 조건

|조건명|	값|
|---|---|
|Class 최대 생성 개수|	50개|
|Object 최대 생성 개수|	없음|
|Property 최대 생성 개수|	Class 1개 당 50개|
|Class Name 조건|	최대 문자열 길이 32 자 이내 <br/> 첫글자는 반드시 영문 대소문자 및 숫자이되 \_-.문자 사용 가능.|
|Object Name 조건|	최대 문자열 길이 64 자 이내 <br/> 첫글자는 반드시 영문 대소문자 및 숫자이되 \_-.문자 사용 가능.|
|Property Key 조건|	최대 문자열 길이 32 자 이내 <br/> 첫글자는 반드시 영문 대소문자 및 숫자이되 \_-.문자 사용 가능.|
|Property Value 조건|	최대 문자열 길이 512 자 이내 <br/> 문자 형식 제한 없음.|

## Restful API 리스트

### 모든 Class 정보 가져오기.

[Request]

```
method : GET
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes
```

[Response]

```
content-type : application/json;charset-utf8
body :
{
  "header" : {
      "resultCode": 0,
      "resultMessage": "SUCCESS"
      "isSuccessful": true
  },
  "result" : {
      classNameString : {
          "state" : "CREATED or DELETED"
      },
      ...
  }
}
```

### Class 정보 가져오기.

[Request]
```
method : GET
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}
```

[Response]

```
content-type :
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        },
        "result" : {
            "state" : "CREATED or DELETED",
            "properties" : {
                propertyKeyString : {
                    "type" : "TEXT",
                    "state" : "CREATED or DELETED"
                },
                ...
            }
        }
    }
```

### Class 생성하기.

[Request]

```
method : POST
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        }
    }
```

### Class 삭제하기.

[Request]

```
method : DELETE
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        }
    }
```

### Property Key 목록 가져오기.

[Request]

```
method : GET
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/properties
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        },
        "result" : [
            propertyKeyString,
            ...
        ]
    }
```

### 한 번에 여러개의 Property 정보 가져오기.

[Request]

```
method : GET
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/properties?key={propertyKey1}&key=...
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        },
        "result" : {
            propertyKeyString : {
                "state" : "CREATED or DELETED",
                "type" : "TEXT"
            },
            ...
        }
    }
```

### Property 생성하기.

[Request]

```
method : POST
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/properties/{propertyKey}
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        }
    }
```

### Property 삭제하기.

[Request]

```
method : DELETE
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/properties/{propertyKey}
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        }
    }
```

### Object Name 리스트 가져오기. (최대 10000개 및 비정렬 목록)

[Request]

```
method : GET
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        },
        "result" : [
            objectNameString,
            ...
        ]
    }
```

### 한 번에 여러개의 Object 정보 가져오기. (최대 10000개 및 비정렬 목록)

[Request]

```
method : GET
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects?name={objectName1}&name=...
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        },
        "result" : {
            objectNameString : {
                "__created" : String,
                "__updated" : String,
                propertyKeyString : propetyValueString,
                ...
            },
            ...
        }
    }
```

### 한 번에 여러개의 Object 삭제하기.

[Request]

```
method : DELETE
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects?name={objectName1}&name=...
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        }
    }
```

### Object 내용 가져오기.

[Request]

```
method : GET
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        },
        "result" : {
            "__created" : String,
            "__updated" : String,
            propertyKeyString : propertyValueString,
            ...
        }
    }
```

### Object 생성하기.

[Request]

```
method : POST
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}
body :
    {
        "properties" : {
            propertyKeyString : propertyValueString,
            ...
        }
    }
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        }
    }
```

### Object 내용 수정하기.

[Request]

```
method : PUT
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}
body :
    {
        "properties" : {
            propertyKeyString : propertyValueString,
            ...
        }
    }
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        }
    }
```

### Object 삭제하기.

[Request]

```
method : DELETE
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        }
    }
```

### 한 번에 여러개의 Property Value 가져오기.

[Request]

```
method : GET
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}/properties?key={propertyKey1}&key=...
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        },
        "result" : {
                propertyKeyString : propertyValueString,
                ...
            }
    }
```

### Property Value 가져오기.

[Request]

```
method : GET
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}/properties/{properkeyKey}
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        },
        "result" : propertyValueString
    }
```

### Property Value 수정하기.

[Request]

```
method : PUT
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}/properties/{propertyKey}
body :
    {
        "propertyValue" : String
    }
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        }
    }
```

### Property Value 삭제하기.

[Request]

```
method : DELETE
url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}/properties/{propertyKey}
```

[Response]

```
content-type : application/json;charset-utf8
body :
    {
        "header" : {
            "resultCode": 0,
            "resultMessage": "SUCCESS"
            "isSuccessful": true
        }
    }
```

## Response의 header 오류 메시지 종류

|resultMessage|	resultCode|	의미|
|---|---|---|
|Interal server exception.|-1|서버에서 의도치 않은 에러가 발생.|
|Invalid appkey.|-2|잘못된 앱키 사용 시 발생.|
|Class is not exists.|-12002|클래스가 존재하지 않음.|
|Class is already exists.|-12004|같은 이름의 클래스가 이미 존재함.|
|Class is already disabled.|-12005|현재 해당 클래스의 모든 데이터를 삭제중인 상태이므로 조작할 수 없음.|
|Class name don't have to empty.|-12006|클래스 이름을 빈문자열로 사용할 수 없음.|
|Invalid class name length.|-12007|유효하지 않은 길이의 클래스 이름.|
|Invalid class name pattern.|-12009|유효하지 않은 형식의 클래스 이름.|
|Property key is not exists.|-13002|해당 프로퍼티 키가 존재하지 않음.|
|Property key is already exists.|-13004|같은 이름의 프로퍼티 키가 이미 존재.|
|Property key is already disabled.|-13005|해당 프로퍼티 키 삭제가 모든 오브젝트에 대해 적용중이므로 조작할 수 없음.|
|Property key don't have to empty.|-13006|해당 클래스의 프로퍼티 키 허용 개수 초과.|
|Invalid property key length.|-13007|유효하지 않은 길이의 프로퍼티 키 이름.|
|Invalid property key pattern.|-13009|유효하지 않은 형식의 프로퍼티 키 이름.|
|Object is not exists.|-14002|오브젝트가 존재하지 않음.|
|Object is already exists.|-14003|같은 이름의 오브젝트가 이미 존재함.|
|Object name don't have to empty.|-14004|오브젝트 이름을 빈문자열로 사용할 수 없음.|
|Invalid object name length.|-14005|유효하지 않은 길이의 오브젝트 이름.|
|Invalid object name pattern.|-14006|유효하지 않은 형식의 오브젝트 이름.|
|Invalid objects number.|-14008|유효하지 않은 숫자의 오브젝트를 호출.|
|Invalid property value length.|-15002|유효하지 않은 길이의 프로퍼티 값.|