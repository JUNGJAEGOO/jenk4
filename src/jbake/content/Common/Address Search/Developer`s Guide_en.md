title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Common &gt; Address Search &gt; Developer's Guide
-------------------------------------------------

Search Address
--------------

Up to 100 addresses information that matches the query will be returned. Retrieved address information will be in the order of most similar to the user’s query. Therefore, if totalCount is over 100, it is better to guide the user to enter the address in specific detail for the query.

### Example of a good query

Sampyeong-dong 629: You can find specific address upon entering dong and the street number.
Seongnam-si Daewangpangyo-ro 645beon-gil 16: You can find specific address upon entering the road name and the building number.
Dongcheon Maeul Dongmun Goodmorning Hill 5 Cha: You can search the building name too.
Dongcheon-dong Dongmun 5 Cha: You can search by entering both dong name and the building name.

### Example of an improper query

Gyeonggi-do Seongnam-si Bundang-gu Sampyeong-dong: Return all addresses in Sampyeong-dong as lot number is not designated though it is relatively in detail.
Daewangpangyo-ro: Return all addresses near the road as the building number is not designated.
Jeongja-dong: Return all addresses in Jeongja-dong.

\[URL\]

        GET http://api-address.cloud.toast.com/address/v1/appkeys/{appkey}/addresses?q={query}&startRank={startRank}&returnCount={returnCount}

\[Path Parameters\]

| Value  | Type   | Description |
|--------|--------|-------------|
| appkey | String | AppKey      |

\[Query Parameters\]

Query Parameters Description

| Value       | Type   | Description                                                                                            |
|-------------|--------|--------------------------------------------------------------------------------------------------------|
| q           | String | Query                                                                                                  |
| startRank   | String | Designate starting from which search results will be returned. Basic value is 1, maximum value is 1000 |
| returnCount | String | Designate how many search results will be returned. Basic value is 100, maximum value is 100           |

\[Response\]

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

| Name               | Type   | Description                                                                                                                                                                                   |
|--------------------|--------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| query              | String | Query                                                                                                                                                                                         |
| totalCount         | int    | Total number of address retrieved                                                                                                                                                             |
| addresses          | List   | List of addresses retrieved                                                                                                                                                                   |
| roadAddress        | String | Basic road name address                                                                                                                                                                       |
| roadAddressExtra   | String | Reference items for road name address                                                                                                                                                         |
| roadAddressEnglish | String | Road name address in English                                                                                                                                                                  |
| jibunAddress       | String | Lot address                                                                                                                                                                                   |
| relatedJibun       | String | Related lot                                                                                                                                                                                   |
| dongCode           | String | Legal district code                                                                                                                                                                           |
| roadCode           | String | Road name code                                                                                                                                                                                |
| buildingCode       | String | Building management number                                                                                                                                                                    |
| zipCode            | String | New postal code                                                                                                                                                                               |
| oldZipCode         | String | Old postal code (※ The Ministry of the Interior does not offer previous 6 digit postal code for buildings added/changed after August 1, 2015. In this case, this field will return '000-000') |
| groupByState       | List   | Result list of number of retrieved addresses tied in the unit of cities/provinces                                                                                                             |
| state              | String | Names of tied cities/provinces                                                                                                                                                                |
| count              | int    | Number of each tied cities/provinces                                                                                                                                                          |
| startRank          | int    | Start rank of returned address                                                                                                                                                                |
| returnCount        | int    | Total number of address returned. Smaller than or same as totalCount                                                                                                                          |


