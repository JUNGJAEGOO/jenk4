title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Upcoming Products> Spell Checker > Developer's Guide

> ※ 본 문서는 alpha 개발 단계의 문서입니다.
> 사용에 관심이 있으신 분은 **support@cloud.toast.com**으로 문의해 주시기 바랍니다.

## 오탈자 검사하기

맞춤법 검사기 API를 이하의 방법으로 적절히 호출하여 입력 질의에서 오탈자를 검사하고 교정어를 추천받습니다. 이 때 입력 질의에는 500자 제한이 있으며, 500자가 넘는 입력 질의는 별다른 경고 없이 잘려서 처리됩니다. 때문에 UI 부분에서 입력 문장을 500자 이상 입력하지 못하도록 제한할 필요가 있습니다. 발견된 오탈자는 입력 질의에서 등장하는 순서대로 정렬되어 있으며, 각 오탈자의 추천어들은 맞춤법 검사기가 판단한 가장 적합한 추천어 순으로 정렬되어 있습니다.  
맞춤법 검사기는 영문 및 기타 언어의 오탈자 검사를 지원하지 않습니다.

[URL]

```
POST http://api-spell-checker.cloud.toast.com/spell-checker/v1.0/appkeys/{appkey}/corrections
```

[Path Parameters]

| 값 | 타입 | 설명 |
|:---|:---|:---|
| appkey | String | AppKey |

[Request]

```
{
    "query": String,
    "maxSuggestion": int
}
```

| 이름 | 타입 | 설명 |
|:---|:---|:---|
| query | String | 질의 (최대 500자) |
| maxSuggestion | int | 반환 받을 추천 교정어의 최대 개수 (값 범위: 0~16) |

[Response]

```
{
    "header": {
        "isSuccessful": boolean,
        "resultCode": int,
        "resultMessage": String
    },
    "body": {
        "query": String,
        "maxSuggestion": int,
        "errata" : [
            {
                "erratum": String,
                "position": int,
                "length": int,
                "suggestions": [
                    {
                        "suggestion": String,
                        "type": int
                    },
                    ...
                ]
            },
            ...
        ],
        "elapsedTime": int
    }
}
```

| 이름 | 타입 | 설명 |
|:---|:---|:---|
| query | String | 질의 |
| maxSuggestion | int | 추천 교정어 최대 개수 (값 범위: 0~16) |
| errata | List | 검사된 오탈자 목록 |
| erratum | String | 검사된 오탈자 |
| position | int | 오탈자의 바이트 시작 위치 |
| length | int | 오탈자의 바이트 길이 (문자 당 길이: 영문 - 1, 한글 - 3) |
| suggestions | List | 오탈자의 교정 추천어 목록 (추천 랭킹 오름차순 정렬) |
| suggestion | String | 오탈자의 교정 추천어 |
| type | int | 추천어의 교정 방식<br>1: 띄어쓰기<br>2: 맞춤법<br>3: 사전 추천어 |
| elaspedTime | int | api 오탈자 분석 소요 시간 |


## 응답속도를 높이기 위한 가이드

입력 질의의 500자 길이 제한은 맞춤법 검사기의 처리 성능이 입력 문장의 길이 및 오탈자의 개수와 밀접한 연관이 있는 점을 감안해 설정한 것입니다. 검사 문장이 짧을 수록 성능 면에서 유리하기 때문에, 500자 제한이 있지만 그보다 짧은 입력 유도를 권해드립니다. 예를 들어 전체 문장을 받아 한 번에 맞춤법 검사를 실행해 주는 방법보다는, 문장을 입력받을 때마다 실시간으로, 또는 주기적으로 문장을 부분적으로 끊어서 검사하는 방법으로 프로그램을 설계하시는 편이 성능 면에서 더 유리합니다.