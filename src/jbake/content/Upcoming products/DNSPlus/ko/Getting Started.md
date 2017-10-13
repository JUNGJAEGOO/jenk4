title=About
date=2013-09-24
type=page
status=published
big=TCUpcoming
summary=DNSPlusGetting
~~~~~~
## Upcoming Products > DNS+ > Getting Started

DNS+ 를 사용하기 위한 절차는 아래와 같습니다.

## Hosted Zone의 생성

DNS+ 서비스를 선택하게 되면 현재 Hosting하고 있는 Hosted Zone에 대한 목록을 볼 수 있습니다.

<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-001.png"/>
<br>
[그림 1] Hosted Zone 목록 보기
</center>
<br>

Hosted Zone 생성 버튼을 클릭하여 Hosted Zone을 추가할 수 있습니다. 추가하는 입력창에서 Hosting할 Domain을 입력합니다.

<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-002.png"/>
<br>
[그림 2] Hosted Zone 추가 대화 창
</center>
<br>

Hosted Zone이 생성되면 SOA, NS 레코드가 기본으로 생성됩니다. SOA 레코드에서는 관리자 계정을 지정할 수 있습니다. 등록한 서버에 맞는 관리자 계정을 설정해 주시기 바랍니다. NS 레코드에는 DNS+의 네임서버 이름이 할당되어 있습니다. 생성한 도메인에 대한 DNS Query를 위해서는 도메인 등록기관에 해당 네임서버로의 위임 권한 설정이 반드시 필요합니다.

<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-003.png"/>
<br>
[그림 3] Hosted Zone에 toast.com 생성
</center>
<br>

생성 이후에는 Hosted Zone에 새로 추가한 "toast.com"가 조회됩니다. SOA, NS 가 Hosted Zone과 함께 생성 되었기 때문에 Record Set Count는 2가 됩니다. Hosted Zone 삭제는 여러 개를 선택하여 삭제할 수 있으나 수정의 경우에는 하나만 선택하여 수정할 수 있습니다.

<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-004.png"/>
<br>
[그림 4] Hosted Zone 수정 대화 창
</center>
<br>

Hosted Zone을 삭제하면 Record Set까지 함께 삭제되기 때문에 주의가 필요합니다. Record Set 과 Hosted Zone이 삭제되면 더 이상 Domain 서비스를 하지 않기 때문에 의도하지 않은 경우 서비스 중단이 발생할 수 있습니다.

<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-005.png"/>
<br>
[그림 5] Hosted Zone 삭제 대화 창
</center>
<br>




## Record Set의 관리

Record Set은 Hosted Zone에 포함되는 호스트들에 대한 목록, 서비스 타입에 해당하는 호스트를 의미합니다. 같은 호스트라도 서비스 타입에 따라 다른 동작을 할 수 있습니다. 각각 생성된 Hosted Zone에 대해 "관리" 버튼을 누르거나 "Record Sets" 탭을 선택하게 되면 해당 Hosted Zone에 포함되는 Record Set을 관리할 수 있습니다.


<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-006.png"/>
<br>
[그림 6] Record Set 목록
</center>
<br>


새로운 Record Set을 생성을 하기 위해서 "Record Set" 생성 버튼을 클릭합니다.

<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-007.png"/>
<br>
[그림 7] Record Set 생성 대화 창
</center>
<br>




Record Name에 호스트 이름을 입력합니다. 예제와 같이 "www"이라 입력하면, 외부에서 조회가 되는 전체 이름은 "www.toast.com"와 같습니다. Type은 Service Type이며 아래 표와 같습니다.


|Service Type|설명|
|-|-|
|A|IPv4 Address|
|CNAME|Canonical Name|
|MX|Mail Exchange|
|TXT|Text|
|PTR|Pointer|
|SRV|Location Service|
|SPF|Sender Policy Framework|

