title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Upcoming Products > RTCS > Developer's Guide
RTCS를 사용하기 위해 필요한 기본 지식과 API에 대해 설명합니다

## 채널
메세지를 수신하기 위한 기본 단위입니다. 같은 채널에 가입되어있는 클라이언트들과 메세지를 공유할 수 있습니다.. 클라이언트 별로 다른 메세지를 전달해야한다면 전용 채널을 생성하면 됩니다. 기본적으로 메세지를 받으려면 RTCS와 연결이 완료된 후 채널에 가입을 진행합니다. 채널의 종류는 아래와 같습니다.

### 채널 명규칙
채널 명은 RTCS내부에서 사용하는 prefix 채널과 사용자가 임의로 만들어서 사용하는 공개 채널이 있습니다. 채널명을 작성할 때는 아래의 조건에 맞아야합니다
* **영문**, **숫자**, **_** 와  **-** 만 허용한다.
* **200 byte**의 길이만 허용한다.
* **private_**, **presence_**, **member_** 로 시작하는 공개 채널은 생성할 수 없다.

채널의 종류는 아래와 같습니다.

### 공개 채널
인증과정이 없어 누구나 가입이 가능합니다. **private_**, **presence_**, **member_** 로 시작하는 채널명은 만들 수 없습니다.

### 비공개 채널
가입을 위해서는 연결 URL을 요청할때 선 가입을 시켜주거나, 추후 가입시에 인증이 필요합니다. 채널명은 **private_** 로 시작합니다.

### 멤버 채널
가입을 위해서는 연결 URL을 요청할때 선 가입을 시켜주거나, 추후 가입시에 인증이 필요합니다. 채널명은 **member_** 로 시작합니다. 가입자를 아래와 같은 내용으로 조회가 가능합니다.
```
{세션아이디:사용자정보}
```

### 출석 채널
가입을 위해서는 연결 URL을 요청할때 선 가입을 시켜주거나, 추후 가입시에 인증이 필요합니다. 채널명은 **presence_** 로 시작합니다. 채널에 가입과 탈퇴하는 회원의 정보를 채널 가입들에게 broadcast를 해줍니다. 가입자 정보를 아래와 같은 내용으로 조회가 가능합니다.
```
{세션아이디:사용자정보}
```

## 인증
Webauth를 이용하여 채널 가입시에 인증 기능을 추가 할 수 있습니다.. 채널 가입시  **private_**, **presence_** 와 **member_** 채널은 인증을 거쳐야합니다. Connection URL을 받을 때 가입 허용을 미리 지정하지 않았다면 추후 채널 가입시에 Webauth를 통해 인증 여부를 문의 합니다.

### WebAuth 세팅

### 요청
WebAuth는 서비스 서버에 http **POST** 요청으로 전달되며 Body는 json형태로 전달됩니다. 응답코드 **200**이면 인증성공이다. 지정된 타임아웃은 **1,000ms** 이고 전송 성공/실패에 관계없이 재 요청하지 않습니다.

[Body]
```
{
    "time":"milliseconds",
    "type":"subscribe",
    "app":"{appkey}",
    "user":"{user}",
    "channel":"{channel_name}"
}
```
[payload]

|이름|자료형|설명|
|---|---|---|
|app|String|토스트 클라우드의 **appkey**|
|user|String|접근 요청 할때 전달된 사용자 정보|
|channels|String|가입요청이 들어온 채널 명|


## Webhook
클라이언트에서 밣생하는 이벤트를 서비스 서버로 전달할때 사용합니다. Http의 post로 요청이 전달되고 body는 Json형태 이다. Hook은 기본 시간 동안(**1,000ms**) 전송 시도 후 성공/실패에 상관없이 완료되며, 실패 하더라도 재전송 되지 않습니다.

### 클라이언트 접속
클라이언트가 접속 했을 때 Hook이 발생합니다. 지정한 Hook URL로 아래와 같은 데이터가 전송됩니다. **user** 데이터는 접속 URL을 요청했을 때 전달해준 서비스 서버의 user 데이터입니다.

```
{
    "time" : "milliseconds",
    "type" : "connect",
    "app" : "{appkey}",
    "user" : "{user}",
    "session" : "{session}",
    "detail" : {
       "origin":"http://service"
     }
}
```
[payload]

|이름|자료형|설명|
|---|---|---|
|type|String|Hook 이벤트 타입|
|app|String|토스트 클라우드의 **appkey**|
|user|String|접근 요청 할때 전달된 사용자 정보|
|session|String|접속한 클라이언트의 Session ID|

