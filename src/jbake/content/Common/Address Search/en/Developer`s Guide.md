title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > Address Search > Developer's Guide

## 주소 검색하기

질의에 일치하는 주소 정보를 최대 100건까지 반환합니다. 검색된 주소 정보는 사용자 질의와 가장 유사한 순서로 정렬되어 있습니다. 따라서, totalCount 가 100 이상인 경우에는 사용자에게 좀 더 구체적이고 상세한 주소를 질의로 입력할 것을 안내하는 것이 좋습니다.

### 좋은 질의의 예

삼평동 629: 동(洞)과 번지수를 입력하면 정확한 주소를 찾을 수 있습니다.   
성남시 대왕판교로645번길 16: 도로명과 건물번호를 입력하면 정확한 주소를 찾을 수 있습니다.    
동천마을동문굿모닝힐5차: 건물이름도 검색이 가능합니다.    
동천동 동문5차: 동이름과 건물이름을 함께 입력해서 검색할 수도 있습니다.  

### 좋지 않은 질의의 예

경기도 성남시 분당구 삼평동: 비교적 상세하나 번지수가 지정되지 않아, 삼평동의 모든 주소를 반환합니다.    
대왕판교로: 건물 번호가 지정되지 않아, 해당 도로 주변의 모든 주소를 반환합니다.   
정자동: 정자동의 모든 주소를 반환합니다.  

[URL]

```http
    GET http://api-address.cloud.toast.com/address/v1/appkeys/{appkey}/addresses?q={query}&startRank={startRank}&returnCount={returnCount}
```

[Path Parameters]

| 값      | 타입     | 설명     |
| ------ | ------ | ------ |
| appkey | String | AppKey |

[Query Parameters]

Query Parameters 설명

| 값           | 타입     | 설명                                         |
| ----------- | ------ | ------------------------------------------ |
| q           | String | 질의                                         |
| startRank   | String | 몇 번째 검색결과부터 반환할 것인지를 지정. 기본값은 1, 최대값은 1000 |
| returnCount | String | 몇 개의 검색결과를 반환할 것인지를 지정. 기본값은 100, 최대값은 100 |

[Response]

```json
{
   "header": {
       "isSuccessful": boolean,
       "resultCode": int,
       "resultMessage": String
   },
   "body": {
       "query": String,
       "totalCount": int,
       "addresses" : [
           {
               "roadAddress": String,
               "roadAddressExtra": String,
               "roadAddressEnglish": String,
               "jibunAddress": String,
               "relatedJibun": String,
               "dongCode": String,
               "roadCode": String,
               "buildingCode": String,
               "zipCode": String,
               "oldZipCode": String
           },
           ...
       ],
       "groupByState": [
           {
               "state": String,
               "count": int
           },
          ...
       ],
       "startRank": int,
       "returnCount": int
   }
}
```

| 이름                                                                                 | 타입     | 설명                                |
| ---------------------------------------------------------------------------------- | ------ | --------------------------------- |
| query                                                                              | String | 질의                                |
| totalCount                                                                         | int    | 검색된 주소의 총 갯수                      |
| addresses                                                                          | List   | 검색된 주소들의 목록                       |
| roadAddress                                                                        | String | 기본 도로명주소                          |
| roadAddressExtra                                                                   | String | 도로명주소의 참고 항목                      |
| roadAddressEnglish                                                                 | String | 영문 도로명주소                          |
| jibunAddress                                                                       | String | 지번주소                              |
| relatedJibun                                                                       | String | 관련지번                              |
| dongCode                                                                           | String | 법정동코드                             |
| roadCode                                                                           | String | 도로명코드                             |
| buildingCode                                                                       | String | 건물관리번호                            |
| zipCode                                                                            | String | 새 우편번호                            |
| oldZipCode                                                                         | String | 기존 우편번호 <br/>  (※ 2015년 8월 1일 이후 추가/변경된 건물은 행정자치부가 기존 6자리 우편번호를 제공하지 않음. 이 경우, 본 필드는 '000-000'을 반환) |
| groupByState                                                                       | List   | 검색된 주소 개수를 시/도 단위로 묶은 결과 목록       |
| state                                                                              | String | 묶은 시/도 이름                         |
| count                                                                              | int    | 묶은 시/도 각각의 개수                     |
| startRank                                                                          | int    | 반환된 주소의 시작 등수                     |
| returnCount                                                                        | int    | 반환된 주소의 총 개수. totalCount보다 작거나 같음 |
