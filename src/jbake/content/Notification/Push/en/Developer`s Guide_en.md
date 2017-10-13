title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Notification &gt; Push &gt; Developer's Guide
---------------------------------------------

Service Activation
------------------

Click \[CONSOLE\] &gt; \[Notification\] &gt; \[Push\] &gt; \[Use Product\] button

CONSOLE Guide
-------------

### Manage Token

#### Register

A token can be registered through Token registration API.

#### Modify

If a new token is issued, it will automatically modify to a new token upon when sending a message. Or it can be modified through Token registration API.

#### Delete

When sending a message, it will automatically delete any tokens that cannot be used if there is any. Deleted tokens can be obtained through feedback API.

### Authentication Certificate Management

#### Create And Bring GCM API Key

-   Move to \[[Google Developer Console](https://console.developers.google.com/project)\]

-   Click \[Create Project\] button, and create project

-   Set \[Select Project\] &gt; \[API\] &gt; \[Mobile API\] &gt; \[Cloud Messaging For Android\] as use

-   Click \[Select Project\] &gt; \[User Verification Information\] &gt; \[Add User Verification Information\] &gt; \[API key\]

-   Click \[Server Key\] &gt; Create (Allow Server IP Blank)

-   Select issued server type key &gt; Copy \[API Key\]

#### Register GCM API Key

-   Click \[CONSOLE\] &gt; \[Notification\] &gt; \[Push\] &gt; \[Certificates\] tap

-   Copy created GCM API Key from above and paste in \[GCM Push Credentials\] &gt; Click \[REGISTER\], registration is completed

#### Create And Bring APNS Authentication

-   In Mac, run \[Keychain\]

-   Click \[Access Chain\] &gt; \[Support Authentication\] &gt; \[Request Certificate To Certificate Agency\] button

-   Enter necessary information including Apple Developer ID in \[User Email Address\], select \[Saved In Disc\], select \[Save Personal Key Pair Information\], click \[Continue\]

-   In \[Key Pair Information\], select size of the key and algorithm then click \[Continue\], creating CSR(Certificate Signing Request)) file is completed

-   Move to \[[Apple Developer Certificates](https://developer.apple.com/account/ios/certificate/certificateList.action)\]

-   In \[Select Type\] &gt; \[Request\] &gt; \[Generate\], upload CSR file made in \[Keychain\], click \[Generate\] button

-   Create certificate and download is available (If there is not authority for download, get approval first)

-   Download certificate and select certificate in \[Keychain\] &gt; \[Certificate\]

-   Right click on the certificate, and select \['...' send\] in the menu

-   Click \[Save\] after selecting saving location

-   Enter password to protect the items sent then creating APNS certificate is now completed

#### Register APNS authentication certificate

-   Click \[CONSOLE\] &gt; \[Notification\] &gt; \[Push\] &gt; \[Certificates\] tab

-   Select \[Apple Push Certificates\] &gt; \[Certificates\] file &gt; Select APNS certificate

-   Enter certificate password in \[Password\]

-   Click \[REGISTER\], registration completed

#### Join Tencent

-   Connect to \[Tencent Push Service Homepage\].

-   Click 登录(Login) in upper right page.

-   Click 注册新帐号(Join) in lower right side of popup.

-   In \[Email Account\], enter everything including Email Account, Nickname, Password, Verification Code, and click \[Sign up now\].

-   Click \[Select Your Country/Region\] under \[Send Verification Code\].

-   Select 'South Korea 0082' in 'region', and enter the number in 010AAAABBBB format in 'Mobile Number'.

-   Enter the verification code and move onto the next step.

-   Confirm 'Activation Email' in the email account registered when joining, and process activation.

#### Register Tencent Application

-   After login, connect to \[Tencent Push Service Dashboard\].

-   Click 接入推送应用(register application) in the upper right page.

-   Enter 应用名称(application name).

-   Choose 所属分类(category).

-   Select Android in 应用平台(application platform), and register the package name.

-   Click 接入应用(create application).

#### Register Tencent ACCESS ID, SECRET KEY

-   After log in, connect to \[Tencent Push Service Dashboard\].

-   Click 应用统计(statistics), and go to application dashboard.

-   From the menu on the left, click 配置管理(setting) &gt; 应用配置(application setting). Check ACCESS ID, ACCESS KEY and SECRET KEY.

-   Return to TOAST CLOUD, move to \[CONSOLE\] &gt; \[Notification\] &gt; \[Push\] &gt; \[Certificates\] tab.

-   Enter ACCESS ID, SECRET KEY in checked \[Tencent Credential\].

### Manage channels

Click \[CONSOLE\] &gt; \[Notification\] &gt; \[Push\] &gt; \[Channels\] tab, and channels can be managed using \[ADD\], \[EDIT\] and \[DELETE\].

### Send immediately

Click \[CONSOLE\] &gt; \[Notification\] &gt; \[Push\] &gt; \[Messages\] tap &gt; \[Send\] button, and you can send a push message immediately.

Immediate send form is composed as follows.

| Name                           | Description                                                                                                                                                    |
|--------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target                         | Set up push message notifications.                                                                                                                             |
| Target &gt; To                 | Enter channel or UID. Target by clicking on the right \[channel/uid\] button, and switch to channel or UID. Enter multiple using a comma (',') as a separator. |
| Target &gt; Type               | Select one between ALL, CAHNNEL and UID. Enter multiple using a comma (',') as a separator.                                                                    |
| Target &gt; Channels, UIDs     | Enter multiple using a comma (',') as a separator.                                                                                                             |
| Target &gt; Countries          | Enter country code. Enter multiple using a comma (',') as a separator.                                                                                         |
| Target &gt; Push Types         | Select multiple between GCM, APNS, APNS Sandbox and Tencent.                                                                                                   |
| Option &gt; Time To Live       | Message transmission valid time. If transmission is delayed during the setup time, it will automatically be processed as failure. The unit in minutes.         |
| Option &gt; Message Per Second | Speed of message transmission. It starts from 0(infinity) to 20, and the unit in 1,000/sec.                                                                    |
| Message &gt; Editor Type       | SIMPLE, JSON There is two types. In case of JSON, the user can enter the message in person.                                                                    |
| Message &gt; Message Type      | NOTIFICATION and AD types are available. In case of AD, it is only sent to users who agreed to advertising push messages.                                      |

### Scheduled send

Click \[CONSOLE\] &gt; \[Notification\] &gt; \[Push\] &gt; \[Reservations\] tab, manage scheduled send using the \[ADD\], \[EDIT\], \[DELETE\] buttons.

Scheduled send form is composed as follows.

| Name             | Description                                                                                                                                                                                                                                                                                        |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Reservation Type | ONCE: one time EVERY\_DAY: A message is sent at the designated time between StartDate and EndDate. EVERY\_WEEK: A message is sent on the designated day of the week set in Reservation Condition. EVERY\_MONTH: A message is sent on the designated day of the month set in Reservation Condition. |
| Day of week      | Select the day of the week.                                                                                                                                                                                                                                                                        |
| Day of Month     | Enter the date using a comma (',') as a separator.                                                                                                                                                                                                                                                 |
| Reservation time | Enter the time to send the message. Time format is 'HH:mm'.                                                                                                                                                                                                                                        |
| Start Date       | Enter the start date to send the message. Select the date using the calendar. The format is 'YYYY-MM-DD'.                                                                                                                                                                                          |
| End Date         | Enter the last date to send the message. Select the date using the calendar. The format is 'YYYY-MM-DD'.                                                                                                                                                                                           |
| Local time       | If set true, the message is sent according to the local time.                                                                                                                                                                                                                                      |

API Reference
-------------

### API test

It can be done in \[CONSOLE\] &gt; \[Notification\] &gt; \[Push\] &gt; \[APIs\] tab.

### Secret Key

    Header
    X-Secret-Key: [a-zA-Z0-9]{8}

It can be created in \[CONSOLE\] &gt; \[Notification\] &gt; \[Push\] &gt; \[URL & AppKey\].

### Response

\[Response HTTP Status Code\]

200 OK.
Respond all API requests as 200 OK.
For detailed response result, refer to Header in Response Body.

\[Response Header\]

    {
        "header" : {
            "isSuccessful" : true,
            "resultCode": 0,
            "resultMessage" : "Success."
        }
    }

\[resultCode, resultMessage\]

| isSuccessful | resultCode    | resultMessage                                                                                                       |
|--------------|---------------|---------------------------------------------------------------------------------------------------------------------|
| true         | 0             | Success.                                                                                                            |
| false        | 40001         | Client Error. Wrong URI.                                                                                            |
| false        | 40002         | Client Error. Unavailable field value.                                                                              |
| false        | 40003         | Client Error. Bad request. Check your request parameter or body.                                                    |
| false        | 40004         | Client Error. Target length is exceeded. CHANNEL: 100, UID: 10,000.                                                 |
| false        | 40005         | Client Error. Content length is exceeded.                                                                           |
| false        | 40006         | Client Error. Wrong target format. Clound't read two target types at once. Send a target, channels or uids at once. |
| false        | 40007         | Client Error. Invalid certificate.                                                                                  |
| false        | 40008         | Client Error. Invalid APNS certificate.                                                                             |
| false        | 40009         | Client Error. Invalid APNS Sandbox certificate.                                                                     |
| false        | 40101         | Client Error. Permission denied. Access is not allowed.                                                             |
| false        | 40102         | Client Error. Unavailable appkey.                                                                                   |
| false        | 40402         | Client Error. No messages to send in body.                                                                          |
| false        | 40403         | Client Error. No target in body.                                                                                    |
| false        | 40404         | Client Error. Not found certificate.                                                                                |
| false        | 40405         | Client Error. Not found instance.                                                                                   |
| false        | 40406         | Client Error. Not found reservation.                                                                                |
| false        | 40407         | Client Error. Unavailable reservation.                                                                              |
| false        | 40408         | Client Error. Not found channel.                                                                                    |
| false        | 40409         | Client Error. Not found token.                                                                                      |
| false        | 40010         | Client Error. Invalid Tencent certificate.                                                                          |
| false        | 40011         | Client Error. Bad request. Check your content.                                                                      |
| false        | 40012         | Client Error. Expired APNS certificate.                                                                             |
| false        | 40013         | Client Error. Duplicate certificate.                                                                                |
| false        | 40014         | Client Error. Wrong message type. Check contact or removeGuide.                                                     |
| false        | 40015         | Client Error. Wrong reservationDays.                                                                                |
| false        | 50001 ~ 50501 | Internal Error. Please report this. 'http://cloud.toast.com/support/qaa'.                                           |

API v1.3 Reference
------------------

### Token

##### Register token

\[Method, URL\]

    POST https://api-push.cloud.toast.com/push/v1.3/appkey/{appkey}/tokens
    Content-Type: application/json;charset=UTF-8

\[Request Body\]

    {
      "channel": "default",
      "oldToken": "oldToken",
      "token": "token",
      "isNotificationAgreement": true,
      "isAdAgreement": true,
      "isNightAdAgreement": true,
      "pushType": "GCM",
      "timezoneId": "Asia/Seoul",
      "uid": "uid",
      "country": "KR",
      "language": "ko"
    }

\[Response Body\]

    {
        "header" : {
            "isSuccessful" : true or false,
            "resultCode": 0,
            "resultMessage" : "Success."
        }
    }

| Parameter               | Usage             |                                                                  |
|-------------------------|-------------------|------------------------------------------------------------------|
| token                   | Required, String  | Token. 255 bytes.                                                |
| oldToken                | Optional, String  | Old Token. 255 bytes.                                            |
| channel                 | Optional, String  | Channel name. 50 bytes.                                          |
| pushType                | Required, String  | GCN, APNS, APNS\_SANDBOX, TENCENT                                |
| isNotificationAgreement | Required, Boolean | true or false                                                    |
| isAdAgreement           | Required, Boolean | true or false                                                    |
| isNightAdAgreement      | Required, Boolean | true or false                                                    |
| timezoneId              | Required, String  | Area/Name. IANA time zone database.                              |
| country                 | Required, String  | ISO 3166-1 alpha-2, ISO 3166-1 alpha-3. 3 bytes.                 |
| language                | Required, String  | ISO 639-1, ISO 639-2, iOS(language code + script code). 8 bytes. |
| uid                     | Required, String  | User ID, 64 bytes.                                               |

-   If token is already registered when registering token, other information will be updated according to the token.

-   If token needs to be changed, register the original token in oldToken, and register new token in token, and it will be updated to new token.

-   If Channel is registered when registering token, messages can be sent to a specific Channel. It is not required, and if it is not defined, it will register as "default-channel".

-   Token belongs to only one Channel.

-   "isNotificationAgreement" indicates push message notification consent, "isAdAgreement" indicates advertising push message notification consent, and "isNightAdAgreement" indicates nighttime advertising push message consent.

-   For example, if a user wants to consent to all push messages, select all three fields as true. To receive push message only, set "isNotificationAgreement" as true only.

-   Notification consent follows Information Communications Network Act regulations (from article 50 to article 50 clause 8).
    Go to [KISA guide](http://spam.kisa.or.kr/kor/notice/dataView.jsp?p_No=49&b_No=49&d_No=52)
    Go to regulations

-   Delays may occur due to unstable network condition or various other reasons. To minimize the effect on mobile application operation, set Timeout short, and it is best to register token every time it is operated.

#### Look Up Token

###### a. Look up token using token and push type

\[Method, URL\]

    GET https://api-push.cloud.toast.com/push/v1.3/appkey/{appkey}/tokens?token={token}&pushType={pushType}
    Content-Type: application/json;charset=UTF-8

\[Response Body\]

    {
        "token" : {
            "channel": "default",
            "pushType" : "GCM",
            "isNotificationAgreement": true,
            "isAdAgreement": true,
            "isNightAdAgreement": true,
            "timezoneId" : "Asia/Seoul",
            "country": "KR",
            "language": "ko",
            "uid" : "User ID",
            "token" : "Token"
        },
        "header" : {
            "isSuccessful" : true or false,
            "resultCode": 0,
            "resultMessage" : "Success."
        }
    }

##### Look up token using b. uid

\[Method, URL\]

    GET https://api-push.cloud.toast.com/push/v1.3/appkey/{appkey}/uids/{uid}/tokens
    Content-Type: application/json;charset=UTF-8
    X-Secret-Key: [a-zA-Z0-9]{8}

\[Response Body\]

    {
        "tokens": [{
            "channel": "default",
            "pushType" : "GCM",
            "isNotificationAgreement": true,
            "isAdAgreement": true,
            "isNightAdAgreement": true,
            "timezoneId" : "Asia/Seoul",
            "country": "KR",
            "language": "ko",
            "uid" : "User ID",
            "token" : "Token"
        }],
        "header" : {
            "isSuccessful" : true or false,
            "resultCode": 0,
            "resultMessage" : "Success."
        }
    }

-   API requires Secret Key, and it must be called from the server.

### Messages

#### Sending messages

\[Method, URL\]

    POST https://api-push.cloud.toast.com/push/v1.3/appkey/{appkey}/messages
    Content-Type: application/json;charset=UTF-8
    X-Secret-Key: [a-zA-Z0-9]{8}

\[Request Body\]

    {
        "target" : {
            "type" : "ALL"
        },
        "content" : {
            "default" : {
                "title": "title",
                "body": "body"
            }
        },
        "messageType" : "NOTIFICATION"
    }

\[Response Body\]

    {
        "message" : {
            "messageId" : long
        },
        "header" : {
            "isSuccessful" : true or false,
            "resultCode": 0,
            "resultMessage" : "Success."
        }
    }

| Parameter             | Usage                  |                                                                                                                     |
|-----------------------|------------------------|---------------------------------------------------------------------------------------------------------------------|
| target.type           | Required, String       | ALL, CHANNEL, UID                                                                                                   |
| target.to             | Optional, String Array | If target.type is CHANNEL, then 100, if UID, then 10,000.                                                           |
| target.pushTypes      | Optional, String Array | GCM, APNS, APNS\_SANDBOX, TENCENT                                                                                   |
| target.countries      | Optional, String Array | ISO 3166-1 alpha-2, ISO 3166-1 alpha-3. 3 bytes.                                                                    |
| content               | Required, Map          | 8192 bytes                                                                                                          |
| content.default       | Required, Map          |                                                                                                                     |
| content.default.title | Optional, String       |                                                                                                                     |
| content.default.body  | Optional, String       |                                                                                                                     |
| messageType           | Required, String       | NOTIFICATION, AD                                                                                                    |
| contact               | Optional, String       | Required if messageType is AD.                                                                                      |
| removeGuide           | Optional, String       | Required if messageType is AD.                                                                                      |
| timeToLive            | Optional, Number       | Unit in minute. Basic value is 60 minutes.                                                                          |
| mps                   | Optional, Number       | Message transmission speed. Unit in 1,000/sec, and it ranges from 0(infinity) to 20(20,000 /sec). Basic value is 0. |
| isStored              | Optional, Boolean      | To save the message or not. Basic value is false.                                                                   |

-   Using "target.pushTypes" field, messages can be sent as certain push types. If it is not defined, it will be sent as all push types including GCM, APNS, APNS\_SANDBOX and TENCENT.

-   If "target.countries" field is "\['KR', 'JP'\]", it will send to tokens with token country code of "KR" or "JP".

-   "content.default" is required, and for details information on "content" field, please refer to the below \[Common Message Format\].

-   If a message is sent as "messageType": "AD", "contact" and "removeGuide" fields must be included. Enter contact in "contact" field, and enter notification consent withdrawal guide in "removeGuide" field.

-   If timeToLive field is used, it will automatically consider ones that take longer to send than setup time fail.

\["target" Example\]

    If "target.type" is "ALL", "target.to" is not needed.
    Request Body
    {
        "target" : {
            "type" : "ALL"
        },
        "content" : {
            "default" : {
                "title": "title",
                "body": "body"
            }
        }
    }
    If "target.type" is "UID" or "CHANNEL", enter the uid or channel name in "target.to".
    Request Body
    {
        "target" : {
            "type" : "UID",
            "to" : ["uid-01", "uid-02"]
        },
        "content" : {
            "default" : {
                "title": "title",
                "body": "body"
            }
        }
    }

\["messageType" Example\]

    When sending a general notification push message, not an advertising push message,
    set "messageType" as "NOTIFICATION", and leave "contact" and "removeGuide" blank.
    Request Body
    {
        "target" : {
            "type" : "ALL"
        },
        "content" : {
            "default" : {
                "title": "title",
                "body": "body"
            }
        },
        "messageType" : "NOTIFICATION"
    }
    When sending an advertising push message, set "messageType" as "AD", and enter contact in "contact"
    and notification consent withdrawal guide in "removeGuide".
    Request Body
    {
        "target" : {
            "type" : "ALL"
        },
        "content" : {
            "default" : {
                "title": "title",
                "body": "body"
            }
        },
        "messageType" : "AD",
        "contact" : "Contact",
        "removeGuide" : "Notification withdrawal guide"
    }

#### Common messages

Starting from API v1.3, common message format is supported. Make a message following the below table in "content", a message will be created and sent according to each push type.

| Reserved Word     | Platform                    | Usage                      | GCM        | APNS                     | TENCENT               |
|-------------------|-----------------------------|----------------------------|------------|--------------------------|-----------------------|
| title             | Android, iOS Watch, Tencent | Required, String           | data.title | aps.alert.title          | title                 |
| body              | Android, iOS, Tencent       | Required, String           | data.body  | aps.alert.body           | body                  |
| title-loc-key     | iOS                         | Optional, String           | -          | aps.alert.title-loc-key  | -                     |
| title-loc-args    | iOS                         | Optional, Array of Strings | -          | aps.alert.title-loc-args | -                     |
| action-loc-key    | iOS                         | Optional, String           | -          | aps.alert.action-loc-key | -                     |
| loc-key           | iOS                         | Optional, String           | -          | aps.alert.loc-key        | -                     |
| loc-args          | iOS                         | Optional, Array of String  | -          | aps.alert.loc-args       | -                     |
| launch-image      | iOS                         | Optional, String           | -          | aps.alert.launch-image   | -                     |
| badge             | iOS                         | Optional, Number           | -          | aps.badge                | -                     |
| sound             | Android, iOS, Tencent       | Optional, String           | data.sound | aps.sound                | custom\_content.sound |
| content-available | iOS                         | Optional, String           | -          | aps.content-available    | -                     |
| category          | iOS                         | Optional, String           | -          | aps.category             | -                     |

Other user-customized Word will go into Custom Key/Value field as follows.

| Reserved Word | Platform              | Usage                                   | GCM            | APNS      | TENCENT                   |
|---------------|-----------------------|-----------------------------------------|----------------|-----------|---------------------------|
| customKey     | Android, iOS, Tencent | Optional, Object, Array, String, Number | data.customKey | customKey | custom\_content.customKey |

\["content" Example\]

    "content.default" is required. Below "content.ko" and "content.ja" are language code values of token.
    A Message will be sent following the language code of token.
    Request Body
    {
        "target" : {
            "type" : "ALL"
        },
        "content" : {
            "default" : {
                "title": "title",
                "body": "body",
                "badge": 1,
                "key": "value"
            },
            "ko" : {
                "title": "Title",
                "body": "Body"
                "key": "Value"
            },
            "ja" : {
                "title": "タイトル",
                "body": "プッシュ・メッセージ"
            }
        },
        "messageType" : "NOTIFICATION"
    }
    "ko" GCM Message
     {
        "data": {
            "title": "Title",
            "body": "Body",
            "key": "Value"
        }
    }
    "ja" GCM Message
     {
        "data": {
            "title": "タイトル",
            "body": "プッシュ・メッセージ",
            "key": "value"
        }
    }
    "ko" APNS Message
    {
        "aps": {
            "alert": {
                "title": "Title",
                "body": "Body"
            },
            "badge": 1
        },
        "key": "Value"

    }
    "ja" APNS Message
    {
        "aps": {
            "alert": {
                "title": "タイトル",
                "body": "プッシュ・メッセージ"
            },
            "badge": 1
        },
        "key": "value"
    }
    "ko" TENCENT Message
     {
        "title": "Title",
        "body": "Body",
        "custom_content": {
            "key": "Value"
        }
    }
    "ja" TENCENT Message
     {
        "title": "タイトル",
        "body": "プッシュ・メッセージ",
        "custom_content": {
            "key": "value"
        }
    }

#### Look up messages

\[Method, URL\]

    GET https://api-push.cloud.toast.com/push/v1.3/appkey/{appkey}/messages/{message-id}
    Content-Type: application/json;charset=UTF-8
    X-Secret-Key: [a-zA-Z0-9]{8}

\[Response Body\]

    {
      "header": {
        "resultCode": 0,
        "resultMessage": "SUCCESS",
        "isSuccessful": true
      },
      "message": {
        "messageId": 42983,
        "messageType": "NOTIFICATION",
        "target": {
          "type": "ALL",
          "pushTypes": [
            "GCM"
          ]
        },
        "content": {
          "default": {
            "title": "title",
            "body": "body"
          }
        },
        "targetCount": 1048576,
        "timeToLive": 0,
        "sentTime": "2015-11-23T18:39:38.000+0900",
        "messageStatus": "COMPLETE",
        "mps": 0
      }
    }

-   "messageStatus" field indicates the message status. There are following statuses.

-   READY: Message trasmission request is registered.

-   IN\_MQ: Message created is on standby or currently sending.

-   COMPLETE: Message is sent.

-   CANCEL\_NO\_TARGET: Message is canceled due to no recipient. Confirm the certificate or transmission condition.

-   CANCEL\_INVALID\_CERTIFICATE: There is a problem with the certificate that it has been canceled. Confirm the certificate status.

-   CANCEL\_INVALID\_MESSAGE: Message is canceled due to a wrong format.

-   CANCEL\_UNSUPPORTED\_MESSAGE\_TYPE: Message is canceled due to a wrong format.

-   CANCEL\_UNAUTHORIZED: Failed while verifying the certificate. Confirm the certificate status.

-   CANCEL\_UNKNOWN: Internal error has occurred.

### Feedback

#### Check feedback

\[Method, URL\]

    GET https://api-push.cloud.toast.com/push/v1.3/appkey/{appkey}/feedback
    Content-Type: application/json;charset=UTF-8
    X-Secret-Key: [a-zA-Z0-9]{8}

\[Response Body\]

    {
        "feedback" : [{
            "uid" : "Uid",
            "token" : "Deleted Token",
            "newToken" : "New Token. Nullable",
            "pushType" : "GCM",
            "updateTime" : "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        }],
        "header" : {
            "isSuccessful" : true or false,
            "resultCode": 0,
            "resultMessage" : "Success."
        }
    }
