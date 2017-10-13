title=About
date=2013-09-24
type=page
status=published
big=TCcontents
summary=CDNRelease
~~~~~~
## Contents > CDN > Release Notes

### 2017.07.20

#### 기능 개선/변경
* CDN API를 배포하였습니다. 자세한 내용은 Developer`s guide를 참고해주세요.  
	* CDN 생성, 수정, 조회 API가 추가 되었습니다.
	* 재배포, 재배포 조회 API가 추가 되었습니다.

* 원본 서버 하위 경로 지원
	* 기존에는 domain 또는 ip 형식의 원본서버만 설정할 수 있었으나 원본 서버의 하위 경로도 설정할 수 있습니다.

* 통계 기능 개선
	* TimeUnit(시간, 일, 주, 월)단위로 편리하게 통계를 확인할 수 있도록 UI를 개선하였습니다.
	* 검색 기간별 통계 단위가 조정되었습니다.
		* 검색 기간이 6시간 미만인 경우 5분 단위
		* 검색 기간이 1일 미만인 경우 1시간 단위
		* 검색 기간이 1일 초과인 경우 1일 단위 
	* 통계는 3가지 종류의 통계를 제공하며, 통계 데이터와 실제 데이터 사이에는 지연이 발생될 수 있습니다. 
		* 트래픽 사용량: 네트워크 bandwith와 전송량을 확인할 수 있습니다. 
		* Http Response별 통계: Http Response Code별로 Cache hit raito를 확인할 수 있습니다. 
		* Top contents : 가장 많이 조회된 Content를 확인할 수 있습니다. 

#### 버그 수정
* 통계 > 서비스이름 선택 UI 버그 수정
	* 서비스 설명에 대한 문구가 길어지면 서비스 이름 선택 UI가 일부만 노출되는 현상을 수정하였습니다.

### 2016.12.22

#### 기능 개선/변경
* 서비스 생성 시 실제 접속 가능한 시점에 OPEN 으로 상태 변경 하도록 수정 
* CORS(Cross-Origin Resource Sharing) 지원

#### 버그 수정
* Global Purge 기능이 동작하지 않던 문제 수정
