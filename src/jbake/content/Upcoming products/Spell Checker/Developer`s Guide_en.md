title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Upcoming Products&gt; Spell Checker &gt; Developer's Guide
----------------------------------------------------------

> ※ This document contains information on alpha development in process. For those who are interested in use, please contact **support@cloud.toast.com**.

Spelling Check
--------------

Search for typos in the input query and get word suggestions by adequately calling Spell checker API through the below method. Notice, there is a 500 letter limit in the input, and the input over 500 letters will be cut off without any warnings. Therefore, UI needs to be restricted to enter no more than 500 letters in the input sentence. Typos found will be sorted in the order of appearance in the input query, and the word suggestions for each typo will be in the order of the most appropriate word suggestions according to the Spell checker.
Spelling check does not support typos in English or other languages.

\[URL\]

    POST http://api-spell-checker.cloud.toast.com/spell-checker/v1.0/appkeys/{appkey}/corrections

\[Path Parameters\]

| Value  | Type   | Description |
|--------|--------|-------------|
| appkey | String | AppKey      |

\[Request\]

    {
        "query": String,
        "maxSuggestion": int
    }

| Name          | Type   | Description                                                        |
|---------------|--------|--------------------------------------------------------------------|
| query         | String | Inquiry (Maximum 500 letters)                                      |
| maxSuggestion | int    | Maximum number of recommended words for return (Value range: 0~16) |

\[Response\]

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

| Name          | Type   | Description                                                                            |
|---------------|--------|----------------------------------------------------------------------------------------|
| query         | String | Inquiry                                                                                |
| maxSuggestion | int    | Max number of recommendation words (value range: 0~16)                                 |
| errata        | List   | Examined typo list                                                                     |
| erratum       | String | Examined typo                                                                          |
| position      | int    | Typo’s start location of byte                                                          |
| length        | int    | Typo’s byte length (Length per letter: English - 1, Korean - 3)                        |
| suggestions   | List   | List of recommended words for typos (Recommendation ranking ascending order)           |
| suggestion    | String | Recommended words for typos                                                            |
| type          | int    | Correction method of recommended words 1: space2: spelling3: dictionary recommendation |
| elaspedTime   | int    | api time required for typo analysis                                                    |

A Guide to Speed up the Response
--------------------------------

A 500 letter limit in the input query is created considering the Spell Checker’s close connection with the length of input sentence and the number of typos. Although there is a 500 letter limit, an input shorter than the limit is recommended because the shorter the sentence is, the more effective it is. For example, rather than running a spell check for a whole sentence, it is better to develop the program to check the sentence live every time an input is received or check parts of a sentence from time to time for the best performance.