### 클라이언트 종료
클라이언트가 종료 했을 때 Hook이 발생합니다. 지정한 Hook URL로 아래와 같은 데이터가 전송됩니다. **user** 키에 데이터는 접속 URL을 요청했을 때 전달해준 user 데이터입니다.
```
{
    "time" : "milliseconds",
    "type" : "connect",
    "app" : "{appkey}",
    "user" : "{user}",
    "session" : "{session}",
    "detail" : {
       "origin":"http://service"
     }
}
```
[payload]

|이름|자료형|설명|
|---|---|---|
|type|String|Hook 이벤트 타입|
|app|String|토스트 클라우드의 **appkey**|
|user|String|접근 요청 할때 전달된 사용자 정보|
|session|String|접속한 클라이언트의 Session ID|


### 채널 가입
클라이언트에서 채널을 가입했을 때 Hook이 발생됩니다. 지정한 Hook URL로 아래와 같은 데이터가 전송됩니다. **user** 키에 데이터는 접속 URL을 요청했을 때 전달해준 user 데이터입니다.
```
{
    "time" : "1352770998419",
    "type" : "subscribe",
    "app" : "{appkey}",
    "user" : "{user}",
    "session" : "{session}",
    "detail" : {
       "channel" : "{channel_name}"
     }
}
```
[payload]

|이름|자료형|설명|
|---|---|---|
|type|String|Hook 이벤트 타입|
|app|String|토스트 클라우드의 **appkey**|
|user|String|접근 요청 할때 전달된 사용자 정보|
|session|String|접속한 클라이언트의 Session ID|
|channel_name|String|가입 한 채널명|

### 채널 탈퇴
클라이언트에서 채널을 탈퇴했을 때 Hook이 발생됩니다. 지정한 Hook URL로 아래와 같은 데이터가 전송됩니다. **user** 키에 데이터는 접속 URL을 요청했을 때 전달해준 user 전송됩니다.
```
{
    "time" : "1352770998419",
    "type" : "unsubscribe",
    "app" : "{appkey}",
    "user" : "{user}",
    "session" : "{session}",
    "detail" : {
       "channel" : "{channel_name}"
     }
}
```
[payload]

|이름|자료형|설명|
|---|---|---|
|type|String|Hook 이벤트 타입|
|app|String|토스트 클라우드의 **appkey**|
|user|String|접근 요청 할때 전달된 사용자 정보|
|session|String|접속한 클라이언트의 Session ID|
|channel_name|String|가입 탈퇴 채널명|

## Service API  
RTCS에서 제공하는 Rest API에 대한 설명입니다. API종류는 접속 권한 요청, 채널 메시지 전달 요청, 채널 존재 여부 확인 등의 기능을 제공합니다. 기본 API URL은 아래와 같습니다.

|기본 도메인|
|---|
|https://api-gw.cloud.toast.com/tc-pusher/|

### 접속 권한 요청
RTCS에 접속하기 위한 접속 권한을 요청합니다. 제공 받은 URL을 이용하여 클라이언트에서 접속하면 됩니다..

[URL]

```
POST /v2/auth/{appkey}/access
```

[payload]

```
{
   "user":"{user_data}",
   "channels":[
      "channel_name",
      "channel_name",
      "channel_name"
   ],
   "via":"{via}"
}
```
[parammeter]

|이름|자료형|설명|
|---|---|---|
|appkey|String|토스트 클라우드의 Appkey|

[payload]

|이름|자료형|설명|
|---|---|---|
|user|String|사용자 식별을 위한 정보(문자열)를 입력한다. 최대 값은 200byte 이다.|
|channels|Array|가입이 허가된 채널명들을 입력한다. 3개까지 입력 가능하며, 채널명의 최대 값은 200byte 이다.채널 중에 인증이 필요한 채널에 대해서만 필요하다|
|via|String|클라이언트 타입을 구분하기 위한 식별자. 기본값은 browser|

[response]
```
{
   "url":"ttps://pub001-pusher.toast.com/socket.io/1/?app={appkey}&ts=1501588191&s=389ab4e5d444a9ce48d2edb05021747fada29df4&d=Og&t=1501588191521",
   "app":"appkey"
}
```
|이름|자료형|설명|
|---|---|---|
|url|String|클라이언트 접속 URL|
|appkey|String|토스트 클라우드의 Appkey|

[Http status code]

