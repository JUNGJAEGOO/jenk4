## Open Source > Toast Haste > Overview

# 빌드하기

> 샘플 내용은 IntelliJ Community edition 을 기준으로 작성되었습니다.

## 0. 요구사항
- **Haste framework는 JDK 1.7 이상, Maven 3.3.0 이상을 요구합니다.**
- **AES-256 지원을 위해서 JCE(Java Cryptography Extension)을 요구합니다. 반드시 JCE를 설치해주세요**

## 1. 코드 내려받기
- 아래 Repository에서 소스코드를 내려받습니다.
- [TOAST Haste framework](https://github.com/nhnent/toast-haste.framework)

## 2. IDE 설치
- 아래 링크에서 IntelliJ Community Edition을 다운받아서 설치합니다.
- [IntelliJ Community Edition Download](https://www.jetbrains.com/idea/?fromMenu#chooseYourEdition)

## 3. 프로젝트 불러오기
1. IntelliJ CE를 실행합니다.
2. 상단 메뉴의 File > Open...을 선택합니다.
3. 내려받은 프로젝트의 루트 폴더를 선택해서 불러옵니다.

## 4. 메이븐 빌드
1. View > Tool Windows > Maven Projects 를 선택합니다.
2. Haste > install 을 선택합니다.
3. 빌드가 완료됩니다.

### enforcer-plugin 에서 에러가 발생했을 경우...
- enforcer-plugin 에러가 발생될 경우, 요구사항을 만족시키지 못한 경우 입니다. (JDK 1.7 이상, Maven 3.3.0 이상)
- JDK를 업데이트 하거나, Maven 버전을 업데이트 해주시기 바랍니다.

#### IntelliJ에서 Maven 버전 올리기
- IntelliJ 내부의 Maven 버전이 낮을 경우, 직접 Maven을 다운로드 받아서 설정해주셔야 합니다.

1. Maven 다운로드 : https://maven.apache.org/download.cgi
2. 원하는 경로에 다운로드 받은 Maven을 압축해제 합니다.
3. IntelliJ의 설정을 선택합니다. (윈도우 기준 : File > Settings, Mac 기준 : IntelliJ > Preferences)
4. "Build, Execution, Deployment" > "Build Tools" > "Maven" 을 선택합니다.
5. "Maven home directory"에 다운로드 받은 Maven의 경로를 선택합니다.

# Let's Haste
- Haste framework를 사용해서 간단한 Echo 서버를 개발해보면서, 기본적인 사용법을 알아본다.

## Echo 서버
- Haste framework를 체크아웃 받으면, com.nhnent.haste.example.echoserver 패키지의 EchoServer 클래스의 main 함수를 통해서 Echo 서버를 실행할 수 있습니다.

### 1. GameServerBootstrap을 통한 서버 설정
```java
public class EchoServer {
    private static final int PORT = 5056;

    public static void main(String[] args) {
        GameServerBootstrap bootstrap = new GameServerBootstrap();

        bootstrap.application(new EchoServerApplication())
                .option(UDPOption.THREAD_COUNT, 2)
                .option(UDPOption.SO_RCVBUF, 1024)
                .option(UDPOption.SO_SNDBUF, 1024)
                .bind(PORT).start();
    }
}
```
### 2. EchoServerApplication 에서 ClientPeer를 생성하는 코드를 추가합니다. 
- ClientPeer는 클라이언트가 접속할 때 생성되는 Peer 객체입니다.
```java
public class EchoServerApplication extends ServerApplication {
    @Override
    protected void setup() {
    }

    @Override
    protected void tearDown() {
    }

    @Override
    protected ClientPeer createPeer(InitialRequest initialRequest, NetworkPeer networkPeer) {
        return new EchoPeer(initialRequest, networkPeer);
    }
}
```
### 3. 실제 주고받는 데이터인 EchoMessage 클래스를 구현합니다. 
- 데이터는 MessageBridge를 상속받아서 구현하면 FieldParameter 어노테이션을 이용해서 쉽게 구현할 수 있습니다.
```java
public class EchoMessage extends MessageBridge {
    public static final short MESSAGE = 0;

    public EchoMessage(RequestMessage request) {
        super(request);
    }

    @FieldParameter(Code = MESSAGE)
    public String message;
}
```
### 4. 실제 클라이언트와 데이터 송수신을 하는 EchoPeer 클래스를 구현합니다.
```java
public class EchoPeer extends ClientPeer {
    private static final Logger logger = LoggerFactory.getLogger(EchoPeer.class);

    public EchoPeer(InitialRequest initialRequest, NetworkPeer networkPeer) {
        super(initialRequest, networkPeer);
    }

    @Override
    protected void onReceive(RequestMessage request, SendOptions options) {
        EchoMessage message = new EchoMessage(request);

        logger.info(MessageFormat.format("Client message is \"{0}\"", message.message));

        ResponseMessage response = message.toResponse();
        this.send(response, options);
    }

    @Override
    protected void onDisconnect(DisconnectReason reason, String detail) {
    }
}
```

## Echo 클라이언트
- Haste SDK for .NET를 체크아웃 받으면, Examples 폴더의 Haste.EchoClient 프로젝트를 통해서 Echo 클라이언트를 실행할 수 있습니다.

### 1. NetworkConnection 객체 생성 및 설정 객체 만들기
```csharp
_connection = new NetworkConnection();
_config = new ConnectionConfig
{
    ChannelCount = 5,
    DisconnectionTimeout = 3000,
    IsCrcEnabled = false,
    MaxUnreliableCommands = 0,
    MTUSize = 1350,
    PingInterval = 1000,
    SentCountAllowance = 3,
    WarningQueueSize = 500,
};
_connection.Configure(_config);
```
### 2. NetworkConnection 객체에 응답 이벤트 등록하기 
- ClientPeer는 클라이언트가 접속할 때 생성되는 Peer 객체입니다.
```csharp
_connection.ResponseReceived += OnResponseReceived;
_connection.StatusChanged += OnStatusChanged;
...

const int MESSAGE_CODE = 0;

private static void OnResponseReceived(ResponseMessage response)
{
    if (response.Code == MESSAGE_CODE)
    {
        string message = string.Empty;
        if (response.Data.GetValue(MESSAGE_PARAM_CODE, out message))
        {
            Console.WriteLine("[OnResponseReceived] Server message is \"{0}\"", message);
        }
    }
}
```
### 3. 연결하기 및 응답 쓰레드 시작하기
```csharp
IPEndPoint remoteEndPoint = new IPEndPoint(IPAddress.Parse("127.0.0.1"), 5056);
_connection.Connect(remoteEndPoint, new Version(0, 1, 0), null);

Thread receiveThread = new Thread(() =>
{
    while (true)
    {
        _connection.NetworkUpdate();
    }
});
receiveThread.Start();
```
### 4. 데이터 송신을 위한 메서드 만들기
```csharp
const int MESSAGE_PARAM_CODE = 0;

public void Send(string input)
{
    DataObject data = new DataObject();
    data.SetString(MESSAGE_PARAM_CODE, input);
    _connection.SendRequestMessage(MESSAGE_CODE, data, SendOptions.ReliableSend);
}
```
