title=About
date=2013-09-24
type=page
status=published
big=TCGame
summary=TCGameLeaderboardDV'sEN
~~~~~~
Game &gt; LeaderBoard &gt; Developer's Guide
--------------------------------------------

Leaderboard API provides the following three types in REST API format.

#### Look up Leaderboard

-   Look up single/multiple users’ scores and ranking

-   Look up all scores and ranking in certain range

#### Register Leaderboard

-   Register single/multiple users’ scores

#### Delete Leaderboard

-   Delete single/all users’ Leaderboard information

> \[Notice\]
> Factor must be registered in order to use API.

Look Up Leaderboard
-------------------

### Look up single user’s score/ranking

A way to look up a desired user’s Leaderboard information.

\[URL\]

    GET https://api-ranking.cloud.toast.com/ranking/v3/api/appkey/{appkey}/factors/{factor}/users/{userId}/rank-info

\[Table 1\] Single user’s score/ranking look up URL parameter

| Name   | Data type | Description        |
|--------|-----------|--------------------|
| appkey | String    | Leaderboard AppKey |
| factor | Int       | Leaderboard Factor |
| userid | String    | User ID            |

\[Table 2\] Single user’s score/ranking look up Query parameter

| Name          | Data type | Description                                                                          |
|---------------|-----------|--------------------------------------------------------------------------------------|
| transactionid | Int64     | Transaction ID                                                                       |
| ispast        | Bool      | Whether to include previous Leaderboard (If not entered, the default value is False) |

\[Example Request\]

    GET https://api-ranking.cloud.toast.com/ranking/v3/api/appkey/{appkey}/factors/{factor}/users/{userid}/rank-info?transactionid=12345&ispast=false

\[Example Response\]

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
            "header": {
                "transactionId": 12345,
                "isSuccessful": true,
                "resultCode": 200,
                "resultMessage": "OK",
                "serviceCode": 1
            },

            "factor": 1,
            "userId": "user1234",
            "score": 1000,
            "rank": 2,
            "rankChange": 0,
            "lastUpdate": 1408599041
    }

### Look up multiple users’ scores/ranking

A way to look up multiple user’s Leaderboard information.

\[URL\]

    POST https://api-ranking.cloud.toast.com/ranking/v3/api/appkey/${appkey}/rank-infos/get

\[Table 3\] Multiple users’ score/ranking look up Body parameter

| Name          | Data type | Description                                                                          |
|---------------|-----------|--------------------------------------------------------------------------------------|
| transactionId | Int64     | Transaction ID                                                                       |
| isPast        | Bool      | Whether to include previous Leaderboard (If not entered, the default value is False) |
| userlist      | Vector    | List of users who want to look up                                                    |

\[Example Request\]

    POST https://api-ranking.cloud.toast.com/ranking/v3/api/appkey/${appkey}/rank-infos/get
    Content-Type: application/json
    {
            "transactionId": 12345,
            "isPast": false,
            "users": [
                {
                    "factor": 1,
                       "userIDList" : ["user1000", "user1001", "user1002"]            
                },
                {
                    "factor": 2,
                       "userIDList" : ["user2000", "user2001", "user2002"]            
                }
            ]
    }

\[Example Response\]

    HTTP/1.1 200 OK
    Content-Type: application/json
    {
            "header": {
                "transactionId": 12345,
                "isSuccessful": true,
                "resultCode": 200,
                "resultMessage": "OK",
                "serviceCode": 1
            },
            "rankInfos": [
                {
                "factor": 1,
                    "totalSize" : 2,
                    "userRankInfoList" : [
                            {
                                "userId" : "user1000",
                                "score" : 1200,
                                "rank" : 1,
                                "rankChange" : 0,
                                "lastUpdate" : 1408599041
                        },
                            {
                                "userId" : "user1001",
                                "score" : 1100,
                                "rank" : 2,
                                "rankChange" : 0,
                                "lastUpdate" : 1408599042
                        }
                    ]           
                },
                {
                "factor": 2,
                    "totalSize" : 1,
                    "userRankInfoList" : [
                            {
                                "userId" : "user2000",
                                "score" : 2200,
                                "rank" : 1,
                                "rankChange" : 0,
                                "lastUpdate" : 1408599041
                        }                   
                    ]           
                }
            ]
    }

### Look up all scores/ranking in certain range

A way to look up ranking information in desired range out of all rankings.

\[URL\]

    GET https://api-ranking.cloud.toast.com/ranking/v3/api/appkey/{appkey}/factors/{factor}/rank-infos

\[Table 4\] All scores/ranking in certain range look up URL parameter

| Name   | Data type | Description        |
|--------|-----------|--------------------|
| appkey | String    | Leaderboard AppKey |
| factor | Int       | Factor             |

\[Table 5\] All scores/ranking in certain range look up Query parameter

| Name          | Data type | Description                                                                          |
|---------------|-----------|--------------------------------------------------------------------------------------|
| transactionid | Int64     | Transaction ID                                                                       |
| ispast        | Bool      | Whether to include previous Leaderboard (If not entered, the default value is False) |
| start         | Int       | Start ranking                                                                        |
| size          | Int       | Number of Leaderboard information to bring                                           |

\[Example Request\]

    GET https://api-ranking.cloud.toast.com/ranking/v3/api/ appkey/{appkey}/factors/{factor}/rank-infos?transactionid=12345&ispast=false&start=1&size=3