|code| 구분 | 코드명 | 설명 |
|---|---|---|---|
|200| 성공 |ACCEPTED | 요청이 정상적으로 수행된 경우 발생한다.|
|400| 에러 |Bad Request | 잘못된 요청일 경우 발생한다.|
|401| 에러 |Unauthorized | 인증 실패일 경우 발생한다.|
|413| 에러 |Request Entity Too Large | 메시지 크기가 지정된 크기보다 더 큰 경우 발생한다.|
|500| 에러 |Server Error | 서버가 점검 중이거나 장애인 경우 발생한다.|
|503| 에러 |Server Maintenance | 서버가 점검 중인 경우 발생한다.|


### 채널 메시지 전달 요청
채널에 가입된 클라이언트 들에게 메세지를 전달 할 수 있습니다.
* 주의)
  * 메세지의 크기는 **1mb** 보다 작아야합니다.
  * 큰메세지를 보낼 경우 **413** 에러가 발생합니다..
* 메세지 크기만 잘 조절하면 base64를 이용해 바이너리도 전달 가능 합니다.

[URL]

```
POST /v2/event/{appkey}/channel
```

[payload]

```
{
   "channels":[
      "channel_name"
   ],
   "event":"{event_name}",
   "data":{
      "user":"aa",
      "message":"hahahah"
   }
}
```
[parammeter]

|이름|자료형|설명|
|---|---|---|
|appkey|String|토스트 클라우드의 Appkey|

[payload]

|이름|자료형|설명|
|---|---|---|
|channels|Array|메시지를 전달할 채널명을 입력한다. 한꺼번에 전달할 수 있는 채널의 개수는 100개로 제한된다.|
|event|String|메세지를 받을 이벤트명|
|data|String or object|전달할 메세지 string 이나 json 모두 지원, 하지만 json도 string으로 전달하는게 안전하다.|

[response]
```
{"accepted":"{server_id}", "app":"{appkey}"}
```

|이름|자료형|설명|
|---|---|---|
|accepted|String|서버 아이디|
|app|String|토스트 클라우드의 Appkey|

[Http status code]

|code| 구분 | 코드명 | 설명 |
|---|---|---|---|
|200| 성공 |ACCEPTED | 요청이 정상적으로 수행된 경우 발생한다.|
|400| 에러 |Bad Request | 잘못된 요청일 경우 발생한다.|
|401| 에러 |Unauthorized | 인증 실패일 경우 발생한다.|
|413| 에러 |Request Entity Too Large | 메시지 크기가 지정된 크기보다 더 큰 경우 발생한다.|
|500| 에러 |Server Error | 서버가 점검 중이거나 장애인 경우 발생한다.|
|503| 에러 |Server Maintenance | 서버가 점검 중인 경우 발생한다.|

### 채널 존재 여부 확인
채널이 존재 하는지 확인 할 수 있습니다.

[URL]

```
GET /exists/{appkey}
```

[parammeter]

|이름|자료형|설명|
|---|---|---|
|appkey|String|토스트 클라우드의 Appkey|


[response]
```
{"occupied": Boolean}
```

|이름|자료형|설명|
|---|---|---|
|occupied|Boolean|채널 존대 여부|

[Http status code]

|code| 구분 | 코드명 | 설명 |
|---|---|---|---|
|200| 성공 |ACCEPTED | 요청이 정상적으로 수행된 경우 발생한다.|
|400| 에러 |Bad Request | 잘못된 요청일 경우 발생한다.|
|401| 에러 |Unauthorized | 인증 실패일 경우 발생한다.|
|500| 에러 |Server Error | 서버가 점검 중이거나 장애인 경우 발생한다.|
|503| 에러 |Server Maintenance | 서버가 점검 중인 경우 발생한다.|

### 채널에 가입된 세션 정보 조회
채널에 가입된 세션의 목록을 조회 할 수 있습니다. 조회가 가능한 채널은 **presence** 와 **member** 채널입니다.

[URL]

```
GET /v2/channel/{appkey}/sessions?channel={channel_name}
```

[parammeter]

|이름|자료형|설명|
|---|---|---|
|appkey|String|토스트 클라우드의 Appkey|
|channel|String|조회할 채널명을 입력한다. 한 번에 하나만 가능하다.|


[response]
요청이 성공하면 "세션아이디"/"사용자"가 key/value로 저장된 결과가 전달된다.

```
{
    "{sessionId_1}": "{user_1}",
    "{sessionId_2}": "{user_2}"
}
```

|이름|자료형|설명|
|---|---|---|
|sessionId|String|RTCS 세션 아이디|
|user|String|서비스서버에서 전달해준 User 정보|

[Http status code]

