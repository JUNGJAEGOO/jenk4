title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Upcoming Products > WatchDog > Overview

> ※ 본 문서는 alpha 개발 단계의 문서입니다.
> 사용에 관심이 있으신 분은 **support@cloud.toast.com**으로 문의해 주시기 바랍니다.

WatchDog 서비스는 장애 감지, 장애 전파, 장애 관리를 위한 서비스입니다.  
장애 감지를 위해 기본적으로 Web Service 모니터링 기능이 탑재되어 있으며 다양한 모니터링 서비스와의 연동이 API 를 통해 가능합니다. 장애 감지 내역은 다양한 방법으로 장애담당자/복구담당자에게 전파되며 전파된 장애 감지 내역은 사내 협업 도구와의 연동을 통해 빠른 대응 및 조치가 가능합니다.  

![[그림 1] Watchdog 시스템 구성도](http://static.toastoven.net/prod_watchdog/img_01.jpg)
<center>[그림 1] Watchdog 시스템 구성도</center>

## 특징

- 장애 감지
	- Web Service Monitoring
		- Auto Sharding, Scale Out
		- 성능을 고려한 Processer 수 제어
		- 기본적인 모니터링 시나리오 제공
	- 다양한 장애 감지 시스템 연동을 위한 API 제공
- 장애 전파
	- 서비스 개발 조직의 독립적인 장애 관리 기능
	- 다양한 전파 방법 제공
- 장애 보고
	- 헙업 도구를 이용한 장애 관리

## 주요 기능

- 장애 감지
	- Web Service Monitoring
		- URL 별 모니터링 시나리오 관리 기능(로그인, 텍스트 검증, 이미지 검증, 커스텀 스크립트)
		- 모니터링 시나리오 실행 기능
- 장애 전파
	- 장애 관리를 위한 기준 정보 관리
		- 서비스
		- 전파그룹
		- 전파담당자
		- 전파방법
	- 전파 내역 관리
		- 장애 감지 시스템으로부터 전파 내역 송신
	- 전파 실행
		- 전파그룹 / 전파담당자 / 전파방법을 통한 전파 실행
		- 전송 / 재전송 / 전파 중지
		- 장애 Manual 신고
- 장애 보고
	- Dooray 의 장애 관리 Project와 Task 를 통한 장애 관리
	- 장애 분류를 위한 위한 다양한 태그 관리
		- 서비스명
		- ESM 명
		- 긴급