\[Example Response\]

    HTTP/1.1 200 OK
    Content-Type: application/json
    {
        "header": {
                "transactionId": 12345,
                "isSuccessful": true,
                "resultCode": 200,
                "resultMessage": "OK",
                "serviceCode": 1
        },
        "userRankInfoList": [
                {

                       "factor": 1,
                       "userId": "user0000",
                       "score": 1100,
                       "rank": 1,
                       "rankChange": 0,
                       "lastUpdate": 1408599990
                },
                {

                       "factor": 1,
                       "userId": "user1234",
                       "score": 1000,
                       "rank": 2,
                       "rankChange": 0,
                       "lastUpdate": 1408599041
                },
                {

                       "factor": 1,
                       "userId": "user0001",
                       "score": 900,
                       "rank": 3,
                       "rankChange": 0,
                       "lastUpdate": 1408589468
                }
        ],
        "totalSize": 1000
    }

Register Leaderboard
--------------------

### Register single user’s score

A way to register a desired user’s score.

\[URL\]

    POST https://api-ranking.cloud.toast.com/ranking/v3/api/appkey/{appkey}/factors/{factor}/users/{userid}/score

\[Table 6\] Single user’s score registration URL parameter

| Name   | Data type | Description        |
|--------|-----------|--------------------|
| appkey | String    | Leaderboard AppKey |
| factor | Int       | Factor             |
| userid | String    | User ID            |

\[Table 7\] Single user’s score registration Body parameter

| Name          | Data type | Description    |
|---------------|-----------|----------------|
| transactionId | Int64     | Transaction ID |
| score         | Int64     | User’s score   |

\[Example Request\]

    POST https://api-ranking.cloud.toast.com/ranking/v3/api/appkey/{appkey}/factors/{factor}/users/{userid}/score
    Content-Type: application/json

    {
            "transactionId": 12345,
            "score": 1005
    }

\[Example Response\]

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
            "header": {
                "transactionId": 12345,
                "isSuccessful": true,
                "resultCode": 200,
                "resultMessage": "OK",
                "serviceCode": 1
            }
    }

### Register multiple users Leaderboard

A way to register desired users scores.

\[URL\]

    POST https://api-ranking.cloud.toast.com/ranking/v3/api/appkey/${appkey}/scores

\[Table 8\] Multiple users Leaderboard registration Body parameter

| Name          | Data type | Description       |
|---------------|-----------|-------------------|
| transactionId | Int64     | Transaction ID    |
| scores        | Vector    | User’s score list |

\[Example Request\]

    POST https://api-ranking.cloud.toast.com/ranking/v3/api/appkey/${appkey}/scores

    Content-Type: application/json
    {
        "transactionId": 12345,
        "scores": [
        {
            "factor": 1,
            "userScoreList" : [
            {
                "userId": "user1000",
                "score": 1200
            },
            {
                "userId": "user1001",
                "score": 1100
            }
            ]
        },
        {
            "factor": 1,
            "userScoreList" : [
            {
                "userId": "user1000",
                "score": 1200
            }
            ]
        }
        ]
    }

\[Example Response\]

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
            "header": {
                    "transactionId": 12345,
                    "isSuccessful": true,
                    "resultCode": 200,
                    "resultMessage": "OK",
                    "serviceCode": 1
            }
    }

Delete Leaderboard
------------------

### Delete single user Leaderboard information

A way to delete a desired user’s Leaderboard information. Entered user’s Leaderboard information will be deleted. To delete all factors, request by inserting -1 in the factor value.

\[URL\]

    DELETE https://api-ranking.cloud.toast.com/ranking/v3/api/appkey/{appkey}/factors/{factor}/users/{userid}

\[Table 9\] Multiple users Leaderboard delete URL parameter

| Name   | Data type | Description                |
|--------|-----------|----------------------------|
| appkey | String    | Leaderboard Service AppKey |
| Factor | Int       | Factor                     |
| userid | String    | User ID                    |

\[Table 10\] Multiple users Leaderboard delete Query parameter

| Name          | Data type | Description                                                                          |
|---------------|-----------|--------------------------------------------------------------------------------------|
| transactionid | Int64     | Transaction ID                                                                       |
| ispast        | Bool      | Whether to include previous Leaderboard (If not entered, the default value is False) |

\[Example Request\]

    DELETE https://api-ranking.cloud.toast.com/ranking/v3/api/appkey/{appkey}/factors/{factor}/users/{userid}?transactionid=12345&ispast=false

\[Example Response\]

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
            "header": {
                "transactionId": 12345,
                "isSuccessful": true,
                "resultCode": 200,
                "resultMessage": "OK",
                "serviceCode": 1
            }
    }

Error Code
----------

Error codes in \[Table 11\] explain the meanings of resultCode and resultMessage in Response body’s header.

\[Table 11\] Error codes

| Result Code | Description                                             |
|-------------|---------------------------------------------------------|
| 200         | OK : Request succeeded                                  |
| 400         | Bad Request : In case of a wrong request                |
| 401         | Unauthorized : In case of an invalid Leaderboard AppKey |
| 404         | Not Found : In case requested resource cannot be found  |
| 501         | Not Implemented : In case data does not exist           |

> \[Note\]
> HTTP status code 400 occurs when it does not meet the API format.
> HTTP status code 200 and result code 400 occurs in case of correct API format but wrong value.
> Please check the following link for additional information on other general error codes.
> http://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