Alias의 경우 해당 Host가 다른 Host를 대신하게 되는 경우에 사용합니다. 각 Service Type에 대해서 값들이 존재하는데 "A"인 경우 IPv4 Address를 입력한다. 복수로 입력이 가능하며 이는 DNS Query 응답에 포함되어 전달됩니다.


<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-008.png"/>
<br>
[그림 8] Record Set 수정 대화 창
</center>
<br>

수정은 생성과 동일합니다. 수정을 하기 위해서는 Record Set을 한 개만 선택해야 하지만 삭제를 하기 위해서는 여러 개를 선택할 수 있습니다.


<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-009.png"/>
<br>
[그림 9] Record Set 삭제 대화 창
</center>
<br>

Record Set에는 "Import Record Set"이라는 특별한 기능이 있는데, 이 기능은 Record Set이 없는 경우에만 사용할 수 있습니다. 이미 추가되어 있다면 삭제 이후에 기능 사용이 가능합니다. 이 기능은 Zone File을 읽어서 Record Set 에 일괄로 추가해주는 기능으로, 기존에 DNS를 운영하던 Zone File이 있다면 Import해서 일괄 적용할 수 있습니다.

## Health Check

Health Check 기능은 Record Set에 등록된 IP Address들에 대해서 Health Check를 수행하고, 응답하지 않는 경우 DNS Query의 응답에서 이를 제외하는 기능입니다. 따라서 Health Check 기능을 사용하지 않는 경우에는 복수로 입력된 모든 IPv4 Address 전체를 응답하지만, Health Check 기능을 사용하는 경우에는 정상적으로 응답하는 호스트만 응답합니다.

<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-010.png"/>
<br>
[그림 10] Health Check 목록
</center>
<br>



Health Check 기능은 이미 입력된 Record Set에 한정하여 동작합니다. Record Set에 1개의 IPv4 Address(호스트)만 입력했다면 이 기능은 필요하지 않습니다. 여러 개의 호스트가 입력된 경우에 각각에 지정한 요청을 지정한 주기만큼 반복적으로 수행하면서 각 호스트의 동작 여부를 판별하게 됩니다.

<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-011.png"/>
<br>
[그림 11] Health Check 관리 대화 창
</center>
<br>



위 예제의 경우 "www"에 속한 각 호스트들에 대해서 Protocol 별로 연결을 시도하여 연결이 되거나 "200 OK" 응답을 받는다면 DNS Query에 응답을 하고 그렇지 않은 경우 응답에서 제외합니다. Path는 HTTP/HTTPS의 경우에만 적용하고 해당 URL Path에 접속을 시도합니다. Port는 TCP/HTTP/HTTPS로 접근하는 TCP 포트를 의미합니다.
Failure Threshold와 Request Interval은 매 Request Interval 마다 위에서 지정한 접속을 시도합니다. 이때 Failure Threshold에서 지정한 횟수 만큼 실패하게 되면, 서비스에 제외합니다.
만약 Record Set에 등록된 모든 호스트가 응답하지 않는다면 DNS Query의 응답으로 전체 Record Set을 응답합니다.


# Monitoring

모니터링은 HeartBeat 설정한 Record Set에서 어떤 항목이 동작해서 현재 상태가 어떤지를 표시합니다. DNS+ 서비스는 주기적으로 호스트에 요청을 전달하여 상태를 확인하는데 그 결과값을 표시합니다.


<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-012.png"/>
<br>
[그림 12] Monitoring 상태 목록
</center>
<br>


# Report

Statistics는 현재 동작하고 있는 Hosted Zone에 대한 통계 정보를 조회할 수 있습니다. 지정한 Host Zone, Record Type, Routing Policy에 따라 조회가 가능합니다.


<br>
<center>
<img src="http://static.toastoven.net/prod_dnsplus/img-013.png"/>
<br>
[그림 13] Statistics 조회
</center>
<br>


필요한 경우 통계 데이터 초기화를 수행 할 수 있으나 Hosted Zone 별로는 할 수 없습니다.