|code| 구분 | 코드명 | 설명 |
|---|---|---|---|
|200| 성공 |ACCEPTED | 요청이 정상적으로 수행된 경우 발생한다.|
|400| 에러 |Bad Request | 잘못된 요청일 경우 발생한다.|
|401| 에러 |Unauthorized | 인증 실패일 경우 발생한다.|
|500| 에러 |Server Error | 서버가 점검 중이거나 장애인 경우 발생한다.|
|503| 에러 |Server Maintenance | 서버가 점검 중인 경우 발생한다.|

### 채널에 가입된 세션 개수 조회
채널에 가입된 세션의 갯수를 조회 할 수 있습니다.. 조회가 가능한 채널은 **presence** 와 **member** 채널입니다.

[URL]

```
GET /v2/channel/{appkey}/count?channel={channel_name}
```

[parammeter]

|이름|자료형|설명|
|---|---|---|
|appkey|String|토스트 클라우드의 Appkey|
|channel|String|조회할 채널명을 입력한다. 한 번에 하나만 가능하다.|


[response]
```
{"count":Number}
```

|이름|자료형|설명|
|---|---|---|
|count|Number|채널에 가입된 세션 숫자|

[Http status code]

|code| 구분 | 코드명 | 설명 |
|---|---|---|---|
|200| 성공 |ACCEPTED | 요청이 정상적으로 수행된 경우 발생한다.|
|400| 에러 |Bad Request | 잘못된 요청일 경우 발생한다.|
|401| 에러 |Unauthorized | 인증 실패일 경우 발생한다.|
|500| 에러 |Server Error | 서버가 점검 중이거나 장애인 경우 발생한다.|
|503| 에러 |Server Maintenance | 서버가 점검 중인 경우 발생한다.|

## Client

클라이언트는 Javascript는 socket.io 0.9 기반, 나머지 native client들은 아래 socket.io 1.x버젼용 client library를 사용면 됩니다.


### Javascript
  - socket.io 0.9
  - [https://cdnjs.com/libraries/socket.io/0.9.17](https://cdnjs.com/libraries/socket.io/0.9.17)

### Java
  - socket.io 1.x

#### Maven
**pom.xml** 에 아래와 같이 추가합니다.
```
<dependencies>
  <dependency>
    <groupId>io.socket</groupId>
    <artifactId>socket.io-client</artifactId>
    <version>1.0.0</version>
  </dependency>
</dependencies>
```

#### Gradle
**build.gradle** 에 아래와 같이 추가합니다.
```
compile ('io.socket:socket.io-client:1.0.0') {
  // excluding org.json which is provided by Android
  exclude group: 'org.json', module: 'json'
}
```

### Swift or Objective-C
  - socket.io 1.x
  - [https://github.com/socketio/socket.io-client-swift](ÂΩ)

#### Swift Package Manager
**Package.swift** 에 아래 디펜던시를 추가합니다
```
import PackageDescription

let package = Package(
    name: "YourSocketIOProject",
    dependencies: [
        .Package(url: "https://github.com/socketio/socket.io-client-swift", majorVersion: 11)
    ]
)
```

### Carthage
**Cartfile** 에 아래와 같이 추가합니다.
```
github "nuclearace/Starscream" ~> 8.0.4
github "socketio/socket.io-client-swift" ~> 11.1.1 # Or latest version
```
Run
```
carthage update --platform ios,macosx
```

#### CocoaPods 1.0.0 or later  
  - Cocoapod
  - [https://cocoapods.org/pods/Socket.IO-Client-Swift](https://cocoapods.org/pods/Socket.IO-Client-Swift)

프로젝트에서 **Podfile** 파일을 생성하고 **Socket.IO-Client-Swift** 를 추가합니다.
```
  use_frameworks!

  target 'YourApp' do
      pod 'Socket.IO-Client-Swift', '~> 11.1.1' # Or latest version
  end
```

  Install pods:
```
  $ pod install
```  
  Import the module:

  Swift:
```
  import SocketIO
```

  Objective-C:
```
  @import SocketIO;
```  

#### CocoaSeeds
Add this line to your Seedfile:
````
github "socketio/socket.io-client-swift", "v11.1.1", :files => "Source/*.swift" # Or latest version
````
Run
```
seed install.
```

### Cpp
  - socket.io 1.x
  - [https://github.com/socketio/socket.io-client-cpp/releases/tag/1.6.1](https://github.com/socketio/socket.io-client-cpp/releases/tag/1.6.1)

### Unity3D
  - socket.io 1.x
  - [https://github.com/nhnent/socket.io-client-unity3d](https://github.com/nhnent/socket.io-client-unity3d)
