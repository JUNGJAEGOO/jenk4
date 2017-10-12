title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Game > Real Time Multiplayer > Release Notes

### 2017.09.21
* [SDK] Unity3D SDK v2.0.3 릴리즈
    * API 서버의 정상적인 응답을 받아도 간헐적으로 게임서버 접속이 안 되는 버그 수정

### 2017.07.20
* [Server, SDK] v1.0 서비스 종료
    * v1.0 서비스가 종료됨에 따라, v1.x SDK를 사용할 수 없습니다.
    * v2.0 안내 및 SDK 적용에 대한 자세한 내용은 아래 공지를 확인해주시기 바랍니다.
        * [[공지] Toast Cloud Real-Time Multiplayer v2 안내](https://cloud.toast.com/support/notice/detail/1453435858K00360)

### 2017.05.25
#### 기능 개선/변경
* [Server] CCU 수집 버그 확인을 위한 로그 추가
* [Server, SDK] RTO(Retransmission Timeout) 개선

### 2017.04.20
#### 기능 개선/변경
* [Server] 안정성 작업
    * 백엔드의 안정성 향상을 위한 작업을 진행
* [Console] TOAST UI 차트 적용

#### 버그 수정
* [SDK] 채널 버그 수정
    * 채널의 총 갯수를 늘려도 일정 수준 이하의 채널로만 송수신 되는 버그 수정
* [SDK] 유니티 4 지원을 위한 버그 수정
    * 인스펙터의 Serialize 버그 수정
    * 유니티 4 컴파일 에러 버그 수정
* [Console] CCU 정보가 잘못 출력되는 버그 수정

### 2016.09.29
#### 기능 개선/변경
* [SDK] 네트워크 구현을 Toast Haste SDK로 변경
* [SDK] IPv6 지원
    * 기존 SDK는 IPv6를 지원하지 않음
    * 애플 검수를 위해서 SDK 업데이트 권장
