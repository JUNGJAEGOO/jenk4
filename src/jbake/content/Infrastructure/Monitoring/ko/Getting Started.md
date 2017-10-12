title=About
date=2013-09-24
type=page
status=published
big=TCInfra
summary=TCInframonitorGetting
~~~~~~
## Infrastructure > Compute & Network > Monitoring Guide

TOAST Cloud는 사용자가 생성한 인스턴스에 대한 모니터링 기능을 기본으로 제공합니다.
인스턴스의 하드웨어 리소스 사용량을 볼 수 있으며, 사용량에 임계값을 설정하여 특정 상황에 대한 알람을 이메일 또는 SMS로 받아 볼 수 있습니다.

## 모니터링 시스템 구성

![[모니터링 시스템 구성]](http://static.toastoven.net/toastcloud/static/common/img/cms_img/monitoring/img_1.jpg)
<center>[그림 1. 모니터링 시스템 구성]</center>

모니터링 시스템은 OpenStack의 Ceilometer를 기반으로 확장한 시스템입니다.
기본적으로 하이퍼바이저(Hypervisor)를 통해 사용자가 생성한 인스턴스의 리소스 사용량 정보를 얻기 때문에 모니터링을 위한 별도의 프로그램을 설치할 필요가 없습니다. 특수한 모니터링 항목을 확인하고자 한다면 (예: 서버의 다운여부) 모니터링 에이전트를 서버에 직접 설치하여야 합니다.

## 인스턴스 상태 확인

[Infrastructure] > [Compute & Network] > [Monitoring] > [Server Details]탭에서 모니터링할 인스턴스를 추가합니다.

```
[Infrastructure] > [Compute & Network] > [Monitoring] > [Server Details]탭 클릭
```

```
[Server Name]란에 서버 선택
[Add] 버튼 클릭
```

![[그림 1 서버 상세 정보]](http://static.toastoven.net/prod_infrastructure/monitoring/img_101.png)
<center>[그림 1 서버 상세 정보]</center>

[Server Name]란에서 선택한 서버에 대해서 [Add] 버튼을 누르면 해당 서버의 상세 정보가 하단의 표에 추가 됩니다. 더 이상 확인 하고 싶지 않은 서버는 가장 우측의 [Delete] 버튼을 눌러 삭제할 수 있습니다. 서버 상세 정보에서 확인 가능한 정보는 다음과 같습니다.

- 서버 이름
- IP
- CPU 사용량
- 메모리 사용량
- 디스크 사용량
- 초당 읽은 디스크 바이트
- 초당 쓴 디스크 바이트
- 초당 받은 네트워크 바이트
- 초당 전송한 네트워크 바이트
- 서버 상태
- 서버 구동시간

서버 상태 그래프를 보고자 하는 경우에는 [Graph]탭을 선택합니다.

```
[Infrastructure] > [Compute & Network] > [Monitoring] > [Graph]탭 클릭
```

![[그림 2 서버 상태 그래프]](http://static.toastoven.net/prod_infrastructure/monitoring/img_102.png)
<center>[그림 2 서버 상태 그래프]</center>

검색 기간에 따라 그래프에 표현되는 데이터의 주기가 1분/5분/30분/2시간으로 자동 변경됩니다. 더 이상 확인 하고 싶지 않은 서버에 대한 그래프는 [Delete] 버튼을 클릭하여 삭제할 수 있습니다.

> [주의]  
> 모니터링 데이터의 보관 주기는 최대 한달 입니다. 따라서 그래프의 기간은 한 달을 넘길 수 없습니다.

## 알람로그 확인

[Infrastructure] > [Compute & Network] > [Monitoring] > [Alarm Logs]탭에서 알람 로그 리스트를 확인 할 수 있습니다.

```
[Infrastructure] > [Compute & Network] > [Monitoring] > [Alarm Logs]탭 클릭
```

![[그림 3 알람 로그]](http://static.toastoven.net/prod_infrastructure/monitoring/img_103.png)
<center>[그림 3 알람 로그]</center>

사용자가 등록한 임계값을 초과하여 발송한 알람 리스트를 확인 할 수 있습니다. 특정 VM에 대한 알람로그를 보고 싶으면 서버 이름 혹은 IP 주소를 입력 후 [검색] 버튼을 클릭합니다.

## 알람 등록

[Infrastructure] > [Compute & Network] > [Monitoring] > [Alarm Setting]탭에서 알람을 등록 할 수 있습니다.

```
[Infrastructure] > [Compute & Network] > [Monitoring] > [Alarm Setting]탭 > [Add] 버튼 클릭
```

![[그림 4 알람 등록]](http://static.toastoven.net/prod_infrastructure/monitoring/img_104.png)
<center>[그림 4 알람 등록]</center>

&lt;Add Alarm Setting> 대화창에서 알람등록할 서버를 추가하고 Metric 설정 및 수신자를 지정합니다.

### [Server Name] 선택

알람을 등록 할 서버를 검색하여 추가 합니다.

### [Metric] 선택

알람을 받을 인스턴스의 시스템 자원 및 임계 값을 설정합니다. 지원하는 Metric 에는 CPU, CPU 사용량, 메모리 사용량, Disk 사용량, 네트워크 사용량 및 Server Status가 있습니다. 각 Metric의 설명 및 입력해야 하는 임계값의 형태는 아래와 같습니다.

[표 1 Metric 설명]

|파라메터|	설명|
|---|---|
|CPU|	CPU 사용량을 뜻합니다. 0~100(%) 중 하나의 값을 입력해야 합니다.|
|Memory|	Memory 사용량을 뜻합니다. MB 단위의 절댓값을 입력합니다.|
|Disk Usage|	디스크 사용량을 뜻합니다. 인스턴스에 연결한 각각의 디스크에 대해서 바이트 단위의 절댓값을 입력합니다.|
|Network RX|	받은 네트워크 사용량을 뜻합니다. 인스턴스에 연결한 각각의 이더넷 인터페이스에 대해서 바이트 단위의 절댓값을 입력합니다.|
|Network TX|	전송한 네트워크 사용량을 뜻합니다. 인스턴스에 연결한 각각의 이더넷 인터페이스에 대해서 바이트 단위의 절댓값을 입력합니다.|
|Server Down|	서버의 상태를 뜻합니다. 여기서 말하는 서버의 상태는 외부와 통신이 가능한 상태를 정상으로 판단합니다. 해당 Metric은 별도의 값을 입력할 필요가 없습니다.|

> [주의]  
> Serverdown Metric 을 사용하기 위해서는 별도의 Monitoring Agent 를 해당 인스턴스에 설치하여야 하며, 해당 인스턴스는 외부와 통신이 가능한 네트워크에 연결되어 있어야 합니다.

```
[Server Name]란에 서버 선택
[Add] 버튼 클릭
[+ Add alarm metric] 클릭
[계랑]란에 설정할 Metric 선택
[임계값]란에 조건 선택 및 값 지정
알람 수신자 설정을 위하여 [Receiver]란에 [Edit] 버튼 클릭
```

![[그림 5 알람 등록 설정]](http://static.toastoven.net/prod_infrastructure/monitoring/img_105.png)
<center>[그림 5 알람 등록 설정]</center>

&lt;Receiver> 대화창이 팝업되면 프로젝트 멤버를 추가합니다.

### Receiver 설정

알람을 받을 프로젝트 멤버를 선택하고, 알람을 받을 방법을 선택합니다.

```
[Receiver]란에 프로젝트 멤버 이메일 입력
[Add] 버튼 클릭
[OK] 버튼 클릭
```

![[그림 6 Receiver 설정]](http://static.toastoven.net/prod_infrastructure/monitoring/img_106.png)
<center>[그림 6 Receiver 설정]</center>

## 알람 수정 및 삭제

[Infrastructure] > [Compute & Network] > [Monitoring] > [Alarm Setting]탭에서 알람을 수정 및 삭제 할 수 있습니다.

![[그림 7 알람 리스트]](http://static.toastoven.net/prod_infrastructure/monitoring/img_107.png)
<center>[그림 7 알람 리스트]</center>

알람을 수정하려면 리스트에서 수정하고자 하는 알람 설정을 클릭합니다. 알람 등록과는 다르게 한번에 하나의 알람에 대해서만 수정 가능합니다. 나머지는 알람 등록과 동일합니다.  
등록한 알람은 필요에 따라 활성화 시키거나 비활성화 시킬 수 있습니다. 활성화 혹은 비활성화 하고자 하는 알람들을 리스트에서 선택한 후 “Enable/Disable” 버튼을 누르면 해당 알람을 활성화 혹은 비활성화 시킬 수 있습니다.  
등록한 알람이 더 이상 필요 없을 때에는 [Delete] 버튼을 눌러 해당 알람을 삭제 할 수 있습니다.

## 모니터링 에이전트 설치

> [참고]  
> Server Down Metric을 사용할 때에만 모니터링 에이전트가 필요합니다.

### 에이전트 다운로드

http://cloud.toast.com> [DOCUMENTS] > [Download]에서 [Monitoring Agent] 파일을 다운로드 받습니다.

```
[root@host-192-168-0-7 ~]# wget http://static.toastoven.net/toastcloud/sdk_download/monitor/agent-0.0.1.tgz
--2014-09-17 11:35:31--  http://10.24.144.114:21000/agent.tgz
Connecting to 10.24.144.114:21000... connected.
HTTP request sent, awaiting response... 200 OK
Length: 168329 (164K) [application/x-gzip]
Saving to: “agent.tgz”

100%[=======================================================>]
168,329     --.-K/s   in 0.005s

2014-09-17 11:35:31 (35.6 MB/s) - “agent-0.0.1.tgz” saved [168329/168329]
```

### 에이전트 설치

모니터링 에이전트는 반드시 root 권한으로 설치해야 합니다. 설치는 다운받은 파일의 압축 해제 후, “install.sh”를 실행하면 됩니다.

```
[root@host-192-168-0-7 ~]# tar -zxvf agent-0.0.1.tgz
./agent/
./agent/ssl/
./agent/ssl/cert.pem
./agent/ssl/.svn/
./agent/ssl/.svn/entries
./agent/ssl/.svn/text-base/
./agent/ssl/.svn/text-base/key.pem.svn-base
./agent/ssl/.svn/text-base/cert.pem.svn-base
./agent/ssl/.svn/tmp/
./agent/ssl/.svn/tmp/text-base/
./agent/ssl/.svn/tmp/prop-base/
./agent/ssl/.svn/tmp/props/
./agent/ssl/.svn/prop-base/
./agent/ssl/.svn/props/
./agent/ssl/.svn/all-wcprops
./agent/ssl/key.pem
./agent/conf.d/
./agent/conf.d/client.json
./agent/conf.d/rabbitmq.json
./agent/jq
./agent/sensu.repo
./agent/install.sh
./agent/plugins/
./agent/plugins/vm_checks_update.rb
./agent/plugins/VERSION
[root@host-192-168-0-7 ~]# sh agent/install.sh
```

### 에이전트 상태 확인

“service sensu-client status” 명령어를 입력하여 아래와 같이 “is running”으로 나온다면 정상적으로 동작하고 있는 것입니다.

```
[root@host-192-168-0-7 ~]# /etc/init.d/sensu-client status
sensu-client (pid 9223) is running...
```

만약 위 상태가 아닐 경우 “service sensu-client start” 명령어를 통해서 수동으로 시작할 수 있습니다.

```
[root@host-192-168-0-7 ~]# /etc/init.d/sensu-client start
Starting sensu-client [ OK ]
```

### 주의 사항
모니터링 에이전트는 오픈소스 프로젝트인 sensu를 이용하였습니다. 따라서 사용자 인스턴스에 이미 다른 sensu 에이전트가 설치되어 있다면 TOAST Cloud의 모니터링 에이전트를 사용할 수 없습니다.  
또한 /etc/sensu 안의 파일들을 임의로 변조하거나 삭제할 경우 정상 동작을 보장하지 않습니다.
