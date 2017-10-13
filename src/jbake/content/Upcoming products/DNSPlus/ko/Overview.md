title=About
date=2013-09-24
type=page
status=published
big=TCUpcoming
summary=DNSPlusOverview
~~~~~~
## Upcoming Products > DNS+ > Overview

DNS(Domain Name Service)는 192.168.0.12와 같이 숫자로 되어 있는 IPv4 Address가 외우기 어렵고 사용자 친화적이지 못하다는 단점을 보완하기 위해 nhnent.com, toast.com 등의 영문자로 네트워크 호스트를 표기하는 방법으로 각 domain name이 원래 가지고 있는 IPv4 Address로 바꿔주는 서비스입니다.
가령 www.toast.com을 이용한다고 하면 www은 호스트이고 toast.com은 Domain 혹은 Hosted Zone이라고 합니다.

## 특/장점

* DNS Server를 간편하게 설정할 수 있습니다.
* 접속 지역에 따라 지리적으로 가까운 서버를 지정할 수 있습니다.
* 정책을 이용하여 여러 서버에 부하를 나눠서 서비스 할 수 있습니다.

## 주요기능
다음과 같은 기능을 제공합니다.

* Host Zone 서비스 및 관리
* Record Set 관리
* Health Check 에 의한 서비스 안전성 향상

## 용어 설명

| 용어 | 설명 |
|--------------|----|
| Domain       | IPv4 Address가 숫자로 되어있기 때문에 이것을 사용자가 쉽게 인지할 수 있는 형태로 나타내는 방법<br>Ex) www.toast.com|
| Hosted Zone  |DNS가 서비스 하는 호스트에 대한 Domain 영역|
| Record Set   |Hosted Zone에 의해서 서비스 되는 Host 정보|
| Health Check |Record Set에 의해 지정된 호스트들에 대해 동작 여부를 감시하는 기능|
| Geolocation  |DNS Query에 대한 응답을 하는 경우에 요청지에 따라서 가까운 서버를 연결하는 DNS의 부속 서비스|
