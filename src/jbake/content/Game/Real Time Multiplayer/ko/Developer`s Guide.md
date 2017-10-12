title=About
date=2013-09-24
type=page
status=published
big=TCGame
summary=TCGameRealtimeDV's
~~~~~~
## Game > Real Time Multiplayer > Developer's Guide

## NetworkManager

NetworkManager는 멀티플레이어 게임을 위한 네트워크 기능을 제공하는 컴포넌트다. 사용자는 별도의 스크립트 작성 없이도 NetworkManager에서 제공하는 인스펙터를 이용해 네트워크 설정 및 상태 관리, 매치 메이킹 등의 작업을 수행할 수 있을 뿐만 아니라 해당 기능에 대응되는 API를 제공한다. NetworkManager가 제공하는 주요한 기능은 다음과 같다.

- 게임 상태 관리
- 게임 오브젝트 생성 관리
- 씬 관리
- 로그 레벨 설정
- 매치 메이킹
- 네트워크 접속 설정

## 인스펙터

NetworkManager 인스펙터는 다음과 같다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_27.jpg)

|용어|	설명|
|---|---|
|Don’t Destroy On Load|	새로운 씬이 로드될 때 NetworkManager 컴포넌트가 포함된 게임 오브젝트가 파괴되지 않도록 지정한다.|
|Log Level|	NetworkManager 컴포넌트의 로그 레벨을 지정한다.|
|Online Scene|	플레이어가 게임 룸에 참가했을 때 호출되는 씬을 지정한다. 빌드세팅에 등록된 씬만 등록가능하다. |
|Offline Scene|	플레이어가 룸을 떠나거나 네트워크 접속이 종료될 때 호출되는 씬을 지정한다. 빌드세팅에 등록된 씬만 등록가능하다. |
|Listener|	NetworkManager의 상태 변화를 공지하기 위한 필드다. 게임 오브젝트에 이벤트 공지를 수신할 스크립트를 작성해서 지정하면 된다. <br/> - void OnConnected() : 네트워크 연결 성공 <br/> - void OnFailedToConnect() : 네트워크 연결 실패 <br/> - void OnDisconnected() : 네트워크 연결 종료 <br/> - void OnJoinedGame() : 게임 룸 참가|
|Appkey|	TOAST Cloud에서 발급받은 Appkey을 입력한다.|
|Url|	TOAST Cloud에서 발급받은 URL을 입력한다.|
|Max Player|	룸의 최대 수용 인원을 지정한다.|
|RoomType|	입력한 문자열과 같은 경우에 매칭을 수행한다.|
|Reopen|	게임 진행 중에 결원이 발생할 경우, 추가 참가자를 게임에 참가할 수 있도록 지정한다.|
|Spawn Info|	게임 룸 안에서 동적으로 생성할 게임오브젝트를 등록한다.|
|Channel Count|	네트워크 통신에 사용할 채널 개수를 지정한다. 지정 가능한 범위는 최소 5개 최대 50개다.|
|MTU Size|	한 번에 송신할 최대 byte 수를 지정한다. 지정 가능한 범위는 최소 450 bytes 최대 1300 bytes다.|
|Ping Interval|	신뢰성 데이터가 송신되지 않을 경우, 클라이언트에서 서버로 전송할 Ping 주기를 지정한다.|
|Disconnect Timeout|	신뢰성 데이터를 송신 후, 응답을 기다리는 최대 시간을 설정한다.|
|Enable CRC|	데이터의 무결성 검사를 활성화 한다. 서비스 지역의 네트워크 상태가 좋다면 모바일 기기에서 사용하지 않는 것을 권장한다.|
|Max Unreliable <br/> Commands|	지정한 개수 이상으로 비 신뢰성 데이터가 큐에 쌓일 경우, 큐를 비운다. 0으로 설정된 경우, 해당 기능은 동작하지 않는다.|
|Waning Queue Size|	큐에 일정 개수만큼의 패킷이 쌓일 경우, Warning 메시지를 전달한다.|
|Resent Count <br/> Allowance|	응답이 도착하지 않은 데이터에 대한 재전송 횟수를 지정한다.|
|Shows Network <br/> Stats and Info|	활성화될 경우, 네트워크 상태와 관련된 수치 정보를 NetworkStatistic 프로퍼티로 확인할 수 있으며 NetworkManagerHUD 컴포넌트가 활성화되어 있으면 해당 값을 게임화면에서 확인할 수 있다.|

### 씬 관리

많은 개발자들이 유니티로 게임을 만들 때, 다수의 씬을 사용한다. 예를 들면 메뉴 씬, 게임, 씬, 종료 씬 등으로 구분 지어 게임을 개발한다. NetworkManager는 자동으로 플레이어가 게임 룸에 입장하면 Online Scene에 설정된 씬들 로딩한다. 반대로 게임을 종료하고 룸에서 나오게 되어 서비스 이용을 종료한 경우에는 Offline Scene을 로딩하게 된다.

하지만 네트워크 연결 전에 사용하던 씬과 온라인 씬이 같은 씬일 경우, 씬 로딩을 수행하지 않는다. 오프라인 씬 역시 같은 씬에 대해서 씬 로딩을 수행하지 않는다. 즉, 단일 씬으로 구성된 게임에도 멀티플레이어 컨텐츠를 추가할 수 있다. 그리고 게임 룸에 진입한 상태에서 종료 전까지 추가로 다른 씬을 로딩하여 사용할 수 있다.

### 매치 메이킹

TOAST Cloud의 리얼 타임 멀티플레이어 서비스는 가장 기초적인 방법의 매칭 메이킹 서비스를 제공한다. 매치 메이킹은 RoomType에 설정한 문자열을 기준으로 매칭이 수행된다.

- **레벨 매칭**
점수를 기반을 둔 매칭은 플레이어의 점수를 일정 간격으로 나누어 그 값을 기준으로 문자열을 생성하면 된다. 예를 들면 111점의 플레이어의 경우, 100으로 나눈 몫으로 game_1 타입의 매칭을 지정하면 100점대의 플레이어끼리 매칭을 지정할 수 있다.

- **게임 타입 매칭**
MORPG와 같이 플레이어가 특정 던전을 선택해서 입장할 경우, 해당 던전의 이름을 지정해서 매칭이 수행되도록 지정할 수 있다.

- **게임 버전 관련 매칭**
클라이언트의 버전을 구분해야 하는 경우, 클라이언트 버전 정보를 추가하여 매칭이 수행되도록 지정하면 된다.

### 리스너 설정

NetworkManager는 상태 정보를 세 가지로 구분하여 공지하는 기능을 가지고 있다. TOAST Cloud에 접속한 Connected 상태, 인증 과정을 거처 게임 룸에 진입한 JoinedGame 상태, 마지막으로 연결이 종료된 Disconnected 상태다. 상태 변화에 따라 필요한 동작이 필요하다면 게임 오브젝트에 다음과 같이 스크립트를 작성해 NetworkManager의 인스펙터의 Listener 항목에 드래그하면 된다. 상태 정보를 받을 필요가 없다면 리스너를 설정하지 않아도 된다.

```
public class Listener : MonoBehaviour {

    ///

    /// Connected to TOAST Cloud
    ///

    void OnConnect() {}

    ///

    /// Failed to connect TOAST Cloud
    ///

    void OnFailedToConnect() {}

    ///

    /// Joined a Game
    ///

    void OnJoinedGame() {}

    ///

    /// Disconnected from TOAST Cloud
    ///

    void OnDisconnected() {}
}
```

### 게임 오브젝트 생성

멀티플레이어 게임에서 동적으로 게임 오브젝트를 생성하는 것은 필수적인 기능 중 하나다. 생성할 Prefab을 네트워크 연결 전에 NetworkManager에 등록하여 동적으로 게임 오브젝트를 생성할 수 있다. NetworkManager에 등록하기 위해 해당 게임 오브젝트는 필수적으로 NetworkIdentity 컴포넌트를 포함하고 있어야 한다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_28.jpg)

등록된 프리팹은 다음과 같이 RealtimeNetwork가 제공하는 API를 호출하여 동적으로 생성할 수 있다.

```
RealtimeNetwork.Instantiate (playerPrefab, position, rotation);
```

### 멀티플랙싱

멀티플랙싱은 도메인이 다른 데이터 간의 종속성을 제거하여 불필요한 데이터 지연을 방지하는 방법이다. 예를 들면, A 데이터와 B 데이터가 Reliable Sequenced QoS로 지정되어 있고 서로 종속성을 가지고 있지 않다면 A 데이터의 유실이 B 데이터 지연을 초래하지 않는 것이 좋다. 이런 불필요한 지연을 막기 위해 종속 관계가 없는 각 도메인에 개별 채널을 할당하여 사용하는 것이 바람직하다.

NetworkManager의 Channel Count는 사용할 최대 채널 개수를 지정한다. 지정 가능 범위는 최소 5개부터 최대 50까지 사용 가능하며 영 번째와 첫 번째 채널은 내부적인 데이터를 위한 채널로 사용하기 때문에 사용을 지양하는 것이 좋다.

### 네트워크 설정

인스펙터에서 Advanced Configuration을 활성화할 경우, 네트워크 엔진의 디폴트 옵션을 변경할 수 있다. 하지만 특별한 경우를 제외하고 해당 기능을 설정하는 것은 권장하지 않는다.

- **MTU Size**
MTU 크기 변경은 서비스 중인 나라 혹은 지역의 네트워크 인프라 상태가 좋지 못한 곳에서 값을 낮추어 IP 계층의 단편화를 방지하는 용도로 사용된다. IP 계층의 단편화는 네트워크의 지연을 더욱 가중할 수 있다.

- **Ping Interval**
클라이언트의 연결 상태를 민감하게 인지할 필요가 없으면 Ping 송신 주기를 늘리고 민감하게 반응해야 하는 경우 최소 500 milliseconds까지 줄일 수 있다.

- **Disconnection Timeout**
신뢰성 데이터 송신 후, 해당 데이터에 대한 응답 메시지를 수신할 때까지 기다리는 최대 시간 값을 나타낸다. 최솟값은 1000 milliseconds부터 최대 5000 milliseconds까지다.

- **CRC Enable**
데이터의 무결성 확인 기능을 활성화한다. 국내 네트워크 환경을 고려했을 때 활성화하는 것을 권장하지 않는다.

- **Max Unreliable Commands**
해당 기능은 Cellular-Wi-Fi 핸드 오버 또는 사용자 조작 때문에 렌더링 루프가 멈추었을 경우 유용하게 사용되는 기능으로 큐에 쌓여 있는 이전 데이터를 제거하고 최신 데이터를 반영하도록 하는 기능이다.

- **Waning Queue Size**
네트워크 엔진 내부 큐에 지정한 임곗값보다 많은 수의 데이터가 쌓일 경우, Warning 메시지를 발생시킨다.

### API

[Properties]

|용어|타입|설명|
|---|---|---|
|Url|	string|	Console에서 발급 받은 프로젝트 접속 URL을 나타낸다.|
|Appkey|	string|	Console에서 발급받은 프로젝트의 Appkey를 나타낸다.|
|GameState|	GameStates|	게임과 관련된 상태를 나타낸다|
|NetStatus|	NetStates|	네트워크 상태를 나타낸다.|
|UserID|	string|	접속 시 사용할 플레이어의 고유 아이디를 나타낸다.|
|LocalPlayer|	Player|	게임 룸에서 공유되는 로컬 플레이어의 정보입니다.|
|IsMaster|	bool|	현재 플레이어가 마스터 권한을 가지고 있으면 True를 반환하고 그렇지 않을 경우 false를 반환한다.|
|dontDestroyOnLoad|	bool|	NetworkManager가 포함된 게임 오브젝트가 씬이 변경될 때, 파괴되지 않도록 설정한다.|
|ServerAddress|	string|	접속한 게임 서버의 주소를 반환한다. 2.0 이상에선 도메인으로 표현된다.|
|ServerPort|	int|	접속한 게임 서버의 포트 번호를 반환한다.|
|MaxPlayer|	int|	게임 룸의 최대 플레이어를 나타낸다. 최대 인원은 8명이다.|
|RoomType|	string|	접속할 게임 룸의 종류를 지정한다.|
|Reopen|	bool|	게임 중 플레이어가 떠날 경우, 새로운 플레이어가 게임에 참가하도록 허용한다.|
|OnlineScene|	string|	게임 룸에 참가했을 때 로드될 씬을 나타냅니다.|
|OfflineScene|	string|	연결이 끊어졌을 때 로드될 씬을 나타낸다.|
|SpawnPrefabs|	List|	게임 중에 동적으로 생성할 프리팹 리스트를 나타낸다.|
|MTU|	int|	한 번에 송신할 최대 byte 수를 지정한다. 지정 가능한 범위는 최소 450 최대 1300이다.|
|PingInterval|	int|	신뢰성 데이터가 송신되지 않았을 경우, 클라이언트에서 서버로 전송할 Ping 주기를 지정한다.|
|DisconenctTimeout|	int|	신뢰성 데이터를 송신 후, 응답을 기다리는 최대 시간을 설정한다.|
|ChannelCount|	int|	사용할 최대 채널 수를 지정한다.|
|ShowNetworkStats|	bool|	디버깅 목적으로 네트워크 상태를 표시할지 지정한다.|
|Listener|	GameObject|	NetworkManager의 상태변화를 수신하기 위한 리스너를 지정한다.|

[Methods]

|용어|설명|
|---|---|
|Description|	TOAST Cloud의 리얼 타임 멀티플레이어 서비스에 접속한다.|
|Signature|	void Connect()|
|Return Value|	N/A	|

|용어|설명|
|---|---|
|Description|	TOAST Cloud의 리얼 타임 멀티플레이어 서비스를 종료한다.|
|Signature|	void Disconnect()|
|Return Value|	N/A	|

## RealtimeNetwork

RealtimeNetwork는 네트워크가 활성화된 후 리얼 타임 멀티플레이어 컨텐츠를 제작할 수 있는 고수준의 API를 제공한다. RealtimeNetwork는 정적 함수와 정적 프로퍼티만 제공하기 때문에 별도의 객체 생성이 필요 없다. RealtimeNetwork가 제공하는 주요기능은 다음과 같다.

- 게임 오브젝트 생성 및 파괴
- RPC
- 서버 시간 동기화

### 게임 오브젝트 생성과 파괴

멀티 플레이어 게임에서 네트워크상에서 게임 오브젝트의 생성과 파괴는 필수적인 기능이다. RealtimeNetwork에서 제공하는 Instantiate 함수를 사용해서 게임 룸에 게임 오브젝트를 생성할 수 있다. 생성에 관련된 몇 가지 제약 조건은 다음과 같다.

- 동적으로 네트워크상에 생성할 수 있는 게임 오브젝트는 NetworkManager의 Registered Spawnable Prefab에 지정된 게임 오브젝트에 한정되며 등록된 게임 오브젝트는 반드시 NetworkIdentity 컴포넌트를 포함하고 있어야 한다.
- 마스터 소유로 설정된 프리팹은 마스터 권한을 갖은 플레이어만 생성할 수 있다.
- 로컬 플레이어 소유로 설정된 프리팹은 생성한 플레이어가 최초 소유권을 가진다.

게임 오브젝트가 파괴가 필요한 경우, RealtimeNetwork에서 제공하는 Destroy함수 사용하면 된다. 삭제할 게임 오브젝트의 소유권을 가지고 있는 플레이어만 Destroy를 사용해서 해당 게임 오브젝트를 삭제할 수 있다. Destroy 함수의 두 번째 인자는 삭제 지연 시간을 지정할 수 있으므로 GameObject의 Destroy와 같은 기능을 네트워크상에서 쉽게 구현 할 수 있다.

### RPC

RealtimeNetwork의 RPC는 플레이어 간 메시지를 송수신하기 위한 기능을 제공한다.

- Ephemeral메시지, Persistent 메시지
- 유니캐스트
- 멀티캐스트

RPC로 호출될 수 있는 스크립트와 게임 오브젝트는 요건은 다음과 같다.

- RPC에 사용될 클래스는 NetworkBehaviour를 상속받아야 한다.
- 사용할 스크립트를 포함한 게임 오브젝트는 NetworkIdentity 컴포넌트를 포함하고 있어야 한다.

RPC는 두 가지 타입의 메시지를 제공한다. 첫 번째는 현재 게임 룸에 접속된 플레이어에게만 메시지를 전달하는 Ephemeral과 게임 룸에 메시지를 저장해두는 Persistent 방식을 제공한다. Ephemeral 타입은 일반적인 네트워크 통신의 메시지 송수신과 유사하게 현재 게임 룸에 접속한 플레이어에 한정되어 일시적으로 전달된다. 하지만 Persistent 타입은 지정된 스크립트와 함수로 구분되어 게임 룸에 저장된다. 사용 예를 들면, 마스터 소유권을 갖은 플레이어가 특정 RPC를 Persistent로 지정하여 게임 룸에 송신하면 현재 접속한 플레이어는 해당 메시지를 바로 수신하게 되고 이 후에 접속한 플레이어도 같은 RPC 메시지 수신하게 된다. 지정된 Persistent 메시지는 RemoveRPC 함수를 사용해 게임 룸에서 삭제할 수 있다.

RealtimeNetwork의 RPC는 유니캐스트와 멀티캐스트를 지원한다. 다시 말하면, 특정 플레이어에게 메시지를 전송할 수 있을 뿐만 아니라 게임 룸에 접속된 전체 플레이어 또는 특정 플레이어 그룹에 송신할 수 있다.

### 시간 동기화

대전 게임 등에서 시간 동기화는 필수적인 요소임에도 불구하고 네트워크 환경과 물리적인 거리로 인해 같은 시간 값을 공유하기가 쉽지 않다. 게다가 각 플레이어가 다른 타임 존에 속해 있다면 로컬 타임을 사용할 수 없으므로 서버 시간을 기준 시간으로 사용해야 한다. RealtimeNetwork의 FetchServerTimestamp함수와 ServerTime프로퍼티는 쉽게 플레이어 간 시간을 동기화를 가능하게 해준다. 특히 모바일 환경에서 Cellular와 Wi-Fi에서 발생하는 네트워크 성능을 차이를 고려하여 시간을 동기화를 지원한다.

FetchServerTimestamp는 비 동기 함수로, 동기화가 완료된 후에는 ServerTime은 0보다 큰 값을 반환한다. 클라이언트는 최초 연결 시, 내부적으로 FetchServerTimestamp를 호출하여 시간 동기화 기능을 실행하지만, 모바일 환경을 고려했을 때, 게임 시작 전에 한번 더 호출해 주는 것을 권장한다.

### API
[Properties]

RealtimeNetwork는 정적 함수와 정적 프로퍼티를 제공한다. RealtimeNetwork의 함수와 프로퍼티는 다음과 같다.

|용어|타입|설명|
|---|---|---|
|IsNetworkActive|	bool|	네트워크의 연결 상태를 나타낸다.|
|IsJoinedRoom|	bool|	게임 룸에 접속한 상태를 나타낸다.|
|IsMaster|	bool|	현재 플레이어가 마스터 권한을 가졌는지 나타낸다.|
|LocalPlayer|	Player|	현재 플레이어의 정보를 반환한다.|
|CurrentUserID|	string|	접속 시 사용한 플레이어의 고유 ID를 반환한다.|
|Players|	List|	현재까지 게임 룸에 접속한 플레이어 리스트를 반환한다.|
|RoomProperties|	DataObject|	게임 룸 생성할 때 지정된 룸의 속성을 반환한다.|
|ServerTime|	uint|	서버 시간을 반환한다.|
|IsServerTimeAvailable|	uint|	서버 시간이 사용 가능한지 확인한다.|
|RoundTripTime|	uint|	평균 패킷 왕복 시간을 반환한다.|

[Methods]

|용어|설명|
|---|---|
|Description|	네트워크상에 게임 오브젝트를 생성한다.|
|Signature|	GameObject Instantiate( GameObject prefab, Vector3 position, Quaternion rotation)|
|Parameters|	prefab	생성할 게임 오브젝트의 프리팹|
|Parameters|position	생성할 게임 오브젝트의 위칫값|
|Parameters|rotation	생성할 게임 오브젝트의 회전값|
|Return Value|	GameObject	생성된 게임 오브젝트를 반환한다.|

|용어|설명|
|---|---|
|Description|	네트워크상에 게임 오브젝트를 삭제한다.|
|Signature|	bool Destroy(GameObject gameObject, float time = 0)|
|Parameters|	gameObject	네트워크상에서 삭제할 게임 오브젝트|
|Parameters|time	초 단위 삭제 지연 시간|
|Return Value|	GameObject	생성된 게임 오브젝트를 반환한다.|

|용어|설명|
|---|---|
|Description|	네트워크상에 RPC 메시지를 송신한다.|
|Signature|	bool RPC(NetworkIdentity identity, string methodName, RpcType type, ReceiverGroup receiverGroup, DataObject parameters, SendOptions sendOptions)|
|Signature|bool RPC(NetworkIdentity identity, string methodName, RpcType type, byte player, DataObject parameters, SendOptions sendOptions)|
|Signature|bool RPC(NetworkIdentity identity, string methodName, RpcType type, byte[] players, DataObject parameters, SendOptions sendOptions)|
|Parameters|	identity	메시지를 송신할 게임 오브젝트의 NetworkIdentity를 지정한다.|
|Parameters|methodName	메시지를 수신할 함수 이름|
|Parameters|type	메시지 타입을 지정한다. RpcType의 Ephemeral 또는 Persistent|
|Parameters|receiverGroup	메시지를 수신할 그룹을 지정한다.|
|Parameters|player	메시지를 수신할 플레이어 아이디를 지정한다.|
|Parameters|players	메시지를 수신할 플레이어의 아이디를 배열 형태로 지정한다.|
|Parameters|parameters	메시지 수신 시 함수의 인자로 전달된다.|
|Parameters|sendOptions	메시지 송신 옵션을 지정한다.|
|Return Value|	bool	송신에 성공하면 true를 반환하고 그렇지 않으면 false를 반환한다.|

|용어|설명|
|---|---|
|Description|	Persistent로 지정된 RPC 메시지를 삭제한다.|
|Signature|	bool RemoveRPC(NetworkIdentity identity, string methodName, SendOptions sendOptions)|
|Parameters|	identity	삭제할 RPC의 NetworkIdentity를 지정한다.|
|Parameters|methodName	삭제할 RPC의 함수 이름을 지정한다.|
|Return Value|	bool	송신에 성공하면 true를 반환하고 그렇지 않으면 false를 반환한다.|

|용어|설명|
|---|---|
|Description|	다른 플레이어 게임 오브젝트의 소유권을 요청한다.|
|Signature|	bool RequestOwnership(GameObject gameobject)|
|Parameters|	gameobject	소유권을 요청할 게임 오브젝트|
|Return Value|	bool	송신에 성공하면 true를 반환하고 그렇지 않으면 false를 반환한다.|

|용어|설명|
|---|---|
|Description|	서버 시간 동기화를 위한 메시지를 요청한다.|
|Signature|	bool FetchServerTimestamp()|
|Return Value|	bool	송신에 성공하면 true를 반환하고 그렇지 않으면 false를 반환한다.|

## NetworkIdentity

NetworkIdentity는 네트워크상에서 해당 게임 오브젝트의 고유 식별자다. 게임 오브젝트에서 NetworkTransfrom 컴포넌트와 NetworkBehaviour를 사용하기 위해서는 NetworkIdentity 컴포넌트를 반드시 포함하고 있어야 하며 사용자 정의 스크립트에서 NetworkBehaviour를 상속받거나 NetworkTransform 컴포넌트를 추가할 경우, 자동으로 NetworkIdentity가 추가된다. NetworkIdentity의 주요 기능은 다음과 같다.

- 게임 오브젝트 고유 식별자
- 소유권 지정

### 인스펙터

NetworkIdentity 인스펙터는 다음과 같다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_29.jpg)

|인스펙터| 설명|
|---|---|
|Local Player Authority|	해당 게임 오브젝트의 소유권 지정을 나타낸다. 지정된 경우, 해당 오브젝트를 생성한 플레이어가 소유권을 갖게 된다. 하지만 지정되어 있지 않을 경우 마스터 소유권으로 지정 된다.|

## NetworkTransform

NetworkTransform은 게임 오브젝트의 위치와 회전 값을 쉽게 동기화 할 수 있게 다양한 기능을 제공 한다. NetworkTransform 컴포넌트는 NetworkBehaviour를 상속받은 사용자 정의 스크립트의 특수한 형태로 NetworkBehaviour를 상속받은 사용자 정의 스크립트와 같은 방식으로 동작한다.

NetworkTransform 컴포넌트를 사용하기 위해서는 NetworkIdentity 컴포넌트가 게임 오브젝트에 포함되어야 한다. 다음은 NetworkTransform이 제공하는 주요 기능이다.

- 위치 동기화
- 회전 동기화
- 전송 속도
- 송수신 채널 설정

### 인스펙터

NetworkManager 인스펙터는 다음과 같다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_30.jpg)

|인스펙터| 설명|
|---|---|
|Network Send Rate|	초당 전송률을 지정한다.|
|Network Channel|	송신 채널을 지정한다.|
|Transform Sync Mode|	동기화 방법을 제공한다.|
|Movement Threshold|	지정한 값이 회전 각 또는 위치 벡터의 크기 값을 초과할 경우 데이터를 송신한다.|
|Snap Threshold|	위치 벡터의 크기 값이 지정한 값을 초과하면 위치 보간을 수행하지 않고 직접 값을 대응시킨다.|
|Interpolate Movement Factor|	데이터 전송률에 기반을 둔 위치 보간 인수다. 1 보다 클 경우, 보간 횟수가 감소하고 1보다 작은 값일 경우 보간 횟수가 증가한다. 0일 경우 보간을 수행하지 않는다.|
|Rotation Axis|	회전축을 지정한다.|
|Interpolate Rotation Factor|	데이터 전송률에 기반을 둔 회전 보간 인수다. 1 보다 클 경우, 보간 횟수가 감소하고 1보다 작은 값일 경우 보간 횟수가 증가한다. 0일 경우 보간을 수행하지 않는다.|
|Sync Angular Velocity|	Rigidbody의 각 속도 값을 동기화를 지정한다.|

### 전송 속도

게임 오브젝트 동기화를 위해 초당 전송률은 설정하는 것은 성능과 게임의 자연스러운 연출을 위해 아주 중요하다. NetworkTransform에서 보간 법(Interpolation)을 지원하기 때문에 게임의 특성에 맞게 전송률을 지정할 수 있으며 각 게임 오브젝트의 역할에 맞게 전송률을 지정하면 된다.

송신 단말기와 수신 단말기 사이의 지연을 줄이기 위해 매 프레임마다 데이터를 전송하는 방법이 좋을 것 같지만 실제로 매 프레임마다 데이터를 송신할 경우, 게임 성능에 안 좋은 결과를 끼친다. 그래서 네트워크로 전달되는 위치 정보의 지연은 피할 수 없으므로 보간 법은 필수적으로 사용되어야 하며 캐릭터의 이동 속도를 제한하여 지연을 줄이고 보간 법을 사용하는 것을 권장한다. 특별한 경우가 아니면 PC에서는 초당 10회 모바일 단말기에서는 초당 6회를 권장한다.

### 동기화 모드

게임의 특성과 게임 오브젝트의 사용 목적에 따라 동기화 기법은 달라진다. NetworkTransform 컴포넌트는 다음과 같이 동기화 기법을 제공하여 게임 오브젝트를 쉽게 동기화할 수 있도록 지원한다.

- **SyncTransform** : 보간 법을 사용하지 않고 동기화를 수행한다. 네트워크로 수신된 최신 데이터를 게임 오브젝트에 즉시 반영한다.
- **SyncRigidbody2D** : 보간 법을 사용해 Rigidbody2D의 velocity 값을 변경하여 동기화한다. Rigidbody2D 컴포넌트가 포함되어 있어야 한다.
- **SyncRigidbody3D** : 보간 법을 사용해 Rigidbody의 velocity 값을 동기화한다. Rigidbody 컴포넌트가 포함되어 있어야 한다.
- **SyncCharacterControl** : 보간 법을 사용해 CharacterController 컴포넌트 좌표를 동기화한다. CharacterController 컴포넌트가 포함되어 있어야 한다.

### 채널 설정

데이터 멀티플랙싱을 이용하기 위해서 NetworkTransform에 전용 채널을 지정할 수 있다. 데이터양이 많지 않을 경우, 특별히 채널을 지정하지 않고 하나의 디폴트로 지정된 삼 번 채널로 모든 데이터를 전송하는 방법도 사용할 수 있겠지만, 데이터양이 많다면 다중 채널을 사용해서 데이터 간 간섭을 피하는 것이 효율적이다. NetworkManager 인스펙터의 Channel Count 항목 또는 ChannelCount API를 사용해 최대 채널 개수를 지정할 수 있으며 지정된 채널 범위 안에서 각 NetworkTransform에 고유 채널을 부여할 수 있다. 예를 들면 Channel Count를 십 번으로 지정한 경우, 영 번부터 십 번 채널까지 사용할 수 있다. 하지만 내부적으로 사용되는 영 번과 일 번 채널 그리고 디폴트 채널인 삼 번 채널은 사용을 피하는 것을 권장하며 전용 채널은 사 번부터 십 번까지 사용하는 것이 좋다. 불필요한 채널 생성은 성능에 좋지 않기 때문에 적정한 채널 개수를 지정하는 것이 좋다.

### API

인스펙터에서 제공되는 기능에 대응되는 프로퍼티를 제공한다.

[Properties]

|API Methods|타입| 설명|
|---|---|---|
|syncRotationAxis|	AxisSyncMode|	회전축을 지정한다.|
|NetworkChannel|	int|	송신 채널을 지정한다.|
|transformSyncMode|	TransformSyncMode|	동기화 방법을 제공한다.|
|movementTheshold|	float|	지정한 값이 회전 각 또는 위치 벡터의 크기 값을 초과할 경우 데이터를 송신한다.|
|snapThreshold|	float|	위치 벡터의 크기 값이 지정한 값을 초과하면 위치 보간을 수행하지 않고 직접 값을 대응시킨다.|
|interpolateMovement|	float|	데이터 전송률에 기반울 둔 위치 보간을 인수다. 1 보다 클 경우, 보간 횟수가 감소하고 1보다 작은 값일 경우 보간 횟수가 증가한다. 0일 경우 보간을 수행하지 않는다.|
|interpolateRotation|	float|	데이터 전송률에 기반을 둔 위치 보간을 인수다. 1 보다 클 경우, 보간 횟수가 감소하고 1보다 작은 값일 경우 보간 횟수가 증가한다. 0일 경우 보간을 수행하지 않는다.|
|syncSpin|	bool|	Rigidbody의 각 속도 값을 동기화를 지정한다.|

## NetworkBehaviour

NetworkBehaviour는 사용자 정의 스크립트에서 리얼 타임 멀티플레이어가 제공하는 기능을 사용하기 위해서 해당 스크립트가 상속을 받아야 하는 클래스다. NetworkBehaviour는 UnityEngine.MonoBehaviour를 상속받았기 때문에 MonoBehaviour의 기능 역시 사용할 수 있다. NetworkTransform와 같이 NetworkBehaviour를 상속받은 사용자 정의 클래스를 컴포넌트로 포함한 게임 오브젝트는 반드시 하나의 NetworkIdentity 컴포넌트를 포함하고 있어야 한다.

### 게임 시작과 끝

게임 룸에 진입하면, 오버라이딩한 OnStart 함수가 호출된다. 반대로 게임 룸을 떠나거나 네트워크 연결이 종료되면 OnLeave 함수가 호출된다.

### 플레이어 접속 확인

접속 중인 게임 룸에 다른 플레이어가 게임 룸에 참가하거나 떠날 경우, OnJoinedRoom과 OnLeavedRoom을 오버라이딩해서 해당 이벤트 메시지를 수신할 수 있다. 만약 마스터로 지정된 플레이어가 게임 룸을 떠났을 경우, OnLeavedRoom 메시지를 통해 새로 마스터로 지정된 플레이어의 번호를 수신할 수 있다.

### 사용자 정의 동기화

NetworkBehaviour의 가상 함수인 OnSerialize와 OnDeserialize를 사용자 정의 스크립트에서 오버라이딩을 통해 지속해서 반영이 필요한 데이터를 동기화 할 수 있다. 예를 들면 NetworkTransform에서 지원하지 않는 게임 오브젝트의 크기가 지속해서 동기화가 필요하다면 해당 로직을 OnSerialize와 OnDeserialize에 추가하여 개발할 수 있다. NetworkTransform의 위치와 회전 동기화가 해당 기능을 이용한 구현이다. 하지만 지속해서 동기화가 필요 없는 데이터의 경우 RPC 사용을 권장한다.

OnSerialize 함수는 최초 호출된 이 후, DirtyBit 프로퍼티 값이 true일 때만 호출되므로 동기화가 필요한 경우 DirtyBit를 true로 지정해야 한다. 데이터가 송신된 후, DirtyBit는 자동으로 false로 변경된다. 만약 새로운 플레이어가 게임 룸에 참가했을 때 OnSerialize 함수로 최신 데이터를 반영하고 싶은 경우 DirtyBit를 true로 지정해야 한다. 해당 기능은 제공되는 NetworkTransform 소스 코드를 참고하기 바란다.

NetworkBehaviour는 함수 오버라이딩을 통해 송신 간격, 채널, QoS를 지정할 수 있다. 송신 간격은 초단위로 지정하게 되어 있다. 예를 들면, 200 milliseconds 간격으로 데이터를 송신하고 싶을 경우, 0.2로 지정하면 된다. 인스팩터에서는 초당 횟수를 지정한다는 점에서 차이가 있다. 채널은 GetNetworkChannel 함수를 오버라이딩해서 변경 가능하며 NetworkManager의 Channel Count에 지정된 최대 채널 내에서 지정되어야 한다. QoS 기본 값은 UnreliableSequenced로 지정되어 있으며 지속해서 반영이 필요한 데이터는 기본값 그대로 UnreliableSequenced QoS를 권장한다.

### API

NetworkBehaviour의 API는 현재 게임 오브젝트의 소유권과 관련된 프로퍼티와 특정 이벤트를 수신하기 위한 가상 함수 그리고 사용자 데이터를 송수신하기 위한 가상 함수와 프로퍼티로 구성되어 있다.

[Properties]

|API Properties|타입| 설명|
|---|---|---|
|IsLocalPlayerGameObject|	bool|	게임 오브젝트가 로컬 플레이어 소유인지를 나타낸다.|
|HasAuthority|	bool|	해당 게임 오브젝트에 대한 소유권을 가지고 있는지 확인한다.|
|DirtyBit|	bool|	True로 지정하면 OnSerialize함수가 호출되어 데이터가 송신된다. 송신 후, 자동으로 False로 변경된다.|
|NetworkIdentity|	NetworkIdentity|	현재 게임 오브젝트에 포함된 NetworkIdentity 컴포넌트를 반환한다.|

[Methods]

|API Methods| 설명|
|---|---|
|Description|	가상 함수로 게임 룸 진입 시 호출된다.|
|Signature|	void OnStart()|

|API Methods| 설명|
|---|---|
|Description|	가상 함수로 게임 룸에서 떠날 때 호출된다.|
|Signature|	void OnLeave()|

|API Methods| 설명|
|---|---|
|Description|	가상 함수로 사용자 데이터를 송신하기 위해 오버라이딩하는 함수다.|
|Signature|	bool OnSerialize(DataObject data, bool initialState)|
|Parameters|	data	송신할 데이터를 입력한다.|
|Parameters|initialState	최초 호출 시 true 그렇지 않으면 false 다.|
|Return Value|	bool	true를 반환 시, 데이터를 송신하고 그렇지 않은 경우 데이터를 송신하지 않는다.|

|API Methods| 설명|
|---|---|
|Description|	가상 함수로 사용자 데이터를 수신하기 위해 오브라이딩하는 함수다.|
|Signature|	void OnDeserialize(DataObject data, bool initialState)|
|Parameters|	data	수신한 데이터|
|Parameters|initialState	최초 호출 시 true 그렇지 않으면 false 다.|
|Return Value|	bool	true를 반환 시, 데이터를 송신하고 그렇지 않은 경우 데이터를 송신하지 않는다.|

|API Methods| 설명|
|---|---|
|Description|	가상 함수로 지정한 채널로 OnSerialize 데이터가 송신 된다. 오버라이딩을 통해 지정 채널을 변경할 수 있다.|
|Signature|	byte GetNetworkChannel()|
|Return Value|	byte	지정된 채널이 반환된다.|

|API Methods| 설명|
|---|---|
|Description|	가상 함수로 OnSerialize 데이터 송신 주기를 지정한다. 오버라이딩을 통해 송신 간격을 변경할 수 있다.|
|Signature|	float GetNetworkSendInterval()|
|Return Value|	float	지정된 초 단위 시간 간격을 반환한다.|

|API Methods| 설명|
|---|---|
|Description|	가상 함수로 OnSerialize 송신 데이터의 네트워크 QoS를 지정한다. 오버라이딩을 통해 네트워크 QoS를 변경할 수 있다.|
|Signature|	QosType GetQoS()|
|Return Value|	QosType	지정된 QoS를 반환한다.|

|API Methods| 설명|
|---|---|
|Description|	가상 함수로 새로운 플레이어가 게임 룸에 참여 시 호출된다.|
|Signature|	void OnJoinedRoom(byte playerNum)|
|Parameters|	playerNum	새로 참여한 플레이어 번호|

|API Methods| 설명|
|---|---|
|Description|	가상 함수로 플레이어가 게임 룸을 떠났을 때 호출된다.|
|Signature|	public virtual void OnLeavedRoom(byte playerNum, byte newMasterNum)|
|Parameters|	playerNum	게임 룸을 떠난 플레이어 번호|
|Parameters|newMasterNum	현재 게임 룸 마스터의 플레이어 번호|

## DataObject

DataObject는 사용자가 객체를 생성하여 데이터 송수신할 때 사용된다. 송신 시 DataObject는 직렬화와 역 직렬화를 거처 목적지에 전달된다.

|Type|	Bytes used|
|---|---|
|bool|	1|
|byte|	1|
|Int16|	2|
|Int32|	4|
|Int64|	8|
|float|	4|
|double|	8|
|string|	variable|
|bool array|	variable|
|byte array|	variable|
|Int16 array|	variable|
|Int32 array|	variable|
|Int64 array|	variable|
|float array|	variable|
|double array|	variable|
|string array|	variable|
|DataObject|	variable|

### API

DataObject는 키와 값으로 데이터를 저장하게 된다.

[Properties]

|API Properties| 설명|
|---|---|
|Count|	저장된 데이터의 개수를 반환한다.|

[Methods]

|API Methods| 설명|
|---|---|
|Description|	해당 키를 포함하고 있는지 확인한다.|
|Signature|	bool ContainsKey(byte key)|
|Parameters|	key	키 값|
|Return Value|	bool	해당 키가 존재 할 때 true를 반환하고 그렇지 않으면 false를 반환한다.|

|API Methods| 설명|
|---|---|
|Description|	키에 해당하는 값를 반환한다.|
|Signature|	T GetValue(byte key)|
|Parameters|	key	키 값|
|Return Value|	T	해당 키의 값을 반환한다.|

|API Methods| 설명|
|---|---|
|Description|	키의 존재를 확인하고 해당하는 값을 반환한다.|
|Signature|	bool GetValue(byte key, out T value)|
|Parameters|	key	키 값|
|Parameters|value	값을 반환한다.|
|Return Value|	bool	키에 해당하는 값을 있을 때 true를 반환하고 그렇지 않은 경우 false를 반환한다.|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 Boolean 타입의 값을 입력한다.|
|Signature|	void SetBoolean(byte key, bool value)|
|Parameters|	key	키 값|
|Parameters|value	Boolean 타입의 값|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 Byte 타입의 값을 입력한다.|
|Signature|	void SetByte(byte key, byte value)|
|Parameters|	key	키 값|
|Parameters|value	Byte 타입의 값|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 Int16 타입의 값을 입력한다.|
|Signature|	void SetInt16(byte key, Int16 value)|
|Parameters|	key	키 값|
|Parameters|value	Int16 타입의 값|
|Return Value	|-|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 Int32 타입의 값을 입력한다.|
|Signature|	void SetInt32(byte key, Int16 value)|
|Parameters|	key	키 값|
|Parameters|value	Int32 타입의 값|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 Int64 타입의 값을 입력한다.|
|Signature|	void SetInt64(byte key, Int64 value)|
|Parameters|	key	키 값|
|Parameters|value	Int64 타입의 값|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 String 타입의 값을 입력한다.|
|Signature|	void SetString(byte key, String value)|
|Parameters|	key	키 값|
|Parameters|value	String 타입의 값|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 DataObject 타입의 값을 입력한다.|
|Signature|	void SetDataObject(byte key, DataObject value)|
|Parameters|	key	키 값|
|Parameters|value	DataObject 타입의 값|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 Boolean 배열 타입의 값을 입력한다.|
|Signature|	void SetBooleans(byte key, bool[] value)|
|Parameters|	key	키 값|
|Parameters|value	Boolean 배열 타입의 값|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 Byte 배열 타입의 값을 입력한다.|
|Signature|	void SetBytes(byte key, byte[] value)|
|Parameters|	key	키 값|
|Paramters|value	Byte 배열 타입의 값|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 Int16 배열 타입의 값을 입력한다.|
|Signature|	void SetInt16s(byte key, Int16[] value)|
|Parameters|	key	키 값|
|Parameters|value	Int16 타입의 값|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 Int32 배열 타입의 값을 입력한다.|
|Signature|	void SetInt32s(byte key, Int16[] value)|
|Parameters|	key	키 값|
|Parameters|value	Int32 배열 타입의 값|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 Int64 배열 타입의 값을 입력한다.|
|Signature|	void SetInt64s(byte key, Int64[] value)|
|Parameters|	key	키 값|
|Parameters|value	Int64 배열 타입의 값|

|API Methods| 설명|
|---|---|
|Description|	지정된 키에 String 배열 타입의 값을 입력한다.|
|Signature|	void SetStrings(byte key, String[] value)|
|Parameters|	key	키 값|
|Parameters|value	String 배열 타입의 값.|

## 기타

인자 또는 반환 값으로 사용되면 클래스는 다음과 같다.

### GameState

GameState는 게임 상태를 나타낸다.

|GameState 용어| 설명|
|---|---|
|ConnectEstablished|	네트워크 연결 성립|
|Auth|	인증 성공|
|JoinGame|	게임 참여|
|LeaveGame|	게임 떠남|

### NetStates

네트워크의 상태를 나타낸다.

|NetStates 용어| 설명|
|---|---|
|Disconnected|	네트워크 연결 종료|
|Disconnecting|	네트워크 연결 종류 중|
|Connecting|	네트워크 연결 중|
|Connected|	네트워크 연결 됨|

### TransformSyncMode

네트워크상에서 위치 동기화를 지정한다.

|TransformSyncMode 용어| 설명|
|---|---|
|SyncNone|	동기화를 수행하지 않는다.|
|SyncTransform|	게임 오브젝트의 Transform을 기반의 동기화를 수행한다.|
|SyncRigidbody2D|	Rigidbody2D 컴포넌트를 동기화한다.|
|SyncRigidbody3D|	Rigidbody 컴포넌트를 동기화한다.|
|SyncCharacterController|	CharacterController 컴포넌트를 동기화한다.|

### AxisSyncMode

네트워크상에서 회전 동기화를 지정한다.

|AxisSyncMode 용어| 설명|
|---|---|
|None|	동기화를 수행하지 않는다.|
|AxisX|	X축 회전을 동기화를 수행한다.|
|AxisY|	Y축 회전을 동기화를 수행한다.|
|AxisZ|	Z축 회전을 동기화를 수행한다.|
|AxisXY|	X축과 Y축의 회전을 동기화를 수행한다.|
|AxisXZ|	X축과 Z축의 회전을 동기화를 수행한다.|
|AxisYZ|	Y축과 Z축의 회전을 동기화를 수행한다.|
|AxisXYZ|	모든 축의 회전을 동기화를 수행한다.|

### Player

Player 클래스는 플레이어의 정보를 참조하기 위해 사용된다.

[Properties]

|Player 용어|타입| 설명|
|---|---|
|IsMine|	bool|	해당 객체가 자신을 나타내는지 지정한다.|
|IsMaster|	bool|	해당 객체가 마스터 권한을 가지고 있는지 확인한다.|
|PlayerNr|	byte|	플레이어의 고유 번호를 반환한다.|
|Properties|	DataObject|	TBD|

### SendOptions

SendOptions는 RPC 데이터를 송신 시, 송신 옵션으로 사용된다.

[Properties]

|SendOptions 용어|타입| 설명|
|---|---|---|
|Channel|	byte|	송신 채널을 지정한다.|
|IsEncrypted|	bool|	True 지정 시 데이터를 암호화 한다.|
|QoS|	QosType|	송신 QoS를 지정한다.|

### ReceiverGroup

ReceiverGroup은 RPC 송신 시, 인자로 수신자를 지정한다. ReceiverGroup을 사용하지 않고 Player아이디를 지정하여 송신할 수도 있지만, 수신자 목록이 ReceiverGroup이 지원하는 범위라면 송신 데이터 크기를 고려해서 ReceiverGroup 사용을 권장한다.

|ReceiverGroup 용어| 설명|
|---|---|
|All|	현재 게임 룸에 접속한 모든 플레이어에게 메시지를 송신한다.|
|Others|	나를 제외한 게임 룸에 접속한 모든 플레이어에게 메시지를 송신한다.|
|MasterClient|	마스터 소유권을 가지고 있는 플레이어에게 메시지를 송신한다.|

### QosType

데이터 송신 시 네트워크 QoS를 지정한다.

|QosType 용어| 설명|
|---|---|
|UnreliableSequenced|	비 신뢰성-순서보장 전송. 게임 오브젝트의 좌표와 같이 지속해서 업데이트가 필요한 데이터의 경우에 적합하다.|
|ReliableSequenced|	신뢰성-순서보장 전송. 간헐적 또는 일시적 데이터를 송신하기에 적합하다.|

## 주의 사항

다음 제한 사항은 리얼-타임 멀티플레이어 서비스를 이용하는 상황에 해당 되며 제한 사항 이상의 성능 및 기능이 필요한 경우, 별도의 서비스 존을 구축할 수 있도록 지원하고 있다.

- 게임 룸 당 동시 접속 인원은 8명이다.
- 룸 당 최대 메시지 수는 초당 500(송신 + 수신)개로 제한한다.
- 문서에 기록되지 않은 Public, Internal 접근자를 가진 API의 경우 사용하지 않도록 한다.

## 동영상 튜토리얼

간단한 게임을 멀티플레이어 게임으로 만드는 과정을 담은 영상입니다.  
튜토리얼에서 사용되는 에셋들은 아래 링크를 통해 다운받으실 수 있습니다.  

```
[Space Shooter 튜토리얼 프로젝트 다운로드](http://static.toastoven.net/toastcloud/sdk_download/RTM/SpaceShooter-Tutorial-Project.zip)
```

[Space Shooter 튜토리얼 1편 : 토스트 클라우드 세팅/ 게임 서버 접속]

<iframe width="420" height="315" src="https://www.youtube.com/embed/wpN1RrHnCqg?wmode=transparent" frameborder="0" allowfullscreen wmode="Opaque"></iframe>

[Space Shooter 튜토리얼 2편 : 플레이어 오브젝트의 생성 및 위치 동기화]

<iframe width="420" height="315" src="https://www.youtube.com/embed/3r4M0XKo3JI?wmode=transparent" frameborder="0" allowfullscreen wmode="Opaque"></iframe>

[Space Shooter 튜토리얼 3편 : 미사일과 장애물 오브젝트의 동기화]

<iframe width="420" height="315" src="https://www.youtube.com/embed/WR5bC3u81RI?wmode=transparent" frameborder="0" allowfullscreen wmode="Opaque"></iframe>
